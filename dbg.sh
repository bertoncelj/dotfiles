#! /usr/bin/env bash

function assert_HARD_fail {
    echo "ERROR: $1"
    echo "FAIL installing" 
    echo "exiting installer" 
    exit 1
}




function msg_INFO 
{
    echo "INFO: $1"
}
