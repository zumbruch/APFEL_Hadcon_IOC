#!../../bin/linux-arm/apfel

## You may have to change apfel to something else
## everywhere it appears in this file

< envPaths


epicsEnvSet("STREAM_PROTOCOL_PATH", "../../protocols")
epicsEnvSet("PATH","${PATH}:../../bin/linux-arm")

#cd ${TOP}

## Register all support components
dbLoadDatabase "../../dbd/apfel.dbd"
apfel_registerRecordDeviceDriver pdbbase

drvAsynSerialPortConfigure("hadcon2","/dev/ttyUSB0",0,0,0)
   asynSetOption("hadcon2",0,"baud","115200")
   asynSetOption("hadcon2",0,"bits","8")
   asynSetOption("hadcon2",0,"parity","none")
   asynSetOption("hadcon2",0,"stop","1")
   asynSetOption("hadcon2",0,"clocal","Y")
   asynSetOption("hadcon2",0,"crtscts","N")


## Load record instances
dbLoadRecords ("../../db/hadcon_global.db"      , "device=hadcon2,HADCON=${HOSTNAME}:1, PREFIX=, SUFFIX=")
#dbLoadRecords("../../db/hadcon_debug_global.db", "device=hadcon2,HADCON=${HOSTNAME}:1, PREFIX=, SUFFIX=")
dbLoadRecords("../../db/hadcon_stats.db", "IOC=${HOSTNAME}")

## Load $(HOSTNAME) specific record instances

#< st_${HOSTNAME}.cmd

cd ${TOP}/iocBoot/${IOC}
iocInit

dbl > ${HOSTNAME}.dbl

## Start any sequence programs
#seq sncxxx,"user=pandaHost"