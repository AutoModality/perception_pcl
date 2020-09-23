SHELL := /bin/bash


default:
	source /opt/ros/melodic/setup.bash && catkin_make && catkin_make install 


install:
	echo ALIREZA
	cp -r install debian/ros-melodic-am-perception-pcl/usr/
	install -d /github/workspace/install

clean:
	rm -rf ../*.deb
