#!/bin/bash

STATUS=$(pgrep xautolock)

if [ -z "$STATUS" ]; then
    notify-send "Enabling xautolock"
    xautolock -notifier 'notify-send --icon /home/ak/Pictures/icons/lock.png --app-name Locker "Locking in 20 seconds"' -notify 20 -time 1 -locker "lock" &
else
    notify-send "Disabling xautolock"
    pkill xautolock
fi
