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

if [ -z "$DEVICE_TYPE" ]; then
    echo "Device type is not set. Please use -d option" >&2
    exit 4
fi

case ${DEVICE_TYPE} in
    SMA)
        ST_CMD_FILE=stSMA.cmd
	;;

    SMB)
	ST_CMD_FILE=stSMB.cmd
	;;

    *)
        echo "Invalid RSSMX100A type: "${DEVICE_TYPE} >&2
        exit 7
        ;;
esac

echo "Using st.cmd file: "${ST_CMD_FILE}

cd "$IOC_BOOT_DIR"

IPADDR="$IPADDR" IPPORT="$IPPORT" P="$P" R="$R" "$IOC_BIN" "$ST_CMD_FILE"
