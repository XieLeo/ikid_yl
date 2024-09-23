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

class head_contol_by_brain {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.neck_rotation_theta_angle = null;
      this.neck_front_swing_theta_angle = null;
      this.is_find_state = null;
      this.is_follow_state = null;
    }
    else {
      if (initObj.hasOwnProperty('neck_rotation_theta_angle')) {
        this.neck_rotation_theta_angle = initObj.neck_rotation_theta_angle
      }
      else {
        this.neck_rotation_theta_angle = 0.0;
      }
      if (initObj.hasOwnProperty('neck_front_swing_theta_angle')) {
        this.neck_front_swing_theta_angle = initObj.neck_front_swing_theta_angle
      }
      else {
        this.neck_front_swing_theta_angle = 0.0;
      }
      if (initObj.hasOwnProperty('is_find_state')) {
        this.is_find_state = initObj.is_find_state
      }
      else {
        this.is_find_state = false;
      }
      if (initObj.hasOwnProperty('is_follow_state')) {
        this.is_follow_state = initObj.is_follow_state
      }
      else {
        this.is_follow_state = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type head_contol_by_brain
    // Serialize message field [neck_rotation_theta_angle]
    bufferOffset = _serializer.float64(obj.neck_rotation_theta_angle, buffer, bufferOffset);
    // Serialize message field [neck_front_swing_theta_angle]
    bufferOffset = _serializer.float64(obj.neck_front_swing_theta_angle, buffer, bufferOffset);
    // Serialize message field [is_find_state]
    bufferOffset = _serializer.bool(obj.is_find_state, buffer, bufferOffset);
    // Serialize message field [is_follow_state]
    bufferOffset = _serializer.bool(obj.is_follow_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type head_contol_by_brain
    let len;
    let data = new head_contol_by_brain(null);
    // Deserialize message field [neck_rotation_theta_angle]
    data.neck_rotation_theta_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [neck_front_swing_theta_angle]
    data.neck_front_swing_theta_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [is_find_state]
    data.is_find_state = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_follow_state]
    data.is_follow_state = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_brain_pkg/head_contol_by_brain';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e40d90720bf88cd6f3200a64bcb87dbc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 neck_rotation_theta_angle  # 颈旋转关节角度
    float64 neck_front_swing_theta_angle # 颈前摆关节角度
    bool is_find_state # 是否找球状态
    bool is_follow_state # 是否跟球状态
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new head_contol_by_brain(null);
    if (msg.neck_rotation_theta_angle !== undefined) {
      resolved.neck_rotation_theta_angle = msg.neck_rotation_theta_angle;
    }
    else {
      resolved.neck_rotation_theta_angle = 0.0
    }

    if (msg.neck_front_swing_theta_angle !== undefined) {
      resolved.neck_front_swing_theta_angle = msg.neck_front_swing_theta_angle;
    }
    else {
      resolved.neck_front_swing_theta_angle = 0.0
    }

    if (msg.is_find_state !== undefined) {
      resolved.is_find_state = msg.is_find_state;
    }
    else {
      resolved.is_find_state = false
    }

    if (msg.is_follow_state !== undefined) {
      resolved.is_follow_state = msg.is_follow_state;
    }
    else {
      resolved.is_follow_state = false
    }

    return resolved;
    }
};

module.exports = head_contol_by_brain;
