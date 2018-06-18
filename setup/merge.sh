#!/bin/bash


dir=`pwd`
if [ ! -e "${dir}/$(basename $0)" ]; then
  echo "Script not called from within repository directory. Aborting."
  exit 2
fi
dir="${dir}/.."

source ${dir}/setup/func.sh

if [ -f "${dir}/local/update.sh" ]; then
    ask "Update packages/?" Y && ${dir}/local/update.sh
fi

# Merge
rm -rf ${dir}/merged/bak
mkdir -p ${dir}/merged/bak
mv ${dir}/merged/* ${dir}/merged/bak

# Bash
cpif ${dir}/global/.bashrc ${dir}/merged/.bashrc
cpif ${dir}/global/.bash_aliases ${dir}/merged/.bash_aliases
if [ -f ${dir}/local/.local_bash_aliases ]; then
    cat ${dir}/local/.local_bash_aliases >> ${dir}/merged/.bash_aliases
fi

# Vim
cpif ${dir}/global/.vimrc ${dir}/merged/.vimrc
if [ -f ${dir}/local/.vimrc ]; then
    cat ${dir}/local/.vimrc >> ${dir}/merged/.vimrc
fi

# git
cpif ${dir}/global/.global_gitconfig ${dir}/merged/.gitconfig
if [ -f ${dir}/local/.local_gitconfig ]; then
    cat ${dir}/local/.local_gitconfig >> ${dir}/merged/.gitconfig
fi


# Merge experiments
if [ -f ${dir}/experimental/merge.sh ]; then
    ask "Use experimental/?" N && ${dir}/experimental/merge.sh
fi

# Link
if [ `ask "Link merged directory/?" Y` ]; then
    ln -sfn ${dir}/merged ${HOME}/.dotfiles.merged
    ask "Link bashrc/?" Y && ln -sfn ${dir}/merged/.bashrc ${HOME}/.bashrc && ln -sfn ${dir}/merged/.bash_aliases ${HOME}/.bash_aliases
    ask "Link vimrc/?" Y && ln -sfn ${dir}/merged/.vimrc ${HOME}/.vimrc
    ask "Link gitconfig/?" Y && ln -sfn ${dir}/merged/.gitconfig ${HOME}/.gitconfig
fi
