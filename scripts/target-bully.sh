#!/bin/bash
#
# this script dangles the target ECU by the legs 
# and shakes until all lunch money is on the floor
#

( echo ATZ; sleep 1;
echo ATE0; sleep 1;
echo ATL1; sleep 1;
echo ATH0; sleep 1;
echo ATSP5; sleep 1;
echo ATSH8111F1; sleep 1;
echo ATFI; sleep 1;
echo 83 00; sleep 1;
echo 83 02; sleep 1;
echo 18 00 FF 00; sleep 1;
for i in `seq 0 255`; do 
  echo 1A `printf %02X $i`;
  sleep 1.0
done ;
for i in `seq 0 255`; do 
  echo 21 `printf %02X $i`;
  sleep 1.0
done ;
for i in `seq 0 255`; do 
  echo 30 `printf %02X $i` 01;
  sleep 1.0
done ;
for i in `seq 0 255`; do 
  echo 33 `printf %02X $i`;
  sleep 1.0
done ;
) | 
  socat - tcp-connect:192.168.0.10:35000,cr
