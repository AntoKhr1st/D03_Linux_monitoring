#!/bin/bash

#call counter
source counter.sh
counter_color


export HOSTNAME="$(cat /etc/hostname)"
    echo -e "${FRONT_1}${BACK_1}HOSTNAME${END}=${FRONT_2}${BACK_2}$HOSTNAME${END}"
export TIMEZONE="$(timedatectl | awk 'NR==4{print $3 " UTC", $5}' | tr -d "0)")"
    echo -e "${FRONT_1}${BACK_1}TIMEZONE${END}=${FRONT_2}${BACK_2}$TIMEZONE${END}"
export USER="$(whoami)"
    echo -e "${FRONT_1}${BACK_1}USER${END}=${FRONT_2}${BACK_2}$USER${END}"
export OS="$(awk '{print $1,$2,$3}' /etc/issue)"
    echo -e "${FRONT_1}${BACK_1}OS${END}=${FRONT_2}${BACK_2}$OS${END}"
export DATE="$(date | awk '{print $2,$3,$4,$5}')"
    echo -e "${FRONT_1}${BACK_1}DATE${END}=${FRONT_2}${BACK_2}$DATE${END}"
export UPTIME="$(uptime -p)"
    echo -e "${FRONT_1}${BACK_1}UPTIME${END}=${FRONT_2}${BACK_2}$UPTIME${END}"
export UPTIME_SEC="$(awk '{print $1}' /proc/uptime)"
    echo -e "${FRONT_1}${BACK_1}UPTIME_SEC${END}=${FRONT_2}${BACK_2}$UPTIME_SEC${END}"
export IP="$(hostname -I)"
    echo -e "${FRONT_1}${BACK_1}IP${END}=${FRONT_2}${BACK_2}$IP${END}"
export MASK="$(ifconfig | awk 'NR==2{print $4}')"
    echo -e "${FRONT_1}${BACK_1}MASK${END}=${FRONT_2}${BACK_2}$MASK${END}"
export GATEWAY="$(ip route | awk '/default/{print $3}')"
    echo -e "${FRONT_1}${BACK_1}GATEWAY${END}=${FRONT_2}${BACK_2}$GATEWAY${END}"
export RAM_TOTAL="$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')"
    echo -e "${FRONT_1}${BACK_1}RAM_TOTAL${END}=${FRONT_2}${BACK_2}$RAM_TOTAL${END}"
export RAM_USED="$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')"
    echo -e "${FRONT_1}${BACK_1}RAM_USED${END}=${FRONT_2}${BACK_2}$RAM_USED${END}"
export RAM_FREE="$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')"
    echo -e "${FRONT_1}${BACK_1}RAM_FREE${END}=${FRONT_2}${BACK_2}$RAM_FREE${END}"
export SPACE_ROOT="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')"
    echo -e "${FRONT_1}${BACK_1}SPACE_ROOT${END}=${FRONT_2}${BACK_2}$SPACE_ROOT${END}"
export SPACE_ROOT_USED="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')"
    echo -e "${FRONT_1}${BACK_1}SPACE_ROOT_USED${END}=${FRONT_2}${BACK_2}$SPACE_ROOT_USED${END}"
export SPACE_ROOT_FREE="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')"
    echo -e "${FRONT_1}${BACK_1}SPACE_ROOT_FREE${END}=${FRONT_2}${BACK_2}$SPACE_ROOT_FREE${END}"

echo "
column 1 font color = $color_text_1 ($color_name_1)
column 1 background = $color_text_2 ($color_name_2)
column 2 font color = $color_text_3 ($color_name_3)
column 2 background = $color_text_4 ($color_name_4)"
