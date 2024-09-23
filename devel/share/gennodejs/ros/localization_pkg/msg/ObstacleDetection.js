// Auto-generated. Do not edit!

// (in-package localization_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class ObstacleDetection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left_lower_corner = null;
      this.right_lower_corner = null;
    }
    else {
      if (initObj.hasOwnProperty('left_lower_corner')) {
        this.left_lower_corner = initObj.left_lower_corner
      }
      else {
        this.left_lower_corner = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('right_lower_corner')) {
        this.right_lower_corner = initObj.right_lower_corner
      }
      else {
        this.right_lower_corner = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleDetection
    // Serialize message field [left_lower_corner]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.left_lower_corner, buffer, bufferOffset);
    // Serialize message field [right_lower_corner]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.right_lower_corner, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleDetection
    let len;
    let data = new ObstacleDetection(null);
    // Deserialize message field [left_lower_corner]
    data.left_lower_corner = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [right_lower_corner]
    data.right_lower_corner = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'localization_pkg/ObstacleDetection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd667fd4ba057e0adbc55ef5b683aec9a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point left_lower_corner
    geometry_msgs/Point right_lower_corner
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleDetection(null);
    if (msg.left_lower_corner !== undefined) {
      resolved.left_lower_corner = geometry_msgs.msg.Point.Resolve(msg.left_lower_corner)
    }
    else {
      resolved.left_lower_corner = new geometry_msgs.msg.Point()
    }

    if (msg.right_lower_corner !== undefined) {
      resolved.right_lower_corner = geometry_msgs.msg.Point.Resolve(msg.right_lower_corner)
    }
    else {
      resolved.right_lower_corner = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = ObstacleDetection;
