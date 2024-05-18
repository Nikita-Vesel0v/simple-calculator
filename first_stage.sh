#!/usr/bin/env bash 
echo "Enter an arithmetic operation: "
read eq
re='^[-0-9 ]+ [-,+,*,/] [-0-9]+$'
if [[ $eq =~ $re ]]; then
    echo "Operation check passed!"
else
    echo "Operation check failed!"
fi