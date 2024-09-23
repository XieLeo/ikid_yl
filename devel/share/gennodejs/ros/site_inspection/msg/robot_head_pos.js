// Auto-generated. Do not edit!

// (in-package site_inspection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class robot_head_pos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.neck_rotation_theta = null;
      this.neck_front_swing_theta = null;
    }
    else {
      if (initObj.hasOwnProperty('neck_rotation_theta')) {
        this.neck_rotation_theta = initObj.neck_rotation_theta
      }
      else {
        this.neck_rotation_theta = 0.0;
      }
      if (initObj.hasOwnProperty('neck_front_swing_theta')) {
        this.neck_front_swing_theta = initObj.neck_front_swing_theta
      }
      else {
        this.neck_front_swing_theta = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_head_pos
    // Serialize message field [neck_rotation_theta]
    bufferOffset = _serializer.float64(obj.neck_rotation_theta, buffer, bufferOffset);
    // Serialize message field [neck_front_swing_theta]
    bufferOffset = _serializer.float64(obj.neck_front_swing_theta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_head_pos
    let len;
    let data = new robot_head_pos(null);
    // Deserialize message field [neck_rotation_theta]
    data.neck_rotation_theta = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [neck_front_swing_theta]
    data.neck_front_swing_theta = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'site_inspection/robot_head_pos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1abf8b03136e17e9236b9db881fa8e69';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 neck_rotation_theta  # 颈旋转关节角度
    float64 neck_front_swing_theta # 颈前摆关节角度
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_head_pos(null);
    if (msg.neck_rotation_theta !== undefined) {
      resolved.neck_rotation_theta = msg.neck_rotation_theta;
    }
    else {
      resolved.neck_rotation_theta = 0.0
    }

    if (msg.neck_front_swing_theta !== undefined) {
      resolved.neck_front_swing_theta = msg.neck_front_swing_theta;
    }
    else {
      resolved.neck_front_swing_theta = 0.0
    }

    return resolved;
    }
};

module.exports = robot_head_pos;
