#!/bin/bash
#array params are passed 1 by 1 so we need to reconstruct it again
#shift proves the theory

lastRecord(){
    #array is passed as first parameter
    first=$1
    shift
    #fisrt is lost
    arr=($@)
    len=${#arr[@]}
    echo ${arr[ $(expr $len - 1) ]}
}

array=('hi' 'bash' 'scripting')
last=$(lastRecord ${array[@]})
echo $last