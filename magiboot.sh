#!/bin/bash

# MagiBoot Online Bootanimation Installer Script
# Coded by @FrosT2k5
# @MagiBoot for BootAnimations

# Colors
RED="\033[1;31m" # For errors / warnings
GREEN="\033[1;32m" # For info
YELLOW="\033[1;33m" # For input requests
BLUE="\033[1;36m" # For info
NC="\033[0m" # reset color

# Variables
URL="https://raw.githubusercontent.com/FrosT2k5/MagiBoot/master/bootanimations.txt"
HOMEDIR="/data/data/com.termux/files/home"
BINDIR="/data/data/com.termux/files/usr/bin"
CACHE_PATH="${HOMEDIR}/.cache/magiboot"
if [[ ! -d "$CACHE_PATH" ]]
then
    mkdir -p $CACHE_PATH
fi

curl $URL -o ${CACHE_PATH}/bootanimation.txt 2>/dev/null

bootanims=$(cat ${CACHE_PATH}/bootanimation.txt)
MAX=$(wc -l $CACHE_PATH/bootanimation.txt | cut -d " " -f 1)


echo -e "Number of Bootanimations: $GREEN $MAX $NC"
echo -e "\n\nChoose one from list of Available Bootanimations -"


while read i;
do
	num=$(echo $i | cut -d "," -f 1)
	name=$(echo $i | cut -d "," -f 2)
	echo " $num -  $name"
done < ${CACHE_PATH}/bootanimation.txt

	while true
	do
		echo -en "${YELLOW}[CHOICE]${NC}: "
		read inp

		if [[ inp -gt $MAX ]]
		then
			echo -e "${RED}Bootanimation $inp doesn't exist"
			continue
		fi

		if [ $inp -eq $inp 2>/dev/null ]
		then
			link=$(sed -n ${inp}p ${CACHE_PATH}/bootanimation.txt | cut -d "," -f 3)
			echo $link
			echo $link > ${CACHE_PATH}/choice
			break
	  	else
	    	echo "$inp is not an integer or not defined"
	  	fi

	done
