#!/bin/bash

dir=`pwd`

if [ -d symlink ]; then
    rm -rf symlink
fi
mkdir symlink

# Main Configs
for filename in */*.symlink; do
    cp $filename symlink/
    if [ -f ${filename}.local ]; then
        cat symlink/`basename $filename` ${filename}.local > symlink/.`basename $filename .symlink`
        rm symlink/`basename $filename`
    else
        mv symlink/`basename $filename` symlink/.`basename $filename .symlink`
    fi
    ln -sfn ${dir}/symlink/.`basename $filename .symlink` ~/.`basename $filename .symlink`
done

# Aliases
for filename in */*.aliases; do
    if [ -f ${filename}.local ]; then
        cat $filename ${filename}.local > symlink/`basename $filename`
    else
        cp $filename symlink/
    fi
done

mv symlink/bash.aliases symlink/.bash_aliases
ln -sfn ${dir}/symlink/.bash_aliases ~/.bash_aliases

for filename in symlink/*.aliases; do
    cat $filename >> symlink/.bash_aliases
    rm $filename
done

ln -sfn ${dir}/prompt ~/.prompt
