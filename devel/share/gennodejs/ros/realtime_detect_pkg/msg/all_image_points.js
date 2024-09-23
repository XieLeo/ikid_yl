// Auto-generated. Do not edit!

// (in-package realtime_detect_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let image_points = require('./image_points.js');

//-----------------------------------------------------------

class all_image_points {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ball_xyxy = null;
      this.goalpost_xyxy = null;
      this.robot_xyxy = null;
      this.L_mark_xyxy = null;
      this.T_mark_xyxy = null;
      this.X_mark_xyxy = null;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type all_image_points
    // Serialize message field [ball_xyxy]
    // Serialize the length for message field [ball_xyxy]
    bufferOffset = _serializer.uint32(obj.ball_xyxy.length, buffer, bufferOffset);
    obj.ball_xyxy.forEach((val) => {
      bufferOffset = image_points.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [goalpost_xyxy]
    // Serialize the length for message field [goalpost_xyxy]
    bufferOffset = _serializer.uint32(obj.goalpost_xyxy.length, buffer, bufferOffset);
    obj.goalpost_xyxy.forEach((val) => {
      bufferOffset = image_points.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [robot_xyxy]
    // Serialize the length for message field [robot_xyxy]
    bufferOffset = _serializer.uint32(obj.robot_xyxy.length, buffer, bufferOffset);
    obj.robot_xyxy.forEach((val) => {
      bufferOffset = image_points.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [L_mark_xyxy]
    // Serialize the length for message field [L_mark_xyxy]
    bufferOffset = _serializer.uint32(obj.L_mark_xyxy.length, buffer, bufferOffset);
    obj.L_mark_xyxy.forEach((val) => {
      bufferOffset = image_points.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [T_mark_xyxy]
    // Serialize the length for message field [T_mark_xyxy]
    bufferOffset = _serializer.uint32(obj.T_mark_xyxy.length, buffer, bufferOffset);
    obj.T_mark_xyxy.forEach((val) => {
      bufferOffset = image_points.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [X_mark_xyxy]
    // Serialize the length for message field [X_mark_xyxy]
    bufferOffset = _serializer.uint32(obj.X_mark_xyxy.length, buffer, bufferOffset);
    obj.X_mark_xyxy.forEach((val) => {
      bufferOffset = image_points.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type all_image_points
    let len;
    let data = new all_image_points(null);
    // Deserialize message field [ball_xyxy]
    // Deserialize array length for message field [ball_xyxy]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ball_xyxy = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ball_xyxy[i] = image_points.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [goalpost_xyxy]
    // Deserialize array length for message field [goalpost_xyxy]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.goalpost_xyxy = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.goalpost_xyxy[i] = image_points.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [robot_xyxy]
    // Deserialize array length for message field [robot_xyxy]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.robot_xyxy = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.robot_xyxy[i] = image_points.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [L_mark_xyxy]
    // Deserialize array length for message field [L_mark_xyxy]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.L_mark_xyxy = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.L_mark_xyxy[i] = image_points.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [T_mark_xyxy]
    // Deserialize array length for message field [T_mark_xyxy]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.T_mark_xyxy = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.T_mark_xyxy[i] = image_points.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [X_mark_xyxy]
    // Deserialize array length for message field [X_mark_xyxy]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.X_mark_xyxy = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.X_mark_xyxy[i] = image_points.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.ball_xyxy.length;
    length += 16 * object.goalpost_xyxy.length;
    length += 16 * object.robot_xyxy.length;
    length += 16 * object.L_mark_xyxy.length;
    length += 16 * object.T_mark_xyxy.length;
    length += 16 * object.X_mark_xyxy.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'realtime_detect_pkg/all_image_points';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8cd15673e10b541cdf32b31b8a02c11';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    image_points[] ball_xyxy
    image_points[] goalpost_xyxy
    image_points[] robot_xyxy
    image_points[] L_mark_xyxy
    image_points[] T_mark_xyxy
    image_points[] X_mark_xyxy
    
    ================================================================================
    MSG: realtime_detect_pkg/image_points
    int32[4] coordinates  # 用于存储一个检测框的四个坐标 [x1, y1, x2, y2]
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new all_image_points(null);
    if (msg.ball_xyxy !== undefined) {
      resolved.ball_xyxy = new Array(msg.ball_xyxy.length);
      for (let i = 0; i < resolved.ball_xyxy.length; ++i) {
        resolved.ball_xyxy[i] = image_points.Resolve(msg.ball_xyxy[i]);
      }
    }
    else {
      resolved.ball_xyxy = []
    }

    if (msg.goalpost_xyxy !== undefined) {
      resolved.goalpost_xyxy = new Array(msg.goalpost_xyxy.length);
      for (let i = 0; i < resolved.goalpost_xyxy.length; ++i) {
        resolved.goalpost_xyxy[i] = image_points.Resolve(msg.goalpost_xyxy[i]);
      }
    }
    else {
      resolved.goalpost_xyxy = []
    }

    if (msg.robot_xyxy !== undefined) {
      resolved.robot_xyxy = new Array(msg.robot_xyxy.length);
      for (let i = 0; i < resolved.robot_xyxy.length; ++i) {
        resolved.robot_xyxy[i] = image_points.Resolve(msg.robot_xyxy[i]);
      }
    }
    else {
      resolved.robot_xyxy = []
    }

    if (msg.L_mark_xyxy !== undefined) {
      resolved.L_mark_xyxy = new Array(msg.L_mark_xyxy.length);
      for (let i = 0; i < resolved.L_mark_xyxy.length; ++i) {
        resolved.L_mark_xyxy[i] = image_points.Resolve(msg.L_mark_xyxy[i]);
      }
    }
    else {
      resolved.L_mark_xyxy = []
    }

    if (msg.T_mark_xyxy !== undefined) {
      resolved.T_mark_xyxy = new Array(msg.T_mark_xyxy.length);
      for (let i = 0; i < resolved.T_mark_xyxy.length; ++i) {
        resolved.T_mark_xyxy[i] = image_points.Resolve(msg.T_mark_xyxy[i]);
      }
    }
    else {
      resolved.T_mark_xyxy = []
    }

    if (msg.X_mark_xyxy !== undefined) {
      resolved.X_mark_xyxy = new Array(msg.X_mark_xyxy.length);
      for (let i = 0; i < resolved.X_mark_xyxy.length; ++i) {
        resolved.X_mark_xyxy[i] = image_points.Resolve(msg.X_mark_xyxy[i]);
      }
    }
    else {
      resolved.X_mark_xyxy = []
    }

    return resolved;
    }
};

module.exports = all_image_points;
