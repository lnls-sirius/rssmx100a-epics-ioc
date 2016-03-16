#!../../bin/linux-x86_64/rssmx100a

## You may have to change rssmx100a to something else
## everywhere it appears in this file

< envPaths

# Load device configurations
< device.config

epicsEnvSet("TOP", "../..")
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/rssmx100aApp/Db")

## Register all support components
dbLoadDatabase("$(TOP)/dbd/rssmx100a.dbd",0,0)
rssmx100a_registerRecordDeviceDriver pdbbase


## Load record instances
dbLoadRecords("${TOP}/rssmx100aApp/Db/rssmx100a.db", "P=DIG, DEVICE_INST = $(DEVICE_INST), PORT=rssmx100a_port, ADDR=0, TIMEOUT=1")

# Create the asyn port to talk to the eiger on port 111.
vxi11Configure("rssmx100a_port","$(DEVICE_IP)",1,1000,"inst")

#cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=finottiHost"
