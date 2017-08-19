#!/bin/bash

echo "--- Checking for Java 9 ---"
source ././../../common-functions.sh
echo "--- Java 9 found ---"
java -version

echo ""
echo "--- LAUNCH ---"

echo " > adding symbolic links to Java command(s) ---"

ln -f -s $(which java) java9

echo " > run monitor"
echo ""

# the classpath is needed for Spark's dependencies
java9 \
	--class-path 'build/class-path/*' \
	--modulepath build/module-path \
	--addmods monitor.observer.alpha,monitor.observer.beta \
	--addmods monitor.utils,monitor.statistics \
	--addmods monitor.rest \
	--addmods java.xml.bind \
	monitor.Main
