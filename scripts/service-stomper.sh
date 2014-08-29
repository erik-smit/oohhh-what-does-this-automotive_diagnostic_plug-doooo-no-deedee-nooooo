#!/bin/bash
( echo ATZ; sleep 1;
echo ATL1; sleep 1;
echo ATH1; sleep 1;
echo ATSP5; sleep 1;
echo ATSH8111F1; sleep 1;
echo ATFI; sleep 1;
#for i in `seq 0 255`; do 
#  echo 1A`printf %02X $i`;
#  sleep 0.4
#done ;
for i in `seq 0 255`; do 
  echo 21`printf %02X $i`;
  sleep 0.4
done ) | 
  socat - tcp-connect:192.168.0.10:35000,cr
