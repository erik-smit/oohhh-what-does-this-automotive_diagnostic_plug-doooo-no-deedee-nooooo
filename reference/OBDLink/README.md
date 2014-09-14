        * Added ATJE and ATJS commands (set J1939 Tx PGN data format to MSB first/LSB first)
        * Added ATMP and ATDM1 commands (monitor for PGNs)
        * Added ATPB command (set protocol B options and baud rate)
        * Added block filters (STFAB and STFCB commands)
        * Added CAN flow control filters (STFAFC and STFCFC commands)
        * Added new command to program base board hardware revision
        * Added pass filters (STFAP and STFCP commands)
        * Added STFAPG and STFCPG commands (add/clear PGN filters)
        * Complete ELM327 v1.4 power control support (ATLP, ATIGN commands, and 0E programmable parameter)
        * Configuration and status reporting (STSLCS, STSLLT, and STSLXS commands)
        * Enabled UART communication for the selected PIM when all PIMs are enabled
        * External sleep control input sleep/wakeup triggers (STSLX, STSLXST, and STSLXWT commands)
        * Implemented programmable parameters 2B through 2F
        * Implemented protocols A through C
        * STSLEEP command
        * UART inactivity sleep and UART pulse wakeup triggers (STSLU, STSLUIT, and STSLUWP commands)
        * BUG: <RX ERROR was being printed on the next good frame (invalid frames could not be received)
        * BUG: A timeout that was too short would sometimes cause modem detection to fail
        * BUG: Actual default values for the PowerSave voltage triggers were different from those reported by the STSLCS command
        * BUG: After receiving a CAN frame at the wrong baud rate, ECUsim did not respond to the first valid CAN request and printed "CAN ERROR"
        * BUG: After resetting voltage sense calibration to defaults (ATCV 0000, STVCAL), voltage-based sleep/wakeup triggers would fail to recalibrate until the next device reset
        * BUG: All messages should be printed while monitoring (CAN messaged w/ invalid PCI were being dropped)
        * BUG: ATCV 0000 and STVCAL commands ignored factory calibration saved via STSAVCAL until the next device reset
        * BUG: ATDP command was appending extra CR character for KWP2000 protocols
        * BUG: ATIB command was not being recognized
        * BUG: ATMx commands now use the current CAN HW filter setting (ATCF and ATCM), instead of resetting it to pass-all
        * BUG: ATRV command output was not ELM327 compliant through the entire range (100.0V could be displayed instead of --.-V)
        * BUG: ATST timeout could be exceeded on a busy bus
        * BUG: ATSWhh command should not restart keep alives
        * BUG: ATTA command was changing headers even if the protocol was already open
        * BUG: Baud rate switching (ATBRD and STBR commands) now uses character specified via programmable parameter 0D for confirmation
        * BUG: CAN frame retransmissions would not stop if message transmission was canceled via a UART character
        * BUG: CAN Rx would sometimes lockup the IC during busy CAN bus monitoring due to FIFO corruption
        * BUG: Carriage return character specified via programmable parameter 0D is now used for UART reception, as well as transmission
        * BUG: Due to a compiler bug, under certain conditions, ISO keep-alives were sent back-to-back and tester address set via PP 06, was not used for keep-alive headers
        * BUG: Due to a race condition, heavy UART Tx traffic sometimes would generate FATAL ERROR 0x0101 [5, ...]
        * BUG: During monitoring, first byte of ISO messages was sometimes printed incorrectly
        * BUG: Entering monitoring mode would reset CAN settings to the protocol defaults
        * BUG: Fixed 5-baud init address validation (for now hardcoded to 0x33)
        * BUG: Fixed a minor memory leak in ISO keep-alive module
        * BUG: Fixed CAN filtering bug that could prevent 11-bit ID messages from being received
        * BUG: Fixed UART transmission being corrupted under rare circumstances
        * BUG: For UART baud rates below 611 baud, the divisor was calculated incorrectly
        * BUG: ISO 9141 protocol is now properly detected while monitoring (instead of being detected as KWP)
        * BUG: J1850 PWM transmitter was reading J1850 VPW Rx input during bus acquisition
        * BUG: J1939 TP sessions would not time out if no CAN frames are coming in
        * BUG: KWP fast init was not properly using user-set headers
        * BUG: KWP2000 fast init did not work reliably with vehicles that have multiple ECUs responding to StartCommunication message
        * BUG: Modem could get reset without gracefully dropping the connection on first startup after FW update
        * BUG: Monitoring commands under certain conditions would erroneously terminate with BUFFER FULL error
        * BUG: PP 0B PWR_CTRL pin polarity setting was being ignored
        * BUG: Previous release was not compiled with proper silicon errata libs
        * BUG: Programmable parameter 17 setting was being ignored
        * BUG: Protocol 5A could be erroneously detected on protocol 3A connection failure
        * BUG: Protocol was not being saved after being detected via a monitoring command
        * BUG: Protocol would not get properly saved if ATSP set it to the same protocol that was autodetected or set via ATTP
        * BUG: Rarely, under very unusual conditions, UART inactivity sleep or other timeouts could get triggered prematurely
        * BUG: Resetting the device to factory defaults would not clear Bluetooth bond table while the connection is active
        * BUG: Setting programmable parameter 17 to 00 would turn off keep-alives
        * BUG: SI command returned incorrect data
        * BUG: SLEEP input polarity setting was being ignored
        * BUG: SLEEP input polarity switching was not working
        * BUG: Sleep triggers were not working if ATMA on startup was enabled (PP 00), until ATMA was terminated
        * BUG: Some commands that require one parameter would erroneously accept no parameters
        * BUG: Some sleep triggers could glitch after about 24 days of continuous operation
        * BUG: Some timeout settings could be violated for a short period of time after about 24 days of continuous operation
        * BUG: Sometimes, 4 dots would be printed during ISO 5-baud init
        * BUG: Source address header byte in ISO keep-alive messages should be set to OBD source (tester) address (set by PP 06)
        * BUG: SRR bit was being incorrectly set when transmitting 29-bit CAN frames
        * BUG: STDIX command printed init month off by one
        * BUG: STIBR command would not correctly set baud rates above 32767 baud
        * BUG: STPTO command was not being recognized
        * BUG: STSAVCAL command could not check whether VMEASURE calibration value was already saved
        * BUG: STSLUIT command was erroneously accepting 0 as a parameter
        * BUG: Suppress keep alives (ATSW00) should not get reset on ATD
        * BUG: There could be erroneous <RX ERRORs after CAN FIFO overflow
        * BUG: There was a small chance of device lockup after finishing CAN message reception
        * BUG: There was a small chance that EEPROM would get corrupted if a device reset interrupted a specific write cycle
        * BUG: UART inactivity sleep timer was not being reset if only CRs were being received
        * BUG: UART Rx could lock up or start receiving corrupted data
        * BUG: UART Tx could lock up or transmit corrupted data due to silicon erratum and race conditions
        * BUG: Unable to communicate on UART if 3 PIMs were installed
        * BUG: Under certain circumstances J1850 Bus+ could go active when not actively transmitting
        * BUG: Under some rare circumstances, false feedback errors were detected during ISO 5-baud init
        * BUG: Waiting for CAN responses was not cancellable via UART character
        * BUG: When resetting to factory defaults, bond table would not be cleared if the host reconnected as soon as the connection was dropped
        * BUG: While entering sleep mode, the device would cause a glitch on HS and MS CAN lines
        * BUG: With protocol A5 set, autodetect would potentially not work properly with non-default headers set
        * BUG: Wrong ISO_RX pin polarity
        * CHG: Added a workaround for the wakeup reset bug in the old BT modem FW release
        * CHG: Added additional ISO init message (prints received address)
        * CHG: Added CAN transmitter "Bus Off" mode indication to ATCS command
        * CHG: Added message size limitation for received ISO9141 messages (ATNL setting)
        * CHG: Added new protocol preset options to the SP command (21, 23, 24, 25, 33, 34, 35, 36)
        * CHG: Added optional precision parameter to STVR command
        * CHG: Added optional voltage offset parameter to STVCAL command
        * CHG: Added the changes required for the new BT modem FW release
        * CHG: Adding duplicate filters will now succeed without using any extra memory
        * CHG: All protocol transmit pins are now always driving (passive) to eliminate undefined bus states for certain driver configurations
        * CHG: Any fatal errors will now be printed again after a reset, to make sure they are not missed
        * CHG: ATAL is now forced on, when CAN auto formatting is off (ATCAF 0)
        * CHG: ATAR command now clears all filters before adding default ones for consistent operation across protocols
        * CHG: ATWS command now keeps current UART baud rate setting, per ELM327 functionality
        * CHG: Changed all timeouts from -0.5/+0 ms to -0/+0.5 ms precision
        * CHG: Changed ATST and PP 03 default to 0x19 (102 ms)
        * CHG: Changed default PP 0C value to 23 (115.2 kbaud) for consistency with other STN11xx devices
        * CHG: Changed default PP 0C value to 23 (115.2 kbaud)
        * CHG: Changed default programmable parameter 13 setting to 0xF4 (999ms)
        * CHG: Changed default UART baud rate to 115.2 kbaud
        * CHG: Cold start startup time has been reduced by 120 ms
        * CHG: Command cancellation via UART character is now much more responsive
        * CHG: Default ISO 9141 filters are now pass-all due to point-to-point nature of the connection
        * CHG: Device will no longer get stuck receiving OBD messages indefinitely during protocol detection or while handling keep-alives, if connected in parallel with another tester or if message filters are improperly configured
        * CHG: Device will no longer reset the modem if the host disconnects while transmitting data
        * CHG: Disabled internal pull-up of the SLEEP pin to further reduce current consumption in sleep mode
        * CHG: Disabled the short button press (enable bonding) when Bluetooth connection is active
        * CHG: Doubled maximum possible ISO refresh rate
        * CHG: ECUsim turns off CAN reception when CAN is not the active protocol
        * CHG: Further reduced current consumption during sleep
        * CHG: Implemented new AT@1 functionality (now changeable via STS@1)
        * CHG: Implemented new default J1939 timeouts
        * CHG: Improved accuracy of all timeouts from -1/+0 ms to -0.5/+0 ms
        * CHG: Improved accuracy of all timeouts from -1/+0 ms to -0/+0.5 ms precision
        * CHG: Improved automatic detection of KWP2000 protocols when using monitoring commands
        * CHG: Improved CR+LF handling (ignore only the first LF after CR)
        * CHG: Improved J1850 PWM receiver's symbol detection
        * CHG: Improved J1850 PWM transmitter to work better with improperly loaded buses
        * CHG: Improved voltage calibration (STVCAL/ATCV commands) accuracy by sampling and averaging readings over about 500 ms
        * CHG: Improved voltage measurement precision to 3 decimal places for better accuracy at lower ANALOG_IN voltages
        * CHG: In KWP2000 protocol with manual checksum mode on, the minimum data length for transmitted messages is now 2 bytes
        * CHG: Increased CAN FIFO size from 23 to 31 frames
        * CHG: Increased CAN Tx timeout to 300 ms to reduce the occurrence of CAN ERRORs due to noise or poor link quality
        * CHG: Increased ISO feedback settling wait time from 10% to 33% of bit time
        * CHG: Increased maximum LED blink frequency
        * CHG: Increased UART baud rate error limit to +/- 3% (ATBRD and PP 0C divisors 9 and 7 are now supported)
        * CHG: Increased UART Tx buffer size from 512 bytes to 1k
        * CHG: ISO 5-baud bus init is now considered successful even if the inverted address byte is not received from ECU or is invalid
        * CHG: ISO 5-baud init can now be cancelled on any character received over UART
        * CHG: ISO 5-baud init will now not complete initialization if the key byte validation fails
        * CHG: ISO9141-2 messages are now truncated to 11 bytes or split into 11-byte chunks (maximum length for OBD-II messages) for normal reception (ATNL mode). This improves reliability of communication with 9494 keyword ECUs
        * CHG: Maximum value for all voltage measurement-related commands is now 65.534V
        * CHG: Now all filtering commands turn off automatic filtering mode
        * CHG: Now ISO key bytes will be reset to '--' if init fails or is canceled (ELM327 v1.4 behavior)
        * CHG: OBD Rx LED now blinks for all received messages, inluding internally consummed CAN flow control messages and KWP2000 StartComm responses
        * CHG: OBD Tx LED now blinks for all OBD Tx activity, including CAN flow control frame transmissions during reception
        * CHG: OBD Tx LED now blinks for all OBD Tx activity, including IFR and flow control frame transmissions during reception
        * CHG: Optimized automatic filtering to work properly in marginal cases
        * CHG: PP 06 changes will now take effect upon reset to defaults (ATD)
        * CHG: Reduced startup time by reducing bootloader delay and speeding up LED test for improved compatibility with legacy software
        * CHG: Reduced the extra current drawn by the CAN_TX pin in sleep, when the CAN transceiver is powered off
        * CHG: Relaxed some J1850 PWM timing settings to work better with slightly non-compliant ECUs
        * CHG: Removed 8-byte Tx data length limitation for J1850 protocols (ATAL only)
        * CHG: Removed clearing of UART buffer on prompt, since that could lead to missing a message from the modem
        * CHG: Removed length limitation on custom keep alive messages (ATWM command)
        * CHG: Removed simulator properties and ECU list from start up message
        * CHG: Removed STCMM command (replaced by ATCSM command)
        * CHG: Removed STTSTMXBTN command
        * CHG: Removed the possibility of device lockup, while handling a fatal error
        * CHG: Renamed MON command to SOMM (old one still available, but deprecated)
        * CHG: Renamed RESET command to SR (old one still available, but deprecated)
        * CHG: Renamed STCAFCP/STCCFCP commands to STCFCPA/STCFCPC (old ones still available, but deprecated)
        * CHG: Renamed STRPBR command to STPRBR (report OBD protocol baud rate)
        * CHG: Restored ELM327 functionality for AT@2 command (now one-time programmable via AT@3)
        * CHG: RST_NVM input and STRSTNVM command now also reset the voltage calibration to the default value
        * CHG: RST_NVM input now sets all user-configurable NVM settings to their defaults, except VMEASURE calibration and ATSD data
        * CHG: SI command now prints the hardware revision after the device name
        * CHG: Simplified STATUS LED blink during sleep to "on for 5 ms, every 3 seconds"
        * CHG: STCSWM command now takes mode values from 0 to 8, which independently encode the high speed tool load output
        * CHG: STFAPG command now accepts PGNs 4 to 6 characters long
        * CHG: STI command now prints controller ID, instead of device name
        * CHG: STRSTNVM command now also clears the Bluetooth bond table and resets the device
        * CHG: STRSTNVM command now also resets the device
        * CHG: STSLUIT command will not accept a setting below 5 sec to prevent bricking
        * CHG: STVCAL command now accepts voltage down to 3 decimal point (1 millivolt) precision
        * CHG: STVR command will now print --.-- when the calibrated voltage exceeds 65.534V
        * CHG: UART Rx now ignores LF characters for the purpose of cancelling a command (CR+LF EOL handling)
        * CHG: Updated dot printing during ISO 5-baud init to follow ELM327 v1.3a behavior
        * CHG: Updated STDIX command output to include the new device status info
        * CHG: Updated STSLCS command output for clarity and to include the new PowerSave triggers
        * CHG: When monitoring messages in ATNL mode while a KWP2000 protocol is selected, ISO9141-2 (CARB) messages are now truncated to 12 bytes or split into 12-byte chunks
        * CHG: Zero length frames that generated "<DATA ERROR" will now generate "DATA ERROR" instead
        * NEW: Ability to set custom BT device name (factory programmable only)
        * NEW: Added ability to turn off J1850 CRC calculation and checking
        * NEW: Added abort of OBD message reception on any character received over UART
        * NEW: Added AT@3 command (store device identifier)
        * NEW: Added ATCV 0000 command (restore factory VMEASURE calibration)
        * NEW: Added ATFE and ATSS commands as NOPs (not applicable) for compatibility with ELM327 software
        * NEW: Added ATFI and ATSI commands (perform ISO fast/5-baud bus init)
        * NEW: Added ATIB48 command (set ISO baud rate to 4800)
        * NEW: Added ATIB96 command (set ISO baud rate to 9600)
        * NEW: Added ATSD and ATRD commands (store/read user data byte)
        * NEW: Added ATTA command (set tester address)
        * NEW: Added capability to receive invalid CAN frames (STCMM 2 only)
        * NEW: Added debug LED blinking for different device states in debug message level 2 or above
        * NEW: Added DTC configuration commands (DAD, DPA, DPDA, DRA, DRDA, DSSA, DSDA)
        * NEW: Added ECU configuration commands (E, EA, EAF, EAP, EAPA, EAUPP, EC, ECD, ED, EDA, EL, EN, END, EP, EV, EVD)
        * NEW: Added engine crank counter output to STDIX command
        * NEW: Added Freeze Frames configuration commands (FA, FD, FPA, FPD, FPSD, FT, FTD)
        * NEW: Added INTERNAL ERROR and FATAL ERROR reporting
        * NEW: Added PID configuration commands (PA, PAUDC, PAUMS, PAUS, PD, PSD)
        * NEW: Added power LED blink during boot
        * NEW: Added PowerSave functionality:
        * NEW: Added reset and sleep/wakeup trigger messages in debug message level 1 or above
        * NEW: Added simulator configuration commands (SF, SI, SOMMT, SOMT, SPBR, SPI)
        * NEW: Added STBR command (set UART baud rate)
        * NEW: Added STBRT command (set UART baud rate switch timeout)
        * NEW: Added STCAFCP and STCCFCP commands to add/clear CAN flow control 11-bit ID pairs
        * NEW: Added STCMM command (set CAN monitoring mode)
        * NEW: Added STDI command (print device hardware ID string)
        * NEW: Added STFCA command (clear all OBD filters)
        * NEW: Added STIAT command (turn ISO adaptive interbyte timing on/off)
        * NEW: Added STIBR command (set ISO baud rate)
        * NEW: Added STIMCS command (turn ISO manual checksum on/off)
        * NEW: Added STIP1X command (set ISO P1Max timing)
        * NEW: Added STIP4 command (set ISO P4 timing)
        * NEW: Added STM and STMA commands to enable monitoring using the new filtering subsystem
        * NEW: Added STMFR command (print device manufacturer ID string)
        * NEW: Added STPBR command (set protocol baud rate for ISO and CAN)
        * NEW: Added STRPBR command (report protocol baud rate for all supported OBD protocols)
        * NEW: Added STRSTNVM command (reset user-configurable NVM settings to factory defaults)
        * NEW: Added STS@1 command (set AT@1 device description string)
        * NEW: Added STSATI command (set ATI ID string)
        * NEW: Added STSAVCAL command (save factory calibration values)
        * NEW: Added STSBR command (set UART baud rate in terminal-friendly way)
        * NEW: Added STSLPSP command (set PWR_CTRL output polarity
        * NEW: Added STSLXP command (set polarity of the external SLEEP input)
        * NEW: Added STSN command (print device serial number)
        * NEW: Added STVCAL command (calibrate voltage measurement)
        * NEW: Added STVR command (read battery voltage with two decimal places precision)
        * NEW: Added STVRX command (return battery voltage in ADC steps)
        * NEW: Added STWBR command (write current UART baud rate to NVM)
        * NEW: Added support for hardware r3.0
        * NEW: Added support for J1939 and USERx CAN protocols:
        * NEW: Added UART RX OVERFLOW error to report UART Rx buffer overflow
        * NEW: Added voltage change wakeup PowerSave trigger (STSLVG and STSLVGW commands)
        * NEW: Added voltage level sleep/wakeup PowerSave triggers (STSLVL, STSLVLS, and STSLVLW commands)
        * NEW: All header types can now be sent over KWP2000 protocol (1, 2, 3, and 4 bytes)
        * NEW: ATBD (compatibility only - NOP)
        * NEW: ATCRA [no param] (set CAN hardware filters to defaults)
        * NEW: ATCSM (set CAN silent monitoring)
        * NEW: ATJHF (set J1939 header formatting)
        * NEW: ATJTM (set J1939 response timeout multiplier)
        * NEW: Implemented <RX ERROR detection during CAN bus monitoring
        * NEW: Implemented ATCSM command (CAN silent monitoring)
        * NEW: Implemented CAN ERROR detection during monitoring
        * NEW: Implemented cumulative run time timer (returned via STDIX)
        * NEW: Implemented ELM327 PP 11 (J1850 Break Signal monitor enable)
        * NEW: Implemented ELM327 PP 21 (ATCSM default setting)
        * NEW: Implemented engine crank/start detection
        * NEW: Implemented hardware reset functionality to reset programmable parameters to defaults
        * NEW: Implemented mixed-mode CAN (ISO15765/ISO11898)
        * NEW: Implemented one-time programming of the STMFR string for OEMs
        * NEW: Implemented PP 11 (J1850 Break Signal monitor enable)
        * NEW: Implemented PP 12 (PWM/VPW pin polarity setting)
        * NEW: Implemented PP 15 (default ISO P1 max timing)
        * NEW: Implemented PP 17 (default ISO P1 max timing)
        * NEW: Implemented PP 19 (delay between ISO fast and 5-baud bus init during automatic protocol detection)
        * NEW: Implemented PP 21 (ATCSM default setting)
        * NEW: Implemented PP 2A (CAN error checking [b7: ISO 15765 data length and b6: ISO 15765 PCI=00])
        * NEW: Implemented programmable parameter 06 (OBD source [tester] address)
        * NEW: Implemented programmable parameter 0C (default UART baud rate divisor)
        * NEW: Implemented programmable parameter 16 (default ATIB setting)
        * NEW: Implemented VBAT and host status monitoring for tri-color Status LED control
        * NEW: Initial release
        * NEW: Made PIM firmware compatible with the new ECUsim 5100 base boards (r2.0 and above)
        * NEW: Redesigned message filtering subsystem:
        * NEW: Renamed filtering commands to fit the new naming convention (old ones still available, but deprecated)
        * NEW: Renamed STPRBR to STPBRR (STPRBR still available, but deprecated)
        * NEW: Source address header byte in ISO keep-alive messages is now set to OBD source (tester) address (set by PP 06)
        * NEW: STBTCOD (factory use only, set Bluetooth CoD value)
        * NEW: STCMM (set CAN monitoring mode)
        * NEW: STDBGM (set debug message level)
        * NEW: STDICES (report engine start count)
        * NEW: STDICPO (report POR count)
        * NEW: STDITPO (report time since POR)
        * NEW: STDIX (factory use only, extended device ID information)
        * NEW: STFA (enable automatic filtering mode)
        * NEW: STIX (print extended FW version info)
        * NEW: STP (set protocol)
        * NEW: STPC (close protocol)
        * NEW: STPCB (set automatic check byte calculation/checking)
        * NEW: STPO (open protocol)
        * NEW: STPR (report current protocol number)
        * NEW: STPRS (report current protocol string)
        * NEW: STPTO (set OBD response timeout)
        * NEW: STSDI (set STDI HW ID string)
        * NEW: STTSTMXBTN (factory use only, disable MX button functionality during assembly line testing)
        * NEW: STVCAL [no param] (reset voltage calibration to factory defaults)
        * NEW: Updated firmware to work with hardware revisions 2.x
        * NEW: Updated to work with OBDLink U r2.0 and above, OBDLink S, and microOBD hardware

-------------------
microOBD ChangeLog
OBDLink ChangeLog
OBDLink CI ChangeLog
OBDLink MX ChangeLog
OBDLink SX ChangeLog
ScanTool.net LLC
STN1110 ChangeLog
STN1170 ChangeLog
STSP300 ChangeLog
v1.0.0 - 2009/07/01
v1.0.0 - 2009/08/20
v1.1.0 - 2009/08/12
v1.1.0 - 2009/10/01
v1.1.1 - 2009/08/14
v1.1.3 - 2009/12/16
v1.2.0 - 2009/10/01
v1.2.0 - 2010/01/20
v1.2.1 - 2009/12/16
v1.2.2 - 2010/02/15
v1.2.4 - 2010/03/09
v1.3.0 - 2010/01/20
v2.0.0 - 2010/06/07
v2.0.0 - 2010/06/15
v2.0.1 - 2010/06/08
v2.0.1 - 2010/07/12
v2.0.1 - 2011/01/07
v2.0.2 - 2010/06/24
v2.0.2 - 2010/07/13
v2.0.2 - 2010/08/26
v2.0.3 - 2010/08/25
v2.0.4 - 2010/10/21
v2.1.0 - 2010/02/18
v2.1.0 - 2010/06/24
v2.1.1 - 2010/08/24
v2.1.1 - 2011/06/23
v2.1.2 - 2010/08/25
v2.1.3 - 2010/11/18
v2.1.3 - 2011/01/11
v2.2.2 - 2011/01/11
v3.0.0 - 2012/04/30
v3.0.2 - 2011/12/22
v3.1.0 - 2012/05/16
v3.1.1 - 2012/05/23
v3.1.3 - 2013/04/22
v3.1.5 - 2012/05/10
v3.1.6 - 2012/05/11
v3.1.7 - 2012/05/14
v3.2.0 - 2012/07/12
v3.2.0 - 2012/09/19
v3.2.0 - 2013/08/06
v3.3.0 - 2012/09/26
v3.3.0 - 2012/10/09
v3.3.1 - 2012/09/25
v3.3.1 - 2012/10/16
