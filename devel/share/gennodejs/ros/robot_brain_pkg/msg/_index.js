
"use strict";

let robot_head_pos = require('./robot_head_pos.js');
let cmd_walk = require('./cmd_walk.js');
let calculate_position_result = require('./calculate_position_result.js');
let image_points = require('./image_points.js');
let head_contol_by_brain = require('./head_contol_by_brain.js');

module.exports = {
  robot_head_pos: robot_head_pos,
  cmd_walk: cmd_walk,
  calculate_position_result: calculate_position_result,
  image_points: image_points,
  head_contol_by_brain: head_contol_by_brain,
};
