#! /bin/bash

# $MUTE is the 'n' of "on" if the sound is muted, the 'f' of "off" if not
MUTE=`cat /proc/acpi/ibm/volume | tail -c 2`
if [ "$MUTE" == "n" ]; then
       COLOUR="#cc241d"
else
 	COLOUR="#8ec07c"
fi

# Returns the current master volume; requires alsa-utils
VALUE=`amixer get Master | sed s/%.*$// | sed 's/^.*\[//' | tail -n 1`

# Format and print
echo "<fc=$COLOUR>$VALUE</fc>%"
