#!/usr/bin/env bash

# Options
shutdown='⏻ ' reboot=' ' suspend=' ' logout=' '

# Rofi CMD
rofi_cmd() { rofi -dmenu --normal-window \
	-theme ~/.config/rofi/styles/powermenu.rasi
}

# Pass variables to rofi dmenu
run_rofi() { echo -e "$logout\n$suspend\n$reboot\n$shutdown" | rofi_cmd ;}

# Execute Command
run_cmd() {
	case "$1" in
		'--shutdown') systemctl poweroff ;;
		'--reboot') systemctl reboot ;;
		'--suspend') systemctl suspend ;;
		'--logout') i3-msg exit || sway exit ;;
	esac
}

# Actions
case "$(run_rofi)" in
    $shutdown) run_cmd --shutdown ;;
    $reboot) run_cmd --reboot ;;
    $suspend) run_cmd --suspend ;;
    $logout) run_cmd --logout ;;
esac
