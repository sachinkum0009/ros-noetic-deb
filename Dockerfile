FROM ros:noetic-ros-core

# Use bash instead of sh for the RUN steps
SHELL ["/bin/bash", "-c"]

# Install ros package and dependencies
RUN apt-get update && apt-get install -y \
    # python bloom and fake root
    # python-bloom \
    python3-pip \
    fakeroot \
    git \
    dpkg-dev \
    debhelper
    
RUN pip install -U bloom

RUN rosdep init && rosdep update

# ros entrypoint
ADD ros_entrypoint.sh /ros_entrypoint.sh

ENTRYPOINT [ "/ros_entrypoint.sh" ]