#!/bin/bash

#if available start EPICS's caRepeater
which caRepeater >/dev/null 2>&1 
if [ $? -eq 0 ] 
then
 pgrep caRepeater || caRepeater &
fi

export myIOCBOOT=~/EPICS/apps/apfel/iocBoot/iocapfel
export myARCH=linux-arm
cd ${myIOCBOOT} && LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}../../lib/${myARCH} HOSTNAME=$(hostname) ../../bin/${myARCH}/apfel st.cmd


