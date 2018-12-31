
#SIMILARITY ANALYSES

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

bootstrap_list=['1', '10','100','200','400','800']
scantimelist=['halfmintest','onemintest','threemintest','fivemintest','tenmintest','fifteenmintest','twentymintest','twentyfivemintest']

#scantimelist=['fifteenmintest']
#bootstrap_list=['10','100','200','400','800']


homedir= '/home/ec2-user/alldata' # '/Users/aki.nikolaidis/PyBASC_outputs'


GSMdir='/workflow_output/basc_workflow_runner/basc/join_group_stability/group_stability_matrix.npy'
labelsdir='/workflow_output/clusters_G/clusters_G.npy'

group_level_reproducibility=pd.DataFrame(columns=['scantime', 'rerun','bootstrap', 'group_label_acc', 'gsm_repref_corr', 'mean_rep_ism_gsm_corr', 'stdev_rep_ism_gsm_corr'])
all_individual_reproducibility=pd.DataFrame(columns=['scantime', 'rerun','bootstrap', 'subject', 'ism_repref_corr', 'sub_rep_ism_gsm_corr', 'sub_ref_ism_gsm_corr'])


# GROUP LEVEL ANALYSIS
for scantime in scantimelist:
    for rerun in rerun_list:
        for bootstrap in bootstrap_list:
            if bootstrap =='1':
                repdir=homedir + '/randomgrabs_0BS/' + scantime + str(int(rerun)) + '/Run_1_1600_correlation_ward_clusters-4_IndBS-1_block-1'
            else:
                repdir=homedir + '/' + scantime+ '/Run_'+str(int(rerun))+'_1600_correlation_ward_clusters-4_IndBS-' + bootstrap + '_block-1'
                

            print(str(scantime) + 'scantime')
            print(str(bootstrap) + 'bootstrap')
            print(str(rerun) + 'rerun')
            refdir=homedir + '/reftest/reftest/Run_1_1600_correlation_ward_clusters-4_IndBS-' + bootstrap + '_block-1'
            
            ref_gsm_dir = refdir + '/workflow_output/group_stability_matrix/group_stability_matrix.npz'
            rep_gsm_dir = repdir + '/workflow_output/group_stability_matrix/group_stability_matrix.npz'
            
            ref_grp_labels_dir = refdir + '/workflow_output/clusters_G/clusters_G.npy'
            rep_grp_labels_dir = repdir + '/workflow_output/clusters_G/clusters_G.npy'
            
            group_label_acc = adjusted_rand_score(np.load(ref_grp_labels_dir), np.load(rep_grp_labels_dir))
            gsm_repref_corr = 1- scipy.spatial.distance.correlation(scipy.sparse.load_npz(ref_gsm_dir).toarray().ravel(),scipy.sparse.load_npz(rep_gsm_dir).toarray().ravel())
            
            rep_ism_gsm_corr=np.load(repdir + '/workflow_output/basc_workflow_runner/basc/join_group_stability/ism_gsm_corr.npy')
            mean_rep_ism_gsm_corr=rep_ism_gsm_corr.ravel().mean()
            stdev_rep_ism_gsm_corr=rep_ism_gsm_corr.ravel().std()
            
            newgroupdata=pd.DataFrame([[scantime, rerun, bootstrap, group_label_acc, gsm_repref_corr, mean_rep_ism_gsm_corr, stdev_rep_ism_gsm_corr]], columns=['scantime', 'rerun','bootstrap', 'group_label_acc', 'gsm_repref_corr', 'mean_rep_ism_gsm_corr', 'stdev_rep_ism_gsm_corr'])
            groupframes=[group_level_reproducibility,newgroupdata]
            group_level_reproducibility=pd.concat(groupframes)
            group_level_reproducibility.to_csv('/home/ec2-user/similarity/group_level_reproducibility.csv')
            
            
            
            #BEGGINING SUMMARY LEVEL INDIVIDUAL  ANALYSIS
            ref_ind_grp_labels_dir = refdir + '/workflow_output/ind_group_cluster_labels/'
            rep_ind_grp_labels_dir = repdir + '/workflow_output/ind_group_cluster_labels/'
            
            ref_ism_dir= refdir + '/workflow_output/basc_workflow_runner/basc/individual_stability_matrices/mapflow/'
            rep_ism_dir= repdir + '/workflow_output/basc_workflow_runner/basc/individual_stability_matrices/mapflow/'
            
        
            os.chdir(ref_ind_grp_labels_dir)
            subdirs_all = [x[1] for x in os.walk(ref_ind_grp_labels_dir)]                                                                            
            subdirs = subdirs_all[0]
            
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
                rep_ind_label = pd.DataFrame(np.load(rep_ind_grp_labels_dir + '_individual_group_clustered_maps'+ str(subject)+ '/ind_group_cluster_labels.npy'))
                ref_ind_label = pd.DataFrame(np.load(ref_ind_grp_labels_dir + '_individual_group_clustered_maps'+ str(subject)+ '/ind_group_cluster_labels.npy'))
                
                #calculate label Adjusted Rand Score
                ref_rep_label_ind_ARI=adjusted_rand_score(np.asarray(rep_ind_label).ravel(), np.asarray(ref_ind_label).ravel())
        
                #ISM
                temp_rep_ism = scipy.sparse.load_npz(rep_ism_dir+'_individual_stability_matrices' + str(subject) + '/individual_stability_matrix.npz').toarray()
                temp_ref_ism = scipy.sparse.load_npz(ref_ism_dir+'_individual_stability_matrices' + str(subject) + '/individual_stability_matrix.npz').toarray()
                rep_ism = pd.DataFrame(np.array(temp_rep_ism[np.triu_indices(4332, k = 1)]))
                ref_ism = pd.DataFrame(np.array(temp_ref_ism[np.triu_indices(4332, k = 1)]))
                
                #calculate ISM Spatial Correlation
                
                ism_repref_corr=1- scipy.spatial.distance.correlation(rep_ism.T,ref_ism.T)
                
                newdata=pd.DataFrame([[scantime, rerun, bootstrap, subject, ism_repref_corr, ref_rep_label_ind_ARI]],columns=['scantime','rerun', 'bootstrap', 'subject', 'ism_repref_corr', 'ref_rep_indgrp_label_ARI'])
                frames=[all_individual_reproducibility, newdata]
                all_individual_reproducibility=pd.concat(frames)
                
    
                all_individual_reproducibility.to_csv('/home/ec2-user/similarity/all_individual_reproducibility.csv')
                
                
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
            filename1='/home/ec2-user/similarity/Discriminability_SpatialCorr_'+str(scantime)+str(int(bootstrap))+'bootstraps'+str(int(rerun))+'rerun.csv'
            np.savetxt(filename1, spatialcorr, delimiter=",")


