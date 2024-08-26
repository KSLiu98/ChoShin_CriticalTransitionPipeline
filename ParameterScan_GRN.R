# ParameterScan_GRN.R
# Visualize the results of randomly selecting parameters and initial conditions
# for Cho and Shin's lung cancer GRN

######LIBRARIES#################################################################
library(tidyverse)
library(ggplot2)
library(MASS)
library(RColorBrewer)
library(gridExtra)
library(dplyr)

######READING DATA##############################################################
#set wd
setwd('C:/Users/keliu/OneDrive - UConn Health Center/Documents/Scanned Documents/Documents/Cho_Shin_GRN_Analysis')

#reading data
filename <- 'Cho_Shin_LungCancer_GRN_19'

#Creating the dataframes
CopasiOutput <- 
  read.table(paste0(filename,'.txt'), header = TRUE, sep = '\t')
CopasiOutput_FinalGenes <- CopasiOutput[,62:69]
colnames(CopasiOutput_FinalGenes) <- c('FOSB','FOS','JUN','SPP1','CTSL','CD74','HLA','TIMP1')
CopasiOutput_InitialGenes <- CopasiOutput[,53:60]
CopasiOutput_log2FC <- log2(CopasiOutput_FinalGenes/CopasiOutput_InitialGenes)
colnames(CopasiOutput_log2FC) <- c('FOSB','FOS','JUN','SPP1','CTSL','CD74','HLA','TIMP1')
CopasiOutput_FinalGenes_log10 <- log10(CopasiOutput_FinalGenes)
colnames(CopasiOutput_FinalGenes_log10) <- c('FOSB','FOS','JUN','SPP1','CTSL','CD74','HLA','TIMP1')

######READING CLOUD-COPASI OUTPUT###############################################
#Cloud-COPASI output is split amongst many different files, which need to be 
#concatenated. 

#Assuming that filename variable is already specified,
num_files <- 100
dataframes <- vector(mode = 'list', length = num_files)
for (j in 1:num_files) {
  current_filename <- paste0((j-1),'_',filename,'.txt')
  current_file <- read.table(current_filename, header = TRUE, sep = '\t')
  dataframes[[j]] <- current_file
}
rm(j,current_file,current_filename) #housekeeping
CopasiOutput <- data.table::rbindlist(dataframes)
rm(dataframes, num_files) #housekeeping

######HEATMAPS##################################################################
#Generating heatmaps
#heatmap(t(as.matrix(CopasiOutput_FinalGenes)),col = gplots::redgreen(250))
pdf(paste0(filename,'.pdf'))
heatmap(t(as.matrix(CopasiOutput_log2FC)),col = gplots::redgreen(250), 
        scale = 'row')
dev.off()

######CALCULATING PCA###########################################################
#Calculating the PCA
#For the log2FC data
pca_res_log2FC <- prcomp(CopasiOutput_log2FC, scale. = FALSE)
pca_res_log2FC_scaled <- prcomp(CopasiOutput_log2FC, scale. = TRUE)
#For the final gene expression data, not logFC. Log transformed before 
#calculating PCA
pca_res_FinalGenes <- prcomp(CopasiOutput_FinalGenes_log10, scale. = FALSE)
pca_res_FinalGenes_scaled <- prcomp(CopasiOutput_FinalGenes_log10, scale. = TRUE)

#Color palette for combined histogram/2D density plot
rf <- colorRampPalette(rev(brewer.pal(11,'Spectral')))
r <- rf(32)

######PLOTTING PCA FOR LOG2FC###################################################



#Creating the plots
#Firstly, for the log2FC data
pdf(paste0(filename,'_log2FC_PCA.pdf'))
###Firstly, for the unscaled PCA data
#Simple scatterplots for PC1 and PC2
plot(pca_res_log2FC$x[,1],pca_res_log2FC$x[,2], xlab = 'PCA1', ylab = 'PCA2', 
     main = paste0(filename,' PCA plot without scaling'))
#Density plots for PC1 and PC2
ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2)) + 
  geom_bin2d(bins=60) +
  scale_fill_continuous(type = "viridis") + 
  theme_bw() + ggtitle(paste0(filename,' PCA plot without scaling'))
#Fancier density plots
ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2) ) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=1) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  theme(
    legend.position='right'
  ) + ggtitle(paste0(filename,' PCA plot without scaling'))
#Multipanel PCA plot, colored by log2FC of network nodes
p1 <- ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$FOSB)) +
  geom_point() + scale_color_viridis_c() 
p1$labels$colour <- 'FOSB'
p2 <- ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$FOS)) +
  geom_point() + scale_color_viridis_c() 
p2$labels$colour <- 'FOS'
p3 <- ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$JUN)) +
  geom_point() + scale_color_viridis_c()
p3$labels$colour <- 'JUN'
p4 <- ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$SPP1)) +
  geom_point() + scale_color_viridis_c() 
p4$labels$colour <- 'SPP1'
p5 <- ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$CTSL)) +
  geom_point() + scale_color_viridis_c() 
p5$labels$colour <- 'CTSL'
p6 <- ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$CD74)) +
  geom_point() + scale_color_viridis_c()
p6$labels$colour <- 'CD74'
p7 <- ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$HLA)) +
  geom_point() + scale_color_viridis_c() 
p7$labels$colour <- 'HLA'
p8 <- ggplot(data=pca_res_log2FC$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$TIMP1)) +
  geom_point() + scale_color_viridis_c() 
p8$labels$colour <- 'TIMP1'
grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8, nrow=4)
#Combined histogram/2D density plot
h1 <- hist(pca_res_log2FC$x[,1], breaks=50, plot=F)
h2 <- hist(pca_res_log2FC$x[,2], breaks=50, plot=F)
top <- max(h1$counts, h2$counts)
k <- kde2d(pca_res_log2FC$x[,1], pca_res_log2FC$x[,2], n=100)
oldpar <- par()
par(mar=c(3,3,1,1))
layout(matrix(c(2,0,1,3),2,2,byrow=T),c(3,1), c(1,3))
image(k, col=r) #plot the image
par(mar=c(0,2,1,0))
barplot(h1$counts, axes=F, ylim=c(0, top), space=0, col='red')
par(mar=c(2,0,0.5,1))
barplot(h2$counts, axes=F, xlim=c(0, top), space=0, col='red', horiz=T)

###Secondly, for the PCA results with scaling
#Simple scatterplots for PC1 and PC2
plot(pca_res_log2FC_scaled$x[,1],pca_res_log2FC_scaled$x[,2], xlab = 'PCA1', ylab = 'PCA2',
     main = paste0(filename,' PCA plot with scaling'))
#Density plots for PC1 and PC2
ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2)) + 
  geom_bin2d(bins=60) +
  scale_fill_continuous(type = "viridis") + 
  theme_bw() + ggtitle(paste0(filename,' PCA plot with scaling'))
#Fancier density plots
ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2) ) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=1) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  theme(
    legend.position='right'
  ) + ggtitle(paste0(filename,' PCA plot with scaling'))
#Multipanel PCA plot, colored by log2FC of network nodes
p1 <- ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$FOSB)) +
  geom_point() + scale_color_viridis_c() 
p1$labels$colour <- 'FOSB'
p2 <- ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$FOS)) +
  geom_point() + scale_color_viridis_c() 
p2$labels$colour <- 'FOS'
p3 <- ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$JUN)) +
  geom_point() + scale_color_viridis_c()
p3$labels$colour <- 'JUN'
p4 <- ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$SPP1)) +
  geom_point() + scale_color_viridis_c() 
p4$labels$colour <- 'SPP1'
p5 <- ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$CTSL)) +
  geom_point() + scale_color_viridis_c() 
p5$labels$colour <- 'CTSL'
p6 <- ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$CD74)) +
  geom_point() + scale_color_viridis_c()
p6$labels$colour <- 'CD74'
p7 <- ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$HLA)) +
  geom_point() + scale_color_viridis_c() 
p7$labels$colour <- 'HLA'
p8 <- ggplot(data=pca_res_log2FC_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_log2FC$TIMP1)) +
  geom_point() + scale_color_viridis_c() 
p8$labels$colour <- 'TIMP1'
grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8, nrow=4)
#Combined histogram/2D density plot
h1 <- hist(pca_res_log2FC_scaled$x[,1], breaks=50, plot=F)
h2 <- hist(pca_res_log2FC_scaled$x[,2], breaks=50, plot=F)
top <- max(h1$counts, h2$counts)
k <- kde2d(pca_res_log2FC_scaled$x[,1], pca_res_log2FC_scaled$x[,2], n=100)
oldpar <- par()
par(mar=c(3,3,1,1))
layout(matrix(c(2,0,1,3),2,2,byrow=T),c(3,1), c(1,3))
image(k, col=r) #plot the image
par(mar=c(0,2,1,0))
barplot(h1$counts, axes=F, ylim=c(0, top), space=0, col='red')
par(mar=c(2,0,0.5,1))
barplot(h2$counts, axes=F, xlim=c(0, top), space=0, col='red', horiz=T)

dev.off()

######PLOTTING PCA FOR LOG TRANSFORMED FINAL GENE EXPRESSION####################

###Repeat, this time for the FinalGenes data
pdf(paste0(filename,'_FinalGenes_PCA.pdf'))
###Firstly, for the unscaled PCA data
#Simple scatterplots for PC1 and PC2
plot(pca_res_FinalGenes$x[,1],pca_res_FinalGenes$x[,2], xlab = 'PCA1', ylab = 'PCA2', 
     main = paste0(filename,' PCA plot without scaling'))
#Density plots for PC1 and PC2
ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2)) + 
  geom_bin2d(bins=60) +
  scale_fill_continuous(type = "viridis") + 
  theme_bw() + ggtitle(paste0(filename,' PCA plot without scaling'))
#Fancier density plots
ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2) ) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=1) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  theme(
    legend.position='right'
  ) + ggtitle(paste0(filename,' PCA plot without scaling'))
#Multipanel PCA plot, colored by log2FC of network nodes
p1 <- ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$FOSB)) +
  geom_point() + scale_color_viridis_c() 
p1$labels$colour <- 'FOSB'
p2 <- ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$FOS)) +
  geom_point() + scale_color_viridis_c() 
p2$labels$colour <- 'FOS'
p3 <- ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$JUN)) +
  geom_point() + scale_color_viridis_c()
p3$labels$colour <- 'JUN'
p4 <- ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$SPP1)) +
  geom_point() + scale_color_viridis_c() 
p4$labels$colour <- 'SPP1'
p5 <- ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$CTSL)) +
  geom_point() + scale_color_viridis_c() 
p5$labels$colour <- 'CTSL'
p6 <- ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$CD74)) +
  geom_point() + scale_color_viridis_c()
p6$labels$colour <- 'CD74'
p7 <- ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$HLA)) +
  geom_point() + scale_color_viridis_c() 
p7$labels$colour <- 'HLA'
p8 <- ggplot(data=pca_res_FinalGenes$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$TIMP1)) +
  geom_point() + scale_color_viridis_c() 
p8$labels$colour <- 'TIMP1'
grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8, nrow=4)
#Combined histogram/2D density plot
h1 <- hist(pca_res_FinalGenes$x[,1], breaks=50, plot=F)
h2 <- hist(pca_res_FinalGenes$x[,2], breaks=50, plot=F)
top <- max(h1$counts, h2$counts)
k <- kde2d(pca_res_FinalGenes$x[,1], pca_res_FinalGenes$x[,2], n=100)
oldpar <- par()
par(mar=c(3,3,1,1))
layout(matrix(c(2,0,1,3),2,2,byrow=T),c(3,1), c(1,3))
image(k, col=r) #plot the image
par(mar=c(0,2,1,0))
barplot(h1$counts, axes=F, ylim=c(0, top), space=0, col='red')
par(mar=c(2,0,0.5,1))
barplot(h2$counts, axes=F, xlim=c(0, top), space=0, col='red', horiz=T)

###Secondly, for the PCA results with scaling
#Simple scatterplots for PC1 and PC2
plot(pca_res_FinalGenes_scaled$x[,1],pca_res_FinalGenes_scaled$x[,2], xlab = 'PCA1', ylab = 'PCA2',
     main = paste0(filename,' PCA plot with scaling'))
#Density plots for PC1 and PC2
ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2)) + 
  geom_bin2d(bins=60) +
  scale_fill_continuous(type = "viridis") + 
  theme_bw() + ggtitle(paste0(filename,' PCA plot with scaling'))
#Fancier density plots
ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2) ) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=1) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  theme(
    legend.position='right'
  ) + ggtitle(paste0(filename,' PCA plot with scaling'))
#Multipanel PCA plot, colored by log2FC of network nodes
p1 <- ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$FOSB)) +
  geom_point() + scale_color_viridis_c() 
p1$labels$colour <- 'FOSB'
p2 <- ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$FOS)) +
  geom_point() + scale_color_viridis_c() 
p2$labels$colour <- 'FOS'
p3 <- ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$JUN)) +
  geom_point() + scale_color_viridis_c()
p3$labels$colour <- 'JUN'
p4 <- ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$SPP1)) +
  geom_point() + scale_color_viridis_c() 
p4$labels$colour <- 'SPP1'
p5 <- ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$CTSL)) +
  geom_point() + scale_color_viridis_c() 
p5$labels$colour <- 'CTSL'
p6 <- ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$CD74)) +
  geom_point() + scale_color_viridis_c()
p6$labels$colour <- 'CD74'
p7 <- ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$HLA)) +
  geom_point() + scale_color_viridis_c() 
p7$labels$colour <- 'HLA'
p8 <- ggplot(data=pca_res_FinalGenes_scaled$x, aes(x=PC1,y=PC2, color=CopasiOutput_FinalGenes_log10$TIMP1)) +
  geom_point() + scale_color_viridis_c() 
p8$labels$colour <- 'TIMP1'
grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8, nrow=4)
#Combined histogram/2D density plot
h1 <- hist(pca_res_FinalGenes_scaled$x[,1], breaks=50, plot=F)
h2 <- hist(pca_res_FinalGenes_scaled$x[,2], breaks=50, plot=F)
top <- max(h1$counts, h2$counts)
k <- kde2d(pca_res_FinalGenes_scaled$x[,1], pca_res_FinalGenes_scaled$x[,2], n=100)
oldpar <- par()
par(mar=c(3,3,1,1))
layout(matrix(c(2,0,1,3),2,2,byrow=T),c(3,1), c(1,3))
image(k, col=r) #plot the image
par(mar=c(0,2,1,0))
barplot(h1$counts, axes=F, ylim=c(0, top), space=0, col='red')
par(mar=c(2,0,0.5,1))
barplot(h2$counts, axes=F, xlim=c(0, top), space=0, col='red', horiz=T)

dev.off()









######FINDING MULTISTABLE PARAMETERS############################################

#Firstly, to only keep the unique sets of parameters, initial states, and output
#If any row is NOT unique, it could be a different parameter set, or the same 
#parameter set but with different initial states, etc.
CopasiOutput_unique <- CopasiOutput[,c(1:52,62:69)] %>% unique()
CopasiOutput_unique_grouped <- CopasiOutput_unique %>% group_by_at(1:52)

#To find out how many steady states are associated with each set of parameters.
#We are looking for a value greater than 1 in the last column, 'n'
tally_CopasiOutput_unique_grouped <- CopasiOutput_unique_grouped %>% tally()

#Filter for only the parameter sets that ostensibly provide multisability
Copasi_parameters_multistable <- tally_CopasiOutput_unique_grouped %>%
  filter(n > 1)
Copasi_parameters_bistable <- Copasi_parameters_multistable %>% filter(n==2)

#Finding the medians of each parameter in the bistable set. It appears that Cho
#and Shin's parameters, and the medians of my parameters, are not very far off.
Copasi_parameters_bistable_med <- apply(Copasi_parameters_bistable,2,median)
Copasi_parameters_bistable_med <- Copasi_parameters_bistable_med[1:52]

# ggplot(data=Copasi_parameters_bistable, aes(x=X.Y2.creation..FC1))+
#   geom_histogram( binwidth=10, fill="#69b3a2", color="#e9ecef", alpha=0.9) +
#   geom_vline(aes(xintercept=median(X.Y2.creation..FC1)),color='red') +
#   geom_vline(xintercept=48.834,color='blue')
# 


ChoShin_GRNparameters <- c(50.764,36.437,2,
  3.7388,4.0293,48.834,
  92.651,36.102,94.764,
  5,3,4,
  29.777,6.0194,67.22,
  0.73339,38.165,58.436,
  5,2.5773,0.63639,
  11.695,73.576,2,
  9.6368,0.01638,76.83,
  52.016,5,4.79,
  0.32857,58.55,31.963,
  2,78.959,0.32384,
  78.563,7.6353,1,
  43.133,0.35657,85.693,
  93.561,92.464,39.92,
  4,2,1,
  4.0907,8.1658,59.781,
  0.53837)
names(ChoShin_GRNparameters) <- names(Copasi_parameters_bistable_med)[1:52]

Parameter_comparison <- data.frame(Copasi_parameters_bistable_med,ChoShin_GRNparameters)
Parameter_comparison <- Parameter_comparison %>% 
  mutate(Comparison = Copasi_parameters_bistable_med/ChoShin_GRNparameters)

#Plotting comparison of medians and Cho and Shin's published parameters
pdf(paste0(filename,'_RatioMediansToParameters.pdf'))
ggplot(data=Parameter_comparison, aes(x=Comparison))+
  geom_histogram( binwidth=0.1, fill="#69b3a2", color="#e9ecef", alpha=0.9) +
  ggtitle('Ratio of Medians of Bistable Parameters to Published Parameters')
dev.off()

#plotting the status of Timp1 and HLA as scatterplots for each set of bistable
#parameters
#First, selecting the rows that correspond to the bistable parameter sets
bistable_start.ind <- 
  prodlim::row.match(Copasi_parameters_bistable[,1:52], CopasiOutput[,1:52])
#Creating a list to store the final network states corresponding to the bistable
#parameters
bistable_outputs <- vector(mode = 'list', length = length(bistable_start.ind))
#Populating each element in the list
for (i in 1:length(bistable_start.ind)) {
  startind <- bistable_start.ind[i]
  bistable_outputs[[i]] <- 
    CopasiOutput_FinalGenes_log10[startind:(startind+999),]
}
rm(i,startind) #housekeeping
#Plotting the stable states, focusing specifically on TIMP1/HLA
pdf(paste0(filename,'_BistableStates_TIMP1-HLA.pdf'))
par(mfrow = c(1,2))
for (i in 1:length(bistable_start.ind)) {
  plot(bistable_outputs[[i]][,7],bistable_outputs[[i]][,8], xlab = 'log(HLA)',
       ylab = 'log(TIMP1)', col='red',
       main=paste0('Parameters #',i))
}
dev.off()
rm(i) #housekeeping
#Plotting the distribution of the stable states, focusing on HLA
pdf(paste0(filename,'_BistableStates_HLA_Dist.pdf'))
par(mfrow = c(1,2))
for (i in 1:length(bistable_start.ind)) {
  hist(bistable_outputs[[i]][,7],xlab = 'log(HLA)',ylab = 'log(TIMP1)', 
       col='red',main=paste0('Parameters #',i))
}
dev.off()
rm(i) #housekeeping

######DETECTING BISTABLE STATES WITH APPROPRIATE TIMP1/HLA EXPRESSION###########
#If we have a small number of attractors, then we can easily identify the 
#appropriate parameter set that gives us the desired TIMP1/HLA profile by 
#examining a few scatterplots and barplots, as shown above. However, if we're 
#examining a large dataset, then we need some other automated method.

#Assuming that bistable_outputs has already been created
#Looking only at TIMP1/HLA expression only
#Creating an empty list
bistable_outputs_TIMP1_HLA <- 
  vector(mode='list', length = length(bistable_start.ind))
#And populating it with only the TIMP1/HLA columns in bistable_outputs
for (j in 1:length(bistable_start.ind)) {
  bistable_outputs_TIMP1_HLA[[j]] <- bistable_outputs[[j]][,7:8]
}
rm(j) #housekeeping

#Now, filtering for only unique attractor states
bistable_outputs_TIMP1_HLA_unique <- 
  vector(mode='list', length = length(bistable_start.ind))
for (i in 1:length(bistable_start.ind)) {
  bistable_outputs_TIMP1_HLA_unique[[i]] <- 
    unique(bistable_outputs_TIMP1_HLA[[i]])
}
rm(i) #housekeeping


#Listing only attractors with TIMP1-low/HLA-hi and TIMP1-hi/HLA-lo
target_attractors <- vector(mode='logical', length = length(bistable_start.ind))
for (j in 1:length(bistable_start.ind)) {
  focus_df <- bistable_outputs_TIMP1_HLA_unique[[j]]
  if ((focus_df[1,1]<focus_df[2,1]) & (focus_df[1,2]>focus_df[2,2])) {
    target_attractors[j] <- TRUE
  } else if ((focus_df[1,1]>focus_df[2,1]) & (focus_df[1,2]<focus_df[2,2])) {
    target_attractors[j] <- TRUE
  }
}






