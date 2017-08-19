#!/bin/bash

set -eu

source ../../common-functions.sh

echo ""
echo "${info} *** Running 'com.greetings.Main' from within the module package in the 'mlib' folder (running 'org.astro.World' from within the module package in the 'mlib' folder) *** ${normal}"
echo 
java --modulepath mlib \
     -m com.greetings

echo ""
echo "${info} *** Running 'com.greetings.Main' from within the module package in the 'mods' folder (running 'org.astro.World' from within the module package in the 'mods' folder) *** ${normal}"
echo
java --modulepath mods \
     -m com.greetings/com.greetings.Main

# See ../01_Greetings/run.sh for explanations to above commands
# Also see how the --modulepath can read module packages (jar files) in 'mlib' and take them as source modules for execution
