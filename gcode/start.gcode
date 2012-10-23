M140 S60 ;set bed temp, no wait.
M104 S190 ;set hotend temp, no wait.
M116 ;waiting for both temperatures
G90 ;absolute Positioning
G21 ;set units to millimeters
T0 ;select extruder 0
;G28 ;homing (done manually before print)
G92 X0 Y0 Z0 ;set home here
G92 E0 ;reset extruder length
G1 F1800.0
G1 E4.0 ;prime extruder
G92 E0 ;reset extruder length
