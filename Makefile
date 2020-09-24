SHELL := /bin/bash

SRC_DIR=src

default:

	mkdir -p ${SRC_DIR}

	cp -rf pcl_conversions ${SRC_DIR}
	cp -rf pcl_ros ${SRC_DIR}
	cp -rf perception_pcl ${SRC_DIR}
	mv -f CMakeLists.txt ${SRC_DIR}
	source /opt/ros/melodic/setup.bash && catkin_make && catkin_make install


clean:
	mv -f ${SRC_DIR}/CMakeLists.txt .
	rm -rf ${SRC_DIR}
	rm -rf ../*.*deb
	rm -rf build devel install