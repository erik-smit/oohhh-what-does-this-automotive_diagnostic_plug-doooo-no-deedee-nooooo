#!/bin/bash

for i in {0..9} {A..T} {V..Z}; do
  (echo \!tieCAR_SC_$i; sleep 1; echo) | 
   socat - /dev/ttyS6 > ../logs/CANtieCAR_SC_$i
done
