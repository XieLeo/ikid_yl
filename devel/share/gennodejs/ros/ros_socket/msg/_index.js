
"use strict";

let robot_head_pos = require('./robot_head_pos.js');
let cmd_walk = require('./cmd_walk.js');
let robot_joint = require('./robot_joint.js');

module.exports = {
  robot_head_pos: robot_head_pos,
  cmd_walk: cmd_walk,
  robot_joint: robot_joint,
};
