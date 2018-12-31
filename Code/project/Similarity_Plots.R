#OHBM Bootstrap Testing
library(readr)
library(ggplot2)


#GROUP LEVEL SPATIAL CORRELATION
group_level_reproducibility <- read_csv("/Users/aki.nikolaidis/git_repo/BASC_Tech_paper/Data/similarity/group_level_reproducibility.csv")


Data<-group_level_reproducibility
datavar=Data$gsm_repref_corr
Data$bootstrap<- as.factor(Data$bootstrap)
Data$scantime <- as.factor(Data$scantime)
Data$scantime <- factor(Data$scantime,levels(Data$scantime)[c(3,4,6,2,5,1,8,7)])

levels(Data$bootstrap)[levels(Data$bootstrap)=="1"] <- "0"


levels(Data$scantime)[levels(Data$scantime)=="halfmintest"] <- "Half Minute"
levels(Data$scantime)[levels(Data$scantime)=="onemintest"] <- "One Minute"
levels(Data$scantime)[levels(Data$scantime)=="threemintest"] <- "Three Minutes"
levels(Data$scantime)[levels(Data$scantime)=="fivemintest"] <- "Five Minutes"
levels(Data$scantime)[levels(Data$scantime)=="tenmintest"] <- "Ten Minutes"
levels(Data$scantime)[levels(Data$scantime)=="fifteenmintest"] <- "Fifteen Minutes"
levels(Data$scantime)[levels(Data$scantime)=="twentymintest"] <- "Twenty Minutes"
levels(Data$scantime)[levels(Data$scantime)=="twentyfivemintest"] <- "Twenty Five Minutes"
names(Data)[names(Data)=="scantime"]  <- "Time"

pdf("Group_Spatial_Correlation_Reliability.pdf") 
ggplot(Data, aes(x=factor(bootstrap), fill=factor(Time), y=datavar)) + 
  #CONTENTS
  scale_y_continuous(limits = c(0,1)) +
  stat_summary(fun.data=mean_sdl, width=0.5, fun.args = list(mult=1), 
               geom="errorbar", position=position_dodge(width=1), color="grey70") +
  stat_summary(fun.y=mean, geom="point", position=position_dodge(width=1), size=2.7, alpha = 0.8, aes(color=Time)) +
  geom_point(aes(group=factor(Time), colour = factor(Time), x=bootstrap, y=datavar), 
             position= position_dodge(width=1), alpha= 0.4, size=1.2) +
  #LAYOUT
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20),
        legend.title = element_text(size=16, face="bold"))+
  labs(title="Group Test-Retest Reliability", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation") +
  scale_color_discrete(name="Scan Time")+
  scale_fill_discrete(name="", guide='none')
dev.off()


#GROUP LEVEL ADJUSTED RAND INDEX
group_level_reproducibility <- read_csv("/Users/aki.nikolaidis/git_repo/BASC_Tech_paper/Data/similarity/group_level_reproducibility.csv")


Data<-group_level_reproducibility
datavar=Data$group_label_acc
Data$bootstrap<- as.factor(Data$bootstrap)
Data$scantime <- as.factor(Data$scantime)
Data$scantime <- factor(Data$scantime,levels(Data$scantime)[c(3,4,6,2,5,1,8,7)])

levels(Data$bootstrap)[levels(Data$bootstrap)=="1"] <- "0"


levels(Data$scantime)[levels(Data$scantime)=="halfmintest"] <- "Half Minute"
levels(Data$scantime)[levels(Data$scantime)=="onemintest"] <- "One Minute"
levels(Data$scantime)[levels(Data$scantime)=="threemintest"] <- "Three Minutes"
levels(Data$scantime)[levels(Data$scantime)=="fivemintest"] <- "Five Minutes"
levels(Data$scantime)[levels(Data$scantime)=="tenmintest"] <- "Ten Minutes"
levels(Data$scantime)[levels(Data$scantime)=="fifteenmintest"] <- "Fifteen Minutes"
levels(Data$scantime)[levels(Data$scantime)=="twentymintest"] <- "Twenty Minutes"
levels(Data$scantime)[levels(Data$scantime)=="twentyfivemintest"] <- "Twenty Five Minutes"
names(Data)[names(Data)=="scantime"]  <- "Time"

pdf("Group_Adjusted_Rand_Index_Reliability.pdf") 
ggplot(Data, aes(x=factor(bootstrap), fill=factor(Time), y=datavar)) + 
  #CONTENTS
  scale_y_continuous(limits = c(0,1)) +
  stat_summary(fun.data=mean_sdl, width=0.5, fun.args = list(mult=1), 
               geom="errorbar", position=position_dodge(width=1), color="grey70") +
  stat_summary(fun.y=mean, geom="point", position=position_dodge(width=1), size=2.7, alpha = 0.8, aes(color=Time)) +
  geom_point(aes(group=factor(Time), colour = factor(Time), x=bootstrap, y=datavar), 
             position= position_dodge(width=1), alpha= 0.4, size=1.2) +
  #LAYOUT
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20),
        legend.title = element_text(size=16, face="bold"))+
  labs(title="Group Test-Retest Reliability", 
       x="Bootstrap Aggregates",
       y="Adjusted Rand Index") +
  scale_color_discrete(name="Scan Time")+
  scale_fill_discrete(name="", guide='none')
dev.off()






## ALL INDIVIDUALS AS ONE LINE PLOT- SPATIAL CORRELATION
library(plyr)
library(dplyr)
Data_ind<- read_csv("~/git_repo/BASC_Tech_paper/Data/similarity/all_individual_reproducibility.csv")

Data_ind$scantime <- as.factor(Data_ind$scantime)
#Data_ind$scantime <- factor(Data_ind$scantime,levels(Data_ind$scantime)[c(3,4,6,2,5,1,8,7)])

levels(Data_ind$bootstrap)[levels(Data_ind$bootstrap)=="1"] <- "0"

levels(Data_ind$scantime)[levels(Data_ind$scantime)=="halfmintest"] <- "Half Minute"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="onemintest"] <- "One Minute"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="threemintest"] <- "Three Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="fivemintest"] <- "Five Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="tenmintest"] <- "Ten Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="fifteenmintest"] <- "Fifteen Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="twentymintest"] <- "Twenty Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="twentyfivemintest"] <- "Twenty Five Minutes"

datavar_ind<-Data_ind$ism_repref_corr
Data_ind$scantime <- as.factor(Data_ind$scantime)
Data_ind$subject <- as.factor(Data_ind$subject)
Data_ind$scantime <- factor(Data_ind$scantime,levels(Data_ind$scantime)[c(3,4,6,2,5,1,8,7)])
levels(Data_ind$bootstrap)[levels(Data_ind$bootstrap)=="1"] <- "0"

summary_df = ddply(Data_ind, c("bootstrap", "scantime"), summarize, 
                   ism_repref_corr.mean = mean(ism_repref_corr, na.rm = T),
                   ism_repref_corr.sd= sd(ism_repref_corr, na.rm = T))

summary_df$bootstrap<- as.numeric(summary_df$bootstrap)

pdf("Individual_Spatial_Correlation_Reliability.pdf") 
ggplot(data = summary_df,
       mapping = aes(x = bootstrap, y = ism_repref_corr.mean, color = scantime)) +
  geom_line(aes(alpha=1), size=1.5) +
  geom_ribbon(aes(x=summary_df$bootstrap, 
                  ymin=summary_df$ism_repref_corr.mean-summary_df$ism_repref_corr.sd, 
                  ymax= summary_df$ism_repref_corr.mean+summary_df$ism_repref_corr.sd,
                  alpha = 0.05,
                  fill = summary_df$scantime),
              linetype = 0) +
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20),
        legend.title = element_text(size=16, face="bold")) +
  labs(title="Individual Test-Restest Reliability", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation")+
  guides(fill=guide_legend(title="Scan Time"))+
  scale_alpha(guide = 'none') +
  scale_color_discrete(name="Scan Time", guide='none')+
  scale_fill_discrete(name="", guide='none')
dev.off()


## ALL INDIVIDUALS AS ONE LINE PLOT- ADJUSTED RAND INDEX
library(plyr)
library(dplyr)
Data_ind<- read_csv("~/git_repo/BASC_Tech_paper/Data/similarity/all_individual_reproducibility.csv")

Data_ind$scantime <- as.factor(Data_ind$scantime)
#Data_ind$scantime <- factor(Data_ind$scantime,levels(Data_ind$scantime)[c(3,4,6,2,5,1,8,7)])

levels(Data_ind$bootstrap)[levels(Data_ind$bootstrap)=="1"] <- "0"

levels(Data_ind$scantime)[levels(Data_ind$scantime)=="halfmintest"] <- "Half Minute"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="onemintest"] <- "One Minute"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="threemintest"] <- "Three Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="fivemintest"] <- "Five Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="tenmintest"] <- "Ten Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="fifteenmintest"] <- "Fifteen Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="twentymintest"] <- "Twenty Minutes"
levels(Data_ind$scantime)[levels(Data_ind$scantime)=="twentyfivemintest"] <- "Twenty Five Minutes"

datavar_ind<-Data_ind$ref_rep_indgrp_label_ARI
Data_ind$scantime <- as.factor(Data_ind$scantime)
Data_ind$subject <- as.factor(Data_ind$subject)
Data_ind$scantime <- factor(Data_ind$scantime,levels(Data_ind$scantime)[c(3,4,6,2,5,1,8,7)])
levels(Data_ind$bootstrap)[levels(Data_ind$bootstrap)=="1"] <- "0"

summary_df = ddply(Data_ind, c("bootstrap", "scantime"), summarize, 
                   ref_rep_indgrp_label_ARI.mean = mean(ref_rep_indgrp_label_ARI, na.rm = T),
                   ref_rep_indgrp_label_ARI.sd= sd(ref_rep_indgrp_label_ARI, na.rm = T))

summary_df$bootstrap<- as.numeric(summary_df$bootstrap)

pdf("Individual_Adjusted_Rand_Index_Reliability.pdf") 
ggplot(data = summary_df,
       mapping = aes(x = bootstrap, y = ref_rep_indgrp_label_ARI.mean, color = scantime)) +
  geom_line(aes(alpha=1), size=1.5) +
  geom_ribbon(aes(x=summary_df$bootstrap, 
                  ymin=summary_df$ref_rep_indgrp_label_ARI.mean-summary_df$ref_rep_indgrp_label_ARI.sd, 
                  ymax= summary_df$ref_rep_indgrp_label_ARI.mean+summary_df$ref_rep_indgrp_label_ARI.sd,
                  alpha = 0.05,
                  fill = summary_df$scantime),
              linetype = 0) +
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20),
        legend.title = element_text(size=16, face="bold")) +
  labs(title="Individual Test-Retest Reliability", 
       x="Bootstrap Aggregates",
       y="Adjusted Rand Index")+
  guides(fill=guide_legend(title="Scan Time"))+
  scale_alpha(guide = 'none') +
  scale_color_discrete(name="Scan Time", guide='none')+
  scale_fill_discrete(name="", guide='none')
dev.off()

#HEATMAP CORRELATION MATRIX BETWEEN 0BS AND 800BS 
library(reshape2)
library(viridis)
library(gplots)

image_correlation_matrix <- read_csv("/Users/aki.nikolaidis/git_repo/BASC_Tech_paper/Data/ClusterImages/similarity.csv")

image_correlation_matrix$X1<- NULL
colnames(image_correlation_matrix) <- c("Ref 0 BS", "Rep 0 BS 10 Min", "Rep 0 BS 25 Min", "Ref 800 BS", "Rep 800 BS 10 Min", "Rep 800 BS 25 Min")
row.names(image_correlation_matrix) <- c("Ref 0 BS", "Rep 0 BS 10 Min", "Rep 0 BS 25 Min", "Ref 800 BS", "Rep 800 BS 10 Min", "Rep 800 BS 25 Min")

melted_cormat <- melt(image_correlation_matrix)
head(melted_cormat)

dev.off()
heatmap(as.matrix(image_correlation_matrix), 
        Rowv = "Colv", 
        Colv = TRUE, 
        margins = c(18,18),
        col=inferno(256),
        dendScale = 0.1,
        scale = "none",
        legend = c("col"))


##########################################################################################################################
##########################################################################################################################
##########################################################################################################################
#STATISTICAL TESTS

#GROUP ANOVA IMPACT OF TIME AND BOOTSTRAPS ON TRT

#Correlation
Corr_aov <- aov(gsm_repref_corr ~ Time * bootstrap, data = Data)
summary(Corr_aov)
TukeyHSD(Corr_aov, "Time")
TukeyHSD(Corr_aov, "bootstrap")

#ARI
ARI_aov <- aov(group_label_acc ~ Time * bootstrap, data = Data)
summary(ARI_aov)
TukeyHSD(ARI_aov, "Time")
TukeyHSD(ARI_aov, "bootstrap")

#INDIVIDUAL LEVEL
Data_ind$bootstrap_factor<-as.factor(Data_ind$bootstrap)


#LINEAR MIXED EFFECTS MODEL - CORRELATION
library(lmerTest)

#simple_fit_corr <- lmer(ism_repref_corr ~ scantime * bootstrap_factor + (1 | subject) + (1 | rerun), data=Data_ind)
#anova(simple_fit_corr)
#summary(simple_fit_corr)

full_fit_corr <- lmer(ism_repref_corr ~ scantime * bootstrap_factor + (1 | subject) + (1 | rerun) + (1 | subject:bootstrap_factor) + (1 | subject:scantime), data=Data_ind)
anova(full_fit_corr)
summary(full_fit_corr)

#LINEAR MIXED EFFECTS MODEL - ARI

#simple_fit_ari <- lmer(ref_rep_indgrp_label_ARI ~ scantime + bootstrap_factor + (1 | subject)+ (1 | subject:bootstrap_factor) + (1 | subject:scantime), data=Data_ind)
#anova(simple_fit_ari)
#summary(simple_fit_ari)

full_fit_ari <- lmer(ref_rep_indgrp_label_ARI ~ scantime * bootstrap_factor + (1 | subject) + (1 | subject:bootstrap_factor) + (1 | subject:scantime), data=Data_ind)
anova(full_fit_ari)
summary(full_fit_ari)

#Correlation 
Ind_Corr_aov <- aov(ism_repref_corr ~ scantime + bootstrap_factor, data = Data_ind)
summary(Ind_Corr_aov)
TukeyHSD(Ind_Corr_aov, "scantime")
TukeyHSD(Ind_Corr_aov, "bootstrap_factor")

#ARI
Ind_ARI_aov <- aov(ref_rep_indgrp_label_ARI ~ scantime + bootstrap_factor, data = Data_ind)
summary(Ind_ARI_aov)
TukeyHSD(Ind_ARI_aov, "scantime")
TukeyHSD(Ind_ARI_aov, "bootstrap_factor")



# PAIRED T TEST
#create smaller version of Data
StatsData <- subset(Data, bootstrap=='0' | bootstrap=='400')
StatsData <- subset(StatsData, Time=='Twenty Five Minutes' | Time=='Ten Minutes')


StatsDataTenMin <- subset(StatsData, Time=='Ten Minutes')
StatsDataTwentyFiveMin <- subset(StatsData, Time=='Twenty Five Minutes')

#Effect of Bootstrap within a Scan Time
t.test(gsm_repref_corr ~ bootstrap, data = StatsDataTenMin, paired = FALSE)
t.test(gsm_repref_corr ~ bootstrap, data = StatsDataTwentyFiveMin, paired = FALSE)
t.test(group_label_acc ~ bootstrap, data = StatsDataTenMin, paired = FALSE)
t.test(group_label_acc ~ bootstrap, data = StatsDataTwentyFiveMin, paired = FALSE)

#Comparing 10 mins with Bootstraps to 25 Mins without
StatsDataTwentyFiveMin_0BS <- subset(StatsDataTwentyFiveMin, bootstrap=='0')
StatsDataTenMin_400BS <- subset(StatsDataTenMin, bootstrap=='400')
Comparing_10Mins400BS_25Mins0BS <-rbind(StatsDataTwentyFiveMin_0BS,StatsDataTenMin_400BS)
t.test(gsm_repref_corr ~ Time, data = Comparing_10Mins400BS_25Mins0BS, paired = FALSE)
t.test(group_label_acc ~ Time, data = Comparing_10Mins400BS_25Mins0BS, paired = FALSE)



##########################################################################################################################
##########################################################################################################################
##########################################################################################################################



## INDIVIDUAL LEVEL  LINE PLOTS
library(plyr)
library(dplyr)
Data_ind<- read_csv("~/git_repo/BASC_Tech_paper/Data/similarity/all_individual_reproducibility.csv")

datavar_ind<-Data_ind$ism_repref_corr
Data_ind$scantime <- as.factor(Data_ind$scantime)
Data_ind$subject <- as.factor(Data_ind$subject)
Data_ind$scantime <- factor(Data_ind$scantime,levels(Data_ind$scantime)[c(3,4,6,2,5,1,8,7)])
levels(Data_ind$bootstrap)[levels(Data_ind$bootstrap)=="1"] <- "0"

summary_df = ddply(Data_ind, c("bootstrap", "subject", "scantime"), summarize, 
                   ism_repref_corr.mean = mean(ism_repref_corr, na.rm = T),
                   ism_repref_corr.sd= sd(ism_repref_corr, na.rm = T))

summary_df$bootstrap<- as.numeric(summary_df$bootstrap)
ggplot(data = summary_df,
       mapping = aes(x = bootstrap, y = ism_repref_corr.mean, color = subject)) +
  geom_line()+
  facet_wrap(. ~ scantime) +
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Individual Level Correlation", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation")+
  guides(fill=guide_legend(title="Scan Length"))






Data_singlesub$bootstrap<-as.factor(Data_singlesub$bootstrap)
ggplot(data = Data_singlesub,
       mapping = aes(x = bootstrap, y = ism_repref_corr, color = subject)) +
  geom_point(x = Data_singlesub$bootstrap, y = Data_singlesub$ism_repref_corr) +
  #geom_line(y = Data_singlesub$ism_repref_corr) +
  #geom_smooth(aes(y = summary_df$ism_repref_corr.sd)) +
  facet_wrap(. ~ scantime) +
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Individual Level Correlation", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation")+
  guides(fill=guide_legend(title="Scan Length"))


ggplot(data = Data_ind, 
       mapping = aes(x = bootstrap, y = datavar_ind.mean, color = subject)) +
  #stat_summary(fun.data=mean_sdl, width=0.5, fun.args = list(mult=1), 
  #             geom="errorbar", color="grey70") +
  #stat_summary(fun.y=mean, geom="line", size=1, alpha = 0.8) +
  geom_line(alpha=0.5) +
  facet_wrap(. ~ scantime)+
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Individual Level Correlation", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation")+
  guides(fill=guide_legend(title="Scan Length"))





ggplot(Data_ind, aes(x=bootstrap, y=mean(datavar_ind))) + 
  #scale_x_reverse() +
  #stat_summary(fun.y=mean, geom="point", group=Data_ind$subject, size=2.7, alpha = 0.8)
  geom_line(aes(x=bootstrap, y=datavar_ind, color=subject)) +
  geom_smooth(aes(x=bootstrap, y=datavar_ind, color=subject))+
  
  #geom_jitter(aes(y=datavar_ind,group=Data_ind$scantime, colour=Data_ind$scantime, alpha = 0.1, stroke=.01), width=.3, show.legend = FALSE) +
  #geom_violin() +#,notch = TRUE,fill = "white", colour = "#3366FF", outlier.colour = "red", outlier.shape = 1, size=1, show.legend = FALSE) +
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Individual Level Correlation", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation")+
  guides(fill=guide_legend(title="Scan Length"))





## INDIVIDUAL LEVEL 
Data_ind<- read_csv("~/git_repo/BASC_Tech_paper/Data/similarity/all_individual_reproducibility.csv")
#/Users/aki.nikolaidis/git_repo/PyBASC/Updated_IBS_GBS_Jovo4_20_2018.csv')
#Data_ind<-ind_level_reproducibility
datavar_ind<-Data_ind$ism_repref_corr
Data_ind$bootstrap<- as.factor(Data_ind$bootstrap)
Data_ind$scantime <- as.factor(Data_ind$scantime)
Data_ind$subject <- as.factor(Data_ind$subject)
Data_ind$scantime <- factor(Data_ind$scantime,levels(Data_ind$scantime)[c(3,4,6,2,5,1,8,7)])


ggplot(Data_ind, aes(x=bootstrap, y=datavar_ind, fill=scantime)) + 
  #scale_x_reverse() +
  geom_jitter(aes(y=datavar_ind,group=Data_ind$scantime, colour=Data_ind$scantime, alpha = 0.1, stroke=.01), width=.3, show.legend = FALSE) +
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
       y="Spatial Correlation")+
  guides(fill=guide_legend(title="Scan Length"))


# FOR A SINGLE SUBJECT
Data_singlesub <- Data_ind[ which(Data_ind$subject=='6') , ]
datavar_ind<-Data_singlesub$ref_rep_indgrp_label_ARI

ggplot(Data_singlesub, aes(x=bootstrap, y=datavar_ind, fill=scantime)) + 
#ggplot(subset(Data_ind, subject %in% c("6", "2", "15")), aes(x=bootstrap, y=datavar_ind, fill=scantime)) + 
  
  #scale_x_reverse() 
  #ggplot(subset(surveys_complete, species_id %in% c("DO", "DM", "DS") & sex %in% c("F", "M")),
  #       aes(x = sex, y = weight,  colour = interaction(sex, species_id)))
  geom_jitter(aes(y=datavar_ind,group=Data_singlesub$scantime, colour=Data_singlesub$scantime, alpha = 0.1, stroke=0.1), width=.2, show.legend = FALSE) +
  geom_violin() +#,notch = TRUE,fill = "white", colour = "#3366FF", outlier.colour = "red", outlier.shape = 1, size=1, show.legend = FALSE) +
  scale_y_continuous(limits = c(0,1))+
  theme_classic()+
  theme(axis.title.x = element_text(face="bold", size=16),
        axis.title.y = element_text(face="bold", size=16),
        axis.text.x  = element_text(size=16, angle=65, vjust=0.6),
        axis.text.y  = element_text(size=16),
        plot.title   = element_text(vjust=2, hjust=0.5, face="bold", size=20)) +
  labs(title="Sub 6 Individual Level Correlation", 
       x="Bootstrap Aggregates",
       y="Spatial Correlation")+
  guides(fill=guide_legend(title="Scan Length"))





p + facet_grid(~subject)


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