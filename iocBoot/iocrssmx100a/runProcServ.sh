#!/bin/sh

# Use defaults is not set
if [ -z "${RSSMX100A_DEVICE_TELNET_PORT}" ]; then
    RSSMX100A_DEVICE_TELNET_PORT=20000
fi

# Run run*.sh scripts with procServ
/usr/local/bin/procServ -f -n rssmx100a${RSSMX100A_INSTANCE} -i ^C^D ${RSSMX100A_DEVICE_TELNET_PORT} ./runRSSMX100A.sh "$@"
