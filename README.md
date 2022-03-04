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

## Move the raspimouse on the simulator
### Motor energization and Move Raspimouse
Motor can be energized by the following operation.
```
$ echo 1 > /dev/rtmotoren0
```
If you hear a beep, the program is running correctly

You can move the rasp pie mouse on the simulator without going through ROS.
```
$ echo 100 > /dev/rtmotor_raw_l0
$ echo -100 > /dev/rtmotor_raw_r0
```
The first line gives the left motor 100Hz in the forward direction.

The second line gives the right motor1200Hz in the opposite direction.

Note*: Set the value to 0 every time the test is done
```
$ echo 0 > /dev/rtmotor_raw_l0
$ echo 0 > /dev/rtmotor_raw_r0
```

### Move with the keyboard
Run the following command in another terminal.
```
$ roslaunch raspimouse_gazebo raspimouse_with_samplemaze.launch 
$ roslaunch raspimouse_gazebo keyboard_teleop.launch
```

## SLAM Example

Install pakage raspimouse_ros_examples:
```
$ cd ~/catkin_ws/src
$ git clone https://github.com/rt-net/raspimouse_ros_examples.git
$ rosdep install -r -y -i --from-paths raspimouse*
$ cd ~/catkin_ws && catkin_make
$ source ~/catkin_ws/devel/setup.bash
```
Test SLAM on the simulator
```
$ roslaunch raspimouse_gazebo raspimouse_with_willowgarage.launch
$ roslaunch raspimouse_ros_examples slam_gmapping.launch
$ roslaunch raspimouse_ros_examples teleop.launch key:=true mouse:=false
```

