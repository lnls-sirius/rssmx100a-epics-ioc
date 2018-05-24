< envPaths

epicsEnvSet("TOP", "../..")

< RSSMX100A.config

####################################################

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/rssmx100aApp/Db")

## Register all support components
dbLoadDatabase ("${TOP}/dbd/rssmx100a.dbd")
rssmx100a_registerRecordDeviceDriver pdbbase

asSetFilename("$(TOP)/rssmx100aApp/Db/accessSecurityFile.acf")

drvAsynIPPortConfigure("${PORT}", "${IPADDR}:${IPPORT} TCP",0,0,0)

## Load record instances
dbLoadRecords("${TOP}/db/SMB.db", "P=${P}, R=${R}, PORT=${PORT}")

< save_restore.cmd

## Run this to trace the stages of iocInit
#traceIocInit

iocInit

## Start any sequence programs

# Create monitor for Autosave
create_monitor_set("autosave_SMB.req", 300, "P=${P}, R=${R}")

# Create manual trigger for Autosave
create_triggered_set("autosave_SMB.req", "${P}${R}SaveTrg", "P=${P}, R=${R}")
set_savefile_name("autosave_SMB.req", "auto_settings_${P}${R}.sav")
