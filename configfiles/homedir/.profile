### START: general

    stty -ixon # Disable ctrl-s and ctrl-q

    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" # make less more friendly for non-text input files, see lesspipe(1)

    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    #shopt -s globstar

    #shopt -s autocd # Allows you to cd into directory merely by typing the directory name
    PATH=~/bin:$PATH
    export PATH
    export EDITOR=vim

    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' # colored GCC warnings and errors
    export QT_STYLE_OVERRIDE=gtk
    export QT_SELECT=qt5

    if [ $LANG == '' ]; then
        export LANG="en_US.UTF-8"
        export LC_CTYPE="en_US.UTF-8"
        export LC_NUMERIC="en_US.UTF-8"
        export LC_TIME="en_US.UTF-8"
        export LC_COLLATE=C
        export LC_MONETARY="en_US.UTF-8"
        export LC_MESSAGES="en_US.UTF-8"
        export LC_PAPER="en_US.UTF-8"
        export LC_NAME="en_US.UTF-8"
        export LC_ADDRESS="en_US.UTF-8"
        export LC_TELEPHONE="en_US.UTF-8"
        export LC_MEASUREMENT="en_US.UTF-8"
        export LC_IDENTIFICATION="en_US.UTF-8"
        export LC_ALL="en_US.UTF-8"
    fi

### END: general


### START: Load OS specific file

    for f in ~/cfg/lib/*_linux_specific; do . $f; done

### END: Load OS specific file


### START: aliases

    [ -f ~/cfg/lib/aliases ] &&. ~/cfg/lib/aliases

### START: aliases


### START: Load rc file for current shell
    case $SHELL in
    *bash)
        [ -f ~/.bashrc ] && . ~/.bashrc
    ;;
    esac
### END: Load rc file for current shell


### START: Load work config file

    [ -d ~/.workconfig ] && . ~/.workconfig/*

### END: Load work config file


### START: Prompt setup

    . ~/cfg/lib/setprompt

### END: Prompt setup
