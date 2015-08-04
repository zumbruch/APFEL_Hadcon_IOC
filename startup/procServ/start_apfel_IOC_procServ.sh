#!/bin/bash
. epics -q 

pgrep caRepeater || caRepeater &

cd ~/EPICS/apps/apfel/iocBoot/iocapfel && LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}../../lib/linux-arm HOSTNAME=$(hostname) ../../bin/linux-arm/apfel st.cmd


