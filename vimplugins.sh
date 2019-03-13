#!/bin/bash

INFO="\e[1m\e[93m"
RESET="\e[0m"

function info {
    echo "${INFO}---> $1$RESET"
}


declare -A PLUGINS

# Auto match ({[""]}) etc.
PLUGINS["auto-pairs"]="https://github.com/jiangmiao/auto-pairs"

# Status bar
PLUGINS["lightline"]="https://github.com/itchyny/lightline.vim"

#TODO for each plugin add it as a remote, and pull it in, then move everything to .vim

DOTFILES=`pwd`
DIR="${DOTFILES}/symlink/.vim"

mkdir -p ${DIR}/plugin
mkdir -p ${DIR}/git

cd ${DIR}/git
git init
for plugin in ${!PLUGINS[*]}; do
    git remote add $plugin ${PLUGINS[$plugin]}
    git fetch --depth=1 -n -q $plugin
    MERGES="$MERGES $plugin/master"
    INIT="$plugin/master"
done
echo -e $(info "Merging $INIT")
git reset --hard $INIT
for branch in $MERGES; do
    if [ "$INIT" != $branch ]; then
        echo -e $(info "Merging $branch")
        git merge --allow-unrelated-histories -s recursive -X ours --no-edit --no-gpg-sign -q $branch
    fi
done

rm -rf .git
for dir in *; do
    if [ -d $dir ]; then
        cp -r $dir $DIR/
    fi
done
cd ${DOTFILES}
rm -rf ${DIR}/git
