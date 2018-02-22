#!/bin/bash

webgrabDir="/app/wg++"
configDir="/config"
logfilename="webgrab.log"

pwd 
cd /config

for webGrab in ./*.config.xml; do
  echo "Processing webGrab file => $webGrab"
  echo "Moving $webGrab to WebGrab++.config.xml"
  mv -u $webGrab "$configDir/WebGrab++.config.xml"
  echo "Launching webgrab"
  wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=WebGrabber+extrating+xmltv+file+launched.+Working+directory+:+$webGrab"  -qO- > /dev/null 2>>4 &
  mono "$webgrabDir/bin/WebGrab+Plus.exe" $configDir >> $logfilename
  message=$(tail -n2 $logfilename)
  sudo wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=$message."  -qO-  > /dev/null 2>>4
  sleep 5
done

exit 0