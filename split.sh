#!/bin/bash
#splits a wav file wherever silence is detected

if [ "$#" != "2" ]; then
  echo "Usage: $0 <input> <output filename>"
  exit -1
fi

sox -V3 "$1" "$2" silence 1 0.50 0.1% 1 0.3 0.1% : newfile : restart

