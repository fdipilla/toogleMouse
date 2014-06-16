#!/bin/bash

# Obtengo el id del dispositivo
deviceId=$(xinput --list | grep 'SynPS/2 Synaptics TouchPad' | awk '{print $6}' | cut -d \= -f 2)

# Obtengo el estado actual
deviceStatus=$(xinput --list-props 11 | grep "Device Enabled" | awk '{print $4}')

# Cambio al estado contrario
xinput set-int-prop $deviceId "Device Enabled" 8 $((1-deviceStatus))