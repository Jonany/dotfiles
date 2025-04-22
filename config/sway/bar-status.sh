#!/bin/sh

date=$(date +'%a %F %R')
cpu=$(sensors | grep 'Package' | cut -f 5 -d ' ' | sed 's/+//g' | sed 's/\.0//g')

### VOLUME
vol_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -f 2-3 -d ' ')
vol_percent=$(echo $vol_info | awk '{print $1*100}')%
vol_mute=$(echo $vol_info | cut -f 2 -d ' ' | sed 's/\[//g' | sed 's/\]//g')
case $vol_mute in
	MUTED)
		volume='X'
		;;
	*)
		volume=$(echo $vol_percent)
		;;
esac

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


### NETWORK
network_status=$(iwctl station wlan0 show | awk '/State/ {print $2}' | grep -q '^connected$' && echo 'Connected' || echo 'Disconnected')


### BLUETOOTH
bt_connected_dev_info=$(bluetoothctl devices Connected)
bt_connected_dev=$(echo $bt_connected_dev_info | cut -f 3 -d ' ')
bt_connected_dev_mac=$(echo $bt_connected_dev_info | cut -f 2 -d ' ')
bt_dev_battery=$(bluetoothctl info $bt_connected_dev_mac | grep 'Battery Percentage' | cut -f 2 -d '(' | cut -f 1 -d ')')
bt_power_state=$(bluetoothctl show | grep PowerState | cut -f 2 -d ' ')
case $bt_power_state in
	on)
		if [ -z "$bt_connected_dev" ]; then
			bt_status=''
		else
			bt_status="$bt_connected_dev ($bt_dev_battery%) // "
		fi
		;;
	off)
		bt_status='OFF // '
		;;
	*)
		bt_status=$bt_power_state
		;;
esac

echo $bt_status$volume // $bat_percent$charge_icon // $cpu // $network_status // $date
