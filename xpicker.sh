#!/bin/bash

#to change replace xpicker.conf to /DIR/OF/CONF/xpicker.conf

	CONF=/home/jon/.shells/xpicker/xpicker.conf
	NUMOFGUI=$(grep -v '^#' $CONF | grep -v '^$' | head -n 1)
        COUNTER=1
	DERP=1


start ()
	{
	grep -v '^#' $CONF | grep -v '^$' | sed -n '1!p'
        echo "What GUI would you like to use?"
        echo "[1 - "$NUMOFGUI"]"
        read WHATGUI
	DERP=$WHATGUI
	main;
	}


selection ()
	{

       	let DERP=$DERP+1
        FINALLY=$(grep -v '^#' $CONF | grep -v '^$' | sed -n -e "$DERP"p)
        echo "exec "$FINALLY > ~/.xinitrc
	startx && exit
	}

main ()
	{
	if [[ ! $WHATGUI || $WHATGUI = *[^0-9]* ]]; then
		clear
		echo "Thats not even a number."
		start;
	else
		if [[ "WHATGUI" -lt 1 || "WHATGUI" -gt "NUMOFGUI" ]]; then
			clear
			echo "That wasn't between 1 and "$NUMOFGUI
			start;
		else
			selection;
		fi
	fi
	}

start;
