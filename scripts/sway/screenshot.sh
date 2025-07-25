#!/bin/bash

# Directory and filename
DIR="${HOME}/Pictures/Screenshots"
mkdir -p "$DIR"
FILENAME="screenshot-$(date +'%Y%m%d-%H%M%S')-grim.png"
FILE="$DIR/$FILENAME"

# Function to send notification
send_notification() {
    notify-send -i "$FILE" "📸 Screenshot Taken" "Saved. Copied to clipboard"
}


# Determine screenshot mode
case "$1" in
    --selection)
        AREA=$(slurp)
        [ -z "$AREA" ] && exit 1
        grim -g "$AREA" "$FILE" || exit 1
        ;;

    --monitor)
        OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
        [ -z "$OUTPUT" ] && exit 1
        grim -o "$OUTPUT" "$FILE" || exit 1
        ;;

    --window)
        GEOM=$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')
        [ -z "$GEOM" ] && exit 1
        grim -g "$GEOM" "$FILE" || exit 1
        ;;

    *)
        echo "Usage: $0 [--selection|--monitor|--window]"
        exit 1
        ;;
esac

# Copy image to clipboard
wl-copy < "$FILE"

# Notify
send_notification
