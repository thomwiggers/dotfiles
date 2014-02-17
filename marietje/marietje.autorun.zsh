#!/bin/zsh

LOC=$DotZSH/marietje/marietje

pushd $LOC > /dev/null

. $DotZSH/marietje/marietje/marietje-environment.sh

popd > /dev/null

alias upload-to-marietje-noord="python $LOC/pymarietje/src/upload.py -H noordslet.science.ru.nl -u twiggers"
alias marietje="$LOC/bin/pymarietje -H noordslet.science.ru.nl"
