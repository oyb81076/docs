#!/usr/bin/env bash
fswatch -x -t -u . \
    | awk '{if( $0 ~ " IsFile" && $0 ~ " Updated" && $6 ~ ".go$") print "echo ["$4"] "$6";go run "$6; system("");}' \
    | sh
