#!/bin/bash

time=`date +%Y-%m-%d-%I-%M-%S`
geometry=`xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
dir="`xdg-user-dir PICTURES`/Screenshots"
file="Screenshot_${time}_${geometry}.png"

icon1="$HOME/.config/dunst/icons/collections.svg"
icon2="$HOME/.config/dunst/icons/timer.svg"

notify_view () {
	dunstify -u low --replace=699 -i $icon1 "Copied to clipboard."
	viewnior ${dir}/"$file"
	if [[ -e "$dir/$file" ]]; then
		dunstify -u low --replace=699 -i $icon1 "Screenshot Saved."
	else
		dunstify -u low --replace=699 -i $icon1 "Screenshot Deleted."
	fi
}

countdown () {
	for sec in `seq $1 -1 1`; do
		dunstify -t 1000 --replace=699 -i $icon2 "Taking shot in : $sec"
		sleep 1
	done
}

shotnow () {
  sleep 0.5
  /usr/bin/hyprshot -m output -m HDMI-A-1 -o ${dir} -f ${file}
	notify_view
}

shot5 () {
	countdown '3'
	sleep 1 && /usr/bin/hyprshot -m output -m eDP-1 -o ${dir} -f ${file} 
  notify_view
}

shot10 () {
	countdown '10'
	sleep 1 && /usr/bin/hyprshot -m output -m eDP-1 -o ${dir} -f ${file}
	notify_view
}

shotwin () {
  /usr/bin/hyprshot -m window -o ${dir} -f ${file}
	notify_view
}

shotarea () {
  /usr/bin/hyprshot -m region -o ${dir} -f ${file}
	notify_view
}

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

usage() {
    echo "Usage: $0 [--screen | --area | --window | --infive | --inten]"
    exit 1
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --screen) shotnow; exit 0 ;;
        --area) shotarea; exit 0 ;;
        --window) shotwin; exit 0 ;;
        --infive) shot5; exit 0 ;;
        --inten) shot10; exit 0 ;;
        *) usage ;;
    esac
    shift
done

usage

