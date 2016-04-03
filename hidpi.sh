#!/bin/bash

# Sets the GUI toolkits for the correct dpi

# QT
export QT_DEVICE_PIXEL_RATIO=2
# GTK
export GDK_SCALE=2 # scales icons
export GDK_DPI_SCALE=0.5 #undo scaling of text
