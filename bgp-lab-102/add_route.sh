#!/bin/bash

number_of_lines=$(docker ps | wc -l)
number_of_containers="$((number_of_lines - 1))"
if [ $number_of_containers -eq  2 ]
then
docker exec bgplab102_r1_1 gobgp global rib add 192.168.0.0/27 -a ipv4
fi

