#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# [[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

# _set_liveuser_PS1() {
#     PS1='[\u@\h \W]\$ '
#     if [ "$(whoami)" = "liveuser" ] ; then
#         local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
#         if [ -n "$iso_version" ] ; then
#             local prefix="eos-"
#             local iso_info="$prefix$iso_version"
#             PS1="[\u@$iso_info \W]\$ "
#         fi
#     fi
# }
# _set_liveuser_PS1
# unset -f _set_liveuser_PS1

# ShowInstallerIsoInfo() {
#     local file=/usr/lib/endeavouros-release
#     if [ -r $file ] ; then
#         cat $file
#     else
#         echo "Sorry, installer ISO info is not available." >&2
#     fi
# }

source ~/.config/fish/aliases.fish

# [[ "(whoami)" = "root" ]] && return

# [[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
# bind '"\e[A":history-search-backward'
# bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

# _open_files_for_editing() {
#     # Open any given document file(s) for editing (or just viewing).
#     # Note1:
#     #    - Do not use for executable files!
#     # Note2:
#     #    - Uses 'mime' bindings, so you may need to use
#     #      e.g. a file manager to make proper file bindings.

#     if [ -x /usr/bin/exo-open ] ; then
#         echo "exo-open $@" >&2
#         setsid exo-open "$@" >& /dev/null
#         return
#     fi
#     if [ -x /usr/bin/xdg-open ] ; then
#         for file in "$@" ; do
#             echo "xdg-open $file" >&2
#             setsid xdg-open "$file" >& /dev/null
#         done
#         return
#     fi

#     echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
# }

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

# . "$HOME/.cargo/env"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:$HOME/.emacs.d/bin:$PATH:$HOME/.ghcup/bin:$HOME/.cabal/bin:$HOME/hs/bin:$HOME/.cargo/bin:$HOME/.deno/bin:$HOME/Aims/curlfire"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
# setopt autocd
fish_vi_key_bindings
fish_vi_cursor
starship init fish | source
export RUSTC_FORCE_INCREMENTAL=1
export EDITOR="nvim"
export TROLLNAMES_PATH="/home/mbk/hs/content/mine/trollname/6-letter-english-words.txt"

set fish_greeting

if status is-interactive
    if set -q ASCIINEMA_REC
        return
    end
    if test $PWD = "/home/mbk/hs"
        homestartup
    else
        fortune | cowsay
    end
end

export CHEZSCHEMELIBDIRS="/home/mbk/Aims/chez/thunderchez:/home/mbk/Aims/chez/thunderchez:/home/mbk/Aims/chez/chez-srfi:/home/mbk/Aims/chez/pfds"

# opam configuration
source /home/mbk/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
