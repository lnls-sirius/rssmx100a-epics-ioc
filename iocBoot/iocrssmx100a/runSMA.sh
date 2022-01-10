#!/bin/sh
set -e
set +u

# Source environment
. ./checkEnv.sh

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Check last command return status
if [ $? -ne 0 ]; then
    echo "Could not parse command-line options" >&2
    exit 1
fi

if [ -z "$IPADDR" ]; then
    echo "IP address not set. Please use -i option or set \$IPADDR environment variable" >&2
    exit 3
fi

if [ -z "$IPPORT" ]; then
    IPPORT="5025"
fi

cd "$IOC_BOOT_DIR"

if [ -z "$IPPORT2" ]; then
    echo "IP port 2 not set."
    IPPORT2=$IPPORT
fi

if [ -z "$IPADDR2" ]; then
    echo "IP address 2 not set."
    IPADDR2=$IPADDR
fi

IPADDR="$IPADDR" \
IPPORT="$IPPORT" \
IPADDR2="$IPADDR2" \
IPPORT2="$IPPORT2" \
P="$P" \
R="$R" \
"$IOC_BIN" \
stSMA.cmd
