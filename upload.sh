#!/bin/sh
#script for uploading file to 0x0.st
#written by maps
#takes argument from command line, ie 'upload /path/to/file.ext'
#if no argument provided, prompts user for /path/to/file.ext
if [ -z $1 ]
	then
	read -p "file: " file
	else
	file=$1
fi
curl -F"file=@$file" https://0x0.st
