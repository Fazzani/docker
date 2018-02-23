#!/bin/bash

#---------------------------
# Variables
#---------------------------
webgrabDir="/app/wg++"
configDir="/config"
logfilename="webgrab.log"

#---------------------------
# Install all needed tools
#---------------------------
function install_packages {

  if wget --version >/dev/null 2>&1; then
    echo "wget Found"
  else
     /usr/bin/apt-get install -y git wget
  fi
}

#--------------------------
# Pushing to git
#--------------------------
function push_to_git
{
  echo "Pushing to git" 
}

#--------------------------------------------- main ----------------------------------------------------
cd /config

install_packages

for webGrab in ./*.config.xml; do

  echo "Processing webGrab file => $webGrab"
  echo "Moving $webGrab to WebGrab++.config.xml"
  cp -f $webGrab "$configDir/WebGrab++.config.xml"

  echo "Launching webgrab"
  wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=WebGrabber+extrating+xmltv+file+launched.+Working+directory+:+$webGrab"  -qO- && \
  mono "$webgrabDir/bin/WebGrab+Plus.exe" $configDir
  message=$(tail -n2 $logfilename) && \
  wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=$message."  -qO-

done

echo "End of grabbing" && \
echo "Compressing all xmltv" && \
tar -czf guide.tar.gz *.xmltv && \

# coping output file to git folder
cp -f guide.tar.gz ./webgrab-configs/ && \
#pushing to git
push_to_git

exit 0