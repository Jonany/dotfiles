#!/bin/sh

date=$(date +'%a %F %R')
cpu=$(sensors | grep 'Package' | cut -f 5 -d ' ' | sed 's/+//g' | sed 's/\.0//g')
#loadavg_1min=$(cat /proc/loadavg | awk -F ' ' '{print $1}' | sed 's/0\.//g')%
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -f 2 -d ' ' | sed 's/0\.//g')%

### BATTERY
battery=$(acpi -b | awk -F'[, ]' '{print $3,$5}')
charge_status=$(echo $battery | cut -f 1 -d ' ')
bat_percent=$(echo $battery | cut -f 2 -d ' ')

case $charge_status in
	Charging)
		charge_icon='(+)'
		;;
	Discharging)
		charge_icon='(-)'
		;;
	Full)
		charge_icon='(*)'
		;;
	*)
		charge_icon=
		;;
esac


network=$(/sbin/iwconfig wlp2s0 | grep ESSID | cut -f 8 -d ' ' | sed 's/ESSID\:"//g' | sed 's/"//g')
wifi_strength=$(/sbin/iwconfig wlp2s0 | grep Quality | cut -f 2 -d '=' | cut -f 1 -d ' ' | awk -F'[/]' '{perc=($1/$2)*100; printf("%d",perc)}')%
#ext_ping=$(ping -c 1 1.1.1.1 | tail -1 | awk '{print $4}' | cut -f 2 -d '/' | cut -f 1 -d '.')ms
#int_ping=$(ping -c 1 192.168.0.1 | tail -1 | awk '{print $4}' | cut -f 2 -d '/' | cut -f 1 -d '.')ms

echo $volume // $bat_percent$charge_icon // $cpu // $network $wifi_strength // $date
