#!/bin/bash

INFO="\e[1m\e[93m"
ERR="\e[1m\e[91m"
RESET="\e[0m"

function info {
    echo "${INFO}---> $1$RESET"
}

function err {
    echo "${ERR}---> $1$RESET"
}


declare -A PLUGINS

# Auto match ({[""]}) etc.
PLUGINS["auto-pairs"]="https://github.com/jiangmiao/auto-pairs"

# Status bar
PLUGINS["lightline"]="https://github.com/itchyny/lightline.vim"

if ping -c 1 github.com &>/dev/null; then
    echo -e $(info "Gathering vim plugins")
else
    echo -e $(err "Cannot connect to github, skipping.")
    exit
fi


DOTFILES=`pwd`
DIR="${DOTFILES}/symlink/.vim"
GIT="${DOTFILES}/tmp/vim-git"

mkdir -p ${DIR}
mkdir -p ${GIT}

cd ${GIT}
git init
for remote in $(git remote); do
    if [ !${PLUGINS[$remote]} ]; then
        git remote remove $remote
    else
        git remote update $remote
        git merge --allow-unrelated-histories -s recursive -X ours --no-edit --no-gpg-sign -q $remote/master
    fi
done
for plugin in ${!PLUGINS[*]}; do
    git remote add $plugin ${PLUGINS[$plugin]}
    git fetch --depth=1 -n -q $plugin
        git merge --allow-unrelated-histories -s recursive -X ours --no-edit --no-gpg-sign -q $plugin/master
done

for dir in *; do
    if [ -d $dir ]; then
        cp -r $dir $DIR/
    fi
done
cd ${DOTFILES}
