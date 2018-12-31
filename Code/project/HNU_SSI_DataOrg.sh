#!/bin/bash

declare -a sublist=("0025427" "0025428" "0025429" "0025430" "0025431" "0025432" "0025433" "0025434" "0025435" "0025436" "0025437" "0025438" "0025439" "0025440" "0025441" "0025442" "0025443" "0025444" "0025445" "0025446" "0025447" "0025448" "0025449" "0025450" "0025451" "0025452" "0025453" "0025454" "0025455" "0025456")

mkdir /data2/Projects/BASC/HNU_SSI/Merged_gsr-1_scrub-0

cd /data2/Projects/BASC/HNU_SSI/Merged_gsr-1_scrub-0

mkdir ./Reference_Subs
mkdir ./50Min_Replication_Subs
mkdir ./40Min_Replicaiton_Subs
mkdir ./30Min_Replication_Subs
mkdir ./20Min_Replication_Subs
mkdir ./10Min_Replication_Subs



path_to_sub=/data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/
data=Preprocessed_func_gsr-1_scrub-0.nii.gz
#data=/functional_mni/_scan_rest/_csf_threshold_0.96/_gm_threshold_0.7/_wm_threshold_0.96/_compcor_ncomponents_5_selector_pc10.linear1.wm1.global0.motion1.quadratic1.gm0.compcor0.csf1/_bandpass_freqs_0.01.0.1/bandpassed_demeaned_filtered_antswarp.nii.gz
#data=/functional_to_standard/_scan_RESTINGSTATE/_threshold_2/_compcor_ncomponents_5_selector_pc10.linear1.wm1.global1.motion1.quadratic1.gm0.compcor0.csf1/_bandpass_freqs_0.01.0.1/bandpassed_demeaned_filtered_antswarp.nii.gz

#Merge0gsr0scrub - old
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025427_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_4/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_6/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_8/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_10/Preprocessed_func_gsr-0_scrub-0.nii.gz
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025431_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_2/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_4/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_6/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_10/Preprocessed_func_gsr-0_scrub-0.nii.gz 
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025442_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_2/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_6/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_8/Preprocessed_func_gsr-0_scrub-0.nii.gz 
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025445_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_2/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_6/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_8/Preprocessed_func_gsr-0_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_10/Preprocessed_func_gsr-0_scrub-0.nii.gz

#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025427_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_4/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_6/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_8/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_10/Preprocessed_func_gsr-1_scrub-0.nii.gz
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025431_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_2/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_4/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_6/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_10/Preprocessed_func_gsr-1_scrub-0.nii.gz 
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025442_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_2/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_6/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_8/Preprocessed_func_gsr-1_scrub-0.nii.gz 
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025445_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_2/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_6/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_8/Preprocessed_func_gsr-1_scrub-0.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_10/Preprocessed_func_gsr-1_scrub-0.nii.gz

#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025427_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_4/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_6/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_8/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_10/Preprocessed_func_gsr-1_scrub-1.nii.gz
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025431_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_2/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_4/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_6/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_10/Preprocessed_func_gsr-1_scrub-1.nii.gz 
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025442_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_2/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_6/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_8/Preprocessed_func_gsr-1_scrub-1.nii.gz 
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025445_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_2/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_6/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_8/Preprocessed_func_gsr-1_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_10/Preprocessed_func_gsr-1_scrub-1.nii.gz

#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025427_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_4/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_6/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_8/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025427/session_10/Preprocessed_func_gsr-0_scrub-1.nii.gz
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025431_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_2/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_4/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_6/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025431/session_10/Preprocessed_func_gsr-0_scrub-1.nii.gz 
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025442_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_2/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_6/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025442/session_8/Preprocessed_func_gsr-0_scrub-1.nii.gz 
#fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/Reference_Subs/0025445_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_2/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_6/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_8/Preprocessed_func_gsr-0_scrub-1.nii.gz /data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func/0025445/session_10/Preprocessed_func_gsr-0_scrub-1.nii.gz

chmod 777 -R HNU_SSI/*

for sub in "${sublist[@]}" 
do
	#session1=
	session1=${path_to_sub}${sub}/session_1${data}
	session2=${path_to_sub}${sub}_session_2${data}
	session3=${path_to_sub}${sub}_session_3${data}
	session4=${path_to_sub}${sub}_session_4${data}
	session5=${path_to_sub}${sub}_session_5${data}
	session6=${path_to_sub}${sub}_session_6${data}
	session7=${path_to_sub}${sub}_session_7${data}
	session8=${path_to_sub}${sub}_session_8${data}
	session9=${path_to_sub}${sub}_session_9${data}
	session10=${path_to_sub}${sub}_session_10${data}

	#create Reference
	fslmerge -t ./Reference_Subs/${sub}.nii.gz session2 session4 session6 session8 session10
	#create Replication datasets 
	fslmerge -t ./50Min_Replication_Subs/${sub}.nii.gz session1 session3 session5 session7 session9  
	fslmerge -t ./40Min_Replication_Subs/${sub}.nii.gz session1 session3 session5 session7   
	fslmerge -t ./30Min_Replication_Subs/${sub}.nii.gz session1 session3 session5    
	fslmerge -t ./20Min_Replication_Subs/${sub}.nii.gz session1 session3  
	fslmerge -t /./10Min_Replication_Subs/${sub}.nii.gz session1    
done
#/data2/Projects/BASC/HBN-SSI/CPAC_output/M00499588_ssc_9/functional_mni/_scan_rest/_csf_threshold_0.96/_gm_threshold_0.7/_wm_threshold_0.96/_compcor_ncomponents_5_selector_pc10.linear1.wm1.global0.motion1.quadratic1.gm0.compcor0.csf1/_bandpass_freqs_0.01.0.1