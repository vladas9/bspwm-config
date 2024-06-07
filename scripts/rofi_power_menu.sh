
#!/usr/bin/bash

# CMDs
uptime_info=$(uptime -p | sed -e 's/up //g')
host=$(hostnamectl hostname)

# Options with Icons
icons=( "" "󱄌" "" "󰿅" )

# Rofi CMD
rofi_cmd() {
    options_with_icons=()
    for icon in "${icons[@]}"; do
        options_with_icons+=("$icon")
    done

    printf "%s\n" "${options_with_icons[@]}" | \
    rofi -dmenu -i -p "" -mesg " Uptime: $uptime_info" \
    -kb-select-1 "l" \
    -kb-select-2 "u" \
    -kb-select-3 "e" \
    -kb-select-4 "r" \
    -kb-select-5 "s" \
    -kb-select-6 "h" \
    -theme ~/.config/rofi/power_menu.rasi
}

# Execute Command
run_cmd() {
    case $1 in 
        "")
            systemctl suspend
            ;;
        "󰿅")
            bspc quit
            ;;
        "󱄌")
            systemctl reboot
            ;;
        "")
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

