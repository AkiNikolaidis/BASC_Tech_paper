#!/bin/bash
mkdir repdata
cd repdata
aws s3 sync s3://mri-data/50min-repdata .

#############################################################################################################################################################################
#############################################################################################################################################################################

#HALF MINUTE RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest1/halfmintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest2/halfmintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest3/halfmintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest4/halfmintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest5/halfmintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest6/halfmintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest7/halfmintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest8/halfmintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/halfmintest9/halfmintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#ONE MINUTE DATA PREP
sed 's/outputlength=15/outputlength=30/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=15/randomdatagrab=30/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/halfmintest10/onemintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*


#############################################################################################################################################################################
#############################################################################################################################################################################

#ONE MINUTE DATA RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest1/onemintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest2/onemintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest3/onemintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest4/onemintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest5/onemintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest6/onemintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest7/onemintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest8/onemintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/onemintest9/onemintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#THREE MINUTE DATA PREP
sed 's/outputlength=30/outputlength=90/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=30/randomdatagrab=90/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/onemintest10/threemintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*

#############################################################################################################################################################################
#############################################################################################################################################################################

#THREE MINUTE DATA RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest1/threemintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest2/threemintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest3/threemintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest4/threemintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest5/threemintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest6/threemintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest7/threemintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest8/threemintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/threemintest9/threemintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#FIVE MINUTE DATA PREP
sed 's/outputlength=90/outputlength=150/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=90/randomdatagrab=150/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/threemintest10/fivemintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*

#############################################################################################################################################################################
#############################################################################################################################################################################

#FIVE MINUTE DATA RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest1/fivemintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest2/fivemintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest3/fivemintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest4/fivemintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest5/fivemintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest6/fivemintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest7/fivemintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest8/fivemintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fivemintest9/fivemintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#TEN MINUTE DATA PREP
sed 's/outputlength=150/outputlength=300/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=150/randomdatagrab=150/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/fivemintest10/tenmintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*

#############################################################################################################################################################################
#############################################################################################################################################################################

#TEN MINUTE DATA RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest1/tenmintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest2/tenmintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest3/tenmintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest4/tenmintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest5/tenmintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest6/tenmintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest7/tenmintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest8/tenmintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/tenmintest9/tenmintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#FIFTEEN MINUTE DATA PREP
sed 's/outputlength=300/outputlength=450/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=150/randomdatagrab=150/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/tenmintest10/fifteenmintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*


#############################################################################################################################################################################
#############################################################################################################################################################################

#FIFTEEN MINUTE DATA RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest1/fifteenmintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest2/fifteenmintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest3/fifteenmintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest4/fifteenmintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest5/fifteenmintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest6/fifteenmintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest7/fifteenmintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest8/fifteenmintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fifteenmintest9/fifteenmintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#TWENTY MINUTE DATA PREP
sed 's/outputlength=450/outputlength=600/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=150/randomdatagrab=150/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/fifteenmintest10/twentymintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*


#############################################################################################################################################################################
#############################################################################################################################################################################

#TWENTY MINUTE DATA RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest1/twentymintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest2/twentymintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest3/twentymintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest4/twentymintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest5/twentymintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest6/twentymintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest7/twentymintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest8/twentymintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentymintest9/twentymintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#TWENTYFIVE MINUTE DATA PREP
sed 's/outputlength=600/outputlength=750/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=150/randomdatagrab=150/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/twentymintest10/twentyfivemintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*

#############################################################################################################################################################################
#############################################################################################################################################################################

#TWENTYFIVE MINUTE DATA RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest1/twentyfivemintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest2/twentyfivemintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest3/twentyfivemintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest4/twentyfivemintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest5/twentyfivemintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest6/twentyfivemintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest7/twentyfivemintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest8/twentyfivemintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/twentyfivemintest9/twentyfivemintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#FIFTY MINUTE DATA PREP
sed 's/outputlength=750/outputlength=1500/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=150/randomdatagrab=150/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/twentyfivemintest10/fiftymintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*

#############################################################################################################################################################################
#############################################################################################################################################################################

#FIFTY MINUTE DATA RUNS

#############################################################################################################################################################################
#############################################################################################################################################################################
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest1/fiftymintest2/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest2/fiftymintest3/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest3/fiftymintest4/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest4/fiftymintest5/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest5/fiftymintest6/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest6/fiftymintest7/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest7/fiftymintest8/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest8/fiftymintest9/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

sed 's/fiftymintest9/fiftymintest10/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*
nohup python /home/ec2-user/RandomGrabs.py>grabs.txt
nohup PyBASC /home/ec2-user/randomgrabs.yaml>pybasc_output.txt

#REPEAT_ HALF MINUTE DATA PREP
sed 's/outputlength=1500/outputlength=15/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/randomdatagrab=150/randomdatagrab=15/' /home/ec2-user/RandomGrabs.py>>/home/ec2-user/RandomGrabs2.py
rm /home/ec2-user/RandomGrabs.py
cp /home/ec2-user/RandomGrabs2.py /home/ec2-user/RandomGrabs.py
rm /home/ec2-user/RandomGrabs2.py

sed 's/fiftymintest10/halfmintest1/' /home/ec2-user/randomgrabs.yaml>>/home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs.yaml
cp /home/ec2-user/randomgrabs2.yaml /home/ec2-user/randomgrabs.yaml 
rm /home/ec2-user/randomgrabs2.yaml
rm /home/ec2-user/randomgrabs/*

#Upload all outputs back to AWS
cd /home/ec2-user/PyBASC_outputs
aws s3 sync . s3://mri-analysis/new-basc-tech/randomgrabs_0BS
