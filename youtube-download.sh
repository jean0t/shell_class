#!/usr/bin/env bash

# Script doesn't work
# It was made for exercise matters

#============================================|
#	Downloads youtube audio
#	created by: Jean0t
#	github: github.com/jean0t
#	version: 1.0
#============================================|
#	Changelog
#
#	1.0:
#
#============================================|

#============================================|
# VERIFICATIONS

# Do not allow root to run
[[ "$UID" -eq '0' ]] && { echo 'Do not run as root' ; exit 1 ; }

# Test internet conection
[[ $( ping -c1 8.8.8.8 ) ]] || { echo 'You need internet conection to run the script' ; exit 1 ; }

# test if the directory exists
[[ ! -e "$HOME/Downloads/Youtube_Download" ]] \
&& mkdir -p "$HOME/Downloads/Youtube_Download"

#============================================|
# GLOBAL VARIABLES
version='1.0'
quality='128k' #supports 64k, 128k, 256k, 320k
format='mp3' #supports best, aac, vorbis, m4a, opus, wav
output_directory="$HOME/Downloads/Youtube_Download/%(title)s.%(ext)s"
#============================================|

#	START THE PROGRAM

if [[ $( youtube-dl --embed-thumbnail --default-search 'ytsearch' -o $output_directory --audio-quality "$quality" --extract-audio "$format" "$@" ) ]]; then
	echo 'Download was successful'
	exit 0
else
	echo 'An error has occurred'
	exit 1
fi
