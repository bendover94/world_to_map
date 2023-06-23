#!/bin/bash
# This is a script by Lucas Schmirl to create a map from world file
# https://github.com/marinaKollmitz/gazebo_ros_2Dmap_plugin

# launche the gazebo world manually befor starting the script
# roslaunch world_to_map world.launch file:="path_to_your_world.xml"

# ansi-coloring variables
colorBlue="\033[0;34m"
colorOff="\033[0m"
ROSSERVICE_PRINT="rosservice called"
MAPSAVER_PRINT="saving map..."

roslaunch world_to_map world.launch file:=$1 &
roslaunch_pid=$!
sleep 4

# calls the rosservice
rosservice call /gazebo_2Dmap_plugin/generate_map

echo -e $colorBlue $ROSSERVICE_PRINT $colorOff

sleep 1

# saves the map
rosrun map_server map_saver -f map/$2 /map:=/map2d

sleep 1

echo -e $colorBlue $MAPSAVER_PRINT $colorOff

# display message in terminal
echo -e "Map created: $colorBlue $2 $colorOff"

# Send SIGSTOP signal to suspend roslaunch
kill -STOP $roslaunch_pid