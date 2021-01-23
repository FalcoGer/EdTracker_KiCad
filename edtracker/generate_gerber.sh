#! /bin/sh

python3 ./generate_gerber.py edtracker
zip edtracker-gerber.zip *.gbr *.gbrjob *.drl

