#!/bin/bash/

Blackjack()
{
	awk -F" " '{print $1 " " $2 " " $3 " " $4}'
}
Roulette()
{
	awk -F" " '{print $1 " " $2 " " $5 " " $6}'
}
Texas_Hold_Em()
{
	awk -F" " '{print $1 " " $2 " " $7 " " $8}'
}

# Search for a roulette dealer on the schedule using time (00:00:00 AM/PM), date (MMDD), and casino game (B, R, T).
# $1 = time $2 = date $3 = casino game

grep "$1" $2_Dealer_schedule |

if [ $3 = 'B' ]; then
	Blackjack
elif [ $3 = 'R' ]; then
	Roulette
elif [ $3 = 'T' ]; then
	Texas_Hold_Em
fi
