#!/bin/bash

if [ `uname | grep Darwin` ]; then
	echo "This script will run on darwin (Mac OS X)";
else
	echo "This script will only run on darwin (Mac OS X)";
	exit 1
fi

if [ -d ~/src/kitware/Insight ]; then
	mkdir -p ~/src/kitware/Insight_build
	cd ~/src/kitware/Insight_build
	sudo rm -rf *
	# build_doxygen ON,
	# build_examples ON,
	# build_shared_libs OFF,
	# build_testing OFF,
	# cmake_backwards_compatibility WHATEVER,
	# cmake_build_type RelWithDebInfo,
	# cmake_install_prefix /usr/local
	# etc.
	ccmake ../Insight
	make
	sudo make install
else
	echo "No directory ~/src/kitware/Insight"
	echo "Get the source from cvs"
fi

