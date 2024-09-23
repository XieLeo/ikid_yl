// Auto-generated. Do not edit!

// (in-package ros_socket.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class robot_joint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint = null;
    }
    else {
      if (initObj.hasOwnProperty('joint')) {
        this.joint = initObj.joint
      }
      else {
        this.joint = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_joint
    // Serialize message field [joint]
    bufferOffset = _arraySerializer.float64(obj.joint, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_joint
    let len;
    let data = new robot_joint(null);
    // Deserialize message field [joint]
    data.joint = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.joint.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_socket/robot_joint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2d98f45f5f7d408b6a0d45a64e4813c5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] joint  # 各关节位置数据
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_joint(null);
    if (msg.joint !== undefined) {
      resolved.joint = msg.joint;
    }
    else {
      resolved.joint = []
    }

    return resolved;
    }
};

module.exports = robot_joint;
