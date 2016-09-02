linux-scripts
=============

Useful Linux scripts



hdfs_clean_cron.sh

===============================
```
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


```
===============================
```
To convert string to json escaping
alias json_escape="python -c 'import json,sys; print json.dumps(sys.stdin.read())'"

To post a marathon based task

curl -X POST http://10.133.147.10:8080/v2/apps   -d '{ "id": "sreenutest", "cmd": "while true ; do echo hello ; sleep 5 ; done", "cpus": 0.1, "mem": 10.0, "instances": 1 }'  -H "Content-Type: application/json"

prettify json string

echo '{"foo": "lorem", "bar": "ipsum"}' | python -m json.tool

```
