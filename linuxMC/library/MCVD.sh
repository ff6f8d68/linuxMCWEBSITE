url=$1
wget $url 2>&1 | sed -u 's/.*\ \([0-9]\+%\)\ \+\([0-9.]\+\ [KMB\/s]\+\)$/\1\n# updating \2/' | zenity --progress --pulsate --auto-close --title="linuxMC updater"