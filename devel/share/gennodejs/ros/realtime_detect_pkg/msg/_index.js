
"use strict";

let image_points = require('./image_points.js');
let ObjectDetection = require('./ObjectDetection.js');
let all_image_points = require('./all_image_points.js');
let Detections = require('./Detections.js');

module.exports = {
  image_points: image_points,
  ObjectDetection: ObjectDetection,
  all_image_points: all_image_points,
  Detections: Detections,
};
