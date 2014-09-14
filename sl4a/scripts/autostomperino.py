import android
import string
import sys
import time
import os
import re

droid = android.Android()

droid.toggleBluetoothState(False, False)
droid.toggleBluetoothState(True, False)

droid.webViewShow('file:///sdcard/sl4a/scripts/autostomperino/index.html')

outfile = open("autostomperino.response", "a+")
logfile = open("autostomperino.rawlog", "a+")

def feed(request):
  droid.bluetoothWrite(request + '\r\n')  
  time.sleep(0.1)
  response = ''
  while not '>' in response:
    read = droid.bluetoothRead().result
    if read is None:
      return
    response += read
  response = ''.join(filter(lambda x:x in string.digits + string.letters + " ", response))
  logfile.write(request + " | " + response + "\n")
  droid.eventPost('bluetoothOut', request + " | " + response + "\n");
  return response

def stampmindebakkes():
  init = [
   'ATZ',
   'ATE0',
   'ATL1',
   'ATSP5',
   'ATSH8111F1',
   'ATFI'
  ] 

  if not droid.bluetoothConnect('00001101-0000-1000-8000-00805F9B34FB'):
    return

  for line in init:
    feed(line)

# FIXME: diagnostic mode stomping is not supported by all ECUs
#  for mode in range(0, 255):
#    request = "10 %.2X" % mode
#    response = feed(request)
#    if not "50 %.2X" % mode in response: continue
#    outfile.write(request + " | " + response + "\n")
#    print(request + " | " + response)
# FIXME: baudrate stomping?
# request = "10 %.2X 04" % mode
#    request = "STIBR57600"
#    response = feed(request)
#    outfile.write(request + " | " + response + "\n")
#    print(request + " | " + response)
#    request = "STIAT0"
#    response = feed(request)
#    outfile.write(request + " | " + response + "\n")
#    print(request + " | " + response)
#    if "7F 10 12" in response: continue
  for something in [ 1 ]:
    for service in range(0,31) + range (33,129) + range(131,255):
      request = "%.2X" % service
      response = feed(request)
      if "7F %.2X 11" % service in response: continue
      outfile.write(request + " | " + response + "\n")
      print(request + " | " + response)
      iterationtemplate = ""
      iteration = [ ]
      if service == 0x18: 
        iterationtemplate = "%.2X %.2X FF 00" 
        iteration = [ 00 ]
      if service == 0x83: 
        iterationtemplate = "%.2X %.2X" 
        iteration = [ 00, 02 ]
      if service in [ 0x1A, 0x21, 0x33 ]: 
        iterationtemplate = "%.2X %.2X" 
        iteration = range(0, 255) 
      if service == 0x30: 
        iterationtemplate = "%.2X %.2X 01"
        iteration = range(0, 255) 
      for index in iteration:
        request = iterationtemplate % (service, index)
        response = feed(request)
        if "7F %.2X 12" % service in response: continue
        if not "%.2X %.2X" % (service + 0x40, index) in response: continue
        print(request + " | " + response)
        outfile.write(request + " | " + response + "\n")
      
  return
while True: 
  event = droid.eventWait().result
    
  if event['name'] == 'kill':
    sys.exit()
  elif event['name'] == 'bluetooth':
    stampmindebakkes()

