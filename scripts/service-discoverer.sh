#!/bin/bash
#
# StopCommunication (Dec:130, Hex: 82) is skipped.
#

( echo ATZ; sleep 1;
echo ATL1; sleep 1;
echo ATH1; sleep 1;
echo ATSP5; sleep 1;
echo ATSH8011F1; sleep 1;
echo ATFI; sleep 1;
for i in {0..129} {131..254}; do 
  echo `printf %02X $i`; sleep 1;
done ) | 
  socat - tcp-connect:192.168.0.10:35000,cr
