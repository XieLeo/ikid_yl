#!/bin/bash

# gnome-terminal --tab -- bash -c "roscore; exec bash"

# gnome-terminal --tab -- bash -c "\
# source /home/nvidia/ikid_ws2/devel/setup.bash; \
# rosrun game_controller game_controller; \
# exec bash"

# gnome-terminal --tab -- bash -c "\
# sleep 5s;\
# source /home/nvidia/ikid_ws2/devel/setup.bash; \
# rosrun robot_brain_pkg head_control; \
# exec bash"

# gnome-terminal --tab -- bash -c "\
# source /home/nvidia/ikid_ws2/devel/setup.bash; \
# rosrun robot_brain_pkg robot_brain; \
# exec bash"

gnome-terminal --tab -- bash -c "\
sleep 5s; \
source /home/nvidia/ikid_ws2/devel/setup.bash; \
rosrun site_inspection cal_mark.py; \
exec bash"

gnome-terminal --tab -- bash -c "\
sleep 5s; \
source /home/nvidia/ikid_ws2/devel/setup.bash; \
rosrun realtime_detect_pkg realtime_detect_local.py; \
exec bash"

