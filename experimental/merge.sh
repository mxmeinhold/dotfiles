echo -e '\nsource ~/.prompt/prompt.sh' >> $1/merged/.bash_aliases
cp -r $1/experimental/prompt $1/merged/
ln -snf $1/merged/prompt ${HOME}/.prompt

