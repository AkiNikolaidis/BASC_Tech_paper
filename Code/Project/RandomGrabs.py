import numpy as np
import nibabel as nb
import scipy as sp
import nilearn as ni
import sklearn as sk


outputlength=15 # How big the final output dataset will be 
randomdatagrab=15 # How big the random grabs are 


#outputlength=450 #fifteenmins
#outputlength=600 #twentymins
#outputlength=750 #twentyfivemins

outputdir='/home/ec2-user/randomgrabs'
#
#subject_file_list = ['/Users/aki.nikolaidis/git_repo/PyBASC/PyBASC/data/sub_0corr_0.05_noise_2_TRs_100.nii.gz',
#                     '/Users/aki.nikolaidis/git_repo/PyBASC/PyBASC/data/sub_1corr_0.05_noise_2_TRs_100.nii.gz',
#                     '/Users/aki.nikolaidis/git_repo/PyBASC/PyBASC/data/sub_2corr_0.05_noise_2_TRs_100.nii.gz',
#                     '/Users/aki.nikolaidis/git_repo/PyBASC/PyBASC/data/sub_3corr_0.05_noise_2_TRs_100.nii.gz']

subject_file_list =   ['/home/ec2-user/repdata/0025427.nii.gz',
                       '/home/ec2-user/repdata/0025428.nii.gz',
                       '/home/ec2-user/repdata/0025429.nii.gz',
                       '/home/ec2-user/repdata/0025430.nii.gz',
                       '/home/ec2-user/repdata/0025431.nii.gz',
                       '/home/ec2-user/repdata/0025432.nii.gz',
                       '/home/ec2-user/repdata/0025433.nii.gz',
                       '/home/ec2-user/repdata/0025434.nii.gz',
                       '/home/ec2-user/repdata/0025435.nii.gz',
                       '/home/ec2-user/repdata/0025436.nii.gz',
                       '/home/ec2-user/repdata/0025437.nii.gz',
                       '/home/ec2-user/repdata/0025438.nii.gz',
                       '/home/ec2-user/repdata/0025439.nii.gz',
                       '/home/ec2-user/repdata/0025440.nii.gz',
                       '/home/ec2-user/repdata/0025441.nii.gz',
                       '/home/ec2-user/repdata/0025442.nii.gz',
                       '/home/ec2-user/repdata/0025443.nii.gz',
                       '/home/ec2-user/repdata/0025444.nii.gz',
                       '/home/ec2-user/repdata/0025445.nii.gz',
                       '/home/ec2-user/repdata/0025446.nii.gz',
                       '/home/ec2-user/repdata/0025447.nii.gz',
                       '/home/ec2-user/repdata/0025448.nii.gz',
                       '/home/ec2-user/repdata/0025449.nii.gz',
                       '/home/ec2-user/repdata/0025450.nii.gz',
                       '/home/ec2-user/repdata/0025451.nii.gz',
                       '/home/ec2-user/repdata/0025452.nii.gz',
                       '/home/ec2-user/repdata/0025453.nii.gz',
                       '/home/ec2-user/repdata/0025454.nii.gz',
                       '/home/ec2-user/repdata/0025455.nii.gz',
                       '/home/ec2-user/repdata/0025456.nii.gz']

i=27

for subject in subject_file_list:
    print(subject)
    subrandidx=[]
    fullsub=nb.load(subject).get_data()
    nii = nb.load(subject)
    length=fullsub.shape[3]
    loops=outputlength//randomdatagrab
    newsubdata=np.zeros((fullsub.shape[0],fullsub.shape[1],fullsub.shape[2],1))
    for x in range(loops):
        temp_rand=np.random.randint(1,(length-randomdatagrab))
        subrandidx.append(temp_rand)

    
    for x in range(len(subrandidx)):
        random_grab=fullsub[:,:,:,subrandidx[x]:(subrandidx[x]+randomdatagrab)]
        newsubdata=np.concatenate((newsubdata,random_grab),axis=3)

    newsubdata=newsubdata[:,:,:,1:]
    
    img = nb.Nifti1Image(
        newsubdata,
        header=nii.get_header(),
        affine=nii.get_affine()
    )
    
    filename=outputdir + '/sub_' + str(i) + '.nii.gz' 
    
    #img_file = os.path.join(os.getcwd(), filename)
    img.to_filename(filename)
    i=i+1

