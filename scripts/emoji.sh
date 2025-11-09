#!/bin/sh

## Run
rofi -modi emoji \
     -show emoji --normal-window \
	 -emoji-format '{emoji}' \
     -theme ~/.config/rofi/styles/emoji.rasi
