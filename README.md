# wavtools
little audio tools

## import.sh
Fixes up a multitrack wave session (tailored for Behringer UFX1604 in particular)
- deletes silence
- merges L/R channels together
- fixes directory permissions

## join.sh
Joins 2 mono files (left and right) into one stereo file

## delsilence.rb
Deletes silent WAV files in the current directory

## split.sh
Splits one WAV into many WAVEs wherever silence is detected.  Built for turning a recording of samples into 1-hits

## shorten.rb
Recursively finds files that would not be accessible due to MPC1000's filename length restriction, and batch renames them
