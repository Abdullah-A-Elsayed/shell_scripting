#!/bin/bash
echo enter your age
read age
if [ $age -le 25 ]
then
    echo young
elif [ $age -le 40 ]
then
    echo man
else
    echo old
fi
#elif is followed by then