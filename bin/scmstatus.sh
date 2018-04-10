#!/bin/bash

gs_prefix=~/bin
. $gs_prefix/ansicolor.sh

# Display the exit status of the previous command, if non-zero.
function ExitStatus
{
    gs_exitstatus=$?

    if [ $gs_exitstatus -ne 0 ]; then
        echo -en "${FG_RED}Exit status: $gs_exitstatus ${CO_RESET}"
    fi
}

# This is called before printing the each word in a list. The words should be
# comma separated, so it prints a comma unless the word it's supposed to print
# next is the FIRST word.
function MaybeEchoComma
{
    if [ ! -z "$gs_first" ]; then
        gs_first=
    else
        echo -n ", "
    fi
}

# Show the git commit status.
function CommitStatus
{
    unset added
    git status -s --porcelain | while read -r line; do
    if [[ $line == A* ]]; then
        if [ -z "$added" ]; then
            added=1
            MaybeEchoComma
            echo -en "${FG_YELLOW}Added${CO_RESET}"
        fi
    elif [[ $line == \?\?* ]]; then
        if [ -z "$untracked" ]; then
            untracked=1
            MaybeEchoComma
            echo -en "${FG_CYAN}Untracked${CO_RESET}"
        fi
    elif [[ $line == M* ]]; then
        if [ -z "$modified" ]; then
            modified=1
            MaybeEchoComma
            echo -en "${FG_BLUE}Modified${CO_RESET}"
        fi
    elif [[ $line == D* ]]; then
        if [ -z "$deleted" ]; then
            deleted=1
            MaybeEchoComma
            echo -en "${FG_RED}Deleted${CO_RESET}"
        fi
    elif [[ $line == R* ]]; then
        if [ -z "$renamed" ]; then
            renamed=1
            MaybeEchoComma
            echo -en "${FG_MAGENTA}Renamed${CO_RESET}"
        fi
    elif [[ $line == C* ]]; then
        if [ -z "$copied" ]; then
            copied=1
            echo -en ", ${FG_MAGENTA}Copied${CO_RESET}"
        fi
    elif [[ $line == U* ]]; then
        if [ -z "$unmerged" ]; then
            copied=1
            MaybeEchoComma
            echo -en "${FG_MAGENTA}Updated-but-unmerged${CO_RESET}"
        fi
    else
        echo "UNKNOWN STATUS"
            return 1
        fi
    done

    return 0
}

function GitStatus
{

    gs_first=1

    # If we're inside a .git directory, we can't find the branch / commit status.
    if pwd | grep -q /.git; then
    return 0
    fi

    if git rev-parse --git-dir >/dev/null 2>&1; then
        gs_branch=$(git branch | grep "^* " | cut -c 3-)

        gs_gitstatus=$(CommitStatus)

        if [ $? -eq 0 ]; then
            if [ -z "$gs_gitstatus" ]; then
                echo -e "${FG_BLUE}[${CO_RESET}$gs_branch${FG_BLUE}]${CO_RESET}: ${FG_GREEN}Up-to-date${CO_RESET}"
            else
                echo -e "${FG_BLUE}[${CO_RESET}$gs_branch${FG_BLUE}]${CO_RESET}: $gs_gitstatus"
            fi
        fi
    fi
}

export PS1="\n\$(ExitStatus)${FG_BLUE}[${CO_RESET}\$(date +%H:%M)${FG_BLUE}]${CO_RESET} ${FG_GREEN}\u${CO_RESET} @ ${FG_GREEN}\h${CO_RESET}: ${FG_YELLOW}\w${CO_RESET} \$(GitStatus)\n\$ "

