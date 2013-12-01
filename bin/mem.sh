#!/bin/sh

if [ $# -eq 0 ]; then
    echo "Collect some process memory used vs time"
    echo "usage: $0 name"
    exit 1
fi

printf -v ti '%(%s)T' -1;
while sleep 60 ; do
    printf -v t '%(%s)T' -1;
    echo $[($t-$ti)/60] `ps  -o rss= -C $*` ;
done
