#/bin/bash
while getopts c:h:p: flag
do
  case "${flag}" in
    c) celsius=${OPTARG};;
    h) humidity=${OPTARG};;
    p) pressure=${OPTARG};;
  esac
done
echo "Temp (C): $celsius";
echo "Humidity: $humidity";
echo "Pressure: $pressure";

echo 'Content-Type: application/json;charset=UTF-8'
#echo "Content-Type"


curl -X PUT localhost:8081/temp/ -H 'Content-Type: application/json;charset=UTF-8' -d "{"\""celsius"\"":$celsius, "\""humidity"\"":$humidity, "\""pressure"\"":$pressure, "\""illuminance"\"":12, "\""expectedUpdateRateSeconds"\"":300}"
