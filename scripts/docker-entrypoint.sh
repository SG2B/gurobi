#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- gurobi "$@"
fi

if [[ "$VERBOSE" = "yes" ]]; then
    set -x
fi

license=/home/gurobi/gurobi.lic
if [ -f $license ]; then
    echo "Skipping license creation"
    gurobi.sh $1
else
    echo "Configure license $GUROBI_LICENSE"

    grbgetkey $GUROBI_LICENSE
    expect "Assign license key to user 'gurobi' on this machine? \[Y/n\]"
	send "Y"
    gurobi.sh $1
fi