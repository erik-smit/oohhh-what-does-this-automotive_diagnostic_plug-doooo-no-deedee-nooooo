#!/bin/bash
( echo ATZ; sleep 1;
echo ATL1; sleep 1;
echo ATH1; sleep 1;
echo ATSP5; sleep 1;
for i in `seq 0 255`; do 
  #Header type 1: echo 'ATSH81'`printf %02X $i`'F1'; 
  #Header type 2: echo 'ATSH80'`printf %02X $i`'F1'; 
  echo 'ATSH81'`printf %02X $i`'F1'; 
  sleep 0.5;
  #Fast Init - ATSP5 - ATFI
  #Fast Init - ATSP4 - ATSI
  echo ATFI
  sleep 1.5
  echo ATKW
  sleep 0.8
done ) | 
  socat - tcp-connect:192.168.0.10:35000,cr
