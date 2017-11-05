#!/bin/bash
echo "fixing permissions"
chmod 755 .

echo "Deleting silences..."
SCRIPTPATH=`dirname $0`

ruby $SCRIPTPATH/delsilence.rb

if [ -f "Chan_09.wav" -a -f "Chan_10.wav" ]; then
  echo "Joining 9 and 10 into Chans_9_10.wav"
  $SCRIPTPATH/join.sh Chan_09.wav Chan_10.wav Chans_9_10.wav
fi

if [ -f "Chan_11.wav" -a -f "Chan_12.wav" ]; then
  echo "Joining 11 and 12 into Chans_11_12.wav"
  $SCRIPTPATH/join.sh Chan_11.wav Chan_12.wav Chans_11_12.wav
fi

if [ -f "Chan_13.wav" -a -f "Chan_14.wav" ]; then
  echo "Joining 13 and 14 into Chans_13_14.wav"
  $SCRIPTPATH/join.sh Chan_13.wav Chan_14.wav Chans_13_14.wav
fi

if [ -f "Chan_15.wav" -a -f "Chan_16.wav" ]; then
  echo "Joining 15 and 16 into Chans_15_16.wav"
  $SCRIPTPATH/join.sh Chan_15.wav Chan_16.wav Chans_15_16.wav
fi
