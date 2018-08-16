#!/bin/bash
path=$(pwd) # pwd only is just a string
rm -rf result.txt
rm -rf emails.txt
declare -A developers
while read link
do
    #replace '/' by ' '
    link_translated=`echo ${link}| tr '/' ' '`
    link_arr=($link_translated)
    len=${#link_arr[@]}
    proj=${link_arr[ $(expr $len - 1)]}
    #echo $proj
    git clone $link
    cd $proj
    git log > ../${proj}_log.txt
    cd ..
    rm -rf $proj
    while read log_line
    do
        #echo $log_line
        if [[ "${log_line}" = "Author:"* ]]; then
            line_arr=($log_line)
            name=${line_arr[1]}
            if [[ $(grep "${line_arr[2]}" "emails.txt") ]]; then
            #:
               num=${developers[$name]}
               developers[$name]=$(expr $num + 1)
               echo '...'
            else
                developers[$name]=0
                echo "reading $log_line"
                echo ${line_arr[2]} >> emails.txt
            fi
        fi
    done < "${proj}_log.txt"
    rm -rf ${proj}_log.txt
    best=0
    best_name=''
    for result in ${!developers[@]}
    do
        num=${developers[${result}]}
        echo "$result: $num times.">> result.txt
        if [[ $(expr $num) -gt $(expr $best) ]];then
            echo $num
            best_name=$result
            best=$num
        fi
    done
    echo '========== Best Record =========' >> result.txt
    echo "       ${best_name}" >> result.txt
    echo '================================' >> result.txt
    echo " ################ SUCCEEDED  ################"
done < "github links.txt"