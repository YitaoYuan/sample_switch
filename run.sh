#!/bin/bash

set -e

DIR=`cd $(dirname $0); pwd`
P4_NAME=sample_switch

$DIR/kill_$P4_NAME.sh

echo "Start switchd"

$SDE/run_switchd.sh -p $P4_NAME > /dev/null 2>&1 &

echo -n "Configuring L2 forward table... "

$SDE/run_bfshell.sh -b $DIR/bfrt_table_init > /dev/null 2>&1

echo "Done"

echo -n "Configuring ports... "

$SDE/run_bfshell.sh -f $DIR/ucli_port_init  > /dev/null 2>&1

echo "Done"
