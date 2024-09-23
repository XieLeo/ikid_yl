// Auto-generated. Do not edit!

// (in-package config_server.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ParameterDescription = require('../msg/ParameterDescription.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SubscribeListRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.callback = null;
      this.parameters = null;
    }
    else {
      if (initObj.hasOwnProperty('callback')) {
        this.callback = initObj.callback
      }
      else {
        this.callback = '';
      }
      if (initObj.hasOwnProperty('parameters')) {
        this.parameters = initObj.parameters
      }
      else {
        this.parameters = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SubscribeListRequest
    // Serialize message field [callback]
    bufferOffset = _serializer.string(obj.callback, buffer, bufferOffset);
    // Serialize message field [parameters]
    // Serialize the length for message field [parameters]
    bufferOffset = _serializer.uint32(obj.parameters.length, buffer, bufferOffset);
    obj.parameters.forEach((val) => {
      bufferOffset = ParameterDescription.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SubscribeListRequest
    let len;
    let data = new SubscribeListRequest(null);
    // Deserialize message field [callback]
    data.callback = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [parameters]
    // Deserialize array length for message field [parameters]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.parameters = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.parameters[i] = ParameterDescription.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.callback.length;
    object.parameters.forEach((val) => {
      length += ParameterDescription.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'config_server/SubscribeListRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80f357f33862d1f4851d8f3fef90397e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string callback
    ParameterDescription[] parameters
    
    ================================================================================
    MSG: config_server/ParameterDescription
    string name
    string type
    float32 min
    float32 max
    float32 step
    string default_value
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SubscribeListRequest(null);
    if (msg.callback !== undefined) {
      resolved.callback = msg.callback;
    }
    else {
      resolved.callback = ''
    }

    if (msg.parameters !== undefined) {
      resolved.parameters = new Array(msg.parameters.length);
      for (let i = 0; i < resolved.parameters.length; ++i) {
        resolved.parameters[i] = ParameterDescription.Resolve(msg.parameters[i]);
      }
    }
    else {
      resolved.parameters = []
    }

    return resolved;
    }
};

class SubscribeListResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.values = null;
    }
    else {
      if (initObj.hasOwnProperty('values')) {
        this.values = initObj.values
      }
      else {
        this.values = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SubscribeListResponse
    // Serialize message field [values]
    bufferOffset = _arraySerializer.string(obj.values, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SubscribeListResponse
    let len;
    let data = new SubscribeListResponse(null);
    // Deserialize message field [values]
    data.values = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.values.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'config_server/SubscribeListResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b574a4a611cba2b6cf401af98173eb55';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] values
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SubscribeListResponse(null);
    if (msg.values !== undefined) {
      resolved.values = msg.values;
    }
    else {
      resolved.values = []
    }

    return resolved;
    }
};

module.exports = {
  Request: SubscribeListRequest,
  Response: SubscribeListResponse,
  md5sum() { return 'b3d53d10785172ca95ba19fea29582f8'; },
  datatype() { return 'config_server/SubscribeList'; }
};
