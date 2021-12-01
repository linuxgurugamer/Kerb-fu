#!/bin/bash
BIN="/d/Users/jbb/github/_reformatUtils"

cat <<_EOF_
Enter option:

1.  Don't break complex statements and multiple statements residing on a 
    single line.  This will prevent MM statements from being broken onto
    multiple lines, however, it will not put trailing braces onto a new line

2.  Normal, this will split MM statements onto multiple lines

_EOF_

read  option
if [[ "$option" =~ [12] ]]; then
	case $option in
		1)
			o="-o"
			;;
		2)
			o=""
			;;
	esac
	read -p "Recursive (Y/n): "  recursive
	[ "$recursive" = "" ] && recursive="y"
	if [[ "$recursive" =~ [yY] ]]; then
		r="-r"
	fi
	if [[ "$recursive" =~ [yYnN] ]]; then
		$BIN/AStyle.exe $o $r $*
	fi
fi
