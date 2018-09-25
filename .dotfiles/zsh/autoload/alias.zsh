# https://news.ycombinator.com/item?id=11070797
# http://stackoverflow.com/questions/1030169/easy-way-pull-latest-of-all-submodules
alias dot="git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"
alias notes="git --git-dir=$HOME/Notes/.git --work-tree=$HOME/Notes"
alias awk="awk -i common.awk"

# Assumes HIST_IGNORE_SPACE is set
# making aliases to certain commands to start with space to be ignored from history
alias ls=" ls --color=tty"
alias ll=" ls -lh"
alias history=" fc -il 1"

# Common typos
# Warning: highly personalized
alias ψδ=" cd"
alias λσ=" ls"
alias γιτ="git"

# time & date
alias today="date +%Y-%m-%d"

# Ubuntu custom shortcuts
# ctrl + alt + d
# sh -c 'xdotool type --clearmodifiers -- "$(date +%Y-%m-%d)"'

# Using checklist: https://github.com/marinintim/checklist
alias cl="checklist -f ~/Notes/checklist/checklist.txt"
# daily list
alias dl="checklist -f ~/Notes/checklist/checklist.$(today).txt"

# Based on youtube-dl
alias mp3-dl="noglob youtube-dl --extract-audio --audio-format mp3"

# Openbet pipeline
alias pipeline=~/Code/us-entry-current-branches/pipeline

# rlwrap tclsh to get autocomplete and command history
# alias tclsh="rlwrap -z $HOME/.tclsh/autocomplete tclsh"
alias tclsh="rlwrap tclsh"

alias times='curl --silent --show-error --output /dev/null --write-out "
time_namelookup: %{time_namelookup}
time_connect: %{time_connect}
time_appconnect: %{time_appconnect}
time_pretransfer: %{time_pretransfer}
time_redirect: %{time_redirect}
time_starttransfer: %{time_starttransfer}
time_total: %{time_total}"'

alias http_code='curl --silent --show-error --output /dev/null --write-out "%{http_code}\n"'
alias weather="curl -q http://wttr.in/Athens"
alias moon="curl -q http://wttr.in/Moon"
