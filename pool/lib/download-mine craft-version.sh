#!/bin/bash
## This script will download all URLs in the file provided as first arg
## ./download_minecraft_all.sh versions.txt
##
## Each URL on a newline, points to the .jar file on launcher.mojang.com
## ie. https://launcher.mojang.com/mc/game/1.12.2/client/.../client.jar
##
## Grab the URLs from https://mcversions.net/ and do some find/replace,
## or dump the source into a URL extractor

while IFS='' read -r line || [[ -n "$line" ]]; do
  ## Strip the "https://launcher.mojang.com/mc/game" portion
  VERSION_PRE=${line##*/game/}
  ## Strip the parts after the version number
  VERSION=${VERSION_PRE%%/*}
  ## Get filename (client.jar or server.jar)
  FILE=${line##*/}
  
  ## Uncomment to see what is being grabbed
  #echo ${VERSION}
  #echo ${FILE}
  #echo ${VERSION}/${FILE}
  
  ## Create a new directory for this version
  mkdir ${VERSION}
  ## Download both client and server jars into this
  wget $line -O ${VERSION}/${FILE}
done < "$1"
