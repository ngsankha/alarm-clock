#!/bin/bash
#
# A simple alarm clock script
# Copyright (C) 2012, Sankha Narayan Guria (sankha93@gmail.com)
#
# These scripts are unlicensed. That is, they are in the public domain and free to use in any capacity for any purpose.

# enter the time in seconds for which you want to snooze the alarm here
snooze=10

echo "After how much time should the alarm go off? (HH:MM:SS)"
read arr

OLD_IFS="${IFS}"
IFS=":"
read -r h m s <<< "$arr"
seconds=$((( h * 60 * 60) + ( m * 60) + s ))
start=$(date +%s)
end=$((start + seconds))
cur=$start
while [[ $cur -lt $end ]]
do
	cur=$(date +%s)
	left=$((end-cur))
	printf "\rTime to wake up : %02d:%02d:%02d" $((left/3600)) $(( (left/60)%60)) $((left%60))

	sleep 1
done
IFS="${OLD_IFS}"
echo

# entering the infinite loop that will the play the alarm tone paused by the snoozing time
while
./buzzer.sh
do
	start=$(date +%s)
	end=$((start + snooze))
	cur=$start
	while [[ $cur -lt $end ]]
	do
		cur=$(date +%s)
		left=$((end-cur))
		printf "\rSnoozing for : %02d:%02d:%02d" $((left/3600)) $(( (left/60)%60)) $((left%60))

		sleep 1
	done
done
