#!/bin/bash
BASE_DIR=$(pwd)
DARE_OUT=/dare_out
APK_DIR=/APKs
TMP_OUT=/out
for app in `ls $APK_DIR`; 
do
    app_name=$(echo $app | cut -f1 -d'.')
    printf "Retargeting $app_name..."
    mkdir -p $TMP_OUT/$app_name
    $BASE_DIR/dare-1.1.0-linux/dare -d $TMP_OUT/$app_name $APK_DIR/$app > /dev/null
    cp -r $TMP_OUT/$app_name $DARE_OUT/
    echo " Done"
done

