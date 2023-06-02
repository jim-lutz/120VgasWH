#!/bin/bash
# bash script to clean up CEC appliance directory download files 

# $1 is the file to clean up
# usage:
# ./cleanCECdir.sh ../ResidentialWaterHeatersExport_05302023043307.csv


# clean up the beginning junk and remove the nulls
sed 's/\xFF\xFE// ; s/\x00//g ' $1 > CECdir.tsv

