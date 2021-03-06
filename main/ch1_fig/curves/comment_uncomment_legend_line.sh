#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
elif [ $1 = "on" ]
  then
  	find . -type f -name "*.txt" -exec sed -i 's/      Es/#     Es/g' {} +
  	find . -type f -name "*.txt" -exec sed -i 's/\r//g' {} +
elif [ $1 = "off" ]
  then
  	find . -type f -name "*.txt" -exec sed -i 's/#     Es/      Es/g' {} +
  	find . -type f -name "*.txt" -exec sed -i 's/\r//g' {} +
else
    echo "Wrong arg"
fi
