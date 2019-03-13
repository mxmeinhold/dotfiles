#! /bin/bash
mkdir ~/.tmp
scrot ~/.tmp/lock.png
mogrify -resize 5% ~/.tmp/lock.png
mogrify -resize 2000% ~/.tmp/lock.png
i3lock -i ~/.tmp/lock.png
rm ~/.tmp/lock.png
