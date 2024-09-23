// Auto-generated. Do not edit!

// (in-package calculate_position_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class calculate_position_result {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ball_xyxy = null;
      this.goalpost_xyxy = null;
      this.robot_xyxy = null;
      this.L_mark_xyxy = null;
      this.T_mark_xyxy = null;
      this.X_mark_xyxy = null;
      this.ball_distance = null;
      this.kf_ball_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('ball_xyxy')) {
        this.ball_xyxy = initObj.ball_xyxy
      }
      else {
        this.ball_xyxy = [];
      }
      if (initObj.hasOwnProperty('goalpost_xyxy')) {
        this.goalpost_xyxy = initObj.goalpost_xyxy
      }
      else {
        this.goalpost_xyxy = [];
      }
      if (initObj.hasOwnProperty('robot_xyxy')) {
        this.robot_xyxy = initObj.robot_xyxy
      }
      else {
        this.robot_xyxy = [];
      }
      if (initObj.hasOwnProperty('L_mark_xyxy')) {
        this.L_mark_xyxy = initObj.L_mark_xyxy
      }
      else {
        this.L_mark_xyxy = [];
      }
      if (initObj.hasOwnProperty('T_mark_xyxy')) {
        this.T_mark_xyxy = initObj.T_mark_xyxy
      }
      else {
        this.T_mark_xyxy = [];
      }
      if (initObj.hasOwnProperty('X_mark_xyxy')) {
        this.X_mark_xyxy = initObj.X_mark_xyxy
      }
      else {
        this.X_mark_xyxy = [];
      }
      if (initObj.hasOwnProperty('ball_distance')) {
        this.ball_distance = initObj.ball_distance
      }
      else {
        this.ball_distance = 0.0;
      }
      if (initObj.hasOwnProperty('kf_ball_distance')) {
        this.kf_ball_distance = initObj.kf_ball_distance
      }
      else {
        this.kf_ball_distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type calculate_position_result
    // Serialize message field [ball_xyxy]
    bufferOffset = _arraySerializer.int32(obj.ball_xyxy, buffer, bufferOffset, null);
    // Serialize message field [goalpost_xyxy]
    bufferOffset = _arraySerializer.int32(obj.goalpost_xyxy, buffer, bufferOffset, null);
    // Serialize message field [robot_xyxy]
    bufferOffset = _arraySerializer.int32(obj.robot_xyxy, buffer, bufferOffset, null);
    // Serialize message field [L_mark_xyxy]
    bufferOffset = _arraySerializer.int32(obj.L_mark_xyxy, buffer, bufferOffset, null);
    // Serialize message field [T_mark_xyxy]
    bufferOffset = _arraySerializer.int32(obj.T_mark_xyxy, buffer, bufferOffset, null);
    // Serialize message field [X_mark_xyxy]
    bufferOffset = _arraySerializer.int32(obj.X_mark_xyxy, buffer, bufferOffset, null);
    // Serialize message field [ball_distance]
    bufferOffset = _serializer.float64(obj.ball_distance, buffer, bufferOffset);
    // Serialize message field [kf_ball_distance]
    bufferOffset = _serializer.float64(obj.kf_ball_distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calculate_position_result
    let len;
    let data = new calculate_position_result(null);
    // Deserialize message field [ball_xyxy]
    data.ball_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [goalpost_xyxy]
    data.goalpost_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [robot_xyxy]
    data.robot_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [L_mark_xyxy]
    data.L_mark_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [T_mark_xyxy]
    data.T_mark_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [X_mark_xyxy]
    data.X_mark_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [ball_distance]
    data.ball_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [kf_ball_distance]
    data.kf_ball_distance = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.ball_xyxy.length;
    length += 4 * object.goalpost_xyxy.length;
    length += 4 * object.robot_xyxy.length;
    length += 4 * object.L_mark_xyxy.length;
    length += 4 * object.T_mark_xyxy.length;
    length += 4 * object.X_mark_xyxy.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'calculate_position_pkg/calculate_position_result';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c72dbb980ec20fffc2f484435fc2b2f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 目标检测像素坐标点
    int32[] ball_xyxy
    int32[] goalpost_xyxy
    int32[] robot_xyxy
    int32[] L_mark_xyxy
    int32[] T_mark_xyxy
    int32[] X_mark_xyxy
    # PNP计算距离
    float64 ball_distance # 原始PNP计算距离
    float64 kf_ball_distance # 卡尔曼滤波后的计算距离
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new calculate_position_result(null);
    if (msg.ball_xyxy !== undefined) {
      resolved.ball_xyxy = msg.ball_xyxy;
    }
    else {
      resolved.ball_xyxy = []
    }

    if (msg.goalpost_xyxy !== undefined) {
      resolved.goalpost_xyxy = msg.goalpost_xyxy;
    }
    else {
      resolved.goalpost_xyxy = []
    }

    if (msg.robot_xyxy !== undefined) {
      resolved.robot_xyxy = msg.robot_xyxy;
    }
    else {
      resolved.robot_xyxy = []
    }

    if (msg.L_mark_xyxy !== undefined) {
      resolved.L_mark_xyxy = msg.L_mark_xyxy;
    }
    else {
      resolved.L_mark_xyxy = []
    }

    if (msg.T_mark_xyxy !== undefined) {
      resolved.T_mark_xyxy = msg.T_mark_xyxy;
    }
    else {
      resolved.T_mark_xyxy = []
    }

    if (msg.X_mark_xyxy !== undefined) {
      resolved.X_mark_xyxy = msg.X_mark_xyxy;
    }
    else {
      resolved.X_mark_xyxy = []
    }

    if (msg.ball_distance !== undefined) {
      resolved.ball_distance = msg.ball_distance;
    }
    else {
      resolved.ball_distance = 0.0
    }

    if (msg.kf_ball_distance !== undefined) {
      resolved.kf_ball_distance = msg.kf_ball_distance;
    }
    else {
      resolved.kf_ball_distance = 0.0
    }

    return resolved;
    }
};

module.exports = calculate_position_result;
