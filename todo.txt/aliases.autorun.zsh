# todo.sh: https://github.com/ginatrapani/todo.txt-cli

alias todo.sh=`dirname $0`/todo.txt-cli/todo.sh

function t() { 
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}

alias n="t ls +next"
