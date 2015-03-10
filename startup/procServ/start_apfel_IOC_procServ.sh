#!/bin/bash
. epics -q 

pgrep caRepeater || caRepeater &

cd ~/EPICS/apps/apfel/iocBoot/iocapfel && HOSTNAME=$(hostname) ../../bin/linux-arm/apfel st.cmd


