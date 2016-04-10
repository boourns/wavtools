#!/bin/bash
# Joins two mono files into 1 stereo file

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <left.wav> <right.wav> <output.wav>"
  exit -1
fi

sox -M $1 $2 $3


