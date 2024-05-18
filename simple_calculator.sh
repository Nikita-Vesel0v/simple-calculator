#!/usr/bin/env bash 

echo "Enter an arithmetic operation: "
read a operator b

# Regex for checking integer number and operators
re_num='^-?[0-9]+$'
re_operator='^[-+*/]$'

# Checking for the data
if [[ $a =~ $re_num ]] && [[ $b =~ $re_num ]] && [[ $operator =~ $re_operator ]]; then
    # Do arithmetic operation
    arithmetic_result=$(( a $operator b ))
    printf "%s\n" "$arithmetic_result"
else
    echo "Operation check failed!"
fi