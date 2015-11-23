#!/bin/bash
myProcServScript=/home/panda/procServ/start_apfel_IOC_procServ.sh
#procServ -q -L /home/panda/procServ/start_apfel_IOC_procServ.log --logstamp -n apfelControlIOC -l 4814 4813 ${myProcServScript} 
procServ -q -n apfelControlIOC -l 4814 4813 ${myProcServScript} 

