#!/bin/bash

# Panel for herbstluftwm using dzen2
 
## dzen stuff
FG='#CCCCCC'
BG='#333333'
#FONT='-*-fixed-medium-*-*-*-12-*-*-*-*-*-*-*'
FONT="-misc-dejavu sans-medium-r-normal--13-0-0-0-p-0-iso8859-15"

monitor="$@"

geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi
# geometry has the format W H X Y
xoff=${geometry[0]}
yoff=${geometry[1]}
width=${geometry[2]}
height=16

####
# Try to find textwidth binary.
# In e.g. Ubuntu, this is named dzen2-textwidth.
if which textwidth &> /dev/null ; then
    textwidth="textwidth";
elif which dzen2-textwidth &> /dev/null ; then
    textwidth="dzen2-textwidth";
else
    echo "This script requires the textwidth tool of the dzen2 project."
    exit 1
fi

####
# true if we are using the svn version of dzen2
# depending on version/distribution, this seems to have version strings like
# "dzen-" or "dzen-x.x.x-svn"
if dzen2 -v 2>&1 | head -n 1 | grep -q '^dzen-\([^,]*-svn\|\),'; then
    dzen2_svn="true"
else
    dzen2_svn=""
fi

if awk -Wv 2>/dev/null | head -1 | grep -q '^mawk'; then
    # mawk needs "-W interactive" to line-buffer stdout correctly
    # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=593504
    uniq_linebuffered()
    {
      awk -W interactive '$0 != l { print ; l=$0 ; fflush(); }' "$@"
    }
else
    # other awk versions (e.g. gawk) issue a warning with "-W interactive", so
    # we don't want to use it there.
    uniq_linebuffered()
    {
      awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
    }
fi

{
   conky -c ~/.config/herbstluftwm/statusbar | while read -r output; do
      echo -e "conky\t$output"

   done > >( uniq_linebuffered ) &
   childpid=$!
   herbstclient --idle
   kill $childpid

} 2>/dev/null |

{
    TAGS=( $(herbstclient tag_status $monitor) )
    #separator="^fg(#333333)^ro(1x16)^fg()"
    separator="^bg()^fg($selbg)|"
    n=0

    while true; do
        for i in "${TAGS[@]}"; do
        echo -n "^ca(1,herbstclient use ${i:1}) "
        case ${i:0:1} in
        '#')
            echo -n "^fg(#2290B5)[^fg(#FFCC30)${i:1}^fg(#2290B5)]"
            ;;
        '%')
            echo -n "^fg(#2290B5)(^fg(#FFCC30)${i:1}^fg(#2290B5))"
            ;;
        '+')
            echo -n "^fg(#2290B5)[^fg(#CCCCCC)${i:1}^fg(#2290B5)]"
            ;;
        '-')
            echo -n "^fg(#2290B5)(^fg(#CCCCCC)${i:1}^fg(#2290B5))"
            ;;
        ':')
            echo -n "^fg(#CCCCCC) ${i:1} "
            ;;
        *)
            echo -n "^fg(#2290B5) ${i:1} "
            ;;
        esac
        echo -n "^ca()"
    done
    echo -n " $separator"
    gap_width=$(textwidth "$FONT" "$conkyoutput  ")
    echo -n "^p(_RIGHT)^p(-$gap_width)$conkyoutput"
    echo

    # small adjustments
    #right="$conkyoutput  "
    #right_text_only=$(echo -n "$right" | sed 's.\^[^(]*([^)]*)..g')
    ## get width of right aligned text.. and add some space..
    #gap_width=$($textwidth "$FONT" "$right_text_only    ")

    ##echo -n "^pa($(( $width - $gap_width )))$right"
    ##echo -n "^pa($(( 500 ))) ppp eee rrr $n"
    #echo

    # wait for next event
    IFS=$'\t' read -ra cmd || break
    # find out event origin
    case "${cmd[0]}" in
        tag*)
            TAGS=( $(herbstclient tag_status $monitor) )
            ;;
        conky*)
            (( n++ ))
            conkyoutput="${cmd[1]}"
            ;;
        esac
     done
} 2> /dev/null |dzen2 -ta l -y $yoff -x $xoff -h $height -w $width -fg $FG -bg $BG -fn "$FONT" &

