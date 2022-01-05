#!/bin/sh

set -e
set +u

# Parse command-line options
. ./parseCMDOpts.sh "$@"

UNIX_SOCKET=""
if [ -z "${DEVICE_TELNET_PORT}" ]; then
    UNIX_SOCKET="true"
fi

if [ -z "${RSSMX100A_INSTANCE}" ]; then
   RSSMX100A_INSTANCE="1"
fi

set -u

# Use UNIX socket telnet port is not set
if [ "${UNIX_SOCKET}" ]; then
    /usr/local/bin/procServ \
        --logfile - \
        --foreground \
        --name rssmx100a_${RSSMX100A_INSTANCE} \
        --ignore ^C^D \
        unix:./procserv.sock \
            ./runGenericSMX.sh "$@"
else
    /usr/local/bin/procServ \
        --logfile - \
        --foreground \
        --name rssmx100a_${RSSMX100A_INSTANCE} \
        --ignore ^C^D \
        ${DEVICE_TELNET_PORT} \
            ./runGenericSMX.sh "$@"
fi
