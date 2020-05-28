#!/bin/bash

p=$(lsof -i :8090 -sTCP:LISTEN |awk 'NR > 1 {print $2}')
for l in $p
do
 echo "Matando proceso $l"
 kill -9 $l
done
echo "Levantando Proveedor"
nohup java -jar /home/ec2-user/app/spring-boot-crud.jar > /dev/null &
echo "Listo, revisar puerto"
sleep 5;
#tail -f provider/provider.log
