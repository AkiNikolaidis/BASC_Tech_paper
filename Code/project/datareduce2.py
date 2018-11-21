import os
import numpy as np
import nibabel as nb
import scipy.stats


subject_file_list = [
		'/home/ec2-user/repdata/0025427_gsr-1_scrub-0.nii.gz',
		'/home/ec2-user/repdata/0025428_gsr-1_scrub-0.nii.gz',
		'/home/ec2-user/repdata/0025429_gsr-1_scrub-0.nii.gz',
		'/home/ec2-user/repdata/0025430_gsr-1_scrub-0.nii.gz',
		'/home/ec2-user/repdata/0025431_gsr-1_scrub-0.nii.gz',
		'/home/ec2-user/repdata/0025432_gsr-1_scrub-0.nii.gz',
		'/home/ec2-user/repdata/0025433_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025434_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025435_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025436_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025437_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025438_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025439_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025440_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025441_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025442_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025443_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025444_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025445_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025446_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025447_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025448_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025449_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025450_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025451_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025452_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025453_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025454_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025455_gsr-1_scrub-0.nii.gz',
        '/home/ec2-user/repdata/0025456_gsr-1_scrub-0.nii.gz']

for sub in subject_file_list:
    nii=nb.load(sub)
    data=nii.get_data()
    print('working on subject', sub)
    
    tenmin=data[:,:,:,0:300]
    twentymin=data[:,:,:,0:600]

    datadir=os.path.split(sub)[0]    
    subfile=os.path.split(sub)[1]

    print("converting data")
    tenmin_img = nb.Nifti1Image(
        tenmin,
        header=nii.get_header(),
        affine=nii.get_affine()
    )
    filename=datadir+'/tenmindata/'+subfile
    img_file = os.path.join(os.getcwd(), filename)
    tenmin_img.to_filename(img_file)


    twentymin_img = nb.Nifti1Image(
        twentymin,
        header=nii.get_header(),
        affine=nii.get_affine()
    )
    filename=datadir+'/twentymindata/'+subfile
    img_file = os.path.join(os.getcwd(), filename)
    twentymin_img.to_filename(img_file)



    print("subject ", sub, " done")
