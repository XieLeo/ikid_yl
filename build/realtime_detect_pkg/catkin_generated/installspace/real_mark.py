import time
import torch
import rospy
from pathlib import Path
from models.common import DetectMultiBackend
from utils.general import check_img_size, non_max_suppression, scale_coords, check_file, increment_path
from utils.augmentations import letterbox
from utils.plots import Annotator, colors
from utils.torch_utils import select_device
from utils.datasets import LoadImages, LoadStreams
from sensor_msgs.msg import Image
from your_package.msg import image_points  # 替换为实际的消息类型和包名

def run(
        weights=ROOT / 'yolov5s.pt',
        source=ROOT / 'data/images',
        data=ROOT / 'data/coco128.yaml',
        imgsz=(480, 640),
        conf_thres=0.25,
        iou_thres=0.45,
        max_det=1000,
        device='',
        view_img=False,
        save_txt=False,
        save_conf=False,
        save_crop=False,
        nosave=False,
        classes=None,
        agnostic_nms=False,
        augment=False,
        visualize=False,
        update=False,
        project=ROOT / 'runs/detect',
        name='exp',
        exist_ok=False,
        line_thickness=3,
        hide_labels=False,
        hide_conf=False,
        half=False,
        dnn=False,
):
    source = str(source)
    save_img = not nosave and not source.endswith('.txt')
    is_file = Path(source).suffix[1:] in (IMG_FORMATS + VID_FORMATS)
    is_url = source.lower().startswith(('rtsp://', 'rtmp://', 'http://', 'https://'))
    webcam = source.isnumeric() or source.endswith('.txt') or (is_url and not is_file)
    if is_url and is_file:
        source = check_file(source)

    save_dir = increment_path(Path(project) / name, exist_ok=exist_ok)
    (save_dir / 'labels' if save_txt else save_dir).mkdir(parents=True, exist_ok=True)

    device = select_device(device)
    model = DetectMultiBackend(weights, device=device, dnn=dnn, data=data, fp16=half)
    stride, names, pt = model.stride, model.names, model.pt
    imgsz = check_img_size(imgsz, s=stride)

    rospy.init_node("talker_image_points")
    rate = rospy.Rate(30)

    if webcam:
        view_img = check_imshow()
        cudnn.benchmark = True
        dataset = LoadStreams(source, img_size=imgsz, stride=stride, auto=pt)
        bs = len(dataset)
    else:
        dataset = LoadImages(source, img_size=imgsz, stride=stride, auto=pt)
        bs = 1
    vid_path, vid_writer = [None] * bs, [None] * bs

    model.warmup(imgsz=(1 if pt else bs, 3, *imgsz))
    dt, seen = [0.0, 0.0, 0.0], 0
    for path, im, im0s, vid_cap, s in dataset:
        t1 = time_sync()
        im = torch.from_numpy(im).to(device)
        im = im.half() if model.fp16 else im.float()
        im /= 255
        if len(im.shape) == 3:
            im = im[None]
        t2 = time_sync()
        dt[0] += t2 - t1

        visualize = increment_path(save_dir / Path(path).stem, mkdir=True) if visualize else False
        pred = model(im, augment=augment, visualize=visualize)
        t3 = time_sync()
        dt[1] += t3 - t2

        pred = non_max_suppression(pred, conf_thres, iou_thres, classes, agnostic_nms, max_det=max_det)
        dt[2] += time_sync() - t3

        pub = rospy.Publisher("chatter_image_points", image_points, queue_size=10)
        im_p = image_points()

        detected_objects = {
            'ball': [],
            'goalpost': [],
            'robot': [],
            'L_mark': [],
            'T_mark': [],
            'X_mark': []
        }

        for i, det in enumerate(pred):
            seen += 1
            if webcam:
                p, im0, frame = path[i], im0s[i].copy(), dataset.count
                s += f'{i}: '
            else:
                p, im0, frame = path, im0s.copy(), getattr(dataset, 'frame', 0)

            p = Path(p)
            save_path = str(save_dir / p.name)
            txt_path = str(save_dir / 'labels' / p.stem) + ('' if dataset.mode == 'image' else f'_{frame}')
            s += '%gx%g ' % im.shape[2:]
            gn = torch.tensor(im0.shape)[[1, 0, 1, 0]]
            imc = im0.copy() if save_crop else im0
            annotator = Annotator(im0, line_width=line_thickness, example=str(names))

            if len(det):
                det[:, :4] = scale_coords(im.shape[2:], det[:, :4], im0.shape).round()

                for c in det[:, -1].unique():
                    n = (det[:, -1] == c).sum()
                    s += f"{n} {names[int(c)]}{'s' * (n > 1)}, "

                for *xyxy, conf, cls in reversed(det):
                    c = int(cls)
                    object_name = names[c]
                    xyxy = [int(x) for x in xyxy]
                    label = f'{names[c]} {conf:.2f}'
                    annotator.box_label(xyxy, label, color=colors(c, True))

                    if object_name in detected_objects:
                        detected_objects[object_name].append(xyxy)

        # 将检测结果整理为ROS消息格式并发布
        im_p.ball_xyxy = detected_objects['ball']
        im_p.goalpost_xyxy = detected_objects['goalpost']
        im_p.robot_xyxy = detected_objects['robot']
        im_p.L_mark_xyxy = detected_objects['L_mark']
        im_p.T_mark_xyxy = detected_objects['T_mark']
        im_p.X_mark_xyxy = detected_objects['X_mark']

        pub.publish(im_p)
        rospy.loginfo(f"发布检测结果：{detected_objects}")
        rate.sleep()

        im0 = annotator.result()
        if view_img:
            cv2.imshow(str(p), im0)
            cv2.waitKey(1)

    t = tuple(x / seen * 1E3 for x in dt)
    LOGGER.info(f'Speed: %.1fms pre-process, %.1fms inference, %.1fms NMS per image at shape {(1, 3, *imgsz)}' % t)
    if save_txt or save_img:
        s = f"\n{len(list(save_dir.glob('labels/*.txt')))} labels saved to {save_dir / 'labels'}" if save_txt else ''
        LOGGER.info(f"Results saved to {colorstr('bold', save_dir)}{s}")
    if update:
        strip_optimizer(weights)


def parse_opt():
    parser = argparse.ArgumentParser()
    parser.add_argument('--weights', nargs='+', type=str, default=ROOT / 'landmarks0826.pt', help='模型路径')
    parser.add_argument('--source', type=str, default='0', help='文件/目录/URL/通配符，0 表示摄像头')
    parser.add_argument('--data', type=str, default=ROOT / 'data/football.yaml', help='数据集路径')
    parser.add_argument('--imgsz', '--img', '--img-size', nargs='+', type=int, default=(480, 640), help='推理图像大小 h,w')
    parser.add_argument('--conf-thres', type=float, default=0.5, help='置信度阈值')
    parser.add_argument('--iou-thres', type=float, default=0.45, help='NMS IOU 阈值')
    parser.add_argument('--max-det', type=int, default=1000, help='每张图像的最大检测数量')
    parser.add_argument('--device', default='', help='CUDA 设备，例如 0 或 0,1,2,3 或 cpu')
    parser.add_argument('--view-img', action='store_true', help='显示结果')
    parser.add_argument('--save-txt', action='store_true', help='保存结果为文本')
    parser.add_argument('--save-conf', action='store_true', help='在标签中保存置信度')
    parser.add_argument('--save-crop', action='store_true', help='保存裁剪的预测框')
    parser.add_argument('--nosave', action='store_true', help='不保存图像/视频')
    parser.add_argument('--classes', nargs='+', type=int, help='按类别过滤：--classes 0，或 --classes 0 2 3')
    parser.add_argument('--agnostic-nms', action='store_true', help='类别无关的 NMS')
    parser.add_argument('--augment', action='store_true', help='增强推理')
    parser.add_argument('--visualize', action='store_true', help='可视化特征')
    parser.add_argument('--update', action='store_true', help='更新所有模型')
    parser.add_argument('--project', default=ROOT / 'runs/detect', help='保存结果的项目路径')
    parser.add_argument('--name', default='exp', help='保存结果的文件夹名称')
    parser.add_argument('--exist-ok', action='store_true', help='现有项目名称可用，不递增')
    parser.add_argument('--line-thickness', default=3, type=int, help='边框厚度（像素）')
    parser.add_argument('--hide-labels', default=False, action='store_true', help='隐藏标签')
    parser.add_argument('--hide-conf', default=False, action='store_true', help='隐藏置信度')
    parser.add_argument('--half', action='store_true', help='使用 FP16 半精度推理')
    parser.add_argument('--dnn', action='store_true', help='使用 OpenCV DNN 进行 ONNX 推理')
    opt = parser.parse_args()
    opt.imgsz *= 2 if len(opt.imgsz) == 1 else 1  # 扩展图像大小
    print_args(vars(opt))
    return opt


def main(opt):
    check_requirements(exclude=('tensorboard', 'thop'))
    run(**vars(opt))


if __name__ == "__main__":
    opt = parse_opt()
    main(opt)
