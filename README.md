# pimouse_ros_sim


Installer for raspimouse_sim

## Supported version of ROS

* Melodic

## How to use

__A catkin workspace should be prepared beforehand.__

Let's create and build a catkin workspace:
```
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/
$ catkin_make
```

Simply, you can clone this repository and run:
```
$ sudo chmod+x install.bash
$ ./install.bash
```
on your terminal.

## Library Overview
### Basic Configuration
* raspimouse_description

Robot model (URDF)
### Hardware Drivers and Simulation
* raspimouse_ros

Raspberry Pi Mouse Hardware Driver
* raspimouse_gazebo

Simulator Data (Requires raspimouse_fake)
* raspimouse_fake

Simulator Drivers (Requires raspimouse_gazebo)

## Quick Start
Create device file in the /dev directory:
```
$ roscore
$ rosrun raspimouse_fake gen_dev_file.sh
```
Give the permission to nomal user
```
$ sudo chmod 666 /dev/rt*
```

## Operation check of Raspberry Pi Mouse Simulator

Launch the simulator by
```
$ roslaunch raspimouse_gazebo raspimouse_with_samplemaze.launch 
```
After confirming that Gazebo has started, enter the following command in the second window.
```
$ cat /dev/rtlightsensor0
```
on another terminal.

If four types of numbers are displayed , the distance sensor can be simulated properly.
This completes the startup confirmation.

## move the raspimouse on the simulator
### Motor energization

