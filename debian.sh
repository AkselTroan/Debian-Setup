#!/usr/bin/env bash

# 1: Should install essential packages
# Should install and setup i3-gaps

RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
CYAN=$'\e[1;36m'
ENDCOLOR=$'\e[0m'
MAGENTA=$'\e[1;35m'

cls='printf "\033c"'

arrow=' ==> '
newline=$'\n'

s
install_packages(){
	while read -r line; do apt-get install $line; done < ./Resources/package_list.txt
}

install_and_setup_i3_gaps(){
    which git
    if [$? -neq 0] then;
        exit
    else
        git clone https://github.com/maestrogerardo/i3-gaps-deb.git
        cd i3-gaps-deb
        sh i3-gaps-deb
    fi
}

menu(){
	echo "
$GREEN [MAIN MENU] $ENDCOLOR What do you want to do? $newline$MAGENTA
$MAGENTA 1: $ENDCOLOR Install Essential Packages
$MAGENTA 2: $ENDCOLOR Install and setup i3-gaps
$MAGENTA 3: $ENDCOLOR All above
$RED q:  QUIT $ENDCOLOR
"
}

options(){
read -p "$newline$arrow" option
case "$option" in  # For each option given, a function need to be added.
	1 ) echo "$CYAN Installing Essential packages... $ENDCOLOR"
		install_packages
		;;
	2 ) echo "$CYAN Installing and setting up i3-gaps... $ENDCOLOR"
		install_and_setup_i3_gaps
		;;
	3 ) echo "$CYAN Installing essential packages and setting up i3-gaps... $ENDCOLOR"
		install_packages
        install_and_setup_i3_gaps
		;;
	q ) echo "$RED QUITTING $ENDCOLOR";;
esac
}
menu
options
