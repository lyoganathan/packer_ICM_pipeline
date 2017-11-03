ICM_PIPELINE (AMI)
=========================
Ubuntu 16.04 virtual machine loaded with neuroimaging software, available as a public amazon machine image that works with cfncluster
--------------------------------------------------------------------------------
There are 2 branches, one is using packer to build an AMI for AWS and the other is building a VirtualBox VM

#### AMI ID: ami-b764c4cd ####
#### Username: ubuntu ####
#### Region: US East North Virginia (us-east-1) ####

Current Software:
- [Freesurfer 6.0](https://surfer.nmr.mgh.harvard.edu/)
- [FSL 5.0](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki)
- [ITK Snap](http://www.itksnap.org/pmwiki/pmwiki.php)
- [mricron](http://people.cas.sc.edu/rorden/mricron/index.html)
- [aws cli](https://aws.amazon.com/cli/)
- [cfncluster](http://cfncluster.readthedocs.io/en/latest/) compatible

##### Getting the VM working on your AWS account: #####
- Go to Launch EC2 instance
- Search for the ami id: ami-b764c4cd
- Launch and get ssh keys. Login in using putty or mobaxterm with ssh key and username as ubuntu

Sample script to download subjects from S3 and then run recon-all on them

```
#!/bin/bash
#$ -S /bin/bash

for path in $(aws s3 ls s3://killa7/subjects/); do
  if [[ $path == exam* ]]; then
    loc[i]=$path
    ((i++))
  fi
done

SUBJECTS_DIR='/home/ubuntu/Documents/subjects'
mkdir ~/Documents
mkdir ~/Documents/subjects/
mkdir ~/Documents/subjects/nii${loc[$(($SGE_TASK_ID-1))]}
aws s3 sync s3://killa7/subjects/${loc[$(($SGE_TASK_ID-1))]} ~/Documents/subjects/nii${loc[$(($SGE_TASK_ID-1))]}
recon-all -i $SUBJECTS_DIR/nii${loc[$(($SGE_TASK_ID-1))]}/T1W.nii -subjid ${loc[$(($SGE_TASK_ID-1))]}
mv $SUBJECTS_DIR/nii${loc[$(($SGE_TASK_ID-1))]} $SUBJECTS_DIR/${loc[$(($SGE_TASK_ID-1))]}

recon-all -all -subjid ${loc[$(($SGE_TASK_ID-1))]}

aws s3 sync ~/Documents/subjects/ s3://killa7/subjects/
rm -rf ~/Documents/subjects/${loc[$(($SGE_TASK_ID-1))]}

```
Submitting this job with qsub:

```
qsub -V -t 1:25 example.sh
```
