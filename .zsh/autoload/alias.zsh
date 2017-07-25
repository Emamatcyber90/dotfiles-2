require alias && return 1

# Assumes HIST_IGNORE_SPACE is set
# making aliases to certain commands to start with space to be ignored from history
alias ls=" ls --color=tty"
alias ll=" ls -lh"
alias history=" fc -il 1"