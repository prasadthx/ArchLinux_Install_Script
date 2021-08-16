#!/bin/bash

disksMAN=`(fdisk -l) | (grep "^/dev") | (awk '{print $1}')`

mapfile -t darray <<< "$disksMAN"