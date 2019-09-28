[ -f ~/cfg/generate_packagemanager_aliases ] && . ~/cfg/generate_packagemanager_aliases

managers="pacman xbps-install apt yum dnf"

for p in $managers
do
    which $p >/dev/null 2>&1
    if [ "$?" == "0" ]; then
        manager=$p
        break
    fi
done

case $manager in
apt)
    os_specific_file=~/cfg/debian_linux_specific
;;
dnf|yum)
    os_specific_file=~/cfg/redhat_linux_specific
;;
pacman)
    os_specific_file=~/cfg/arch_linux_specific
;;
xbps-install)
    os_specific_file=~/cfg/void_linux_specific
;;
esac

[ -f $os_specific_file ] && . $os_specific_file
