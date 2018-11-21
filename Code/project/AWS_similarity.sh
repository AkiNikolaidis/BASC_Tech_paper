#!/bin/bash
#aws s3 sync s3://mri-analysis/new-basc-tech/referencetest .

aws s3 sync s3://mri-analysis/new-basc-tech/halfmintest .
python similarity_extraction.py
rm -r ./halfmintest
mkdir ./halfmin_output
mv ./similarity/* ./halfmin_output

aws s3 sync s3://mri-analysis/new-basc-tech/onemintest .
python similarity_extraction.py
rm -r ./onemintest
mkdir ./onemin_output
mv ./similarity/* ./onemin_output


aws s3 sync s3://mri-analysis/new-basc-tech/threemintest .
python similarity_extraction.py
rm -r ./threemintest
mkdir ./threemin_output
mv ./similarity/* ./threemin_output


aws s3 sync s3://mri-analysis/new-basc-tech/fivemintest .
python similarity_extraction.py
rm -r ./fivemintest
mkdir ./fivemin_output
mv ./similarity/* ./fivemin_output


aws s3 sync s3://mri-analysis/new-basc-tech/tenmintest .
python similarity_extraction.py
rm -r ./tenmintest
mkdir ./tenmin_output
mv ./similarity/* ./tenmin_output


aws s3 sync s3://mri-analysis/new-basc-tech/fifteenmintest .
python similarity_extraction.py
rm -r ./fifteenmintest
mkdir ./fifteenmin_output
mv ./similarity/* ./fifteenmin_output


aws s3 sync s3://mri-analysis/new-basc-tech/twentymintest .
python similarity_extraction.py
rm -r ./twentymintest
mkdir ./twentymin_output
mv ./similarity/* ./twentymin_output


aws s3 sync s3://mri-analysis/new-basc-tech/twentyfivemintest .
python similarity_extraction.py
rm -r ./twentyfivemintest
mkdir ./twentyfivemin_output
mv ./similarity/* ./twentyfivemin_output

aws s3 sync ./similarity s3://mri-analysis/similarity


