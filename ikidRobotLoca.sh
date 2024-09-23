#!/bin/bash

# gnome-terminal --tab -- bash -c "roscore; exec bash"

# 要保证 serial_port节点先于robot_walk_node启动
gnome-terminal --tab -- bash -c "\
source /home/nvidia/ikid_ws2/devel/setup.bash; \
rosrun site_inspection camera.py; \
exec bash"

# gnome-terminal --tab -- bash -c "\
# source /home/nvidia/ikid_ws2/devel/setup.bash; \
# rosrun localization_pkg odom2bl_sim; \
# exec bash"

gnome-terminal --tab -- bash -c "\
sleep 3s; \
source /home/nvidia/ikid_ws2/devel/setup.bash; \
roslaunch localization_pkg localization.launch; \
exec bash"

