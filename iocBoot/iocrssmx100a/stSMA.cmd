#!../../bin/linux-x86_64/rssmx100a
< envPaths

epicsEnvSet("TOP", "../..")

< RSSMX100A.config

####################################################
epicsEnvSet("EPICS_IOC_LOG_INET", "$(EPICS_IOC_LOG_INET)")
epicsEnvSet("EPICS_IOC_LOG_PORT", "$(EPICS_IOC_LOG_PORT)")

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/rssmx100aApp/Db")

## Register all support components
dbLoadDatabase ("${TOP}/dbd/rssmx100a.dbd")
rssmx100a_registerRecordDeviceDriver pdbbase

asSetFilename("$(TOP)/rssmx100aApp/Db/accessSecurityFile.acf")

drvAsynIPPortConfigure("${PORT}", "${IPADDR}:${IPPORT} TCP", 0, 0, 0)

## Load record instances
dbLoadRecords("${TOP}/db/SMA.db",         "P=${P},R=${R},PORT=${PORT}")
dbLoadRecords("${TOP}/db/hotswap.db",     "P=${P},R=${R},PORT=${PORT},D1=${IPADDR}:${IPPORT},D2=${IPADDR2}:${IPPORT2}")

< save_restore.cmd

## Run this to trace the stages of iocInit
#traceIocInit

iocInit
iocLogInit
caPutLogInit "$(EPICS_IOC_CAPUTLOG_INET):$(EPICS_IOC_CAPUTLOG_PORT)" 2

## Start any sequence programs

# Sequencer STATE MACHINES Initialization
# No sequencer program

# Create monitor for Autosave
create_monitor_set("autosave_SMA.req", 300, "P=${P}, R=${R}")

# Create manual trigger for Autosave
create_triggered_set("autosave_SMA.req", "${P}${R}Save-Cmd", "P=${P}, R=${R}")
set_savefile_name("autosave_SMA.req", "auto_settings_${P}${R}.sav")
