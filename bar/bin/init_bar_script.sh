#!/bin/bash

PANEL_FIFO=/tmp/bar.fifo
PRINTER=/Users/cabrinha/devel/dots/bar/bin/printer.js
NODE=/Users/cabrinha/homebrew/bin/node

[ -e $PANEL_FIFO ] && rm $PANEL_FIFO
mkfifo $PANEL_FIFO

# Run bar and keep reading from fifo
tail -n +1 -f $PANEL_FIFO | $NODE $PRINTER &

date_time() {
    DATETIME=$(date "+S%A %d %b - %I:%M %p")
    echo $DATETIME
}

mpc_current() {
    current=$(mpc current)
    echo $current
}

while true
do
  echo "%{c} mpc_current() %{r} date_time()" > $PANEL_FIFO
  sleep 5
done

