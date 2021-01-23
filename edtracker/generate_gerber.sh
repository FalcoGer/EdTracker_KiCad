#! /bin/sh

python3 ./generate_gerber.py edtracker
zip edtracker-gerber.zip *.gbr *.gbrjob *.drl
../GerberRender/gerbrend \
    -c gold \
    -i ../front.png \
    -j ../back.png \
    -f ./edtracker-F_Cu.gbr \
    -m ./edtracker-F_Mask.gbr \
    -s ./edtracker-F_SilkS.gbr \
    -b ./edtracker-B_Cu.gbr \
    -n ./edtracker-B_Mask.gbr \
    -t ./edtracker-B_SilkS.gbr \
    -d ./edtracker-PTH.drl \
    -o ./edtracker-Edge_Cuts.gbr

