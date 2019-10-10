#!/bin/bash

source ~/.config/herbstluftwm/colors

HC=herbstclient

monitor=${1:-0}
geometry=( $($HC monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi

# geometry has the format X Y W H
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}
panel_height=40
fontSize=10
fontAwesomeSize=10

$HC pad $monitor $panel_height


font="Monospace Medium-${fontSize}:antialias=true"
fontAwesomeFree="FontAwesome5Free-${fontAwesomeSize}:style=Solid:antialias=false;1"
fontAwesomeBrand="FontAwesome5Brand-${fontAwesomeSize}:style=Solid:antialias=false;1"

if awk -Wv 2>/dev/null | head -1 | grep -q '^mawk'; then
    # mawk needs "-W interactive" to line-buffer stdout correctly
    # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=593504
    uniq_linebuffered() {
      awk -W interactive '$0 != l { print ; l=$0 ; fflush(); }' "$@"
    }
else
    # other awk versions (e.g. gawk) issue a warning with "-W interactive", so
    # we don't want to use it there.
    uniq_linebuffered() {
      awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
    }
fi


{
    ### Event generator ###
    # based on different input data (mpc, date, hlwm hooks, ...) this generates events, formed like this:
    #   <eventname>\t<data> [...]
    # e.g.
    #   date    ^fg($fgcolor)18:33^fg(#909090), 2013-10-^fg($fgcolor)29

    #mpc idleloop player &
    while true ; do
        # "date" output is checked once a second, but an event is only
        # generated if the output changed compared to the previous run.
        date +$'date\t%m/%d %H:%M:%S'
        sleep 1 || break
    done > >( uniq_linebuffered ) &
    childpid=$!
    $HC --idle
    kill $childpid
} 2>/dev/null |

{
    bordercolor="#26221C"
    SEP="|"

    IFS=$'\t' read -ra tags <<< "$($HC tag_status $monitor)"
    visible=true
    date=$(date +$'%Y-%m-%d, %H:%M:%S')
    windowtitle="No window name set"

    while true ; do

        ### Data handling ###
        # This part handles the events generated in the event loop, and sets
        # internal variables based on them. The event and its arguments are
        # read into the array cmd, then action is taken depending on the event
        # name.
        # "Special" events (quit_panel/togglehidepanel/reload) are also handled
        # here.

        # wait for next event
        IFS=$'\t' read -ra cmd || break
        # find out event origin
        case "${cmd[0]}" in
            tag*)
                #echo "resetting tags" >&2
                IFS=$'\t' read -ra tags <<< "$($HC tag_status $monitor)"
                ;;
            date)
                DATE_TIME="$SEP ${cmd[@]:1}"
                ;;
            quit_panel)
                exit
                ;;
            togglehidepanel)
                currentmonidx=$($HC list_monitors | sed -n '/\[FOCUS\]$/s/:.*//p')
                if [ "${cmd[1]}" -ne "$monitor" ] ; then
                    continue
                fi
                if [ "${cmd[1]}" = "current" ] && [ "$currentmonidx" -ne "$monitor" ] ; then
                    continue
                fi
                #echo "^togglehide()"
                if $visible ; then
                    visible=false
                    $HC pad $monitor 0
                else
                    visible=true
                    $HC pad $monitor $panel_height
                fi
                ;;
            reload)
                exit
                ;;
            focus_changed|window_title_changed)
                windowtitle="${cmd[@]:2}"
                ;;
            #player)
            #    ;;
        esac

        WIN_TITLE="$SEP ${windowtitle//^/^^} $SEP"

        ### Output ###
        # This part prints dzen data based on the _previous_ data handling run,
        # and then waits for the next event to happen.

        # draw tags
        unset TAGS
        TAGS=' '
        for i in "${tags[@]}" ; do
            unset TAG
            case ${i:0:1} in
                '#') # the tag is viewed on the specified MONITOR and it is focused.
                    TAGCOLOR="%{F$co_panel_monitor_focust_fg}%{B$co_panel_monitor_focust_bg}"
                    ;;
                '+') # the tag is viewed on the specified MONITOR, but this monitor is not focused.
                    TAGCOLOR="%{B#9CA668}%{F#141414}"
                    ;;
                ':') # the tag is not empty
                    TAGCOLOR="%{B-}%{F$co_panel_occupied_fg}"
                    ;;
                '!') # the tag contains an urgent window
                    TAGCOLOR="%{F$co_panel_urgent_fg}%{B$co_panel_urgent_bg}"
                    ;;
                '.') # the tag is empty
                    TAGCOLOR="%{B-}%{F$co_panel_empty_fg}"
                    ;;
                '-') # the tag is viewed on a different MONITOR, but this monitor is not focused.
                    TAGCOLOR="%{B-}%{F$co_panel_other_monitor_unfocust_fg}"
                    ;;
                '%') # the tag is viewed on a different MONITOR and it is focused.
                    TAGCOLOR="%{B-}%{F$co_panel_other_monitor_focust_fg}"
                    ;;
            esac
            TAG="%{A:herbstclient focus_monitor $monitor && herbstclient use ${i:1}:}${i:1}%{A}"
            #TAG="${i:1}"
            TAGS="$TAGS$TAGCOLOR$TAG%{F-}%{B-} "
        done
        TAGS="$SEP$TAGS$SEP"


        #### small adjustments ####

        ## Volume
        volico='\uf028' #  \uf026
        vol=$(amixer -c 0 get Master | grep -o "[0-9]*%" | head -1)
        VOLUME="$SEP $volico$vol"

        ## Battery
        powerdir=/sys/class/power_supply/
        if [[ $(ls $powerdir/BAT*) ]]; then
            batstat=""
            for f in /sys/class/power_supply/BAT*/status
            do
                batstat=$(cat $f)-$batstat
            done
            pwr=$(cat /sys/class/power_supply/BAT0/capacity)
            if [[ $batstat == *"ischarging"* ]]; then
                #   \uf240    \uf241   \uf242    \uf243    \uf244
                [[ $pwr -lt 5 ]] && pwrico='%{F#ff0000}\uf244%{F-}'
                [[ $pwr -ge 5 ]] && pwrico='\uf243'
                [[ $pwr -gt 40 ]] && pwrico='\uf242'
                [[ $pwr -gt 70 ]] && pwrico='\uf241'
                [[ $pwr -gt 95 ]] && pwrico='\uf240'
            else
                #  \uf0e7
                pwrico='\uf0e7'
            fi
            PWR="$SEP $pwrico$pwr%"
        fi

        TOGGLETRAY="$SEP %{A:toggletray:}\uf26c%{A}" #    == \uf26c

        RIGHT="$VOLUME $PWR $DATE_TIME $TOGGLETRAY"


        echo -en "%{l}$TAGS%{c}$WIN_TITLE%{r}$RIGHT $SEP"

    done

    ### dzen2 ###
    # After the data is gathered and processed, the output of the previous block
    # gets piped to dzen2.

#}
}  | lemonbar -g ${panel_width}x${panel_height}+$x+$y -F $co_panel_fg -B $co_panel_bg -o 0 -f ${font} -o -2 -f ${fontAwesomeFree} -o -2 -f ${fontAwesomeBrand} -p -a 20 | sh
