
1- remove everything from PyBASC_outputs
rm -r ./PyBASC_outputs/*
vi onemin_test.yaml
vi onemin_test0BS.yaml
vi AWSBash.sh
nohup bash AWSBash.sh>awsoutput.txt

#TEST

#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAIDAJHYV7CQ4UGMIA
export AWS_SECRET_ACCESS_KEY=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

#RUN HalfMinData
#Download half min nifti data
mkdir /home/ec2-user/halfmindata
cd /home/ec2-user/halfmindata
aws s3 sync s3://mri-data/small-rep-data/halfmindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/halfmin_test.yaml > /home/ec2-user/PyBASC_outputs/halfmintest2.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/halfmin_test0BS.yaml > /home/ec2-user/PyBASC_outputs/halfmintest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/halfminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/halfmintest s3://mri-analysis/new-basc-tech/halfmintest
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/new-basc-tech/halfmintest/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/halfmintest.txt s3://mri-analysis/new-basc-tech/halfmintest/halfmintest.txt


#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAIDAJHYV7CQ4UGMIA
export AWS_SECRET_ACCESS_KEY=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

#RUN oneMinData
#Download one min nifti data
mkdir /home/ec2-user/onemindata
cd /home/ec2-user/onemindata
aws s3 sync s3://mri-data/small-rep-data/onemindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/onemin_test.yaml > /home/ec2-user/PyBASC_outputs/onemintest2.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/onemin_test0BS.yaml > /home/ec2-user/PyBASC_outputs/onemintest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/oneminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/onemintest s3://mri-analysis/new-basc-tech/onemintest
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/new-basc-tech/onemintest/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/onemintest.txt s3://mri-analysis/new-basc-tech/onemintest/onemintest2.txt


#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAIDAJHYV7CQ4UGMIA
export AWS_SECRET_ACCESS_KEY=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

#RUN threeMinData
#Download three min nifti data
mkdir /home/ec2-user/threemindata
cd /home/ec2-user/threemindata
aws s3 sync s3://mri-data/small-rep-data/threemindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/threemin_test.yaml > /home/ec2-user/PyBASC_outputs/threemintest2.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/threemin_test0BS.yaml > /home/ec2-user/PyBASC_outputs/threemintest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/threeminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/threemintest s3://mri-analysis/new-basc-tech/threemintest
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/new-basc-tech/threemintest/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/threemintest.txt s3://mri-analysis/new-basc-tech/threemintest/threemintest2.txt


#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAIDAJHYV7CQ4UGMIA
export AWS_SECRET_ACCESS_KEY=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

#RUN fiveMinData
#Download five min nifti data
mkdir /home/ec2-user/fivemindata
cd /home/ec2-user/fivemindata
aws s3 sync s3://mri-data/small-rep-data/fivemindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/fivemin_test.yaml > /home/ec2-user/PyBASC_outputs/fivemintest2.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/fivemin_test0BS.yaml > /home/ec2-user/PyBASC_outputs/fivemintest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/fiveminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/fivemintest s3://mri-analysis/new-basc-tech/fivemintest
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/new-basc-tech/fivemintest/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/fivemintest.txt s3://mri-analysis/new-basc-tech/fivemintest/fivemintest2.txt


#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAIDAJHYV7CQ4UGMIA
export AWS_SECRET_ACCESS_KEY=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

#RUN tenMinData
#Download ten min nifti data
mkdir /home/ec2-user/tenmindata
cd /home/ec2-user/tenmindata
aws s3 sync s3://mri-data/small-rep-data/tenmindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/tenmin_test.yaml > /home/ec2-user/PyBASC_outputs/tenmintest2.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/tenmin_test0BS.yaml > /home/ec2-user/PyBASC_outputs/tenmintest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/tenminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/tenmintest s3://mri-analysis/new-basc-tech/tenmintest
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/new-basc-tech/tenmintest/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/tenmintest.txt s3://mri-analysis/new-basc-tech/tenmintest/tenmintest2.txt


#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAIDAJHYV7CQ4UGMIA
export AWS_SECRET_ACCESS_KEY=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

#RUN fifteenMinData
#Download fifteen min nifti data
mkdir /home/ec2-user/fifteenmindata
cd /home/ec2-user/fifteenmindata
aws s3 sync s3://mri-data/small-rep-data/fifteenmindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/fifteenmin_test.yaml > /home/ec2-user/PyBASC_outputs/fifteenmintest2.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/fifteenmin_test0BS.yaml > /home/ec2-user/PyBASC_outputs/fifteenmintest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/fifteenminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/fifteenmintest s3://mri-analysis/new-basc-tech/fifteenmintest
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/new-basc-tech/fifteenmintest/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/fifteenmintest.txt s3://mri-analysis/new-basc-tech/fifteenmintest/fifteenmintest2.txt


#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAIDAJHYV7CQ4UGMIA
export AWS_SECRET_ACCESS_KEY=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

#RUN twentyMinData
#Download twenty min nifti data
mkdir /home/ec2-user/twentymindata
cd /home/ec2-user/twentymindata
aws s3 sync s3://mri-data/small-rep-data/twentymindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/twentymin_test.yaml > /home/ec2-user/PyBASC_outputs/twentymintest2.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/twentymin_test0BS.yaml > /home/ec2-user/PyBASC_outputs/twentymintest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/twentyminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/twentymintest s3://mri-analysis/new-basc-tech/twentymintest
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/new-basc-tech/twentymintest/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/twentymintest.txt s3://mri-analysis/new-basc-tech/twentymintest/twentymintest2.txt


#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAIDAJHYV7CQ4UGMIA
export AWS_SECRET_ACCESS_KEY=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

#RUN twentyfiveMinData
#Download twentyfive min nifti data
mkdir /home/ec2-user/twentyfivemindata
cd /home/ec2-user/twentyfivemindata
aws s3 sync s3://mri-data/small-rep-data/twentyfivemindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/twentyfivemin_test.yaml > /home/ec2-user/PyBASC_outputs/twentyfivemintest2.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/twentyfivemin_test0BS.yaml > /home/ec2-user/PyBASC_outputs/twentyfivemintest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/twentyfiveminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/twentyfivemintest s3://mri-analysis/new-basc-tech/twentyfivemintest
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/new-basc-tech/twentyfivemintest/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/twentyfivemintest.txt s3://mri-analysis/new-basc-tech/twentyfivemintest/twentyfivemintest2.txt







#RUN Refdata
#Download ref min nifti data
mkdir /home/ec2-user/refdata
cd /home/ec2-user/refdata
aws s3 sync s3://mri-data/ref-3mm .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/ref_test.yaml > /home/ec2-user/PyBASC_outputs/reftest.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/ref_test0BS.yaml > /home/ec2-user/PyBASC_outputs/reftest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/refresults
aws s3 sync /home/ec2-user/PyBASC_outputs/reftest s3://mri-analysis/ccn-pybasc/BootstrapTest_Ref
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/ccn-pybasc/BootstrapTest_Ref/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/reftest.txt s3://mri-analysis/ccn-pybasc/BootstrapTest_Ref/reftest.txt


nohup PyBASC /home/ec2-user/PyBASC/PyBASC/ref_test.yaml > /home/ec2-user/PyBASC_outputs/reftest.txt
#nohup PyBASC /home/ec2-user/PyBASC/PyBASC/ref_test0BS.yaml > /home/ec2-user/PyBASC_outputs/reftest.txt
#UPLOAD PYBASC OUTPUT 1
#aws s3 mb s3://basc-tech2/refresults
aws s3 sync /home/ec2-user/PyBASC_outputs/reftest s3://mri-analysis/ccn-pybasc/BootstrapTest_Ref
aws s3 cp /home/ec2-user/awsoutput.txt s3://mri-analysis/ccn-pybasc/BootstrapTest_Ref/awsoutput.txt
aws s3 cp /home/ec2-user/PyBASC_outputs/reftest.txt s3://mri-analysis/ccn-pybasc/BootstrapTest_Ref/reftest.txt























































#Download 1 min nifti data
mkdir /home/ec2-user/onemindata
cd /home/ec2-user/onemindata
aws s3 sync s3://smallrepdata/onemindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/onemin_test.yaml > /home/ec2-user/PyBASC_outputs/onemintest.txt
#UPLOAD PYBASC OUTPUT 1
aws s3 mb s3://basc-tech2/oneminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/onemintest s3://basc-tech2/oneminresults
rm -r /home/ec2-user/PyBASC_outputs/onemintest

#Download 3 min nifti data
mkdir /home/ec2-user/threemindata
cd /home/ec2-user/threemindata
aws s3 sync s3://smallrepdata/threemindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/threemin_test.yaml > /home/ec2-user/PyBASC_outputs/threemintest.txt
#UPLOAD PYBASC OUTPUT 1
aws s3 mb s3://basc-tech2/threeminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/threemintest s3://basc-tech2/threeminresults
rm -r /home/ec2-user/PyBASC_outputs/threemintest

#Download 5 min nifti data
mkdir /home/ec2-user/fivemindata
cd /home/ec2-user/fivemindata
aws s3 sync s3://smallrepdata/fivemindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/fivemin_test.yaml > /home/ec2-user/PyBASC_outputs/fivemintest.txt
#UPLOAD PYBASC OUTPUT 1
aws s3 mb s3://basc-tech2/fiveminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/fivemintest s3://basc-tech2/fiveminresults
rm -r /home/ec2-user/PyBASC_outputs/fivemintest

#Download 10 min nifti data
mkdir /home/ec2-user/tenmindata
cd /home/ec2-user/tenmindata
aws s3 sync s3://smallrepdata/tenmindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/tenmin_test.yaml > /home/ec2-user/PyBASC_outputs/tenmintest.txt
#UPLOAD PYBASC OUTPUT 1
aws s3 mb s3://basc-tech2/tenminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/tenmintest s3://basc-tech2/tenminresults
rm -r /home/ec2-user/PyBASC_outputs/tenmintest

#Download 15 min nifti data
mkdir /home/ec2-user/fifteenmindata
cd /home/ec2-user/fifteenmindata
aws s3 sync s3://smallrepdata/fifteenmindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/fifteenmin_test.yaml > /home/ec2-user/PyBASC_outputs/fifteenmintest.txt
#UPLOAD PYBASC OUTPUT 1
aws s3 mb s3://basc-tech2/fifteenminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/fifteenmintest s3://basc-tech2/fifteenminresults
rm -r /home/ec2-user/PyBASC_outputs/fifteenmintest


#Download 20 min nifti data
mkdir /home/ec2-user/twentymindata
cd /home/ec2-user/twentymindata
aws s3 sync s3://smallrepdata/twentymindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/twentymin_test.yaml > /home/ec2-user/PyBASC_outputs/twentymintest.txt
#UPLOAD PYBASC OUTPUT 1
aws s3 mb s3://basc-tech2/twentyminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/twentymintest s3://basc-tech2/twentyminresults
rm -r /home/ec2-user/PyBASC_outputs/twentymintest


#Download 25 min nifti data
mkdir /home/ec2-user/twentyfivemindata
cd /home/ec2-user/twentyfivemindata
aws s3 sync s3://smallrepdata/twentyfivemindata .
#RUN PYBASC 
nohup PyBASC /home/ec2-user/PyBASC/PyBASC/twentyfivemin_test.yaml > /home/ec2-user/PyBASC_outputs/twentyfivemintest.txt
#UPLOAD PYBASC OUTPUT 1
aws s3 mb s3://basc-tech2/twentyfiveminresults
aws s3 sync /home/ec2-user/PyBASC_outputs/twentyfivemintest s3://basc-tech2/twentyfiveminresults
rm -r /home/ec2-user/PyBASC_outputs/twentyfivemintest
