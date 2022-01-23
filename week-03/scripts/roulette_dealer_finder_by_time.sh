#!/bin/bash/

# Search for a roulette dealer on the schedule using time (00:00:00 AM/PM) and date (MMDD)
# $1 = time $2 = date

grep "$1" $2_Dealer_schedule |
awk -F" " '{print $1 " " $2 " " $5 " " $6}'
