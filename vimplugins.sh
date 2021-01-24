#!/bin/bash

INFO="\e[1m\e[93m"
SUBINFO="\e[1m\e[92m"
ERR="\e[1m\e[91m"
RESET="\e[0m"

function info {
    echo "${INFO}---> $1$RESET"
}

function subinfo {
    echo "${SUBINFO} --> $1$RESET"
}

function err {
    echo "${ERR}---> $1$RESET"
}


declare -A PLUGINS

# Auto match ({[""]}) etc.
PLUGINS["auto-pairs"]="https://github.com/jiangmiao/auto-pairs"

# Status bar
PLUGINS["lightline"]="https://github.com/itchyny/lightline.vim"

# Rainbow parentheses
PLUGINS["rainbow-paren"]="https://github.com/luochen1990/rainbow.git"

# Pug syntax (express js templating engine)
PLUGINS["pug"]="https://github.com/digitaltoad/vim-pug.git"

# Vim table mode for quick table formatting
PLUGINS["table-mode"]="https://github.com/dhruvasagar/vim-table-mode.git"

# Tool for computing math without needing to leave vim
PLUGINS["how-much"]="https://github.com/sk1418/HowMuch.git"

DOTFILES=`pwd`
DIR="${DOTFILES}/symlink/.vim"
GIT="${DOTFILES}/tmp/vim-git"

mkdir -p ${DIR}
mkdir -p ${GIT}


cd ${GIT}
git init &>/dev/null

echo -e $(info "Gathering vim plugins")

# Cscope mappings
mkdir -p ${GIT}/plugin
cd ${GIT}/plugin
wget -qN http://cscope.sourceforge.net/cscope_maps.vim
cd ${GIT}

for remote in $(git remote); do
    if [ !${PLUGINS[$remote]} ]; then
        git remote remove $remote
    else
        git remote update $remote
        git merge --allow-unrelated-histories -s recursive -X ours --no-edit --no-gpg-sign -q $remote/master &2>/dev/null
    fi
done
for plugin in ${!PLUGINS[*]}; do
    echo -e $(subinfo "Loading $plugin")
    git remote add $plugin ${PLUGINS[$plugin]}
    git fetch --depth=1 -n -q $plugin
    git merge --allow-unrelated-histories -s recursive -X ours --no-edit --no-gpg-sign -q $plugin/master &2>/dev/null
done

for dir in *; do
    if [ -d $dir ]; then
        cp -r $dir $DIR/
    fi
done
cd ${DOTFILES}
