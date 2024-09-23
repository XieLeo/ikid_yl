#!/bin/bash

# gnome-terminal --tab -- bash -c "roscore; exec bash"

gnome-terminal --tab -- bash -c "\
source /home/nvidia/ikid_ws2/devel/setup.bash; \
roscore;\
exec bash"

gnome-terminal --tab -- bash -c "\
source /home/nvidia/ikid_ws2/devel/setup.bash; \
rosrun site_inspection curve.py; \
exec bash"