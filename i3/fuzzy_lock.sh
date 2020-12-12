#! /bin/bash

FILE_PATH="~/.tmp/lock.png"
mkdir ~/.tmp
scrot FILE_PATH 
mogrify -resize 5% FILE_PATH 
mogrify -resize 2000% FILE_PATH 
i3lock -i FILE_PATH 
rm FILE_PATH 
