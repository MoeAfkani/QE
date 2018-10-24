#!/bin/bash
echo "#This is an output file for $1 excuted in $(date)" &> $1.dew
##########################Constants##############################
lineOftotEnergy=1
lineOfP=1
lineOfForce=1
#################################################################
  for celldom in `LANG=en_US seq $2 $4 $3`
    do
    path=$(pwd)/$1/$celldom
    shitness=$(cat $path/$celldom.$1.scf.out | grep -c "NOT")
    if [ $shitness -eq 1 ]
    then
    # not conv
      echo $celldom shit | tee -a $1.dew
    else 
    # conv
      let "lineOftotEnergy+=200"   #20 line upper than 1st time that "Energy" has observed! 
      echo -n "$celldom"| tee -a $1.dew ;tail -$lineOftotEnergy $path/$celldom.$1.scf.out | grep "!    total energy" |tail -c 20 | tee -a $1.dew
      eval "var$lineOftotEnergy=1";  # recovery to 1


    fi 
  done
gnuplot -e "set terminal png size 1000,900; set output '$1.png'; plot[][]'$1.dew' u 1:2 with linespoints "

eog $1.png &
