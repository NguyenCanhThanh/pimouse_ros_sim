#!/usr/bin/env bash

set -e

UBUNTU_VER=$(lsb_release -sc)
ROS_VER=melodic

sudo apt-get install -y ros-${ROS_VER}-desktop-full
[ "which mktemp" = "" ] && sudo apt-get install -y mktemp

source ~/catkin_ws/devel/setup.bash || { echo "catkin_ws is not working correctly"; exit 1; }

roscd && cd ..
rosdep install -r -y --ignore-src --from-paths src
roscd && cd .. && source ~/catkin_ws/devel/setup.bash && catkin_make

roscd && cd ../src
cd pimouse_ros_sim/raspimouse_ros/scripts/
sudo chmod +x *.py

roscd && cd ../src
cd pimouse_ros_sim/raspimouse_ros_2/scripts/
sudo chmod +x *.py

roscd && cd ../src
cd pimouse_ros_sim/raspimouse_sim/raspimouse_gazebo/scripts/
sudo chmod +x *.py

roscd && cd ../src
cd pimouse_ros_sim/raspimouse_sim/raspimouse_fake/scripts/
sudo chmod +x *.py

roscd && cd ../src
cd pimouse_ros_sim/raspimouse_sim/raspimouse_fake/scripts/
sudo chmod +x *.sh

source ~/catkin_ws/devel/setup.bash

mkdir -p ~/.gazebo/models && cd ~/.gazebo/models
if [ ! -e "ground_plane" ]; then
	cd /tmp && \
	TMPDIR=$(mktemp -d tmp.XXXXXXXXXX) && \
	cd $TMPDIR && \
	wget -l1 -np -nc -r "http://models.gazebosim.org/sun" --accept=gz && \
	wget -l1 -np -nc -r "http://models.gazebosim.org/ground_plane" --accept=gz && \
	wget -l1 -np -nc -r "http://models.gazebosim.org/gas_station" --accept=gz && \
	cd "models.gazebosim.org" && \
	for i in *; do tar -zvxf "$i/model.tar.gz"; done && \
	cp -vfR * ~/.gazebo/models/
fi
