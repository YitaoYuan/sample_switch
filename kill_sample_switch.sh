#!/bin/bash

PIDS=`pgrep bf_switchd`
if [ -n "$PIDS" ] # not empty
then
	echo "These running switch processes will be killed: "$PIDS
	kill -9 $PIDS > /dev/null 2>&1 #This will cause an error because it also kill the process of "grep", however it has terminated.
else
	echo "No running switch process should be killed"
fi
