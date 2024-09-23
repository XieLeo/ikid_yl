// Auto-generated. Do not edit!

// (in-package realtime_detect_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class image_points {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.coordinates = null;
    }
    else {
      if (initObj.hasOwnProperty('coordinates')) {
        this.coordinates = initObj.coordinates
      }
      else {
        this.coordinates = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type image_points
    // Check that the constant length array field [coordinates] has the right length
    if (obj.coordinates.length !== 4) {
      throw new Error('Unable to serialize array field coordinates - length must be 4')
    }
    // Serialize message field [coordinates]
    bufferOffset = _arraySerializer.int32(obj.coordinates, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type image_points
    let len;
    let data = new image_points(null);
    // Deserialize message field [coordinates]
    data.coordinates = _arrayDeserializer.int32(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'realtime_detect_pkg/image_points';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '39d95add7fb2b7fc613712df91e2c161';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[4] coordinates  # 用于存储一个检测框的四个坐标 [x1, y1, x2, y2]
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new image_points(null);
    if (msg.coordinates !== undefined) {
      resolved.coordinates = msg.coordinates;
    }
    else {
      resolved.coordinates = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = image_points;
