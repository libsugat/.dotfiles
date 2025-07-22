#!/bin/bash
busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500
notify-send "Nightlight OFF" "Nightlight turned off"
