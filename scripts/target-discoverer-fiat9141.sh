#!/bin/bash
OUTFILE=${0/.sh/}.log.`date +%s`
echo Logging to: $OUTFILE
echo 
(
for init in ATZ ATE0 ATL0 ATH1 ATSP4 STIBR4800 STIMCS1 ATKW0 ATSW00 ATSH010000;
do
    echo $init;
    sleep 1;
done
for i in `seq 0 255`; do 
  echo 'ATIIA'`printf %02X $i`; 
  sleep 0.5;
  echo ATSI
  sleep 2
  echo 090B
  sleep 1
done ) | 
 socat - tcp-connect:192.168.0.10:35000,cr | 
 tee $OUTFILE
