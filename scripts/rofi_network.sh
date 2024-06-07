#!/usr/bin/bash

notify-send "getting list of available wi-fi networks..."
# get a list of available wifi connections and morph it into a nice-looking list
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

connected=$(nmcli -fields wifi g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="󰖪  disable wi-fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󰖩  enable wi-fi"
fi

# use rofi to select wifi network
chosen_network=$(echo -e "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "wi-fi ssid: " -theme ~/.config/rofi/wifi_theme.rasi )
# get name of connection
read -r chosen_id <<< "${chosen_network:3}"

if [ "$chosen_network" = "" ]; then
	exit
elif [ "$chosen_network" = "󰖩  enable wi-fi" ]; then
	nmcli radio wifi on
elif [ "$chosen_network" = "󰖪  disable wi-fi" ]; then
	nmcli radio wifi off
else
	# message to show when connection is activated successfully
  	success_message="you are now connected to the wi-fi network \"$chosen_id\"."
	# get saved connections
	saved_connections=$(nmcli -g name connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "connection established" "$success_message"
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "password: " )
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "connection established" "$success_message"
    fi
fi
