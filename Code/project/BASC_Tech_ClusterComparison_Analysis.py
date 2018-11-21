#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Oct  6 08:02:39 2018

@author: aki.nikolaidis
"""

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep  3 14:04:05 2018

@author: aki.nikolaidis
"""

#%% CALCULATING ALL ADJUSTED RAND INDICES BETWEEN EACH SUBJECT'S 
# CLUSTER LABELS AT T1 AND EACH SUBJECTS CLUSTER LABELS AT T2
#OUTPUT A MATRIX OF DISTANCES
# OUTPUT A CSV OF SUBJECT LABELS.


#%%
* GSM Spatial Correlation
* Group Labels Rand Index
* ISM Spatial Correlation
* Individualized Group Labels Rand Index
* ISM Discriminability (Spatial Correlation)
* Individualized Group Labels Discriminability (Rand Index)

Outputs to create
Discriminability for ISM Similarity matrix for each Rerun [One CSV per rerun?]
Discriminability for individualized group labels Adjusted Rand Index for each Rerun [One CSV per rerun?]

ISM Spatial Correlation for each rerun [individualized analysis (already done previously)]
Adjusted Rand Index for each individualized group labels for each rerun [individualized analysis (already done previously)]

Adjusted Rand Index for Group Labels for each rerun [group analysis (already done previously)]
Spatial Correlation of GSM [group analysis (already done previously)]


#%%

import PyBASC.utils as utils
import PyBASC.basc as basc
import numpy as np
import os
import pandas as pd
import nibabel as nb
import scipy.sparse
from sklearn.metrics import adjusted_rand_score



reruns=10
rerun_list= np.linspace(1,reruns,reruns)

#bootstrap_list= ['1','100','200','400','800']
bootstrap_list=['1','100','200','400','800']


homedir= '/home/ec2-user/similarity'

GSMdir='/workflow_output/basc_workflow_runner/basc/join_group_stability/group_stability_matrix.npy'
labelsdir='/workflow_output/clusters_G/clusters_G.npy'

group_level_reproducibility=pd.DataFrame(columns=['rerun','bootstrap', 'group_label_acc', 'gsm_repref_corr', 'mean_rep_ism_gsm_corr', 'stdev_rep_ism_gsm_corr'])
all_individual_reproducibility=pd.DataFrame(columns=['rerun','bootstrap', 'subject', 'ism_repref_corr', 'sub_rep_ism_gsm_corr', 'sub_ref_ism_gsm_corr'])



for rerun in rerun_list:
    for bootstrap in bootstrap_list:
        if bootstrap =='1':
            rerun=1
            
        
        # GROUP LEVEL ANALYSIS
        refdir='/Users/aki.nikolaidis/Downloads/halfmintest/Run_'+str(int(rerun))+'_1600_correlation_ward_clusters-4_IndBS-' + bootstrap + '_block-1'
        repdir='/Users/aki.nikolaidis/Downloads/onemintest/Run_'+str(int(rerun))+'_1600_correlation_ward_clusters-4_IndBS-' + bootstrap + '_block-1'
        
        ref_gsm_dir = refdir + '/workflow_output/group_stability_matrix/group_stability_matrix.npz'
        rep_gsm_dir = repdir + '/workflow_output/group_stability_matrix/group_stability_matrix.npz'
        
        ref_grp_labels_dir = refdir + '/workflow_output/clusters_G/clusters_G.npy'
        rep_grp_labels_dir = repdir + '/workflow_output/clusters_G/clusters_G.npy'
        
        group_label_acc = adjusted_rand_score(np.load(ref_grp_labels_dir), np.load(rep_grp_labels_dir))
        gsm_repref_corr = 1- scipy.spatial.distance.correlation(scipy.sparse.load_npz(ref_gsm_dir).toarray().ravel(),scipy.sparse.load_npz(rep_gsm_dir).toarray().ravel())
        
        rep_ism_gsm_corr=np.load(repdir + '/workflow_output/basc_workflow_runner/basc/join_group_stability/ism_gsm_corr.npy')
        mean_rep_ism_gsm_corr=rep_ism_gsm_corr.ravel().mean()
        stdev_rep_ism_gsm_corr=rep_ism_gsm_corr.ravel().std()
        
        newgroupdata=pd.DataFrame([[rerun, bootstrap, group_label_acc, gsm_repref_corr, mean_rep_ism_gsm_corr, stdev_rep_ism_gsm_corr]], columns=['rerun','bootstrap', 'group_label_acc', 'gsm_repref_corr', 'mean_rep_ism_gsm_corr', 'stdev_rep_ism_gsm_corr'])
        groupframes=[group_level_reproducibility,newgroupdata]
        group_level_reproducibility=pd.concat(groupframes)
        group_level_reproducibility.to_csv(homedir+'/group_level_reproducibility_.csv')
        
        
        
        #BEGGINING SUMMARY LEVEL INDIVIDUAL  ANALYSIS
        ref_ind_grp_labels_dir = refdir + '/workflow_output/basc_workflow_runner/basc/individual_group_clustered_maps/'
        rep_ind_grp_labels_dir = repdir + '/workflow_output/basc_workflow_runner/basc/individual_group_clustered_maps/'
        
        ref_ism_dir= refdir + '/workflow_output/basc_workflow_runner/basc/individual_stability_matrices/mapflow/'
        rep_ism_dir= repdir + '/workflow_output/basc_workflow_runner/basc/individual_stability_matrices/mapflow/'
        
    
        os.chdir(ref_ind_grp_labels_dir)
        subdirs_all = [x[1] for x in os.walk(ref_ind_grp_labels_dir)]                                                                            
        subdirs = subdirs_all[2]
        
        sublist = pd.DataFrame(columns=['sub_ID'])
        allrep_labels = pd.DataFrame()
        allref_labels = pd.DataFrame()   
        
        allrep_ism = pd.DataFrame()
        allref_ism = pd.DataFrame()
        
        all_labels = pd.DataFrame()
        all_ism = pd.DataFrame()

        
        #BEGGINING INDIVIDUAL LEVEL ANALYSIS
        for subdir in subdirs:
            print(subdir)
            sublabel  = subdir.split('_')[4]
            subject = np.int(sublabel[4:])
            
    
            sublist.append({'sub_ID':np.int(subject)},ignore_index=True)
    
            #labels (ADD when NPY is GETTING SAVED)
            #rep_ind_label = pd.DataFrame(np.load(rep_ind_grp_labels_dir + '_individual_group_clustered_maps'+ str(subject)+ '/ind_group_cluster_labels.npy'))
            #ref_ind_label = pd.DataFrame(np.load(ref_ind_grp_labels_dir + '_individual_group_clustered_maps'+ str(subject)+ '/ind_group_cluster_labels.npy'))
            
            #calculate label Adjusted Rand Score
            #ref_rep_label_ind_ARI=adjusted_rand_score(np.asarray(rep_ind_label).ravel(), np.asarray(ref_ind_label).ravel())
    
            #ISM
            temp_rep_ism = scipy.sparse.load_npz(rep_ism_dir+'_individual_stability_matrices' + str(subject) + '/individual_stability_matrix.npz').toarray()
            temp_ref_ism = scipy.sparse.load_npz(ref_ism_dir+'_individual_stability_matrices' + str(subject) + '/individual_stability_matrix.npz').toarray()
            rep_ism = pd.DataFrame(np.array(temp_rep_ism[np.triu_indices(4332, k = 1)]))
            ref_ism = pd.DataFrame(np.array(temp_ref_ism[np.triu_indices(4332, k = 1)]))
            
            #calculate ISM Spatial Correlation
            
            ism_repref_corr=scipy.spatial.distance.correlation(rep_ism.T,ref_ism.T)
            
            
            newdata=pd.DataFrame([[rerun, bootstrap, subject, ism_repref_corr]],columns=['rerun', 'bootstrap', 'subject', 'ism_repref_corr'])
            frames=[all_individual_reproducibility, newdata]
            all_individual_reproducibility=pd.concat(frames)
            

            all_individual_reproducibility.to_csv(homedir+'/all_individual_reproducibility_.csv')
            
            
            #DISCRIMINABILITY CALCULATIONS
            
            #Grouping for Discriminability
            #grouping_rep_labels = [allrep_labels,rep_ind_label]
            #grouping_ref_labels = [allref_labels,ref_ind_label]
            grouping_rep_ism = [allrep_ism,rep_ism]
            grouping_ref_ism = [allref_ism,ref_ism]
            
            #Concatenation for Discriminability
            #allrep_labels = pd.concat(grouping_rep_labels, axis=1)
            #allref_labels = pd.concat(grouping_ref_labels, axis=1)

            allrep_ism = pd.concat(grouping_rep_ism, axis=1)
            allref_ism = pd.concat(grouping_ref_ism, axis=1)
            
        
       
       
            
        #CALCULATING INDIVIDUAL LEVEL SPATIAL CORRELATIONS FOR DISCRIMINABILITY
            
        all_ism=[allrep_ism,allref_ism]
        all_ism=pd.concat(all_ism, axis=1)
        spatialcorr=np.corrcoef(all_ism.T)
        filename1=homedir+'/Discriminability_SpatialCorr_'+str(int(rerun))+'.csv'
        np.savetxt(filename1, spatialcorr, delimiter=",")




#%% COMPARING CLUSTERING TECHNIQUES WITH AND WITHOUT BOOTSTRAPPING

import PyBASC.utils as utils
import PyBASC.basc as basc
import numpy as np
import os
import pandas as pd
import nibabel as nb
from sklearn.metrics import adjusted_rand_score


kmeansdir= '/home/ec2-user/kmeans'
warddir= '/home/ec2-user/ward'
spectraldir= '/home/ec2-user/spectral'



GSMdir='/workflow_output/basc_workflow_runner/basc/join_group_stability/group_stability_matrix.npy'
labelsdir='/workflow_output/clusters_G/clusters_G.npy'

cluster_comparisons=pd.DataFrame(columns=['rerun1','rerun2', 'bootstrap', 'KMeans_Spectral_GSMCorr', 'Ward_KMeans_GSMCorr', 'Spectral_Ward_GSMCorr', 'KMeans_Spectral_RandIdx', 'Ward_KMeans_RandIdx', 'Spectral_Ward_RandIdx'])

reruns=13
rerun_list= np.linspace(1,reruns,reruns)


for rerun1 in rerun_list:
    for rerun2 in rerun_list:
            
        print(rerun1,rerun2)
        bootstrap=200
        GSMKmeans_rerun1 = np.load(kmeansdir+'/Run_'+np.str(np.int(rerun1))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation'+GSMdir)
        GSMward_rerun1 = np.load(warddir+'/Run_'+np.str(np.int(rerun1))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation'+GSMdir)
        GSMspectral_rerun1 = np.load(spectraldir+'/Run_'+np.str(np.int(rerun1))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation'+GSMdir) 
        GSMKmeans_rerun2 = np.load(kmeansdir+'/Run_'+np.str(np.int(rerun2))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation'+GSMdir)
        GSMward_rerun2 = np.load(warddir+'/Run_'+np.str(np.int(rerun2))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation'+GSMdir)
        GSMspectral_rerun2 = np.load(spectraldir+'/Run_'+np.str(np.int(rerun2))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation'+GSMdir)

        
        KMeans_Labels_rerun1 = np.load(kmeansdir+'/Run_'+np.str(np.int(rerun1))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation' + labelsdir)
        Ward_Labels_rerun1 = np.load(warddir+'/Run_'+np.str(np.int(rerun1))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation' + labelsdir)
        Spectral_Labels_rerun1 = np.load(spectraldir+'/Run_'+np.str(np.int(rerun1))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation' + labelsdir)
        KMeans_Labels_rerun2 = np.load(kmeansdir+'/Run_'+np.str(np.int(rerun2))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation' + labelsdir)
        Ward_Labels_rerun2 = np.load(warddir+'/Run_'+np.str(np.int(rerun2))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation' + labelsdir)
        Spectral_Labels_rerun2 = np.load(spectraldir+'/Run_'+np.str(np.int(rerun2))+'_800_correlation_4_clusters_200_IndBS_1_blockcorrelation' + labelsdir)

        
        KMeans_Spectral_GSMCorr=np.corrcoef((GSMKmeans_rerun1.ravel(),GSMspectral_rerun2.ravel()))[0][1]
        Ward_KMeans_GSMCorr=np.corrcoef((GSMward_rerun1.ravel(), GSMKmeans_rerun2.ravel()))[0][1]
        Spectral_Ward_GSMCorr=np.corrcoef((GSMspectral_rerun1.ravel(),GSMward_rerun2.ravel()))[0][1]

        KMeans_Spectral_RandIdx=adjusted_rand_score(KMeans_Labels_rerun1, Spectral_Labels_rerun2)
        Ward_KMeans_RandIdx=adjusted_rand_score(Ward_Labels_rerun1, KMeans_Labels_rerun2)
        Spectral_Ward_RandIdx=adjusted_rand_score(Spectral_Labels_rerun1, Ward_Labels_rerun2)
        
        newgroupdata=pd.DataFrame([[rerun1, rerun2, bootstrap, KMeans_Spectral_GSMCorr, Ward_KMeans_GSMCorr, Spectral_Ward_GSMCorr, KMeans_Spectral_RandIdx, Ward_KMeans_RandIdx, Spectral_Ward_RandIdx]], columns=['rerun1','rerun2', 'bootstrap', 'KMeans_Spectral_GSMCorr', 'Ward_KMeans_GSMCorr', 'Spectral_Ward_GSMCorr', 'KMeans_Spectral_RandIdx', 'Ward_KMeans_RandIdx', 'Spectral_Ward_RandIdx']) 
        groupframes=[cluster_comparisons,newgroupdata]
        cluster_comparisons=pd.concat(groupframes)
        cluster_comparisons.to_csv('cluster_comparisons.csv')
        print('JUST FINISHED ', rerun1,rerun2)


bootstrap = 0
rerun1=1
rerun2=1
GSMKmeans_0BS = np.load(kmeansdir+'/Run_1_800_correlation_4_clusters_0_IndBS_1_blockcorrelation'+GSMdir)
GSMWard_0BS = np.load(warddir+'/Run_1_800_correlation_4_clusters_0_IndBS_1_blockcorrelation'+GSMdir)
GSMSpectral_0BS = np.load(spectraldir+'/Run_1_800_correlation_4_clusters_0_IndBS_1_blockcorrelation'+GSMdir)

KMeans_Labels_0BS = np.load(kmeansdir+'/Run_1_800_correlation_4_clusters_0_IndBS_1_blockcorrelation' + labelsdir)
Ward_Labels_0BS = np.load(warddir+'/Run_1_800_correlation_4_clusters_0_IndBS_1_blockcorrelation' + labelsdir)
Spectral_Labels_0BS = np.load(spectraldir+'/Run_1_800_correlation_4_clusters_0_IndBS_1_blockcorrelation' + labelsdir)

KMeans_Spectral_GSMCorr=np.corrcoef((GSMKmeans_0BS.ravel(),GSMSpectral_0BS.ravel()))[0][1]
Ward_KMeans_GSMCorr=np.corrcoef((GSMWard_0BS.ravel(), GSMKmeans_0BS.ravel()))[0][1]
Spectral_Ward_GSMCorr=np.corrcoef((GSMSpectral_0BS.ravel(),GSMWard_0BS.ravel()))[0][1]

KMeans_Spectral_RandIdx=adjusted_rand_score(KMeans_Labels_0BS, Spectral_Labels_0BS)
Ward_KMeans_RandIdx=adjusted_rand_score(Ward_Labels_0BS, KMeans_Labels_0BS)
Spectral_Ward_RandIdx=adjusted_rand_score(Spectral_Labels_0BS, Ward_Labels_0BS)

newgroupdata=pd.DataFrame([[rerun1, rerun2, bootstrap, KMeans_Spectral_GSMCorr, Ward_KMeans_GSMCorr, Spectral_Ward_GSMCorr, KMeans_Spectral_RandIdx, Ward_KMeans_RandIdx, Spectral_Ward_RandIdx]], columns=['rerun1','rerun2', 'bootstrap', 'KMeans_Spectral_GSMCorr', 'Ward_KMeans_GSMCorr', 'Spectral_Ward_GSMCorr', 'KMeans_Spectral_RandIdx', 'Ward_KMeans_RandIdx', 'Spectral_Ward_RandIdx']) 
groupframes=[cluster_comparisons,newgroupdata]
cluster_comparisons=pd.concat(groupframes)
cluster_comparisons.to_csv('cluster_comparisons.csv')


#%%


   
#CREATING INDIVIDUALIZED PARCELLATIONS FOR EVERY FILE
import os
import numpy as np
import PyBASC.utils as utils
import PyBASC.basc as basc
import scipy.sparse
import pandas as pd
    
reruns=2
rerun_list= np.linspace(1,reruns,reruns)

#bootstrap_list= ['1','100','200','400','800']
bootstrap_list=['100']


homedir= '/home/ec2-user/similarity'

GSMdir='/workflow_output/basc_workflow_runner/basc/join_group_stability/group_stability_matrix.npy'
labelsdir='/workflow_output/clusters_G/clusters_G.npy'

group_level_reproducibility=pd.DataFrame(columns=['rerun','bootstrap', 'group_label_acc', 'gsm_repref_corr', 'mean_rep_ism_gsm_corr', 'stdev_rep_ism_gsm_corr'])
all_individual_reproducibility=pd.DataFrame(columns=['rerun','bootstrap', 'subject', 'ism_repref_corr', 'sub_rep_ism_gsm_corr', 'sub_ref_ism_gsm_corr'])



for rerun in rerun_list:
    for bootstrap in bootstrap_list:
        if bootstrap =='1':
            rerun=1
    
    #FOR LOOP OVER ALL RUNS, FOR LOOP OVER ALL SUBJECTS
    repdir='/Users/aki.nikolaidis/Downloads/onemintest/Run_'+str(int(rerun))+'_1600_correlation_ward_clusters-4_IndBS-' + bootstrap + '_block-1'
        
    rep_gsm_dir = repdir + '/workflow_output/group_stability_matrix/group_stability_matrix.npz'
    ismdir= repdir + '/workflow_output/basc_workflow_runner/basc/individual_stability_matrices/mapflow/'
    clusters_G = np.load(repdir + '/workflow_output/clusters_G/clusters_G.npy')
    
    os.chdir(ismdir)
    subdirs_all = [x[1] for x in os.walk(ismdir)]                                                                            
    subdirs = subdirs_all[0]
    
    for subdir in subdirs:
            print(subdir)
            sublabel  = subdir.split('_')[3]
            subject = np.int(sublabel[8:])
            print(subject)
            
            #ISM
            temp_rep_ism = scipy.sparse.load_npz(ismdir +'_individual_stability_matrices' + str(subject) + '/individual_stability_matrix.npz').toarray()
    
            cluster_ids = np.unique(clusters_G)
            cluster_voxel_scores, k_mask = \
                utils.cluster_matrix_average(temp_rep_ism, clusters_G)
            
            cluster_voxel_scores = cluster_voxel_scores.astype("uint8")
            individualized_group_cluster_npy = np.argmax(cluster_voxel_scores, axis=0) + 1
            ind_group_cluster_labels_file = os.path.join(
            os.getcwd(), '_individual_stability_matrices' + str(subject) + '/ind_group_cluster_labels.npy')
            np.save(ind_group_cluster_labels_file, individualized_group_cluster_npy)


#%%



#CCN Analysis
#BOTH GROUP AND INDIVIDUAL LEVEL REPRODUCIBILITY
import PyBASC.utils as utils
import PyBASC.basc as basc
import numpy as np
import os
import pandas as pd
import nibabel as nb
from sklearn.metrics import adjusted_rand_score

data_dir='/home/ec2-user/repdata_GroupDimTrue'
ref_dir='/home/ec2-user/refdata_GroupDimTrue'

#roi_mask_file='/Users/aki.nikolaidis/git_repo/PyBASC/PyBASC/masks/Full_BG_Sim_3mm.nii.gz'
roi_mask_file='/home/ec2-user/PyBASC/PyBASC/masks/Full_BG_Sim_3mm.nii.gz'

#gsm_path='/group_stability_matrix/group_stability_matrix.npy'
roi_mask_nparray = nb.load(roi_mask_file).get_data().astype('float32').astype('bool')

all_individual_reproducibility=pd.DataFrame(columns=['rerun', 'group_dim','bootstrap', 'subject', 'ism_repref_corr', 'sub_rep_ism_gsm_corr', 'sub_ref_ism_gsm_corr'])
group_level_reproducibility=pd.DataFrame(columns=['rerun', 'group_dim','bootstrap', 'group_label_acc', 'gsm_repref_corr', 'mean_rep_ism_gsm_corr', 'mean_ref_ism_gsm_corr', 'stdev_rep_ism_gsm_corr', 'stdev_ref_ism_gsm_corr'])
clusterg_path='/clusters_G/clusters_G.npy'

#data_dir='/Users/aki.nikolaidis/bootstraptest2/repdata'
#ref_dir='/Users/aki.nikolaidis/bootstraptest2/refdata'
subjects= np.linspace(0,23,24)
reruns=30
bootstrap_list= ['0','100','200','400','800','1600']
bootstrap_list2= ['1','200']
group_dim_list=['100','200','400','800','1600']

#bootstrap_list= ['1']#,'100'] #['0','100','200','400','800','1600']
rerun_list= np.linspace(1,reruns,reruns)

for group_dim in group_dim_list:
    for bootstrap in bootstrap_list:
        ref_path= ref_dir + '/Run_1_'+group_dim+'_correlation_4_clusters_'+bootstrap+'_IndBS_1_blockcorrelation/workflow_output'
        refgroup_labels_path= ref_path + clusterg_path
        refgroup_labels=np.load(refgroup_labels_path)
        refismdir=ref_path + '/basc_workflow_runner/basc/individual_stability_matrices/mapflow/'
        refgsmdir=ref_path +'/basc_workflow_runner/basc/join_group_stability/group_stability_matrix.npy'
        ref_ism_gsm_corr=np.load(ref_path+'/basc_workflow_runner/basc/join_group_stability/ism_gsm_corr.npy')


        for rerun in rerun_list:
            if bootstrap=='0':
                current_path= data_dir + '/Run_1_' + group_dim + '_correlation_4_clusters_'+bootstrap+'_IndBS_1_blockcorrelation/workflow_output'
            else:
                current_path= data_dir + '/Run_'+np.str(np.int(rerun))+'_' + group_dim + '_correlation_4_clusters_'+bootstrap+'_IndBS_1_blockcorrelation/workflow_output'
    
            group_labels_path= current_path + clusterg_path
            
            
            print(current_path)
            print(bootstrap)
            #gsm_full_path=current_path + gsm_path
            #print(group_labels_path)
            #clust_label_temp=np.load(workflowpath to clusters_g.npy)
            #import pdb;pdb.set_trace()
            
            roi_mask_nparray = nb.load(roi_mask_file).get_data().astype('float32').astype('bool')
            group_labels=np.load(group_labels_path)
            #gsm=np.load(gsm_full_path)
            
            group_label_acc=adjusted_rand_score(refgroup_labels, group_labels)
            
            ismdir=current_path + '/basc_workflow_runner/basc/individual_stability_matrices/mapflow/'
            
            gsmdir=current_path +'/basc_workflow_runner/basc/join_group_stability/group_stability_matrix.npy'
            
            gsm=np.load(gsmdir)
            refgsm=np.load(refgsmdir)
            
            gsm_repref_corr=np.corrcoef((gsm.ravel(),refgsm.ravel()))[0][1]
    
    
            rep_ism_gsm_corr=np.load(current_path+'/basc_workflow_runner/basc/join_group_stability/ism_gsm_corr.npy')
           
            mean_rep_ism_gsm_corr=rep_ism_gsm_corr.ravel().mean()
            mean_ref_ism_gsm_corr=ref_ism_gsm_corr.ravel().mean()
            
            stdev_rep_ism_gsm_corr=rep_ism_gsm_corr.ravel().std()
            stdev_ref_ism_gsm_corr=ref_ism_gsm_corr.ravel().std()
    
            os.chdir(ismdir)
            subdirs_all = [x[1] for x in os.walk(ismdir)]                                                                            
            subdirs=subdirs_all[0]
            #print(subdirs)
    #        path=os.path.normpath(ismdir+subdirs[0])
    #        individual=path.split(os.sep)[11]
    #        matrices=individual.split('_')[3]
    #        subject=matrices[8:]
            #import pdb;pdb.set_trace()
            newgroupdata=pd.DataFrame([[rerun, group_dim, bootstrap, group_label_acc, gsm_repref_corr, mean_rep_ism_gsm_corr, mean_ref_ism_gsm_corr, stdev_rep_ism_gsm_corr, stdev_ref_ism_gsm_corr]], columns=['rerun', 'group_dim','bootstrap', 'group_label_acc', 'gsm_repref_corr', 'mean_rep_ism_gsm_corr', 'mean_ref_ism_gsm_corr', 'stdev_rep_ism_gsm_corr', 'stdev_ref_ism_gsm_corr'])
            groupframes=[group_level_reproducibility,newgroupdata]
            group_level_reproducibility=pd.concat(groupframes)
            for subdir in subdirs:
                #path=os.path.normpath(ismdir+subdirs[0])
                #import pdb;pdb.set_trace()
                #individual=path.split(os.sep)[11]
                matrices=subdir.split('_')[3]
                subject=matrices[8:]
                ism=np.load(ismdir + subdir + '/individual_stability_matrix.npy')
                replabels=np.load(ismdir+subdir + '/Y1_labels.npy')
                
                refism=np.load(refismdir + subdir + '/individual_stability_matrix.npy')
                reflabels=np.load(refismdir + subdir + '/Y1_labels.npy')
                
                exp_ism=utils.expand_ism(ism,replabels)
                exp_refism=utils.expand_ism(refism,reflabels)
                
                print('calculating ism reproducibility for subject' + subject)
                ism_repref_corr=np.corrcoef((exp_ism.ravel(),exp_refism.ravel()))[0][1]
                
                sub_rep_ism_gsm_corr= rep_ism_gsm_corr[int(subject)]
                sub_ref_ism_gsm_corr= ref_ism_gsm_corr[int(subject)]
                
                newdata=pd.DataFrame([[rerun, group_dim, bootstrap, subject, ism_repref_corr,sub_rep_ism_gsm_corr,sub_ref_ism_gsm_corr]],columns=['rerun', 'group_dim', 'bootstrap', 'subject', 'ism_repref_corr', 'sub_rep_ism_gsm_corr', 'sub_ref_ism_gsm_corr'])
                frames=[all_individual_reproducibility, newdata]
                all_individual_reproducibility=pd.concat(frames) 
    all_individual_reproducibility.to_csv('all_individual_reproducibility.csv')
    group_level_reproducibility.to_csv('group_level_reproducibility.csv')

##%%
##!/usr/bin/env python3
## -*- coding: utf-8 -*-
#"""
#Created on Sat Jun  9 20:31:56 2018
#
#@author: aki.nikolaidis
#"""
#
#### Analysis of OHBM 9 Corticostriatal Networks
##For both Reference and Replication Datasets:
##* Loop over the each cluster number [2,4,…20]-----------------------------DONE
##    * Loop over each of the 9 networks------------------------------------DONE
##    * Load the cluster labels and put into a matrix-----------------------DONE
##* After building the cluster label matrix
##* Initialize a cluster distance matrix 90x90------------------------------DONE
##* Then loop over each column in the matrix, (col_idx_1)-------------------DONE
##    * Loop over each column in the matrix (col_idx_2)---------------------DONE
##        * Compute the adjusted rand index between the cluster assignments.DONE
##        * Put computed rand index into a cluster distance matrix----------DONE
#
##* Calculate spatial correlation between Reference and Replication Dataset,----------------------------------------------DONE
##       for each of the 10, 9x9 matrices.
##    * Clusters2corr= np.corrcoef(RefClusterSimilarity(0:9,0:9).ravel(), RepClusterSimilarity(0:9,0:9).ravel())[0][1]----DONE
##    * Clusters4=cols10:19,rows10:19
##    * Etc etc
##    * Clusters 20= cols80:90, rows80:89
##* Calculate spatial correlation between reference and replication for the full cluster distance matrix.----------------DONE
#
#
#import numpy as np
#import pandas as pd
#import os
#from sklearn.metrics import adjusted_rand_score
#
##/pybasc-output//40min-data-output/40mindata/40MinData100_GS_/home/ec2-user/git_repo/PyBASC/masks/Yeo7_3mmMasks/Yeo_1_3mm.nii.gz/dim_800_correlation_10_clusters_100_IndBS_1_blockcorrelation/workflow_output/basc_workflow_runner/basc/individual_stability_matrices/mapflow/_individual_stability_matrices0/?region=us-east-2&tab=overview
#all_labels=pd.DataFrame()
#
#
#
#clusterg_path='/clusters_G/clusters_G.npy'
#data_dir='/Users/aki.nikolaidis/bootstraptest/repdata/'
#ref_dir='/Users/aki.nikolaidis/bootstraptest/refdata/'
#subjects= np.linspace(0,23,24)
#bootstrap_list= ['0'] #['0','100','200','400','800','1600']
#
#network_list=['Full_BG_Sim_3mm.nii.gz', 'Yeo_1_3mm.nii.gz','Yeo_2_3mm.nii.gz','Yeo_3_3mm.nii.gz','Yeo_4_3mm.nii.gz','Yeo_5_3mm.nii.gz','Yeo_6_3mm.nii.gz','Yeo_7_3mm.nii.gz', 'cerebellum_3mm.nii.gz']
#
#for bootstrap in bootstrap_list:
#    current_path= data_dir + '/' + network + '/dim_800_correlation_4_clusters_'+bootstrap+'_IndBS_1_blockcorrelation/workflow_output'
#    group_labels_path= current_path + clusterg_path
#    #print(group_labels_path)
#    #clust_label_temp=np.load(workflowpath to clusters_g.npy)
#    #import pdb;pdb.set_trace()
#    group_labels=np.load(group_labels_path)
#    print(group_labels_path)
#    new_column_name= clusternum+ '_clusters_' + network
#    all_labels[new_column_name] = group_labels
#    
#        #add a column to a dataframe, where each column of the dataframe is labeled by the clusternum and networklist.
#        
#        
#        #for subject in subjects:
#        #    subject=str(int(subject))
#            #print(subject)
#        #    ismdir=current_path + 'basc_workflow_runner/basc/individual_stability_matrices/mapflow/_individual_stability_matrices'+ subject
#            #ism=np.load(ismdir)
#            
#
#label_sim_matrix=pd.DataFrame(columns=list(all_labels), index=list(all_labels))
#
#for column in all_labels:
#    column1=column
#    for column in all_labels:
#        column2=column
#        #import pdb; pdb.set_trace()
#        #print(column1, column2)
#        col1loc=all_labels.columns.get_loc(column1)
#        col2loc=all_labels.columns.get_loc(column2)
#        #import pdb; pdb.set_trace()
#        label_sim_matrix[column1][column2]= adjusted_rand_score(all_labels[column1],all_labels[column2])
#        
#        
##%%
#
#label_sim_matrix_40Min=np.load('label_sim_matrix_40Min.npy')
#label_sim_matrix_Ref=np.load('label_sim_matrix_Ref.npy')
#all_labels_40Min=np.load('all_labels_40Min.npy')
#all_labels_Ref=np.load('all_labels_Ref.npy')
##%%
#all_labels_total=np.concatenate((all_labels_40Min,all_labels_Ref), axis=1)
#
#all_labels_total_pd=pd.DataFrame(all_labels_total)
#Rep_Ref_label_sim_matrix=pd.DataFrame(columns=list(all_labels_total_pd), index=list(all_labels_total_pd))
#
#for column in all_labels_total_pd:
#    column1=column
#    for column in all_labels_total_pd:
#        column2=column
#        #import pdb; pdb.set_trace()
#        print(column1, column2)
#        col1loc=all_labels_total_pd.columns.get_loc(column1)
#        col2loc=all_labels_total_pd.columns.get_loc(column2)
#        #import pdb; pdb.set_trace()
#        Rep_Ref_label_sim_matrix[column1][column2]= adjusted_rand_score(all_labels_total_pd[column1],all_labels_total_pd[column2])
#        
#Rep_Ref_label_sim_matrix=Rep_Ref_label_sim_matrix.astype(float)
#Rep_Ref_label_sim_matrix_vals=Rep_Ref_label_sim_matrix.values
#
#clusternum_list= ['2','4','6','8','10','12','14','16','18','20']
#network_list=['Full_BG_Sim_3mm.nii.gz', 'Yeo_1_3mm.nii.gz','Yeo_2_3mm.nii.gz','Yeo_3_3mm.nii.gz','Yeo_4_3mm.nii.gz','Yeo_5_3mm.nii.gz','Yeo_6_3mm.nii.gz','Yeo_7_3mm.nii.gz', 'cerebellum_3mm.nii.gz']
#
#replication_list=[]
#refrep_clusternum_list=[]
#refrep_network_list=[]
#for clusternum in clusternum_list:
#    for network in network_list:
#        replication= clusternum + '_clusters_' + network
#        refrep_clusternum_list.append(clusternum + '_clusters')
#        refrep_network_list.append(network)
#        replication_list.append(replication)
#
#replist=pd.DataFrame(replication_list)
#clustlist=pd.DataFrame(refrep_clusternum_list)
#networklist=pd.DataFrame(refrep_network_list)
#
#newmat=Rep_Ref_label_sim_matrix_vals[90:,0:90]
#diag=np.diag(newmat)
#diag_pd=pd.DataFrame(diag, columns=['RepRefSim'])
#
#frames=[replist, clustlist,networklist, diag_pd]
#
#diag_names=pd.concat(frames, axis=1)
#
#diag_names_sort=diag_names.sort(columns='RepRefSim')
#
#
##%%
##np.save('./all_labels_40Min',all_labels)
##np.save('./label_sim_matrix_40Min',label_sim_matrix)
#all_labels_40Min=all_labels
#label_sim_matrix_40Min=label_sim_matrix
#label_sim_matrix_40Min=label_sim_matrix_40Min.astype(float)
#
#label_sim_matrix_Ref=label_sim_matrix
#label_sim_matrix_Ref=label_sim_matrix_Ref.astype(float)
#
#
#a=0
#b=8
#clusters_corr_all=[]
#clusternum_all=[]
#for clusternum in clusternum_list:
#    #plt.imshow(label_sim_matrix_Ref[label_sim_matrix_Ref.columns[a:b]][a:b].values);plt.show()
#    #plt.imshow(label_sim_matrix_Ref[label_sim_matrix_40Min.columns[a:b]][a:b].values);plt.show()
#    print(a)
#    print(b)
#    rep_cluster=label_sim_matrix_40Min[a:b,a:b].ravel()
#    ref_cluster=label_sim_matrix_Ref[a:b,a:b].ravel()
#    clusters_corr=np.corrcoef(rep_cluster,ref_cluster)[0][1]
#    clusters_corr_all.append(clusters_corr)
#    #import pdb; pdb.set_trace()
#    a=a+9
#    b=b+9
#    
#corrdata_perclusternum=pd.DataFrame(
#        {'clusternum':clusternum_list,
#                       'Ref-Rep-Correlation':clusters_corr_all})
#
#global_corrdata=np.corrcoef(label_sim_matrix_40Min.ravel(),label_sim_matrix_Ref.ravel())[0][1]
#
#
#
#
##%%
#
#
##np.save('all_individual_reproducibility',all_individual_reproducibility)    
##np.save('group_level_reproducibility',group_level_reproducibility)   
#            #import pdb; pdb.set_trace()
##            frames=[all_individual_cluster_stability, newdata]
##            all_individual_cluster_stability=pd.concat(frames) 
##
##            
##            cluster_ids = np.unique(group_labels)
##            
##            nClusters = cluster_ids.shape[0]
##            nVoxels = ism.shape[0]
##            os.chdir(ismdir + subdir)
##            k_mask=np.zeros((nVoxels, nVoxels))
##            ism_cluster_voxel_scores = np.zeros((nClusters, nVoxels))
##    
##            
##            ism_cluster_voxel_scores[:,:], k_mask[:,:] = utils.cluster_matrix_average(ism, group_labels)
##            ism_cluster_voxel_scores=ism_cluster_voxel_scores.astype("uint8")
##            
##            ind_cluster_stability=[]
##            ind_cluster_INSTABILITY=[]
##            ind_cluster_stability_Diff=[]
##            #import pdb; pdb.set_trace()
##        
##            for k in cluster_ids:
##                ind_cluster_stability=ism_cluster_voxel_scores[(k-1),group_labels==k].mean()
##                ind_cluster_INSTABILITY=ism_cluster_voxel_scores[(k-1),group_labels!=k].mean()
##                ind_cluster_stability_Diff=ind_cluster_stability-ind_cluster_INSTABILITY
##                #A, B = basc.ndarray_to_vol(gsm_cluster_voxel_scores[k-1,:], roi_mask_file, roi_mask_file, 'gsm_single_cluster%i_stability.nii.gz' % k)
##                # PUT THE ADDING OF VALUES TO THE ALL_GROUP_CLUSTER_STABILITY DATAFRAME
##                newdata=pd.DataFrame([[rerun, bootstrap, k, subject, ind_cluster_stability, ind_cluster_INSTABILITY, ind_cluster_stability_Diff]],columns=['rerun', 'bootstrap', 'k', 'subject', 'stability', 'instability', 'stability_Diff'])
##                #import pdb; pdb.set_trace()
##                frames=[all_individual_cluster_stability, newdata]
##                all_individual_cluster_stability=pd.concat(frames) 
#
#
#            
#           
#        
#        
#       
#        
#        
#
##%%
#def ism_nifti(roi_mask_file, n_clusters, out_dir): #NEED TO CHANGE THIS SCRIPT TO:
#    #APPLY GROUP LEVEL CLUSTER LABELS TO INDIVIDUAL LEVELS
#    #
#    #EXTRACT VOXELWISE STABILITY INFO FOR THAT CLUSTER ACROSS ALL PARTICIPANTS
#    #USE KMASK TO CREATE THAT CLUSTER INFORMATION
#    #
#    
#    #Loop over all ISMs, 
##        load ISM, 
##        loop over all clusters, 
##            perform calculation, 
##            add calculation to running tabs.
##    #Calculate mean at each voxel and CV- 
##    output a voxelwise mean stability and CV Nifti map for each cluster.
#    
#    
#    """
#    Calculate the individual level stability and instability maps for each of the group clusters.
#    Create Nifti files for each individual cluster's stability map
#    
#    
#    Parameters
#    ----------
#        roi_mask_file: the mask of the region to calculate stability for.
#        n_clusters: the number of clusters calculated
#        out_dir: the directory to output the saved nifti images
#    
#
#    Returns
#    -------
#    Creates NIFTI files for all the ism cluster stability maps
#    
#    """
#    import utils
#    import basc
#    import numpy as np
#    import os
#    from pathlib import Path
#    
#    #*ACTION - FIGURE OUT IF CAN BE ADDED TO BASC WORKFLOW, OR DIFFERENT WORKFLOW?
#    
#    #Individual subject ISM to NIFTI and individual
#    #Inputs Subject ISM, ROIFile, 
#
#
#    
#    
#    #for i in range(nSubjects):
#    ismdir=out_dir + '/workflow_output/basc_workflow_runner/basc/individual_stability_matrices/mapflow/'
#    os.chdir(ismdir)
#    subdirs_all = [x[1] for x in os.walk(ismdir)]                                                                            
#    subdirs=subdirs_all[0]
#    roi_mask_nparray = nb.load(roi_mask_file).get_data().astype('float32').astype('bool')
#
#    for subdir in subdirs:
#        os.chdir(ismdir + subdir)
#        
#        ind_cluster_stability_file = os.path.join(os.getcwd(), 'ind_cluster_stability.npy')
#        ind_cluster_INSTABILITY_file = os.path.join(os.getcwd(), 'ind_cluster_INSTABILITY.npy')
#        ind_cluster_stability_Diff_file = os.path.join(os.getcwd(), 'ind_cluster_stability_Diff.npy')
#        ism_cluster_voxel_scores_file = os.path.join(os.getcwd(), 'ism_cluster_voxel_scores.npy')
#        
#        end_file = Path(ism_cluster_voxel_scores_file)
#        
#        if end_file.exists():
#            
#            return
#        else:
#            
#            ism=np.load(ismdir + subdir + '/individual_stability_matrix.npy')
#            clusters_ism = utils.cluster_timeseries(ism, roi_mask_nparray, n_clusters, similarity_metric = 'correlation', affinity_threshold=0.0, cluster_method='ward')
#            clusters_ism = clusters_ism+1
#            niftifilename = ismdir + subdir +'/ism_clust.nii.gz'
#            clusters_ism_file = ismdir + subdir +'/clusters_ism.npy'
#            #Saving Individual Level Cluster Solution
#            ndarray_to_vol(clusters_ism, roi_mask_file, roi_mask_file, niftifilename)
#            np.save(clusters_ism_file, clusters_ism)
#            
#            
#            cluster_ids = np.unique(clusters_ism)
#            nClusters = cluster_ids.shape[0]
#            nVoxels = clusters_ism.shape[0]
#            ism_cluster_voxel_scores = np.zeros((nClusters, nVoxels))
#            k_mask=np.zeros((nVoxels, nVoxels))
#            ism_cluster_voxel_scores[:,:], k_mask[:,:] = utils.cluster_matrix_average(ism, clusters_ism)
#            ism_cluster_voxel_scores=ism_cluster_voxel_scores.astype("uint8")
#            
#            ind_cluster_stability=[]
#            ind_cluster_INSTABILITY=[]
#            ind_cluster_stability_Diff=[]
#            
#    #        ind_cluster_stability_file = os.path.join(os.getcwd(), 'ind_cluster_stability.npy')
#    #        ind_cluster_INSTABILITY_file = os.path.join(os.getcwd(), 'ind_cluster_INSTABILITY.npy')
#    #        ind_cluster_stability_Diff_file = os.path.join(os.getcwd(), 'ind_cluster_stability_Diff.npy')
#    #        ism_cluster_voxel_scores_file = os.path.join(os.getcwd(), 'ism_cluster_voxel_scores.npy')
#    #        
#            os.chdir(ismdir + '/' + subdir)
#    
#    
##%%
#
#
#
#grp_cluster_stability.append(gsm_cluster_voxel_scores[(k-1),clusters_gsm==k].mean())
#grp_cluster_INSTABILITY.append(gsm_cluster_voxel_scores[(k-1),clusters_gsm!=k].mean())    
##%%    
#    
##GROUP LEVEL CLUSTER STABILITY ASSESSMENT
#import utils
#import basc
#import numpy as np
#import os
#import pandas as pd
#    #*ACTION - FIGURE OUT IF CAN BE ADDED TO BASC WORKFLOW, OR DIFFERENT WORKFLOW?
##Individual subject ISM to NIFTI and individual
#
##Inputs Subject ISM, ROIFile, 
#
## EXTRACT ALL THE STABILITY INFO FOR EVERY CLUSTER, 
## AND EVERY CORTICOSTRIATAL NETWORK FOR THE GROUP, 
## AND FOR EVERY INDIVIDUAL
#roi_mask_file='/Users/aki.nikolaidis/git_repo/PyBASC/PyBASC/masks/Full_BG_Sim_3mm.nii.gz'
#clusterg_path='/clusters_G/clusters_G.npy'
#gsm_path='/group_stability_matrix/group_stability_matrix.npy'
#
#roi_mask_nparray = nb.load(roi_mask_file).get_data().astype('float32').astype('bool')
#data_dir='/Users/aki.nikolaidis/bootstraptest2/repdata'
#ref_dir='/Users/aki.nikolaidis/bootstraptest2/refdata'
#subjects= np.linspace(0,23,24)
#reruns=30
#bootstrap_list= ['0'] #['0','100','200','400','800','1600']
#rerun_list= np.linspace(1,reruns,reruns)
#
#all_group_cluster_stability=pd.DataFrame(columns=['bootstrap', 'rerun', 'stability', 'instability', 'stability_Diff'])
#
#
#for bootstrap in bootstrap_list:
#    for rerun in rerun_list:
#        current_path= data_dir + '/Run_'+np.str(np.int(rerun))+'_800_correlation_4_clusters_'+bootstrap+'_IndBS_1_blockcorrelation/workflow_output'
#        group_labels_path= current_path + clusterg_path
#        
#        gsm_full_path=current_path + gsm_path
#        #print(group_labels_path)
#        #clust_label_temp=np.load(workflowpath to clusters_g.npy)
#        #import pdb;pdb.set_trace()
#        import pdb;pdb.set_trace()
#        group_labels=np.load(group_labels_path)
#        gsm=np.load(gsm_full_path)
#        
#        cluster_ids = np.unique(group_labels)
#        nClusters = cluster_ids.shape[0]
#        nVoxels = gsm.shape[0]
#        gsm_cluster_voxel_scores = np.zeros((nClusters, nVoxels))
#        k_mask=np.zeros((nVoxels, nVoxels))
#        gsm_cluster_voxel_scores[:,:], k_mask[:,:] = utils.cluster_matrix_average(gsm, group_labels)
#        gsm_cluster_voxel_scores=gsm_cluster_voxel_scores.astype("uint8")
#        
#        import pdb;pdb.set_trace()
#        
#        grp_cluster_stability=[]
#        grp_cluster_INSTABILITY=[]
#        grp_cluster_stability_Diff=[]
#        
#        for k in cluster_ids:
#            grp_cluster_stability=gsm_cluster_voxel_scores[(k-1),group_labels==k].mean()
#            grp_cluster_INSTABILITY=gsm_cluster_voxel_scores[(k-1),group_labels!=k].mean()
#            grp_cluster_stability_Diff=grp_cluster_stability-grp_cluster_INSTABILITY
#            #A, B = basc.ndarray_to_vol(gsm_cluster_voxel_scores[k-1,:], roi_mask_file, roi_mask_file, 'gsm_single_cluster%i_stability.nii.gz' % k)
#            # PUT THE ADDING OF VALUES TO THE ALL_GROUP_CLUSTER_STABILITY DATAFRAME
#            newdata=pd.DataFrame([[network, clusternum, k, grp_cluster_stability, grp_cluster_INSTABILITY, grp_cluster_stability_Diff]],columns=['network', 'clusternum', 'k', 'stability', 'instability', 'stability_Diff'])
#            frames=[all_group_cluster_stability, newdata]
#            all_group_cluster_stability=pd.concat(frames)
#        
##        grp_cluster_stability=np.asarray(grp_cluster_stability)
##        grp_cluster_INSTABILITY=np.asarray(grp_cluster_INSTABILITY)
##        grp_cluster_stability_Diff=grp_cluster_stability-grp_cluster_INSTABILITY
#        
#        import pdb;pdb.set_trace()
#        
#        #%%
#
#        print(group_labels_path)
#        new_column_name= clusternum+ '_clusters_' + network
#        all_labels[new_column_name] = group_labels
#        
#
#    #for i in range(nSubjects):
#    gsmdir=out_dir + '/workflow_output/basc_workflow_runner/basc/join_group_stability/'
#    os.chdir(gsmdir)
#
#    gsm=np.load(gsmdir + '/group_stability_matrix.npy')
#    clusters_gsm =  np.load(group_labels_path)
#    #clusters_gsm = clusters_gsm+1
#    
#    #niftifilename = gsmdir  +'/gsm_clust.nii.gz'
#    #clusters_gsm_file = gsmdir +'/clusters_gsm.npy'
#    #Saving Individual Level Cluster Solution
##    ndarray_to_vol(clusters_gsm, roi_mask_file, roi_mask_file, niftifilename)
##    np.save(clusters_gsm_file, clusters_gsm)
#    
#    
#    
#    
#    grp_cluster_stability=[]
#    grp_cluster_INSTABILITY=[]
#    grp_cluster_stability_Diff=[]
#    
#    grp_cluster_stability_file = os.path.join(os.getcwd(), 'grp_cluster_stability.npy')
#    grp_cluster_INSTABILITY_file = os.path.join(os.getcwd(), 'grp_cluster_INSTABILITY.npy')
#    grp_cluster_stability_Diff_file = os.path.join(os.getcwd(), 'grp_cluster_stability_Diff.npy')
#    gsm_cluster_voxel_scores_file = os.path.join(os.getcwd(), 'gsm_cluster_voxel_scores.npy')
#    
#    for k in cluster_ids:
#        grp_cluster_stability.append(gsm_cluster_voxel_scores[(k-1),clusters_gsm==k].mean())
#        grp_cluster_INSTABILITY.append(gsm_cluster_voxel_scores[(k-1),clusters_gsm!=k].mean())
#        A, B = basc.ndarray_to_vol(gsm_cluster_voxel_scores[k-1,:], roi_mask_file, roi_mask_file, 'gsm_single_cluster%i_stability.nii.gz' % k)
#    grp_cluster_stability=np.asarray(grp_cluster_stability)
#    grp_cluster_INSTABILITY=np.asarray(grp_cluster_INSTABILITY)
#    grp_cluster_stability_Diff=grp_cluster_stability-grp_cluster_INSTABILITY
#    
#    np.save(grp_cluster_stability_file, grp_cluster_stability)
#    np.save(grp_cluster_INSTABILITY_file, grp_cluster_INSTABILITY)
#    np.save(grp_cluster_stability_Diff_file, grp_cluster_stability_Diff)
#    np.save(gsm_cluster_voxel_scores_file, gsm_cluster_voxel_scores)
#
##%%
#def set_style():
#    # This sets reasonable defaults for font size for
#    # a figure that will go in a paper
#    sns.set_context("paper")
#    
#    # Set the font to be serif, rather than sans
#    sns.set(font='serif')
#    
#    # Make the background white, and specify the
#    # specific font family
#    sns.set_style("white", {
#        "font.family": "serif",
#        "font.serif": ["Times", "Palatino", "serif"]
#    })        
#
#def set_size(fig):
#    fig.set_size_inches(8, 8)
#    plt.tight_layout()
#
#plt.subplots(figsize=(13,13))    
#set_style()
#map=sns.heatmap(label_sim_matrix_Ref,cbar=False, yticklabels=9, xticklabels=9)
#set_size(map)
##%%
#import plotly.plotly as py
#import plotly.graph_objs as go
#import plotly.figure_factory as ff
#
#import numpy as np
#from scipy.spatial.distance import pdist, squareform
#
#
## get data
#data = label_sim_matrix_Ref# label_sim_matrix_40Min ##
##np.genfromtxt("http://files.figshare.com/2133304/ExpRawData_E_TABM_84_A_AFFY_44.tab",
#        #             names=True,usecols=tuple(range(1,30)),dtype=float, delimiter="\t")
#data_array = data#data.view((np.float, len(data.dtype.names)))
#data_array = data_array.transpose()
#labels = diag_names.iloc[:,0]#data.dtype.names
#labels=np.asarray(labels)
#
## Initialize figure by creating upper dendrogram
#figure = ff.create_dendrogram(data_array, orientation='bottom', labels=labels)
#for i in range(len(figure['data'])):
#    figure['data'][i]['yaxis'] = 'y2'
#
## Create Side Dendrogram
#dendro_side = ff.create_dendrogram(data_array, orientation='right')
#for i in range(len(dendro_side['data'])):
#    dendro_side['data'][i]['xaxis'] = 'x2'
#
## Add Side Dendrogram Data to Figure
#figure['data'].extend(dendro_side['data'])
#
## Create Heatmap
#dendro_leaves = dendro_side['layout']['yaxis']['ticktext']
#dendro_leaves = list(map(int, dendro_leaves))
#data_dist = pdist(data_array)
#heat_data = squareform(data_dist)
#heat_data = heat_data[dendro_leaves,:]
#heat_data = heat_data[:,dendro_leaves]
#
#heatmap = [
#    go.Heatmap(
#        x = dendro_leaves,
#        y = dendro_leaves,
#        z = heat_data,
#        colorscale = 'YIGnBu'
#    )
#]
#
#heatmap[0]['x'] = figure['layout']['xaxis']['tickvals']
#heatmap[0]['y'] = dendro_side['layout']['yaxis']['tickvals']
#
## Add Heatmap Data to Figure
#figure['data'].extend(heatmap)
#
## Edit Layout
#figure['layout'].update({'width':1600, 'height':1600,
#                         'showlegend':False, 'hovermode': 'closest',
#                         })
## Edit xaxis
#figure['layout']['xaxis'].update({'domain': [.15, 1],
#                                  'mirror': False,
#                                  'showgrid': False,
#                                  'showline': False,
#                                  'zeroline': False,
#                                  'ticks':""})
## Edit xaxis2
#figure['layout'].update({'xaxis2': {'domain': [0, .15],
#                                   'mirror': False,
#                                   'showgrid': False,
#                                   'showline': False,
#                                   'zeroline': False,
#                                   'showticklabels': False,
#                                   'ticks':""}})
#
## Edit yaxis
#figure['layout']['yaxis'].update({'domain': [0, .85],
#                                  'mirror': False,
#                                  'showgrid': False,
#                                  'showline': False,
#                                  'zeroline': False,
#                                  'showticklabels': False,
#                                  'ticks': ""})
## Edit yaxis2
#figure['layout'].update({'yaxis2':{'domain':[.825, .975],
#                                   'mirror': False,
#                                   'showgrid': False,
#                                   'showline': False,
#                                   'zeroline': False,
#                                   'showticklabels': False,
#                                   'ticks':""}})
#
## Plot!
#py.plot(figure, filename='dendrogram_with_heatmap')
#
#dendro_side['layout']['xaxis']
