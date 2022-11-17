#!/bin/bash

# Обозначения цветов: (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)

result () {

. color

pTIMEZONE=$(timedatectl | awk 'NR==4{print $3 " UTC", $5}' | tr -d "0)")
pOS=$(cat /etc/issue | awk 'NR==1{print $1, $2, $3}')
pIP=$(hostname -I)
pDATE=$(date | awk '{print $2, $3, $4, $5}')
pUPTIME=$(uptime -p)
pUPTIME_SEC=$(cat /proc/uptime | awk '{print $1}') 
pMASK=$(ifconfig | grep 'inet ' | awk 'NR==1{print $4}')
pGATEWAY=$(ip route | awk 'NR==1{print $3}')
pRAM_TOTAL=$(free -m | awk 'NR==2{printf "%0.3f GB", $2/1024}')
pRAM_USED=$(free -m | awk 'NR==2{printf "%0.3f GB", $3/1024}')
pRAM_FREE=$(free -m | awk 'NR==2{printf "%0.3f GB", $4/1024}')
pSPACE_ROOT=$(df /root/ | awk 'NR>1{printf "%0.2f MB", $2/1024}')
pSPACE_ROOT_USED=$(df /root/ | awk 'NR>1{printf "%0.2f MB", $3/1024}')
pSPACE_ROOT_FREE=$(df /root/ | awk 'NR>1{printf "%0.2f MB", $4/1024}')

echo -e "${param1_1fon}${param2_1word}HOSTNAME ${END}=${param3_2fon}${param4_2word} $HOSTNAME${END}" # = сетевое имя
echo -e "${param1_1fon}${param2_1word}TIMEZONE ${END}=${param3_2fon}${param4_2word} $pTIMEZONE${END}" # временная зона в виде: America/New_York UTC -5 (временная зона, должна браться из системы и быть корректной для текущего местоположения)
echo -e "${param1_1fon}${param2_1word}USER ${END}=${param3_2fon}${param4_2word} $USER${END}" # текущий пользователь который запустил скрипт
echo -e "${param1_1fon}${param2_1word}OS ${END}=${param3_2fon}${param4_2word} $pOS${END}" 
echo -e "${param1_1fon}${param2_1word}DATE ${END}=${param3_2fon}${param4_2word} $pDATE${END}" # текущее время в виде: 12 May 2020 12:24:36
echo -e "${param1_1fon}${param2_1word}UPTIME ${END}=${param3_2fon}${param4_2word} $pUPTIME${END}" # время работы системы
echo -e "${param1_1fon}${param2_1word}UPTIME_SEC ${END}=${param3_2fon}${param4_2word} $pUPTIME_SEC${END}" # время работы системы в секундах
echo -e "${param1_1fon}${param2_1word}IP ${END}=${param3_2fon}${param4_2word} $pIP${END}" # ip-адрес машины в любом из сетевых интерфейсов
echo -e "${param1_1fon}${param2_1word}MASK ${END}=${param3_2fon}${param4_2word} $pMASK${END}" # сетевая маска любого из сетевых интерфейсов в виде: xxx.xxx.xxx.xxx
echo -e "${param1_1fon}${param2_1word}GATEWAY ${END}=${param3_2fon}${param4_2word} $pGATEWAY${END}" # ip шлюза по умолчанию
echo -e "${param1_1fon}${param2_1word}RAM_TOTAL ${END}=${param3_2fon}${param4_2word} $pRAM_TOTAL${END}" # размер оперативной памяти в Гб c точностью три знака после запятой в виде: 3.125 GB
echo -e "${param1_1fon}${param2_1word}RAM_USED ${END}=${param3_2fon}${param4_2word} $pRAM_USED${END}" # размер используемой памяти в Гб c точностью три знака после запятой
echo -e "${param1_1fon}${param2_1word}RAM_FREE ${END}=${param3_2fon}${param4_2word} $pRAM_FREE${END}" # размер свободной памяти в Гб c точностью три знака после запятой
echo -e "${param1_1fon}${param2_1word}SPACE_ROOT ${END}=${param3_2fon}${param4_2word} $pSPACE_ROOT${END}" # размер рутового раздела в Mб с точностью два знака после запятой в виде: 254.25 MB
echo -e "${param1_1fon}${param2_1word}SPACE_ROOT_USED ${END}=${param3_2fon}${param4_2word} $pSPACE_ROOT_USED${END}" # размер занятого пространства рутового раздела в Mб с точностью два знака после запятой
echo -e "${param1_1fon}${param2_1word}SPACE_ROOT_FREE ${END}=${param3_2fon}${param4_2word} $pSPACE_ROOT_FREE${END}" # размер свободного пространства рутового раздела в Mб с точностью два знака после запятой
}

result $1 $2 $3 $4
