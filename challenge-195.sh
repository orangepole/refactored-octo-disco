#!/bin/bash

# Compare master and slave tables for any inconsistency
# Author : Jagad
# Date	 : 10-March-2016 


# Path 1: Initial checking of table size : md5umns & rows counts

printf "\n\t Venturesity Challange 195 \n\t Obj: Compare two tables for inconsistency\n" 

master=${1:-~/Desktop/master};
slave=${2:-~/Desktop/slave};

master_rows=` cat $master | wc -l`
slave_rows=` cat $slave | wc -l`
master_md5=`cat $master | md5sum `
slave_md5=`cat $slave | md5sum `

if [ '$master_rows' == '$slave_rows' ] && [ '$master_md5' == '$slave_md5' ]
then
{
printf " \n\t Rows >>  Master = %3d : Slave = %3d" "$master_rows" "$slave_rows"
printf " \n\t md5  >>  Master = %s \n\t         Slave = %s" "$master_md5" "$slave_md5"
printf " \n\t [ ok  ]Table size inconsistency : NONE \n"
}
else 
{
printf " \n\t Rows >>  Master = %3d : Slave = %3d" "$master_rows" "$slave_rows"
printf " \n\t md5 >>  Master = %s \n\t         Slave = %s" "$master_md5" "$slave_md5"
printf " \n\t [Error] Inconcsistency found in Table Size \n"

diff -c $master $slave
}
fi



