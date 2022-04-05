#!/bin/bash

backup=~/backups

# Free memory output to a free_mem.txt file
free -h > $backup/freemem/free_meme.txt

# Disk usage output to a disk_usage.txt file
du -h > $backup/diskuse/disk_usage.txt

# List open files to a open_list.txt file
lsof > $backup/openlist/open_list.txt

# Free disk space to a free_disk.txt file
df -h > $backup/freedisk/free_disk.txt
