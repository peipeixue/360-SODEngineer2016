#!/bin/bash


Tmpfile1=$(mktemp)
Tmpfile2=$(mktemp)
Tmpfile3=$(mktemp)
ifconfig | grep '^[^[:space:]]' | awk '{print $1}' > $Tmpfile1 
ifconfig | grep -A 1 '^[^[:space:]]' | awk '/addr:/ {print $2}' | awk -F ':' '{print $2}' > $Tmpfile2

paste $Tmpfile1 $Tmpfile2 > $Tmpfile3

cat $Tmpfile3 | while read line;do
    key=`echo $line|awk '{print $1}'` value=`echo $line |awk '{print $2}'`
        echo $key $value
done

