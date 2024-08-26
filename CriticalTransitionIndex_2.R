# CriticalTransitionIndex_2.R
# A script to calculate the critical transition index Ic

######Libraries#################################################################
library(dplyr)
#library(stats)

#We will be using the getIC() function from the BioTip package. We will be 
#installing and loading from Bioconducter
BiocManager::install("BioTIP")
library(BioTIP)
library(SingleCellExperiment)
library(scran)
BiocManager::install("scater")
library(scater)

######Testing out getIC()#######################################################
#Creating a sample count matrix, with 3 genes and 9 samples
counts = matrix(sample(1:100, 27),  3,  9)
colnames(counts) = 1:9
row.names(counts) = c('loci1', 'loci2', 'loci3')

#Creating a list object, where each entry in the list is a "state", for instance 
#a cluster in a pseudotime trajectory, and each subentry is the corresponding 
#sample. We can think of each sample as a single cell in a pseudotime cluster.
cli = cbind(1:9, rep(c('state1', 'state2', 'state3'), each = 3))
colnames(cli) = c('samples', 'group')
samplesL <- split(cli[, 1],  f = cli[, 'group'])

#Unique gene ids. These actually have to be a subset of the row names in the 
#count matrix. Which means, if you leave out a gene (as we did here, loci3), we
#will change the final outcome since that gene will not be used to calculate Ic.
CTS = c('loci1', 'loci2')

#Calculating the correlations with 'cor'
Ic = getIc(counts,  samplesL,  CTS, fun = 'cor')
#Including all genes in the calculation of Ic
getIc(counts,  samplesL,  c('loci1','loci2','loci3'), fun = 'cor')
#Calculating the correlations, but with BioTIP, which apparently ignores NA values
#shrink is a way of estimating correlations by shrinking gene-gene correlations
#toward 0 due to the generally low correlation between genes, whereas sample-
#sample correlations are shrunk to the average correlation due to very similar
#gene expression profiles between samples during steady state.
Ic.2 = getIc(counts,  samplesL,  CTS, fun = 'BioTIP', shrink = FALSE)
BioTIP = getIc(counts,  samplesL,  CTS, fun = 'BioTIP')
#The first method with fun='cor' seems to be what the authors use for traiditional
#Ic scores

######Testing out getIC on real data############################################
#Adapted from: https://github.com/xyang2uchicago/BioTIP/blob/master/examples/code/hESC_Bargaje2017/4_plotIc.randomGene.R

#Generating Ic scores for 100 randomly picked genes

#Loading sample data
load('sce_hESC.RData')

#Showing how many of the 929 total cells are within each of the 18 cell clusters
table(sce$Consensus.Cluster)

#Getting the logtransformed counts from the SingleCellExperiment object sce
logmat <- as.matrix(logcounts(sce))

#Creating the list of vectors for the sampleL argument, where each entry of the
#list is a pseudotime cluster and vector entries are cells. Grouping up cells
#by the clusters in sce$Consensus.Cluster
samplesL <- split(rownames(colData(sce)), f =sce$Consensus.Cluster)

#Getting rid of the pseudotime clusters with too few cells
samplesL = samplesL[which(lengths(samplesL)>20)]

#Specifying the number of genes we will randomly draw, and the number of trials
n.sim = 100
n.gene = 20
#Creating a place to store our results, each row being a trial and each column
#a cluster
Ic <- matrix(nrow=n.sim, ncol=length(samplesL))

#Random number generation
set.seed(2022)

#For every trial in the for loop until you complete n.sim total trials, randomly
#sample genes using sample() and get the Ic score for those genes only via getIC
for(i in 1:n.sim){
  random.gene <- sample(rownames(logmat), n.gene)
  Ic[i,] <- getIc(logmat, samplesL, random.gene, fun="cor")
}
colnames(Ic) <- paste0('C',names(samplesL))

# reorder according to pesudo orders
Ic <- Ic[,c( "C2", "C1" , "C3",  "C4",  "C5", "C9", "C7" , "C8","C10"  )]

#Now to find the average Ic for each pseudotime cluster
average.Ic <- apply(Ic,2,mean)

#Creating plot of Ic scores for each cluster
pdf(file='average.Ic_20randomgene.pdf', height=5)
boxplot(Ic,xaxt='n', 
        xlab='cell cluster', main='hESC_Bargaje2017',
        las=1)
lines(1:length(average.Ic), average.Ic, type='b', col='red')
axis(1, at=1:length(average.Ic),labels= names(average.Ic), las=2)
dev.off()


######Modifying getIC() generated plot##########################################

#Specifying the number of genes we will randomly draw, and the number of trials
n.sim2 = 1000
n.gene2 = 50
#Creating a place to store our results, each row being a trial and each column
#a cluster
Ic2 <- matrix(nrow=n.sim2, ncol=length(samplesL))

#For every trial in the for loop until you complete n.sim total trials, randomly
#sample genes using sample() and get the Ic score for those genes only via getIC
for(i in 1:n.sim2){
  random.gene <- sample(rownames(logmat), n.gene2)
  Ic2[i,] <- getIc(logmat, samplesL, random.gene, fun="cor")
}
colnames(Ic2) <- paste0('C',names(samplesL))

# reorder according to pesudo orders
Ic2 <- Ic2[,c( "C2", "C1" , "C3",  "C4",  "C5", "C9", "C7" , "C8","C10"  )]

#Now to find the average Ic for each pseudotime cluster
average.Ic2 <- apply(Ic2,2,mean)

#Creating plot of Ic scores for each cluster
pdf(file='average.Ic_50randomgene.pdf', height=5)
boxplot(Ic2,xaxt='n', 
        xlab='cell cluster', main='hESC_Bargaje2017',
        las=1)
lines(1:length(average.Ic2), average.Ic2, type='b', col='red')
axis(1, at=1:length(average.Ic2),labels= names(average.Ic2), las=2)
dev.off()
