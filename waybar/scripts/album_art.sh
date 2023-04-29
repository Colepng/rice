#!/bin/sh
album_art=$(playerctl -p mpd metadata mpris:artUrl)
if [[ -z $album_art ]] 
then
   # spotify is dead, we should die to.
   exit
fi
curl -s  "${album_art}" --output "/tmp/cover.jpeg"
echo "/tmp/cover.jpeg"
