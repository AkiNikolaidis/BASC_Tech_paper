#CCN Bootstrap Testing
library(readr)
library(ggplot2)


#GROUP LEVEL
group_level_reproducibility <- read_csv("~/Dropbox/1_Projects/1_Research/BASC_Tech/Data/ALLDATA_group_level_reproducibility_.csv")


#/Users/aki.nikolaidis/git_repo/PyBASC/Updated_IBS_GBS_Jovo4_20_2018.csv')
#tiff('refrep_group_labelAcc.tiff', units="in", width=5, height=5, res=300)

Data<-group_level_reproducibility
datavar=Data$group_label_acc
Data$bootstrap<- as.factor(Data$bootstrap)
Data$scantime <- as.factor(Data$scantime)
Data$scantime <- factor(Data$scantime,levels(Data$scantime)[c(3,4,6,2,5,1,8,7)])



ggplot(Data, aes(x=bootstrap, y=datavar, fill=scantime)) + 
  #scale_x_reverse() +
  geom_violin() +#,notch = TRUE,fill = "white", colour = "#3366FF", outlier.colour = "red", outlier.shape = 1, size=1, show.legend = FALSE) +
  scale_y_continuous(limits = c(0,1))+
  geom_jitter(aes(y=datavar,group=Data$scantime, colour=Data$scantime, alpha = 0.5), width=.2, show.legend = FALSE) +
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Group TRT- ARI - 50Min Ref Data", 
       x="Bootstrap Aggregates",
       y="Adjusted Rand Index")
  

#dev.off()



## INDIVIDUAL LEVEL 
Data_ind<- read_csv("~/Dropbox/1_Projects/1_Research/BASC_Tech/Data/ALLDATA_individual_reproducibility_.csv")
#/Users/aki.nikolaidis/git_repo/PyBASC/Updated_IBS_GBS_Jovo4_20_2018.csv')
#Data_ind<-ind_level_reproducibility
datavar_ind<-Data_ind$ism_repref_corr
Data_ind$bootstrap<- as.factor(Data_ind$bootstrap)
Data_ind$scantime <- as.factor(Data_ind$scantime)
Data_ind$scantime <- factor(Data_ind$scantime,levels(Data_ind$scantime)[c(3,4,6,2,5,1,8,7)])

ggplot(Data_ind, aes(x=bootstrap, y=datavar_ind, fill=scantime)) + 
  #scale_x_reverse() +
  geom_jitter(aes(y=datavar_ind,group=Data_ind$scantime, colour=Data_ind$scantime, alpha = 0.1, stroke=1), width=.2, show.legend = FALSE) +
  geom_violin() +#,notch = TRUE,fill = "white", colour = "#3366FF", outlier.colour = "red", outlier.shape = 1, size=1, show.legend = FALSE) +
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Individual Level Correlation", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation")

ggplot(Data_ind, aes(x=bootstrap, y=datavar_ind, fill=scantime)) + 
  #scale_x_reverse() +
  geom_point(aes(y=datavar_ind,group=Data_ind$scantime, colour=Data_ind$scantime, alpha = 0.1, stroke=1), show.legend = FALSE) +
  geom_line(aes(y=datavar_ind,group=Data_ind$scantime, colour=Data_ind$scantime), show.legend = FALSE) +
  geom_violin() +#,notch = TRUE,fill = "white", colour = "#3366FF", outlier.colour = "red", outlier.shape = 1, size=1, show.legend = FALSE) +
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Individual Level Correlation", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation")



#dev.off()





#tiff('refrep_group_labelAcc.tiff', units="in", width=5, height=5, res=300)
datavar=Data_ind$gsm_repref_corr
Data_ind$bootstrap<- as.factor(Data_ind$bootstrap)

ggplot(Data_ind, aes(x=bootstrap)) + 
  #scale_x_reverse() +
  geom_boxplot(aes(y=datavar, alpha = 1),notch = TRUE,fill = "white", colour = "#3366FF", outlier.colour = "red", outlier.shape = 1, size=1, show.legend = FALSE) +
  scale_y_continuous(limits = c(0,1))+
  geom_jitter(aes(y=datavar, alpha=0.9), show.legend = FALSE) +
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Ind Adjacency Matrix Reproducibility", 
       x="Bootstrap Aggregates",
       y="Correlation")