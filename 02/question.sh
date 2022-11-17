#!/bin/bash
chmod +x ./question.sh

#name_file_date
DATE_NAME_Y=$(date +"%d_%m_%Y_%H_%M_%S")

echo -n "Write data to a file Y/N: "
read item
case "$item" in
    y|Y)
        printf "HOSTNAME=$HOSTNAME\nTIMEZONE=$TIMEZONE\nUSER=$USER\nOS=$OS\nDATE=$DATE\nUPTIME=$UPTIME\nUPTIME_SEC=$UPTIME_SEC\nIP=$IP\nMASK=$MASK\nGATEWAY=$GATEWAY\nRAM_TOTAL=$RAM_TOTAL\nRAM_USED=$RAM_USED\nRAM_FREE=$RAM_FREE\nSPACE_ROOT=$SPACE_ROOT\nSPACE_ROOT_USED=$SPACE_ROOT_USED\nSPACE_ROOT_FREE=$SPACE_ROOT_FREE" > $DATE_NAME_Y.status
        exit
        ;;
    n|N)
        echo "Exiting the script"
        exit
        ;;
    *)
        echo "Exiting the script"
        exit
        ;;
esac
