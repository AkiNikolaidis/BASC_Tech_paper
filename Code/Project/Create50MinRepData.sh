
#!/bin/bash
declare -a sublist=("0025427" "0025428" "0025429" "0025430" "0025431" "0025432" "0025433" "0025434" "0025435" "0025436" "0025437" "0025438" "0025439" "0025440" "0025441" "0025442" "0025443" "0025444" "0025445" "0025446" "0025447" "0025448" "0025449" "0025450" "0025451" "0025452" "0025453" "0025454" "0025455" "0025456")

#aws s3 sync s3://mri-data/allsessions .
mkdir /data2/Projects/BASC/HNU_SSI/ReplicationStudy/50Min_Replication_Subs2

path_to_sub=/data2/Projects/BASC/HNU_SSI/CPAC_Preprocessed_func
data=Preprocessed_func_gsr-1_scrub-0.nii.gz

#chmod 777 -R HNU_SSI/*

for sub in "${sublist[@]}" 
do
	#session1=
	session1=${path_to_sub}${sub}/session_1${data}
	session3=${path_to_sub}${sub}_session_3${data}
	session5=${path_to_sub}${sub}_session_5${data}
	session7=${path_to_sub}${sub}_session_7${data}
	session9=${path_to_sub}${sub}_session_9${data}

	#create Replication datasets 
	fslmerge -t /data2/Projects/BASC/HNU_SSI/ReplicationStudy/50Min_Replication_Subs2/${sub}.nii.gz session1 session3 session5 session7 session9  

done