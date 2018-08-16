#!/bin/bash
hi="hi ahmed"
bi="bi hi ahmed"
declare -A arr
arr[${hi}]=4
arr[${bi}]=5
for key in ${!arr[@]}
do
echo ${arr[$key]}
done