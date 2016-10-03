#!/bin/sh

PANEL_FIFO=/tmp/bar.fifo
PRINTER=/Users/cabrinha/devel/bar/bin/printer.js
NODE=/Users/cabrinha/homebrew/bin/node

[ -e $PANEL_FIFO ] && rm $PANEL_FIFO
mkfifo $PANEL_FIFO

# Run bar and keep reading from fifo
tail -n +1 -f $PANEL_FIFO | $NODE $PRINTER &

while true
do
  date "+S%d %b - %I:%M %p" > $PANEL_FIFO
  sleep 5
done

