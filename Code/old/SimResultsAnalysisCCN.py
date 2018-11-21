#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 18 17:02:14 2018

@author: aki.nikolaidis
"""
import os
import numpy as np
from sklearn.metrics import adjusted_rand_score
import pandas as pd
import nibabel as nb
#from PyBASC.__main__ import main, run_PyBASC
import os
import gc
import numpy as np
import nibabel as nb
import numpy as np
import PyBASC.basc as basc
import PyBASC.utils as utils

import scipy.stats
from os.path import expanduser
from PyBASC.basc_workflow_runner import run_basc_workflow

#TrueMotorClust=np.zeros((4332,4332))
#TrueMotorClust[0:2994,0:2994]=1
#TrueMotorClust[2994:4332,2994:4332]=1
#
#TrueMotorLabels=np.zeros((4332,1))
#TrueMotorLabels[0:2994]=1
#TrueMotorLabels[2994:4332]=2

data_dir='/Users/aki.nikolaidis/PyBASC_outputs'
#GS=[1,10,30,60,100]
#SNR=['0.05corr_2noise', '0.3corr_3noise','0.3corr_2noise']
#Volumes=[100,200,400]

TrueClust=nb.load('/Users/aki.nikolaidis/git_repo/PyBASC/PyBASC/masks/True3ClustBG.nii.gz').get_data().astype('float32')
    
roi_mask_file='/Users/aki.nikolaidis/git_repo/PyBASC/PyBASC/masks/True3ClustBG_mask.nii.gz' 
roi_mask_nparray = nb.load(roi_mask_file).get_data().astype('float32').astype('bool')
TrueBG = TrueClust[roi_mask_nparray]

#True3Clust=TrueClust[TrueClust]



TrueBG_GSM=utils.adjacency_matrix(TrueBG)
TrueBG_GSM=TrueBG_GSM*1

#import pdb; pdb.set_trace()

#SimResults=pd.DataFrame(columns=['AvgAcc', 'Reg1Acc', 'Reg2Acc', 'numsub', 'numvox', 'TRs', 'n_clusters', 'corrstrength', 'bootstraps', 'noiselevel', 'SNR'])
SimResults=pd.DataFrame(columns=['GroupDim', 'Run', 'group_label_acc', 'gsm_acc', 'ism_gsm_corrmean', 'ism_gsm_corrstd'])

#'GBS', 'IBS', 'group_label_acc', 'gsm_acc', 'ism_gsm_corrmean', 'ism_gsm_corrstd'])

#GBSTest_0.3corr_2noise_100Vol1GS

GroupDimReduce=['On','On2','Off2c', 'OffFixed1', 'OnFixed1']
Runs=15
'/GroupDimReduceTest_Off2b/Run_15_800_correlation_3_clusters_30_IndBS_1_blockcorrelation/'
'/GroupDimReduceTest_On/Run_7_800_correlation_3_clusters_30_IndBS_1_blockcorrelation/'
'/Users/aki.nikolaidis/PyBASC_outputs/GroupDimReduceTest_On/Run_1_800_correlation_3_clusters_5_IndBS_1_blockcorrelation/'
for GroupDim in GroupDimReduce:
    for Run in range(1,Runs+1): 
            outdir= data_dir+'/GroupDimReduceTest_'+GroupDim+'/Run_' + str(Run)+ '_800_correlation_3_clusters_30_IndBS_1_blockcorrelation'
            #outdir_orig= data_dir+'/GBSTest_'+SNR_level+'_' + str(vols)+ 'Vol' + str(bootstraps) + 'GS/'

            print(outdir)
            #import pdb; pdb.set_trace()
            #subdirs_all = [x[1] for x in os.walk(outdir)]                                                                            
            #subdirs=subdirs_all[0]
            #out_dir= '/Users/aki.nikolaidis/PyBASC_outputs/WWW_BootstrapTest_100GS/dim_' + str(output_size) + '_' + str(similarity_metric) + '_' + str(n_clusters) + '_clusters_' +str(timeseries_bootstraps) +'_IndBS_' + str(blocklength) + '_block' + similarity_metric
#            for subdir in subdirs:
#                newdir=outdir + subdir
#                os.chdir(newdir)
#                #Go into each dir and calculate a bunch of things and put them all into a csv file for plotting later.
#                print(newdir)
#                path=os.path.normpath(newdir)
#                specifics=path.split(os.sep)[5]
#                dimreduction= specifics.split('_')[1]
#                clusternum=specifics.split('_')[3]
#                IBS=specifics.split('_')[5]
#                GBS=bootstraps
               # #import pdb; pdb.set_trace()
        
            group_cluster_labels=np.load(outdir+'/workflow_output/basc_workflow_runner/basc/join_group_stability/clusters_G.npy')
            group_label_acc=adjusted_rand_score(TrueBG.ravel(), group_cluster_labels)
            #import pdb; pdb.set_trace()
            gsm=np.load(outdir+'/workflow_output/basc_workflow_runner/basc/join_group_stability/group_stability_matrix.npy')
            gsm_acc= np.corrcoef(gsm.ravel(),TrueBG_GSM.ravel())[0][1]
            #import pdb; pdb.set_trace()
            ism_gsm_corr=np.load(outdir+'/workflow_output/basc_workflow_runner/basc/join_group_stability/ism_gsm_corr.npy')
            ism_gsm_corrmean= ism_gsm_corr.mean()
            ism_gsm_corrstd= ism_gsm_corr.std()
            
            #import pdb; pdb.set_trace()
            newdata=pd.DataFrame([[GroupDim, Run, group_label_acc, gsm_acc, ism_gsm_corrmean, ism_gsm_corrstd]], columns=['GroupDim', 'Run', 'group_label_acc', 'gsm_acc', 'ism_gsm_corrmean', 'ism_gsm_corrstd'])
    
            frames=[SimResults, newdata]
            SimResults= pd.concat(frames)
                            
SimResults.to_csv(data_dir+'/BASC_Tech_CCN_GroupDim.csv')
                            
