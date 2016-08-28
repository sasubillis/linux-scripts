linux-scripts
=============

Useful Linux scripts



hdfs_clean_cron.sh

===============================

#!/bin/bash

currenttimeinsecs=`date +%s`
onehroldtime=$(($currenttimeinsecs-10800))
while read -r filename timeinsecs;
do
        if [[  $timeinsecs -lt $onehroldtime ]]; then
                timestamp=`date --rfc-3339=seconds`
                csvfilename=${filename%*.gz}
                echo " $timestamp File $csvfilename will be deleted from HDFS file system" >> /var/lib/jenkins/hdfs_deleted_files.log
                hadoop fs -rm hdfs://coord-1/nds-etl/operator-data/vodafone-nz/traffica-rnc/$csvfilename
        fi

done < /var/lib/jenkins/hdfs_fs_clean.log



===============================
