#!/bin/bash/

#Find dealers working during losses

cat 0315_Dealer_schedule | grep -E '05:00:00 AM|08:00:00 AM|02:00:00 PM' |

awk -F" " '{print "March 15 "$1 " " $2 " " $5 " " $6}' >> Dealers_working_during_losses
