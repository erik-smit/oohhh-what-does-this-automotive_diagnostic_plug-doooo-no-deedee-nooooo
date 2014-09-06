#!/bin/bash
#
# socat tcp-listen:35000,reuseaddr,fork,crnl exec:./elm327-snoofert.sh

. come-on-functions

while read l; do 
  echo $l | tee /dev/stderr >> $OUTFILE
  case $l in
    83\ 01)
      echo C301;;
    1A97)
      echo BUS INIT: OK
      echo 5A9768078C85D5;;
    1A\ 97*)
      echo 5A9768078C85D5;;
    1A*91*)
      echo 5A913535313932323931202020;;
    1A*92*)
      echo 5A923032363132303835373120;;
    1A*93*)
      echo 5A9300;;
    1A*94*)
      echo 5A943130333733363837373220;;
    1A*95*)
      echo 5A950000;;
    1A*96*)
      echo 5A96202020202020;;
    1A*99*)
      echo 5A9920070126;;
    18*)
      echo 5800;;
    3E*)
      echo 7E;;
    ATKW)
      echo Response: 1:EF 2:8F;;
    AT*) 
      echo OK ;;
    *)
      echo NO DATA;;
  esac | tee /dev/stderr | tee -a $OUTFILE
done
