#!/bin/bash

set -eu

source ../../common-functions.sh

echo 
echo "${info} *** Running without the patch from within the mods folder. *** ${normal}"
echo

java --modulepath mods \
     -m com.greetings/com.greetings.Main

echo
echo "${info} *** Running with the patch from within the mods folder. *** ${normal}"
echo

java --modulepath mods \
     --patch-module java.base=mypatches/java.base \
     -m com.greetings/com.greetings.Main

