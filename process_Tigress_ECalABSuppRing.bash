#!/bin/bash

# Script to generate the Tigress addback ring gamma ray energy spectrum for a given run.
# Argument 1 is the run number.
# Argument 2 is suppLow.
# Argument 3 is suppHigh.

#copy master files
mkdir MasterFiles
cp GenericMasterFiles/master26563_Tigress_ECalABRing MasterFiles/master"$1"_Tigress_ECalABRing

#replace master file strings with appropriate values
sed -i 's/26563/'"$1"'/g'  MasterFiles/master"$1"_Tigress_ECalABRing

#make the Tigress/BGO hit pattern ROOT file
mkdir Tigress_ECalABSuppRing
Tigress_ECalABSuppRing MasterFiles/master"$1"_Tigress_ECalABRing $2 $3
mv Ring_ECalABSupp.mca Tigress_ECalABSuppRing/run"$1"_Tigress_ECalABSuppRing.mca

#remove intermediate data files to save disk space and cleanup
echo ""
echo "Cleaning up..."
rm -rf TBsep/
rm -rf MasterFiles/

echo ""
echo "Done making the Tigress addback suppressed ring gamma ray energy spectrum: Tigress_ECalABRing/run"$1"_Tigress_ECalABRing.mca"
