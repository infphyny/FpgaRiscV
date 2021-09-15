#!/usr/bin/env bash

#while  [ 1 -eq 1 ]; do 
#  inotifywait -e modify styles.css pinout_ulx3s.py data.py
#  echo "Change!"
  rm -f DecaWishbone.svg
  python3 -m pinout.manager --export pinout_deca DecaWishbone.svg
#done
