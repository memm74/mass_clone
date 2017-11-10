#! /bin/sh
# This file is for pushing graded assignments to GitHub Classroom repositories
# It will add all new files and commit them with a given message
# It requires the folder name and a message


if [[ $# -ne 2 ]];
	then
	echo "This script requires 2 parameter."
	echo "1. The commit message, which will be followed by date and time, e.g. Feedback or Graded"
	echo "2. The folder name the assignments are in"
else
	comment=$1
	assignment=$2
	date=`date +%m-%d-%Y`
	time=`date +%H:%M:%S`
	for f in ../${assignment}/*
		do
			cd $f
			git add -A
			git commit -m "$1 ${date} ${time}"
			git push origin master
			echo $f
			cd ..
		done
fi
