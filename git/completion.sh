# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
completion=/etc/bash_completion.d/git.bash

if test -f $completion
then
  source $completion
fi


# hub tab-completion script for zsh.
# This script complements the completion script that ships with git.
#

# Autoload _git completion functions
if declare -f _git > /dev/null; then
  _git
fi

if declare -f _git_commands > /dev/null; then
  _hub_commands=(
    'alias:show shell instructions for wrapping git'
    'pull-request:open a pull request on GitHub'
    'fork:fork origin repo on GitHub'
    'create:create new repo on GitHub for the current project'
    'browse:browse the project on GitHub'
    'compare:open GitHub compare view'
  )
  # Extend the '_git_commands' function with hub commands
  eval "$(declare -f _git_commands | sed -e 's/main_porcelain_commands=(/main_porcelain_commands=(${_hub_commands} /')"
fi



# vim: ft=zsh sw=2 ts=2 et
