#!/bin/bash

outfile=$HOME/research/sys_info.txt
files=(/etc/shadow /etc/passwd)

# Print file permissions for shadow and passwd
for file in ${files[@]}
do
	ls -l $file >> $outfile
done
	
if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi

if [ ! -f $outfile ]
then
> $outfile
fi

# Print date and time
echo "System Info $(date)" >> $outfile

# Print machine name
echo -e "\nMachine Name: $(uname -a)" >> $outfile

# Print IP address
echo -e "\nIP Address: $( ip address | head -9 | tail -1 | awk '{print $2}')" >> $outfile

# Print hostname
echo -e "\nHostname: $(hostname)" >> $outfile

# Print DNS servers
echo "DNS Servers: " >> $outfile

# Print
cat /etc/resolv.conf >> $outfile

#Print memory info
echo -e "\nMemory Info: $(free -h)" >> $outfile

#Print CPU info
echo -e "\nCPU Info:\n$(lscpu | grep CPU)" >> $outfile

# Print disk usage info
echo -e "\nDisk Usage:\n$(df -H)" >> $outfile

# Print current user
echo -e "\nWho is logged in:\n$(who -a)" >> $outfile

# Print top 10 running processes
echo -e "\nTop 10 Processes: $(ps aux -m | awk '{print $1, $2, $3, $4, $11}' | head)" >> $outfile

