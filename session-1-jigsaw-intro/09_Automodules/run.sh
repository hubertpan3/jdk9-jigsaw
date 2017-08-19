#!/bin/bash

set -eu

source ../../common-functions.sh

echo 
echo "${info} *** Running from within the mods folder without arguments. *** ${normal}"
echo
if [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] ; then
    java --modulepath "mods/main;lib" \
         -m com.greetings/com.greetings.Main
else
    java --modulepath mods/main:lib \
         -m com.greetings/com.greetings.Main
fi

echo
echo "${info} *** Running from within the mods folder with arguments. *** ${normal}"
echo

if [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] ; then
    java --modulepath "mods/main;lib" \
         -m com.greetings/com.greetings.Main \
        Alice Bob Charlie
else
    java --modulepath mods/main:lib \
         -m com.greetings/com.greetings.Main \
        Alice Bob Charlie
fi

echo
echo "${info} *** Running tests *** ${normal}"
echo

# Instead of running the compiled test code directly (which we could do), we're running it as a patch to the original code.
if [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] ; then
    java --modulepath "mods/main;lib" \
         --add-modules com.greetings \
         --patch-module com.greetings=mods/test/com.greetings \
         -m junit/org.junit.runner.JUnitCore \
        com.greetings.GreetTest
else
    java --modulepath mods/main:lib \
         --add-modules com.greetings \
         --patch-module com.greetings=mods/test/com.greetings \
         -m junit/org.junit.runner.JUnitCore \
        com.greetings.GreetTest
fi