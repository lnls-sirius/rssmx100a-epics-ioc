TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC support library
LIBRARY_IOC += rssmx100aSupport
rssmx100aSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Build the IOC application

PROD_IOC = rssmx100a
# rssmx100a.dbd will be created and installed
DBD += rssmx100a.dbd

# rssmx100a.dbd will be made up from these files:
rssmx100a_DBD += base.dbd

# Include dbd files from all support applications:
#rssmx100a_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#rssmx100a_LIBS += xxx

# rssmx100a_registerRecordDeviceDriver.cpp derives from rssmx100a.dbd
rssmx100a_SRCS += rssmx100a_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
rssmx100a_SRCS_DEFAULT += rssmx100aMain.cpp
rssmx100a_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#rssmx100a_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
rssmx100a_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

rssmx100a_DBD += drvAsynIPPort.dbd
rssmx100a_DBD += stream.dbd
rssmx100a_DBD += calcSupport.dbd
rssmx100a_DBD += caPutLog.dbd

rssmx100a_LIBS += asyn
rssmx100a_LIBS += stream
rssmx100a_LIBS += calc
rssmx100a_LIBS += autosave
rssmx100a_LIBS += caPutLog