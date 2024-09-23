#!/bin/bash

# gnome-terminal --tab -- bash -c "roscore; exec bash"

gnome-terminal --tab -- bash -c "\
source /home/nvidia/ikid_ws2/devel/setup.bash; \
rosrun robot_brain_pkg head_control; \
exec bash"

gnome-terminal --tab -- bash -c "\
source /home/nvidia/ikid_ws2/devel/setup.bash; \
rosrun robot_brain_pkg robot_brain_NorthChina_goalkeeper; \
exec bash"

gnome-terminal --tab -- bash -c "\
source /home/nvidia/ikid_ws2/devel/setup.bash; \
rosrun calculate_position_pkg calculate_position; \
exec bash"

gnome-terminal --tab -- bash -c "\
source /home/nvidia/ikid_ws2/devel/setup.bash; \
rosrun realtime_detect_pkg realtime_detect.py; \
exec bash"