#!/bin/sh

# Run run*.sh scripts with procServ
/usr/local/bin/procServ -f -n RSSMX100A -i ^C^D 20000 ./runGenericSMX.sh "$@"
