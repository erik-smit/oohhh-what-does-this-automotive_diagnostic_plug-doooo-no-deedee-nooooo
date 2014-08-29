#!/bin/bash
( echo ATZ; sleep 1;
echo ATL1; sleep 1;
echo ATH1; sleep 1;
echo ATSP5; sleep 1;
echo ATSH8131F1; sleep 1;
echo ATFI; sleep 1;
while /bin/true; do
  echo 2101
  sleep 0.4
done) |
  socat - tcp-connect:192.168.0.10:35000,cr
