#!/bin/bash

#library for script
. ./lib_colors.sh

#Configuration for script
. ./config.sh
if [[ $# -ne 0 ]]
then
    echo "Attention: parameters are accepted in the config file!"
elif [[ "$column1_font_color" == "$column1_background" && "$column1_font_color" != "" && "$column1_background" != "" ]] || [[ "$column2_font_color" == "$column2_background" && "$column2_font_color" != "" && "$column2_background" != "" ]] #check double values
then
    echo "Attention: You have entered arguments of the same column color, please restart the script with different values: 1-6!"
elif ! [[ "$column1_font_color" =~ ^[1-6]$ ]] && [[ "$column1_font_color" != "" ]]
then
    echo "Error: \""$column1_font_color"\" invalid parameter is set in the config file, please restart the script with different values in the config file: 1-6!"
elif ! [[ "$column1_background" =~ ^[1-6]$ ]] && [[ "$column1_background" != "" ]]
then
    echo "Error: \""$column1_background"\" invalid parameter is set in the config file, please restart the script with different values in the config file: 1-6!"
elif ! [[ "$column2_font_color" =~ ^[1-6]$ ]] && [[ "$column2_font_color" != "" ]]
then
    echo "Error: \""$column2_font_color"\" invalid parameter is set in the config file, please restart the script with different values in the config file: 1-6!"
elif ! [[ "$column2_background" =~ ^[1-6]$ ]] && [[ "$column2_background" != "" ]]
then
    echo "Error: \""$column2_background"\" invalid parameter is set in the config file, please restart the script with different values in the config file: 1-6!"
else
#Start script body
chmod +x ./check_print.sh
./check_print.sh
fi
