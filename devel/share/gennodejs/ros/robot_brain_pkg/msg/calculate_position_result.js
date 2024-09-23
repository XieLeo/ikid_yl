// Auto-generated. Do not edit!

// (in-package robot_brain_pkg.msg)


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
      this.football_xyxy = null;
      this.goal_xyxy = null;
      this.net_xyxy = null;
      this.robot_xyxy = null;
      this.penalty_mark_xyxy = null;
      this.center_circle_xyxy = null;
      this.distance = null;
      this.kf_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('football_xyxy')) {
        this.football_xyxy = initObj.football_xyxy
      }
      else {
        this.football_xyxy = [];
      }
      if (initObj.hasOwnProperty('goal_xyxy')) {
        this.goal_xyxy = initObj.goal_xyxy
      }
      else {
        this.goal_xyxy = [];
      }
      if (initObj.hasOwnProperty('net_xyxy')) {
        this.net_xyxy = initObj.net_xyxy
      }
      else {
        this.net_xyxy = [];
      }
      if (initObj.hasOwnProperty('robot_xyxy')) {
        this.robot_xyxy = initObj.robot_xyxy
      }
      else {
        this.robot_xyxy = [];
      }
      if (initObj.hasOwnProperty('penalty_mark_xyxy')) {
        this.penalty_mark_xyxy = initObj.penalty_mark_xyxy
      }
      else {
        this.penalty_mark_xyxy = [];
      }
      if (initObj.hasOwnProperty('center_circle_xyxy')) {
        this.center_circle_xyxy = initObj.center_circle_xyxy
      }
      else {
        this.center_circle_xyxy = [];
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('kf_distance')) {
        this.kf_distance = initObj.kf_distance
      }
      else {
        this.kf_distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type calculate_position_result
    // Serialize message field [football_xyxy]
    bufferOffset = _arraySerializer.int32(obj.football_xyxy, buffer, bufferOffset, null);
    // Serialize message field [goal_xyxy]
    bufferOffset = _arraySerializer.int32(obj.goal_xyxy, buffer, bufferOffset, null);
    // Serialize message field [net_xyxy]
    bufferOffset = _arraySerializer.int32(obj.net_xyxy, buffer, bufferOffset, null);
    // Serialize message field [robot_xyxy]
    bufferOffset = _arraySerializer.int32(obj.robot_xyxy, buffer, bufferOffset, null);
    // Serialize message field [penalty_mark_xyxy]
    bufferOffset = _arraySerializer.int32(obj.penalty_mark_xyxy, buffer, bufferOffset, null);
    // Serialize message field [center_circle_xyxy]
    bufferOffset = _arraySerializer.int32(obj.center_circle_xyxy, buffer, bufferOffset, null);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    // Serialize message field [kf_distance]
    bufferOffset = _serializer.float64(obj.kf_distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calculate_position_result
    let len;
    let data = new calculate_position_result(null);
    // Deserialize message field [football_xyxy]
    data.football_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [goal_xyxy]
    data.goal_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [net_xyxy]
    data.net_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [robot_xyxy]
    data.robot_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [penalty_mark_xyxy]
    data.penalty_mark_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [center_circle_xyxy]
    data.center_circle_xyxy = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [kf_distance]
    data.kf_distance = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.football_xyxy.length;
    length += 4 * object.goal_xyxy.length;
    length += 4 * object.net_xyxy.length;
    length += 4 * object.robot_xyxy.length;
    length += 4 * object.penalty_mark_xyxy.length;
    length += 4 * object.center_circle_xyxy.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_brain_pkg/calculate_position_result';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e9ec4e75c98d04e4a675f9b544fcf13d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 目标检测像素坐标点
    int32[] football_xyxy
    int32[] goal_xyxy
    int32[] net_xyxy
    int32[] robot_xyxy
    int32[] penalty_mark_xyxy
    int32[] center_circle_xyxy
    # PNP计算距离
    float64 distance # 原始PNP计算距离
    float64 kf_distance # 卡尔曼滤波后的计算距离
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new calculate_position_result(null);
    if (msg.football_xyxy !== undefined) {
      resolved.football_xyxy = msg.football_xyxy;
    }
    else {
      resolved.football_xyxy = []
    }

    if (msg.goal_xyxy !== undefined) {
      resolved.goal_xyxy = msg.goal_xyxy;
    }
    else {
      resolved.goal_xyxy = []
    }

    if (msg.net_xyxy !== undefined) {
      resolved.net_xyxy = msg.net_xyxy;
    }
    else {
      resolved.net_xyxy = []
    }

    if (msg.robot_xyxy !== undefined) {
      resolved.robot_xyxy = msg.robot_xyxy;
    }
    else {
      resolved.robot_xyxy = []
    }

    if (msg.penalty_mark_xyxy !== undefined) {
      resolved.penalty_mark_xyxy = msg.penalty_mark_xyxy;
    }
    else {
      resolved.penalty_mark_xyxy = []
    }

    if (msg.center_circle_xyxy !== undefined) {
      resolved.center_circle_xyxy = msg.center_circle_xyxy;
    }
    else {
      resolved.center_circle_xyxy = []
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.kf_distance !== undefined) {
      resolved.kf_distance = msg.kf_distance;
    }
    else {
      resolved.kf_distance = 0.0
    }

    return resolved;
    }
};

module.exports = calculate_position_result;
