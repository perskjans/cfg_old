### START: general

    setxkbmap -model pc105 -layout us -variant altgr-intl
    #setxkbmap -model pc105 -layout us,us -variant altgr-intl,workman-intl -option grp:alt_shift_toggle

    stty -ixon # Disable ctrl-s and ctrl-q

    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    #shopt -s globstar

    #shopt -s autocd # Allows you to cd into directory merely by typing the directory name


### END: general




### START: Load OS specific file

    for f in ~/cfg/lib/*_linux_specific; do . $f; done

### END: Load OS specific file


### START: aliases

    [ -f ~/cfg/lib/exports ] &&. ~/cfg/lib/exports
    [ -f ~/cfg/lib/aliases ] &&. ~/cfg/lib/aliases

### START: aliases


### START: Load rc file for current shell
    case $SHELL in
        *bash) [ -f ~/.bashrc ] && . ~/.bashrc ;;
    esac
### END: Load rc file for current shell


### START: Load work config file

    [ -d ~/.workconfig ] && . ~/.workconfig/*

### END: Load work config file


### START: Prompt setup

    . ~/cfg/lib/setprompt

### END: Prompt setup
