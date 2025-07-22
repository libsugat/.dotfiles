#!/bin/bash
busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 4250
notify-send "Nightlight ON" "Nightlight turned on"
