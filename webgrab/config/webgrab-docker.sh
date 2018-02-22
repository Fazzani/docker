#!/bin/bash

webgrabDir="/app/wg++"
configDir="/config"
logfilename="webgrab.log"

pwd 

for webGrab in ./*.config.xml; do
  echo "Processing webGrab file => $webGrab"
  echo "Moving $WebGrab to WebGrab++.config.xml"
  mv -u $WebGrab "$configDir/WebGrab++.config.xml"
  echo "Launching webgrab"
  wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=WebGrabber+extrating+xmltv+file+launched.+Working+directory+:+$webGrab"  -qO- > /dev/null 2>>4 &
  mono "$webgrabDir/bin/WebGrab+Plus.exe" $configDir >> $logfilename
  message=$(tail -n2 $logfilename)
  sudo wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=$message."  -qO-  > /dev/null 2>>4
  sleep 5
done

exit 0

# #Flags && default values
# verboseFlag=0
# logFlag=0
# outputfile="guide.xmltv"
# baseDir="$pwd"
# configDir="$pwd"
# logFilePath="WebGrab++.log.txt"

# exec 3>&1
# exec 4>&2

# while getopts ":vd:l:f:b:" opt; do
#   case ${opt} in
#     f) # process option fileName
#     echo "-f was triggered, Parameter: $OPTARG" >&2
#     outputfile=$OPTARG
#       ;;
#     v) # process option verbose
#     echo "-v was triggered, Parameter: $OPTARG" >&2
#     verboseFlag=1
#       ;;
#     d) # process working directory path
#     echo "-d was triggered, Parameter: $OPTARG" >&2
#     configDir=$OPTARG
#       ;;
#     b) # process base directory path
#     echo "-b was triggered, Parameter: $OPTARG" >&2
#     baseDir=$OPTARG
#       ;;
#     l) # process enable log
#     echo "-l was triggered, Parameter: $OPTARG" >&2
#     logFlag=1
#     echo $logFlag
#     logEpgFileName=$OPTARG
#     echo $logEpgFileName
#       ;;
#     \?) echo -e "Usage: grab -f ouputFile.xmltv \n-d (working directory, config path) \n[-v (verbose)] \n[-l (enable logging)] \n[-b (webGrab++.exe directory path)]\n"
#     exit 0
#       ;;
#   esac
# done

# #______________________ Activate log mode ______________________
# if [ $logFlag == 1 ];then
#     logFilePath=$configDir$logEpgFileName
# fi
# #______________________ Activate verbose mode ______________________
# if [ $verboseFlag == 0 ];then
# 	echo "In silent mode..."
# 	exec 3>$logFilePath
# 	exec 4>$logFilePath
# else
#   echo $logFilePath
#   echo "WebGrabber Plus launched for $logEpgFileName file"
# fi
# #______________________ launch grabber && update tvheadend ______________________
# sudo wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=WebGrabber+extrating+xmltv+file+launched.+Working+directory+:+$configDir"  -qO- > /dev/null 2>>4 &
# cd  $baseDir && 
# mono ./bin/WebGrab+Plus.exe $configDir 1>&3 2>&4 &&
# sudo cp "$configDir$outputfile" /home/hts/epg 2>>4 #todo : pass a parameter
# sudo cp "$configDir$outputfile" /home/pi/toshiba/xmltv 2>>4 #todo : pass a parameter
# message=$(tail -n2 $logFilePath)

# if [ $verboseFlag == 1 ];then
#   echo "Push epg to tvheadend"
#   echo "last line from log file : $message"
# fi
# cat "$configDir$outputfile" | socat - UNIX-CONNECT:/home/hts/.hts/tvheadend/epggrab/xmltv.sock &&
# sudo wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=$message."  -qO-  > /dev/null 2>>4
# exit 0