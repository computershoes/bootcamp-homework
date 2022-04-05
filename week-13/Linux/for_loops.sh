#!/bin/bash

favstates=('Minnesota' 'Colorado' 'Illinois' 'California' 'Oregon')

for state in ${favstates[@]}
do
	if [ $state = 'Hawaii' ];
	then
		echo 'Hawaii is the best!'
	else
		echo "I'm not fond of Hawaii"
	fi
done
