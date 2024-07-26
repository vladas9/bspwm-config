
#!/usr/bin/bash

# CMDs
uptime_info=$(uptime -p | sed -e 's/up //g')
host=$(hostnamectl hostname)

# Options with Icons
icons=( "󰤆" "󰑓" "" "󰿅" )

# Rofi CMD
rofi_cmd() {
    options_with_icons=()
    for icon in "${icons[@]}"; do
        options_with_icons+=("$icon")
    done

    printf "%s\n" "${options_with_icons[@]}" | \
    rofi -dmenu -i -p "" -mesg " Uptime: $uptime_info" \
    -theme ~/.config/rofi/power_menu.rasi
}

# Execute Command
run_cmd() {
    case $1 in 
        "")
            systemctl suspend
            ;;
        "󰿅")
            tmux kill-server
            bspc quit
            ;;
        "󰑓")
            tmux kill-server
            systemctl reboot
            ;;
        "󰤆")
            tmux kill-server
            systemctl poweroff
            ;;
      
        *)
            echo "Invalid option: $1"
            ;;
    esac
}

# Actions
chosen_option=$(rofi_cmd)
run_cmd "$chosen_option"

