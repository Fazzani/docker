#!/bin/bash

#---------------------------
# Variables
#---------------------------
webgrabDir="/app/wg++"
configDir="/config"
logfilename="webgrab.log"
repo_git="https://github.com/Fazzani/webgrab-configs.git"
#---------------------------
# Install all needed tools
#---------------------------
function install_necessary_packages {

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
  # coping output file to git folder
  cp -f guide.tar.gz ./webgrab-configs/ && \
  echo "push to git"
  git push
}

#--------------------------
# Getting last version from git
# params : git Repo 
#--------------------------
function latest_from_git
{
  echo "Getting latest version from repo git: $1" 
  if [ ! -d .git ]; then
    echo "The repo $1 not exist so we clone it"
    git clone $1
  fi

  # coping output file to git folder
  cp -f guide.tar.gz ./webgrab-configs/ && \
  git push
}

#--------------------------------------------- main ----------------------------------------------------
cd /config

install_necessary_packages

latest_from_git repo_git

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

#pushing to git
push_to_git repo_git

exit 0