FROM ubuntu:xenial

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="OpenMS port."
LABEL software.version="2.4.0"
LABEL version="0.1"

ENV software_version="2.4.0"

# Install dependencies
RUN apt-get -y update && 	apt-get install -y g++ autoconf make patch libtool make git automake wget build-essential cmake && 	apt-get install -y ninja-build qt5-default libqt5serialport5-dev qtscript5-dev libqt5svg5-dev zip && 	apt-get clean && 	apt-get purge && 	rm -rf /var/lib/apt/lists/*
WORKDIR /tmp

RUN git clone https://github.com/OpenMS/OpenMS.git && 	cd OpenMS && 	git checkout --quiet tags/Release2.4.0 && 	git submodule --quiet update --init contrib && 	git submodule --quiet update --init THIRDPARTY && 	cd THIRDPARTY && 	rm -rf .git Windows MacOS Linux/32bit

RUN mkdir contrib-build && 	cd contrib-build && 	cmake -DBUILD_TYPE=LIST ../OpenMS/contrib && 	cmake -DBUILD_TYPE=ALL -DNUMBER_OF_JOBS=4 ../OpenMS/contrib && 	rm -rf archives src

ENV PATH=/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/Fido:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/MyriMatch:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Fido:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/OMSSA:/tmp/OpenMS/THIRDPARTY/Linux/64bit/MyriMatch:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Fido:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/Percolator:/tmp/OpenMS/THIRDPARTY/Linux/64bit/OMSSA:/tmp/OpenMS/THIRDPARTY/Linux/64bit/MyriMatch:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Fido:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/Sirius:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Percolator:/tmp/OpenMS/THIRDPARTY/Linux/64bit/OMSSA:/tmp/OpenMS/THIRDPARTY/Linux/64bit/MyriMatch:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Fido:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/SpectraST:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Sirius:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Percolator:/tmp/OpenMS/THIRDPARTY/Linux/64bit/OMSSA:/tmp/OpenMS/THIRDPARTY/Linux/64bit/MyriMatch:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Fido:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV PATH=/tmp/OpenMS/THIRDPARTY/Linux/64bit/XTandem:/tmp/OpenMS/THIRDPARTY/Linux/64bit/SpectraST:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Sirius:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Percolator:/tmp/OpenMS/THIRDPARTY/Linux/64bit/OMSSA:/tmp/OpenMS/THIRDPARTY/Linux/64bit/MyriMatch:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Fido:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir OpenMS-build && 	cd OpenMS-build && 	cmake -DOPENMS_CONTRIB_LIBS="/tmp/contrib-build;/usr/;/usr/local" -DBOOST_USE_STATIC=OFF -DCMAKE_INSTALL_PREFIX="/usr/local/" -DHAS_XSERVER=Off ../OpenMS && 	make && 	make install && 	rm -rf src doc CMakeFiles

ENV PATH=/usr/local/bin:/tmp/OpenMS/THIRDPARTY/Linux/64bit/XTandem:/tmp/OpenMS/THIRDPARTY/Linux/64bit/SpectraST:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Sirius:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Percolator:/tmp/OpenMS/THIRDPARTY/Linux/64bit/OMSSA:/tmp/OpenMS/THIRDPARTY/Linux/64bit/MyriMatch:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Fido:/tmp/OpenMS/THIRDPARTY/Linux/64bit/Comet:/tmp/OpenMS/THIRDPARTY/Linux/64bit/:/tmp/OpenMS/THIRDPARTY/All/Sirius:/tmp/OpenMS/THIRDPARTY/All/MSGFPlus:/tmp/OpenMS/THIRDPARTY/All/LuciPHOr2:/tmp/OpenMS/THIRDPARTY/All/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV LD_LIBRARY_PATH=/usr/local/lib/:

WORKDIR /usr/local/

RUN zip -r OpenMS-2.4.0.zip lib/lib* share/OpenMS/* bin/*

WORKDIR /home/biodocker/
