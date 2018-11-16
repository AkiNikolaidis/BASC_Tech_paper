library(readr)
library(ICC)
library(ggplot2)
library(RcppCNPy)
library(psych)
library(mgc)


#Running Discriminability
Write a Python Script that 
  1- Loads all subjects individualized cluster labels for Reference and for Replication.
  2- Calculates the adjusted rand index for each pair. (60x60)
  3- populates and outputs a csv file with all the values
  4- outputs a subject labels file as a csv
Write an R script that
  1- Loads the csv file and the subject labels files
  2- library(mgc)
  3- discr.stat(dat, labs) 

library(readr,mgc,ggplot2)

  #PSEUDOCODE- 
  # 1- LOOP OVER HALFMIN DISCRIMINABILITY CSV FILES, 
  # 2- LOAD FILES
  # 3- EXTRACT BOOTSTRAP NUMBER AND RERUN
  # 4- COMPILE DISCRIMINABILITY STATISTIC, RERUN, BOOTSTRAP, AND SCANTIME INTO DATAFRAME ROW
  # 5- COMPLETE FOR ALL HALFMIN DATA
  # 6- RINSE & REPEAT FOR ONEMIN THROUGH TWENTYFIVE MIN
  
dataFiles<- lapply(Sys.glob("~/Dropbox/1_Projects/1_Research/BASC_Tech/Data/testing/Discriminability*.csv"), read.csv, header=FALSE)
file_names<-Sys.glob("~/Dropbox/1_Projects/1_Research/BASC_Tech/Data/testing/Discriminability*.csv")
rerun<- regmatches(file_names, regexpr("*_[0-9]*_rerun*", file_names))
rerun_num<-regmatches(rerun, regexpr("_*[0-9]*_", rerun))
bootstrap<- regmatches(file_names, regexpr("*_[0-9]*_bootstraps", file_names))
bootstrap_num<- regmatches(bootstrap, regexpr("_*[0-9]*_", bootstrap))

discrimtest<-dataFiles[1]
discrimtestmat<-matrix(unlist(discrimtest), nrow=60, byrow=TRUE)
heatmap(discrimtestmat)
discrim_labels<-c(5, 6,	0,	8,	12,	16,	13,	3,	10,	25,	29,	20,	14,	11,	17,	19,	1,	4,	18,	15,	9,	28,	2,	26,	21,	22,	24,	23,	27,	7,	5,	6,	0,	8,	12,	16,	13,	3,	10,	25,	29,	20,	14,	11,	17,	19,	1,4,	18,	15,	9,	28,	2,	26,	21,	22,	24,	23,	27,	7)
discr.stat(discrimtestmat,discrim_labels)




dat<-as.integer(read_csv('/Users/aki.nikolaidis/Downloads/foo.csv'))
labs<-as.integer(read_csv('/Users/aki.nikolaidis/Downloads/foo.csv'))
discr.stat(dat, labs) 
Dx <- as.matrix(dist(dat[sort(labs, index=TRUE)$ix,]), method='euclidian')
plot_mtx(Dx)


plot_mtx <- function(Dx, main.title="Distance Matrix", xlab.title="Sample Sorted by Source", ylab.title="Sample Sorted by Source") {
  data <- melt(Dx)
  ggplot(data, aes(x=Var1, y=Var2, fill=value)) +
    geom_tile() +
    scale_fill_gradientn(name="dist(x, y)",
                         colours=c("#f2f0f7", "#cbc9e2", "#9e9ac8", "#6a51a3"),
                         limits=c(min(Dx), max(Dx))) +
    xlab(xlab.title) +
    ylab(ylab.title) +
    theme_bw() +
    ggtitle(main.title)
}


#%# 3

Data<- as.integer(read_csv('/Users/aki.nikolaidis/Downloads/foo.csv'))
df <- data.frame(matrix(unlist(Data), nrow=4331, byrow=T))
npmat<- npyLoad('/Users/aki.nikolaidis/PyBASC_outputs/threemintest/Run_1_800_correlation_ward_clusters-2_IndBS-2_block-1/workflow_output/basc_workflow_runner/basc/individual_group_clustered_maps/mapflow/_individual_group_clustered_maps0/ind_group_cluster_labels.npy')

npmat2<-npyLoad('/Users/aki.nikolaidis/PyBASC_outputs/threemintest/Run_1_800_correlation_ward_clusters-2_IndBS-2_block-1/workflow_output/ind_group_cluster_stability/_individual_group_clustered_maps0/ind_group_cluster_stability.npy')

npmat3<-npyLoad('/Users/aki.nikolaidis/PyBASC_outputs/threemintest/Run_1_800_correlation_ward_clusters-2_IndBS-2_block-1/workflow_output/ind_group_cluster_labels/_individual_group_clustered_maps0/ind_group_cluster_labels.npy', 
                "integer")

temp<-as.integer(npmat2)

data(ChickWeight)
ICCest(Chick, weight, data = ChickWeight, CI.type = "S")
ICCbare(Chick,weight, data=ChickWeight)

## SAMPLE DISCRIMINABILITY CODE
library(mgc)
library(reshape2)
library(ggplot2)

plot_mtx <- function(Dx, main.title="Distance Matrix", xlab.title="Sample Sorted by Source", ylab.title="Sample Sorted by Source") {
  data <- melt(Dx)
  ggplot(data, aes(x=Var1, y=Var2, fill=value)) +
    geom_tile() +
    scale_fill_gradientn(name="dist(x, y)",
                         colours=c("#f2f0f7", "#cbc9e2", "#9e9ac8", "#6a51a3"),
                         limits=c(min(Dx), max(Dx))) +
    xlab(xlab.title) +
    ylab(ylab.title) +
    theme_bw() +
    ggtitle(main.title)
}


nsrc <- 5
nobs <- 10
d <- 20
set.seed(12345)
src_id <- array(1:nsrc)
labs <- sample(rep(src_id, nobs))
dat <- t(sapply(labs, function(lab) rnorm(d, mean=lab, sd=1)))
discr.stat(dat, labs)  # expect high discriminability since measurements taken at a source have the same mean and sd of only 1



Dx <- as.matrix(dist(dat[sort(labs, index=TRUE)$ix,]), method='euclidian')
plot_mtx(Dx)

discr.stat(Dx, sort(labs))

Dx <- as.matrix(dist(iris[sort(as.vector(iris$Species), index=TRUE)$ix,c(1,2,3,4)]))
plot_mtx(Dx)


discr.stat(iris[,c(1,2,3,4)], as.vector(iris$Species))


