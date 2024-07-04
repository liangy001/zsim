#!/bin/bash
ZSIMPATH=$(pwd)
PINPATH="$ZSIMPATH/pin"
LIBCONFIGPATH="$ZSIMPATH/libconfig"
NUMCPUS=$(grep -c ^processor /proc/cpuinfo)
RAMULATOR2PATH="/home/yue/simulator/ramulator2"
#DRAMSIMPATH="/home/cc/DRAMSim2"
echo $RAMULATOR2PATH

if [ "$1" = "z" ]
then
	echo "Compiling only ZSim ..."
        export PINPATH
        export LIBCONFIGPATH
        scons -j$NUMCPUS
else
	echo "Compiling all ..."
	export LIBCONFIGPATH
	cd $LIBCONFIGPATH
	./configure --prefix=$LIBCONFIGPATH && make install
	cd ..

	export PINPATH
	export RAMULATOR2PATH
#	export DRAMSIMPATH
	scons -j$NUMCPUS
fi
