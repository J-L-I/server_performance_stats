#!/bin/bash
#top -E g  -b -n 1 | head -n 5;
#df -h --total | grep total;
cpuId=$(top -b -n 1 | awk -F',' 'NR==3 {print $4}' | awk '{print $1}');
cpuPercent=$(echo "100 - $cpuId" | bc);

freeMemory=$(top -E g -b -n 1 | awk -F',' 'NR==4 {print $2}' | awk '{print $1}');
usedMemory=$(top -E g -b -n 1 | awk -F',' 'NR==4 {print $3}' | awk '{print $1}');
totalMemory=$(top -E g -b -n 1 | awk -F',' 'NR==4 {print $1}' | awk '{print $4}');
memoryPercent=$(echo "scale=2; $usedMemory / $totalMemory" | bc);

freeDisk=$(df -h --total | grep total | awk '{print $4}');
usedDisk=$(df -h --total | grep total | awk '{print $3}');
totalDisk=$(df -h --total | grep total | awk '{print $2}');
diskPercent=$(df -h --total | grep total | awk '{print $5}');



echo "Server Performance Stats";
echo "------------------------";
echo "CPU";
echo "  CPU Percent Used: $cpuPercent%";
echo "";
echo "MEMORY";
echo "  Memory Percent Used: $memoryPercent%"; 
echo "  Total Memory: $totalMemory GiB";
echo "  Free Memory: $freeMemory GiB";
echo "  Used Memory: $usedMemory GiB";
echo "";
echo "DISK";
echo "  Disk Percent Used: $diskPercent";
echo "  Total Disk: $totalDisk";
echo "  Free Disk: $freeDisk";
echo "  Used Disk: $usedDisk";
echo "";
echo "Top 5 process by memory usage";
echo "$(top -o +%MEM -b -n 1 | awk 'NR==8 {print $2}')";
echo "$(top -o +%MEM -b -n 1 | awk 'NR==9 {print $2}')";
echo "$(top -o +%MEM -b -n 1 | awk 'NR==10 {print $2}')";
echo "$(top -o +%MEM -b -n 1 | awk 'NR==11 {print $2}')";
echo "$(top -o +%MEM -b -n 1 | awk 'NR==12 {print $2}')";
echo ""
echo "Top 5 processes by CPU usage";
echo " $(top -o +%CPU -b -n 1 | awk 'NR==8 {print $2}')";
echo " $(top -o +%CPU -b -n 1 | awk 'NR==9 {print $2}')";
echo " $(top -o +%CPU -b -n 1 | awk 'NR==10 {print $2}')";
echo " $(top -o +%CPU -b -n 1 | awk 'NR==11 {print $2}')";
echo " $(top -o +%CPU -b -n 1 | awk 'NR==12 {print $2}')";

