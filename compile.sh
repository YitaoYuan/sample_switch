#!/bin/bash

cd $(dirname $0)
DIR=`pwd`
P4_NAME=sample_switch

set -ex

mkdir -p build
cd build
cmake $SDE/p4studio/ -DCMAKE_INSTALL_PREFIX=$SDE_INSTALL -DCMAKE_MODULE_PATH=$SDE/cmake -DP4_NAME=$P4_NAME -DP4_PATH=$DIR/switch.p4
make && make install
cd .. 
rm -r build
rm bf_drivers.log
rm zlog-cfg-cur
