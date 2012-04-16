#!/bin/bash
#
# The sound playing script for alarm.sh, modify this to include your alarm tone
# The script requires mplayer to be installed on your system to run
# Copyright (C) 2012, Sankha Narayan Guria (sankha93@gmail.com)
#
# These scripts are unlicensed. That is, they are in the public domain and free to use in any capacity for any purpose.

# Put the file you want to play here instead
file="/home/sankha/a1a.mp3"

mplayer -really-quiet $file
