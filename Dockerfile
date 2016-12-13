FROM ubuntu:xenial

MAINTAINER Kristian Peters <kpeters@ipb-halle.de>

LABEL Description="OpenMS port."

# Install dependencies
RUN apt-get -y update
RUN apt-get -y install cmake g++ autoconf automake qt4-dev-tools patch libtool make git software-properties-common python-software-properties libboost-all-dev libsvm-dev libglpk-dev libzip-dev zlib1g-dev libxerces-c-dev libbz2-dev libqt4-dbg libqt4-dev libqt4-opengl-dev libqtwebkit-dev
RUN apt-get -y install libboost-regex-dev libboost-iostreams-dev libboost-date-time-dev libboost-math-dev libsvm-dev libglpk-dev libzip-dev zlib1g-dev libxerces-c-dev libbz2-dev seqan-dev libwildmagic-dev libwildmagic5v5 libwildmagic5v5-dbg libeigen3-dev
RUN apt-get -y install python-setuptools python-pip python-nose python-numpy python-wheel cython cython-dbg doxygen doxygen-dbg 

RUN pip install autowrap

# Create needed directories
RUN mkdir /usr/src/openms
RUN mkdir /usr/src/openms/contrib-build
RUN mkdir /usr/src/openms/openms-build

# Build contrib stuff
WORKDIR /usr/src/openms
RUN git clone https://github.com/OpenMS/contrib
WORKDIR /usr/src/openms/contrib-build
RUN cmake -DBUILD_TYPE=SEQAN ../contrib && \
    cmake -DBUILD_TYPE=WILDMAGIC ../contrib && \
    cmake -DBUILD_TYPE=EIGEN ../contrib

# Build OpenMS
WORKDIR /usr/src/openms
RUN git clone https://github.com/OpenMS/OpenMS
WORKDIR /usr/src/openms/OpenMS
RUN git checkout tags/Release2.1.0
WORKDIR /usr/src/openms/openms-build
RUN cmake -DCMAKE_PREFIX_PATH="/usr/src/openms/contrib-build/;/usr/src/openms/contrib/;/usr/;/usr/local" -DBOOST_USE_STATIC=OFF -DHAS_XSERVER=Off ../OpenMS && make

# Build PyOpenMS
WORKDIR /usr/src/openms/openms-build
RUN cmake -DCMAKE_PREFIX_PATH="/usr/src/openms/contrib-build/;/usr/src/openms/contrib/;/usr/;/usr/local" -DBOOST_USE_STATIC=OFF -DHAS_XSERVER=Off -DPYOPENMS=ON ../OpenMS && make pyopenms
RUN python setup.py install
RUN pip install pyopenms

# Set environment and user
ENV PATH /usr/src/openms/openms-build/bin/:$PATH
RUN groupadd -g 9999 -f openms
RUN useradd -d /home/openms -m -g openms -u 9999 -s /bin/bash openms
RUN echo 'openms:openms' | chpasswd
WORKDIR /home/openms
USER openms

# Clean up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# Docker entrypoint
CMD [ "" ]
