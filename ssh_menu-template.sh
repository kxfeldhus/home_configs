#!/bin/bash

sshargs='-X'

server_group1=(
 "server:description"\
 "server:description")
server_group2=(
 "server:description"\
 "server:description")

COLUMNS=30 # I don't like when it spreads out horizontally

types=("server_group1" "server_group2")
PS3='Pick a type: '
select type in "${types[@]}"
do
     clear
     servers=' '
     echo $type
     case "$type" in
             server_group1 ) servers="${server_group1[@]}" ;;
             server_group2) servers="${server_group2[@]}" ;;
     esac

     PS3='Pick a server: '
     select server in $servers
        do
                hostname=$(echo "$server" | cut -d':' -f1)
                description=$(echo "$server" | cut -d':' -f2)
                echo "Connecting to: $hostname"
                ssh $sshargs $hostname
                break
        done
    exit 0
done

COLUMNS=
