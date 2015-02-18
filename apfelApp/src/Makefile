TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
# Build the IOC support library

PROD_LIBS += stream
PROD_LIBS += asyn
PROD_LIBS += sscan
PROD_LIBS += scanProgress

LIBRARY_IOC += apfelSupport

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
apfelSupport_SRCS += initTrace.c
apfelSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = apfel
# apfel.dbd will be created and installed
DBD += apfel.dbd

# apfel.dbd will be made up from these files:
apfel_DBD += base.dbd
apfel_DBD += asyn.dbd
apfel_DBD += drvAsynSerialPort.dbd
apfel_DBD += stream.dbd
apfel_DBD += initTrace.dbd
apfel_DBD += sscan.dbd
apfel_DBD += sscanSupport.dbd
apfel_DBD += sscanProgressSupport.dbd
             
# Include dbd files from all support applications:
#apfel_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#apfel_LIBS += xxx

# apfel_registerRecordDeviceDriver.cpp derives from apfel.dbd
apfel_SRCS += apfel_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
apfel_SRCS_DEFAULT += apfelMain.cpp
apfel_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#apfel_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
apfel_LIBS += apfelSupport
# Finally link to the EPICS Base libraries
apfel_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
ifneq ($(findstring linux-arm,$(T_A)),)
BIN_INSTALLS += $(EPICS_BASE_BIN)/caRepeater
LIB_INSTALLS += $(ASYN)/lib/linux-arm/libasyn.so
LIB_INSTALLS += $(STREAM)/lib/linux-arm/libstream.so
LIB_INSTALLS += $(SNCSEQ)/lib/linux-arm/libseq.so
LIB_INSTALLS += $(SNCSEQ)/lib/linux-arm/libpv.so
LIB_INSTALLS += $(SNCSEQ)/lib/linux-arm/libpv.so
endif

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

