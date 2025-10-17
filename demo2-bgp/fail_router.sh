#!/bin/bash

rtrA="docker exec -it  clab-mod2-bgp-rtrA"
rtrB="docker exec -it  clab-mod2-bgp-rtrB"
rtrC="docker exec -it  clab-mod2-bgp-rtrC"
rtrD="docker exec -it  clab-mod2-bgp-rtrD"

start_fail () {
  echo "bringing down links"
  
  $rtrA ip link set dev eth3 down
  $rtrB ip link set dev eth2 down
  $rtrC ip link set dev eth1 down
  $rtrD ip link set dev eth2 down
}

stop_fail () {
  echo "bringing up links"
  
  $rtrA ip link set dev eth3 up
  $rtrB ip link set dev eth2 up
  $rtrC ip link set dev eth1 up
  $rtrD ip link set dev eth2 up
}

if [ $# != 1 ]
then
   echo "specify start or stop"
elif [ $1 == "stop" ]
then 
   stop_fail
elif [ $1 == "start" ]
then
   start_fail
else
   echo "specify start or stop"
fi
