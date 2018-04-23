#!/bin/bash
printf "|------------------------------------------------|-------------|\n"
keys=`echo -e "KEYS *\n" | redis-cli -p 6379`
printf "|%-48s| %-12s|\n" "Key" "Size"
printf "|------------------------------------------------|-------------|\n"
for key in $keys ;
do info=`echo -e "debug object $key" | redis-cli -p 6379 | grep -Po "serializedlength\:[0-9]*" | cut -d ":" -f2 | tr -d '\n'`; 
    printf "|%-48s| %-12d|\n" $key $info 
done | sort -n -t '|' -k 3 -r
printf "|------------------------------------------------|-------------|\n"
