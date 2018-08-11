#!/bin/bash
echo Enter your weight
read weight
case $weight in
    90) echo 90 is big
    ;;
    80) echo 80 is less big
    ;;
    *) echo no matching option
esac