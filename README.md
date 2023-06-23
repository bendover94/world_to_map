# world_to_map plugin

This is a Gazebo simulator plugin to automatically generate a 2D occupancy map from the simulated world at a given certain height. 

This plugin was adapted from the [octomap plugin](https://github.com/ethz-asl/rotors_simulator/tree/master/rotors_gazebo_plugins) from ETH Zürich by [marinaKollmitz](https://github.com/marinaKollmitz/gazebo_ros_2Dmap_plugin) and than by [Lucas Schmirl](https://github.com/bendover94) from FH Technikum Wien.


## Usage 
- Populate the `world_to_map` pkg in your `catkin_ws` and build it with `catkin_make`

- Copy your world file into the `world_to_map` directory

- To include the plugin, add the following lines in between the `<world> </world>` tags of your Gazebo world file and set the parameters according to your needs:

```xml
<plugin name='gazebo_occupancy_map' filename='libgazebo_2Dmap_plugin.so'>
    <map_resolution>0.1</map_resolution> <!-- in meters, optional, default 0.1 -->
    <map_height>0.3</map_height>         <!-- in meters, optional, default 0.3 -->
    <map_size_x>10</map_size_x>          <!-- in meters, optional, default 10 -->
    <map_size_y>10</map_size_y>          <!-- in meters, optional, default 10 -->
    <init_robot_x>0</init_robot_x>          <!-- x coordinate in meters, optional, default 0 -->
    <init_robot_y>0</init_robot_y>          <!-- y coordinate in meters, optional, default 0 -->
</plugin>
```

To generate the map, call the shellscript:
```bash
./generate_map.sh <arg1> <arg2>
```
e.g.
```bash
./generate_map.sh playground.xml myNewMap
```

(The current working directory is `/world_to_map`)

`arg1` is the name of the world file (e.g. playground.xml)

`arg2` is the name by which the map should be saved
