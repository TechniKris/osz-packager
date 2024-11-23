#!/bin/sh
# Script that packages osu!stable's mapset directories into .osz files

workdir="$(pwd)"

if [ "$1" != "/" ] ; then
    maps_dir=${1%/} # remove trailing slashes if present
fi

for mapset in "$maps_dir"/* ; do
    cd "$mapset" || exit
    mapset_name="${mapset#"$maps_dir"/}" # remove leading path
    zip --recurse-paths "$workdir/$mapset_name".osz ./*
    cd "$workdir" || exit
done
