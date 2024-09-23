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

class SubscribeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.prop = null;
      this.callback = null;
      this.desc = null;
    }
    else {
      if (initObj.hasOwnProperty('prop')) {
        this.prop = initObj.prop
      }
      else {
        this.prop = '';
      }
      if (initObj.hasOwnProperty('callback')) {
        this.callback = initObj.callback
      }
      else {
        this.callback = '';
      }
      if (initObj.hasOwnProperty('desc')) {
        this.desc = initObj.desc
      }
      else {
        this.desc = new ParameterDescription();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SubscribeRequest
    // Serialize message field [prop]
    bufferOffset = _serializer.string(obj.prop, buffer, bufferOffset);
    // Serialize message field [callback]
    bufferOffset = _serializer.string(obj.callback, buffer, bufferOffset);
    // Serialize message field [desc]
    bufferOffset = ParameterDescription.serialize(obj.desc, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SubscribeRequest
    let len;
    let data = new SubscribeRequest(null);
    // Deserialize message field [prop]
    data.prop = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [callback]
    data.callback = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [desc]
    data.desc = ParameterDescription.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.prop.length;
    length += object.callback.length;
    length += ParameterDescription.getMessageSize(object.desc);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'config_server/SubscribeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8dcf9fcd8cca224c55e3909837a2cc0f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string prop
    string callback
    ParameterDescription desc
    
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
    const resolved = new SubscribeRequest(null);
    if (msg.prop !== undefined) {
      resolved.prop = msg.prop;
    }
    else {
      resolved.prop = ''
    }

    if (msg.callback !== undefined) {
      resolved.callback = msg.callback;
    }
    else {
      resolved.callback = ''
    }

    if (msg.desc !== undefined) {
      resolved.desc = ParameterDescription.Resolve(msg.desc)
    }
    else {
      resolved.desc = new ParameterDescription()
    }

    return resolved;
    }
};

class SubscribeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SubscribeResponse
    // Serialize message field [value]
    bufferOffset = _serializer.string(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SubscribeResponse
    let len;
    let data = new SubscribeResponse(null);
    // Deserialize message field [value]
    data.value = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.value.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'config_server/SubscribeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '64e58419496c7248b4ef25731f88b8c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SubscribeResponse(null);
    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SubscribeRequest,
  Response: SubscribeResponse,
  md5sum() { return '3aed6858ba7841ecfc55a9e55271bc42'; },
  datatype() { return 'config_server/Subscribe'; }
};
