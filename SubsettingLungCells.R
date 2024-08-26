# SubsettingLungCells.R
# Identifying cells of interest and associated transcripts from Lambrechts et al
# 2018 Nature Medicine Lung Cancer scRNA dataset

######LIBRARIES#################################################################
library(Seurat)
library(hdf5r)
library(dplyr)
library(ggplot2)
library(tidyr)
library(tidyverse)

######READING DATA##############################################################
#Set wd
setwd('C:/Users/keliu/OneDrive - UConn Health Center/Documents/Scanned Documents/Documents/Lambrechts_LungCancer_hdf5')

#Load individual count matrices
Patients <- c('Patient2','Patient3','Patient4','Patient5')
Locations <- c('core','edge','middle','normal')

#Reading only Patient 1, since Patient 1 has no 'normal' sample
for (i in Locations) {
  h5 <- Seurat::Read10X_h5(paste0('Patient1_',i,'_filtered_feature_bc_matrix.h5'))
  assign(paste0('Patient1_',i), h5)
}

#Reading for all other patients
for (i in Patients) {
  for (j in Locations) {
    h5 <- Seurat::Read10X_h5(paste0(i,'_',j,'_filtered_feature_bc_matrix.h5'))
    assign(paste0(i,'_',j), h5)
  }
}
rm(h5,i,j) #Housekeeping

######CREATING SEURAT OBJECTS###################################################
#Patient1
Patient1_core_Seurat <-
  CreateSeuratObject(counts=Patient1_core,project ='Patient1_core')
Patient1_edge_Seurat <-
  CreateSeuratObject(counts=Patient1_edge,project ='Patient1_edge')
Patient1_middle_Seurat <-
  CreateSeuratObject(counts=Patient1_middle,project ='Patient1_middle')
#Patient2
Patient2_core_Seurat <-
  CreateSeuratObject(counts=Patient2_core,project ='Patient2_core')
Patient2_edge_Seurat <-
  CreateSeuratObject(counts=Patient2_edge,project ='Patient2_edge')
Patient2_middle_Seurat <-
  CreateSeuratObject(counts=Patient2_middle,project ='Patient2_middle')
Patient2_normal_Seurat <-
  CreateSeuratObject(counts=Patient2_normal,project ='Patient2_normal')
#Patient3
Patient3_core_Seurat <-
  CreateSeuratObject(counts=Patient3_core,project ='Patient3_core')
Patient3_edge_Seurat <-
  CreateSeuratObject(counts=Patient3_edge,project ='Patient3_edge')
Patient3_middle_Seurat <-
  CreateSeuratObject(counts=Patient3_middle,project ='Patient3_middle')
Patient3_normal_Seurat <-
  CreateSeuratObject(counts=Patient3_normal,project ='Patient3_normal')
#Patient4
Patient4_core_Seurat <-
  CreateSeuratObject(counts=Patient4_core,project ='Patient4_core')
Patient4_edge_Seurat <-
  CreateSeuratObject(counts=Patient4_edge,project ='Patient4_edge')
Patient4_middle_Seurat <-
  CreateSeuratObject(counts=Patient4_middle,project ='Patient4_middle')
Patient4_normal_Seurat <-
  CreateSeuratObject(counts=Patient4_normal,project ='Patient4_normal')
#Patient5
Patient5_core_Seurat <-
  CreateSeuratObject(counts=Patient5_core,project ='Patient5_core')
Patient5_edge_Seurat <-
  CreateSeuratObject(counts=Patient5_edge,project ='Patient5_edge')
Patient5_middle_Seurat <-
  CreateSeuratObject(counts=Patient5_middle,project ='Patient5_middle')
Patient5_normal_Seurat <-
  CreateSeuratObject(counts=Patient5_normal,project ='Patient5_normal')


#Merging all Seurat
AllCells <- merge(x=Patient1_core_Seurat,
                  y=c(Patient1_edge_Seurat,Patient1_middle_Seurat,Patient2_core_Seurat,
                      Patient2_edge_Seurat,Patient2_middle_Seurat,Patient2_normal_Seurat,
                      Patient3_core_Seurat,Patient3_edge_Seurat,Patient3_middle_Seurat,
                      Patient3_normal_Seurat,Patient4_core_Seurat,Patient4_edge_Seurat,
                      Patient4_middle_Seurat,Patient4_normal_Seurat,Patient5_core_Seurat,
                      Patient5_edge_Seurat,Patient5_middle_Seurat,Patient5_normal_Seurat),
                      add.cell.ids=c('Patient1_core','Patient1_edge','Patient1_middle',
                                     'Patient2_core','Patient2_edge','Patient2_middle',
                                     'Patient2_normal','Patient3_core','Patient3_edge',
                                     'Patient3_middle','Patient3_normal','Patient4_core',
                                     'Patient4_edge','Patient4_middle','Patient4_normal',
                                     'Patient5_core','Patient5_edge','Patient5_middle',
                                     'Patient5_normal'),
                  project='LambrechtsLungCancer')

#Checking the merged Seurat
head(colnames(AllCells))
tail(colnames(AllCells))
unique(sapply(X = strsplit(colnames(AllCells), split = "_"), FUN = "[", 1))
table(AllCells$orig.ident)





######QUALITY CONTROL###########################################################

#Adding the percent mitochondrial reads to the metadata for each cell
# The [[ operator can add columns to object metadata. This is a great place to stash QC stats
#Looking for all genes that begin with the pattern 'MT'
#This allows us to filter out low-quality dying cells with high amounts of MT reads
#PercentageFeatureSet calculates the percent of counts originating from a
#particular feature/gene, in this case specified by pattern
AllCells[["percent.mt"]] <- PercentageFeatureSet(AllCells, pattern = "^MT-")
View(AllCells@meta.data)

#Also modifying AllCells Seurat object to contain other metadata about patient and
#tissue type
#First, assign rownames to a column in the metadata
AllCells$sample <- rownames(AllCells@meta.data)
#Then split this column in the metadata by delimiter
AllCells@meta.data <- 
  separate(AllCells@meta.data, col = 'sample', 
           into = c('Patient','Tissue_Location', 'Barcode'), sep = '_')
unique(AllCells@meta.data$Patient)
unique(AllCells@meta.data$Tissue_Location)

#Visualizing quality-control metrics, including mtDNA, number of features, and 
#number of molecules
pdf('QCPlots.pdf')
VlnPlot(AllCells, 
        features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
VlnPlot(AllCells,features = 'nFeature_RNA')
VlnPlot(AllCells,features = 'nCount_RNA')
VlnPlot(AllCells,features = 'percent.mt')
FeatureScatter(AllCells, feature1 = 'nCount_RNA', feature2 = 'nFeature_RNA') +
  geom_smooth(method='lm')
FeatureScatter(AllCells, feature1 = "nCount_RNA", feature2 = "percent.mt")
dev.off()

#Now, for the actual filtration. We will be using subset() for this purpose
#We want percent.mtDNA to be at most 10%, the number of unique features to be
#at least 101 and at most 6000, and the number of molecules (UMIs) to be at least
#201
AllCells_filtered <- subset(AllCells, 
                            subset = nCount_RNA >= 201 & nFeature_RNA <= 6000 &
                              nFeature_RNA >= 101 & percent.mt <= 10)
#Verify filtration
print(AllCells_filtered)

######NORMALIZATION#############################################################

###First, to use a normalization procedure more in line with the current Seurat 
###workflow
AllCells_filtered_norm1 <- AllCells_filtered
#normalizes the feature expression measurements for each cell by the total 
#expression, multiplies this by a scale factor (10,000 by default), and log-
#transforms the result
AllCells_filtered_norm1 <- NormalizeData(AllCells_filtered_norm1)
#Find most variable genes, with default values
AllCells_filtered_norm1 <- FindVariableFeatures(AllCells_filtered_norm1, 
                                                selection.method = "vst", 
                                                nfeatures = 2000)
# Identify the 10 most highly variable genes
top10 <- head(VariableFeatures(AllCells_filtered_norm1), 10)
# plot variable features with and without labels
plot1 <- VariableFeaturePlot(AllCells_filtered_norm1)
plot2 <- LabelPoints(plot = plot1, points = top10, repel = TRUE)
pdf('AllCells_filtered_norm1.pdf')
plot1
plot2
dev.off()
#Scale (linear transformation) step that is standard to all workflows prior to 
#dimensional reduction steps. Also regress out other sources of variation like
#total RNA expression/count and mtDNA. Note: the scaling is by default done only
#for the most variable genes that we've identified
AllCells_filtered_norm1 <- 
  ScaleData(AllCells_filtered_norm1, vars.to.regress = c("percent.mt", "nCount_RNA"))





###Secondly, to use a workflow that more closely hews to Lambrechts et al's 
###published procedure
AllCells_filtered_norm2 <- AllCells_filtered
#Skipping the NormalizeData() step
#Normalizing only by regressing out mtDNA count and total RNA
#Identify the MT count
mito_genes <- grep("^MT-", rownames(AllCells_filtered_norm2), value = TRUE)
AllCells_filtered_norm2.1 <- AllCells_filtered_norm2
AllCells_filtered_norm2.1[["mito.reads"]] <- 
  Matrix::colSums(AllCells_filtered_norm2.1[['RNA']]$counts[mito_genes, ])

#Regress out mitochondrial reads and total RNA
#Note: this does not work, so I will have to do something else
AllCells_filtered_norm2.1 <- FindVariableFeatures(AllCells_filtered_norm2.1, 
                                                  nfeatures=4000)
AllCells_filtered_norm2.1 <- 
  ScaleData(AllCells_filtered_norm2,
            vars.to.regress = c("nCount_RNA", "mito.reads"))

#Regress out percent mitochondrial reads and total RNA
AllCells_filtered_norm2 <- FindVariableFeatures(AllCells_filtered_norm2, 
                                                  nfeatures=4000)
AllCells_filtered_norm2 <- 
  ScaleData(AllCells_filtered_norm2,
            vars.to.regress = c("nCount_RNA", "percent.mt"))
#So it appears that without running NormalizeData first, neither of these things
#work. Additionally, trying to regress out the actual mt read counts is not going
#to work, since we only get the counts for the first layer, and not all 19 layers
#So it looks like this workflow isn't going to work.

######DIMENSIONALITY REDUCTION: PCA#############################################

#Performing PCA based on the most variable 2000 genes
AllCells_filtered_norm_PCA <- 
  RunPCA(AllCells_filtered_norm1, features = VariableFeatures(object = AllCells_filtered_norm1))

#Visualizing PCA
pdf('PCA_plots.pdf')
VizDimLoadings(AllCells_filtered_norm_PCA, dims = 1:2, reduction = "pca")
DimHeatmap(AllCells_filtered_norm_PCA, dims = 1:20, cells = 500, balanced = TRUE)
#Determining the dimensionality of the data, i.e. how many PCs is necessary
ElbowPlot(AllCells_filtered_norm_PCA, ndims = 30)
dev.off()
#Looks like we might use 8-9, or perhaps around 23 dimensions

######CLUSTERING CELLS##########################################################

#In order to organize cells into clusters, before we label the clusters with
#marker genes

#Firstly, with 8 PCs
AllCells_filtered_norm_8PC <- FindNeighbors(AllCells_filtered_norm_PCA, 
                                            dims = 1:8)
AllCells_filtered_norm_8PC <- FindClusters(AllCells_filtered_norm_8PC, 
                                           resolution = c(0.01,0.025,0.05,0.1,0.3,0.5,0.7,1))
#Graphing to see if cluster resolution is adequate
pdf('AllCells_filtered_norm_8PC.clusters.pdf')
DimPlot(AllCells_filtered_norm_8PC, group.by = 'RNA_snn_res.0.01', label = TRUE)#
DimPlot(AllCells_filtered_norm_8PC, group.by = 'RNA_snn_res.0.025', label = TRUE)#
DimPlot(AllCells_filtered_norm_8PC, group.by = 'RNA_snn_res.0.05', label = TRUE)#
DimPlot(AllCells_filtered_norm_8PC, group.by = 'RNA_snn_res.0.1', label = TRUE)
DimPlot(AllCells_filtered_norm_8PC, group.by = 'RNA_snn_res.0.3', label = TRUE)
dev.off()
#Setting identities
AllCells_filtered_norm_8PC_Iden.01 <- AllCells_filtered_norm_8PC
Idents(AllCells_filtered_norm_8PC_Iden.01) <- 'RNA_snn_res.0.01'
AllCells_filtered_norm_8PC_Iden.025 <- AllCells_filtered_norm_8PC
Idents(AllCells_filtered_norm_8PC_Iden.025) <- 'RNA_snn_res.0.025'
AllCells_filtered_norm_8PC_Iden.05 <- AllCells_filtered_norm_8PC
Idents(AllCells_filtered_norm_8PC_Iden.05) <- 'RNA_snn_res.0.05'

#Secondly, with 9 PCs
AllCells_filtered_norm_9PC <- FindNeighbors(AllCells_filtered_norm_PCA, 
                                            dims = 1:9)
AllCells_filtered_norm_9PC <- FindClusters(AllCells_filtered_norm_9PC, 
                                           resolution = c(0.01,0.025,0.05,0.1,0.3,0.5,0.7,1))
#Graphing to see if cluster resolution is adequate
pdf('AllCells_filtered_norm_9PC.clusters.pdf')
DimPlot(AllCells_filtered_norm_9PC, group.by = 'RNA_snn_res.0.01', label = TRUE)#
DimPlot(AllCells_filtered_norm_9PC, group.by = 'RNA_snn_res.0.025', label = TRUE)#
DimPlot(AllCells_filtered_norm_9PC, group.by = 'RNA_snn_res.0.05', label = TRUE)#
DimPlot(AllCells_filtered_norm_9PC, group.by = 'RNA_snn_res.0.1', label = TRUE)
DimPlot(AllCells_filtered_norm_9PC, group.by = 'RNA_snn_res.0.3', label = TRUE)
dev.off()
#Setting identities
AllCells_filtered_norm_9PC_Iden.01 <- AllCells_filtered_norm_9PC
Idents(AllCells_filtered_norm_9PC_Iden.01) <- 'RNA_snn_res.0.01'
AllCells_filtered_norm_9PC_Iden.025 <- AllCells_filtered_norm_9PC
Idents(AllCells_filtered_norm_9PC_Iden.025) <- 'RNA_snn_res.0.025'
AllCells_filtered_norm_9PC_Iden.05 <- AllCells_filtered_norm_9PC
Idents(AllCells_filtered_norm_9PC_Iden.05) <- 'RNA_snn_res.0.05'


#Thirdly, with 23 PCs
AllCells_filtered_norm_23PC <- FindNeighbors(AllCells_filtered_norm_PCA, 
                                            dims = 1:23)
AllCells_filtered_norm_23PC <- FindClusters(AllCells_filtered_norm_23PC, 
                                           resolution = c(0.01,0.025,0.05,0.1,0.3,0.5,0.7,1))
#Graphing to see if cluster resolution is adequate
pdf('AllCells_filtered_norm_23PC.clusters.pdf')
DimPlot(AllCells_filtered_norm_23PC, group.by = 'RNA_snn_res.0.01', label = TRUE)#
DimPlot(AllCells_filtered_norm_23PC, group.by = 'RNA_snn_res.0.025', label = TRUE)#
DimPlot(AllCells_filtered_norm_23PC, group.by = 'RNA_snn_res.0.05', label = TRUE)#
DimPlot(AllCells_filtered_norm_23PC, group.by = 'RNA_snn_res.0.1', label = TRUE)
DimPlot(AllCells_filtered_norm_23PC, group.by = 'RNA_snn_res.0.3', label = TRUE)
dev.off()
#Setting identities
AllCells_filtered_norm_23PC_Iden.01 <- AllCells_filtered_norm_23PC
Idents(AllCells_filtered_norm_23PC_Iden.01) <- 'RNA_snn_res.0.01'
AllCells_filtered_norm_23PC_Iden.025 <- AllCells_filtered_norm_23PC
Idents(AllCells_filtered_norm_23PC_Iden.025) <- 'RNA_snn_res.0.025'
AllCells_filtered_norm_23PC_Iden.05 <- AllCells_filtered_norm_23PC
Idents(AllCells_filtered_norm_23PC_Iden.05) <- 'RNA_snn_res.0.05'


#Decided that 8-9 PCs was probably getting me enough information, so declined to
#proceed with this

######PLOTTING UMAP#############################################################

#First, using the first 8 PCs
#With clusters 0-5
AllCells_filtered_norm_8PC_Iden.01 <- 
  RunUMAP(AllCells_filtered_norm_8PC_Iden.01, dims = 1:8)
#With clusters 0-6
AllCells_filtered_norm_8PC_Iden.025 <- 
  RunUMAP(AllCells_filtered_norm_8PC_Iden.025, dims = 1:8)
#With clusters 0-8. I will likely be proceeding with this.
AllCells_filtered_norm_8PC_Iden.05 <- 
  RunUMAP(AllCells_filtered_norm_8PC_Iden.05, dims = 1:8)
#Plotting to see possible batch effect
pdf('8PC_BatchEffect.pdf')
DimPlot(AllCells_filtered_norm_8PC_Iden.01, reduction = "umap", group.by = 'Patient')
DimPlot(AllCells_filtered_norm_8PC_Iden.01, reduction = "umap", group.by = 'Tissue_Location')
dev.off()

#Secondly, using the first 9 PCs
#With clusters 0-5
AllCells_filtered_norm_9PC_Iden.01 <- 
  RunUMAP(AllCells_filtered_norm_9PC_Iden.01, dims = 1:9)
#With clusters 0-6
AllCells_filtered_norm_9PC_Iden.025 <- 
  RunUMAP(AllCells_filtered_norm_9PC_Iden.025, dims = 1:9)
#With clusters 0-8. I will likely be proceeding with this.
AllCells_filtered_norm_9PC_Iden.05 <- 
  RunUMAP(AllCells_filtered_norm_9PC_Iden.05, dims = 1:9)
#Plotting to see possible batch effect
pdf('9PC_BatchEffect.pdf')
DimPlot(AllCells_filtered_norm_9PC_Iden.01, reduction = "umap", group.by = 'Patient')
DimPlot(AllCells_filtered_norm_9PC_Iden.01, reduction = "umap", group.by = 'Tissue_Location')
dev.off()

#Plotting to see how well cell-clusters separate in UMAP, before annotation by
#biomarker
pdf('UnlabelledUMAP_9PC.pdf')
DimPlot(AllCells_filtered_norm_9PC_Iden.05, reduction = "umap")
dev.off()

pdf('UnlabelledUMAP_8PC.pdf')
DimPlot(AllCells_filtered_norm_8PC_Iden.05, reduction = "umap")
dev.off()


######SAVING SEURAT OBJECTS CREATED UP UNTIL THIS POINT#########################
saveRDS(AllCells, file = 'AllCells.Rds')
saveRDS(AllCells_filtered, file = 'AllCells_filtered.Rds')
saveRDS(AllCells_filtered_norm1, file = 'AllCells_filtered_norm1.Rds')
saveRDS(AllCells_filtered_norm_PCA, file = 'AllCells_filtered_norm_PCA.Rds')
saveRDS(AllCells_filtered_norm_8PC, file = 'AllCells_filtered_norm_8PC.Rds')
saveRDS(AllCells_filtered_norm_8PC_Iden.01, file = 'AllCells_filtered_norm_8PC_Iden.01.Rds')
saveRDS(AllCells_filtered_norm_8PC_Iden.025, file = 'AllCells_filtered_norm_8PC_Iden.025.Rds')
saveRDS(AllCells_filtered_norm_8PC_Iden.05, file = 'AllCells_filtered_norm_8PC_Iden.05.Rds')
saveRDS(AllCells_filtered_norm_9PC, file = 'AllCells_filtered_norm_9PC.Rds')
saveRDS(AllCells_filtered_norm_9PC_Iden.01, file = 'AllCells_filtered_norm_9PC_Iden.01.Rds')
saveRDS(AllCells_filtered_norm_9PC_Iden.025, file = 'AllCells_filtered_norm_9PC_Iden.025.Rds')
saveRDS(AllCells_filtered_norm_9PC_Iden.05, file = 'AllCells_filtered_norm_9PC_Iden.05.Rds')
saveRDS(AllCells_filtered_norm_23PC, file = 'AllCells_filtered_norm_23PC.Rds')

######DISCOVERING CLUSTER BIOMARKERS############################################
#Note: Lambrechts et al. already specified the biomarkers that they used to 
#annotate their cells. However, I will be trying the current Seurat 5.1.0 
#workflow for biomarker discovery and cluster annotation.
AllCells_filtered_norm_9PC_Iden.05 <- 
  JoinLayers(AllCells_filtered_norm_9PC_Iden.05)
AllCells_filtered_norm_8PC_Iden.05 <-
  JoinLayers(AllCells_filtered_norm_8PC_Iden.05)

markers_9PC_Iden.05 <- 
  FindAllMarkers(AllCells_filtered_norm_9PC_Iden.05, only.pos = TRUE)
markers_8PC_Iden.05 <- 
  FindAllMarkers(AllCells_filtered_norm_8PC_Iden.05, only.pos = TRUE)
#Note: when using this, make sure that you have the presto package downloaded.
#Makes running the Wilcoxon test much more efficient

#saving list of markers. This is important, since it can take a long time for
#FindAllMarkers to run.
saveRDS(markers_8PC_Iden.05, file = 'markers_8PC_Iden.05.Rds')

#Plotting biomarkers and clusters
markers_8PC_Iden.05 %>%
  group_by(cluster) %>%
  dplyr::filter(avg_log2FC > 1) %>%
  slice_head(n = 10) %>%
  ungroup() -> top10
pdf('Biomarkers_8PC_Iden.05.pdf')
#Heatmap of top 10 markers for each cluster
DoHeatmap(AllCells_filtered_norm_8PC_Iden.05, features = top10$gene) + NoLegend()
#Alveolar UMAP
FeaturePlot(AllCells_filtered_norm_8PC_Iden.05, 
            features = c('CLDN18','FOLR1','AQP4','PEBP4'))
#Alveolar violin plot
VlnPlot(AllCells_filtered_norm_8PC_Iden.05, 
        features = c('CLDN18','FOLR1','AQP4','PEBP4'))
#Epithelial UMAP
FeaturePlot(AllCells_filtered_norm_8PC_Iden.05, 
            features = c('CAPS','TMEM190','PIFO','SNTN'))
#Epithelial violin plot
VlnPlot(AllCells_filtered_norm_8PC_Iden.05, 
        features = c('CAPS','TMEM190','PIFO','SNTN'))
dev.off()

#List of cell types based on canonical markers
canonical_markers <- list(
  "Alveolar" = c('CLDN18','FOLR1','AQP4','PEBP4'),
  "Epithelial" = c('CAPS','TMEM190','PIFO','SNTN'),
  "Endothelial" = c("CLDN5", "FLT1", "CDH5",'RAMP2'),
  'Fibroblast' = c('COL1A1','DCN','COL1A2','C1R'),
  'B-Cell' = c('CD79A','IGKC','IGLC3','IGHG3'),
  'Myeloid' = c('LYZ','MARCO','CD68','FCGR3A'),
  'T-Cell' = c('CD3D','TRBC1','TRBC2','TRAC')
)

# Initialize a vector to store annotations
cluster_annotations <- rep(NA, length(unique(Idents(AllCells_filtered_norm_8PC_Iden.05))))

# Annotate each cluster based on canonical marker genes
for (i in 1:length(unique(Idents(AllCells_filtered_norm_8PC_Iden.05)))) {
  cluster_markers <- markers_8PC_Iden.05 %>% filter(cluster == (i-1))
  for (cell_type in names(canonical_markers)) {
    if (all(canonical_markers[[cell_type]] %in% cluster_markers$gene)) {
      cluster_annotations[i] <- cell_type
     } 
  }
}
rm(i,cell_type) #housekeeping
for (j in 1:length(cluster_annotations)) {
  if (is.na(cluster_annotations[j])) {
    cluster_annotations[j] <- 'Cancer'
  }
}
rm(j) #housekeeping

#Renaming the clusters to match with annotated cell type
names(cluster_annotations) <- levels(AllCells_filtered_norm_8PC_Iden.05)
AllCells_filtered_norm_8PC_Iden.05 <- 
  RenameIdents(AllCells_filtered_norm_8PC_Iden.05, cluster_annotations)
#Plotting the newly labelled UMAP with new cell type annotations
pdf('CellAnnotations_8PC_Iden.05.pdf')
DimPlot(AllCells_filtered_norm_8PC_Iden.05, reduction = "umap", label = TRUE, 
        pt.size = 0.5) + NoLegend()
dev.off()

######EXAMINING COUNT RANGES FOR GENES OF INTEREST##############################

#Now, to subset counts/gene-expression for patient 5 and selected cell types
#First, to add cell-type to metadata
celltypes <- data.frame(CellType=Idents(AllCells_filtered_norm_8PC_Iden.05))
AllCells_filtered_norm_8PC_Iden.05 <- 
  AddMetaData(AllCells_filtered_norm_8PC_Iden.05, celltypes)
#Subset for epithelial/alveolar cells from patient 5
#Across all biopsy sites
Patient5_Normal_8PC_Iden.05 <-
  subset(AllCells_filtered_norm_8PC_Iden.05, 
         subset = Patient=='Patient5' & CellType %in% c('Alveolar','Epithelial'))
#Across only the adjacent normal tissue
Patient5_Normal_8PC_Iden.05_normal <-
  subset(AllCells_filtered_norm_8PC_Iden.05, 
         subset = Patient=='Patient5' & CellType %in% c('Alveolar','Epithelial')
         & Tissue_Location=='normal')
#Subset for cancer cells from patient 5
#Across all biopsy sites
Patient5_Cancer_8PC_Iden.05 <-
  subset(AllCells_filtered_norm_8PC_Iden.05, 
         subset = Patient=='Patient5' & CellType=='Cancer')
#Across only the tumor tissue
Patient5_Cancer_8PC_Iden.05_tumor <-
  subset(AllCells_filtered_norm_8PC_Iden.05, 
         subset = Patient=='Patient5' & CellType=='Cancer' & 
           Tissue_Location!='normal')
#Extracting the actual counts, both normalized and scaled counts
#Cancer
NormCounts.Patient5_Cancer_8PC_Iden.05_tumor <- 
  as.data.frame(as.matrix(GetAssayData(Patient5_Cancer_8PC_Iden.05_tumor, 
                                       slot = 'data')))
Counts.Patient5_Cancer_8PC_Iden.05_tumor <- 
  as.data.frame(as.matrix(GetAssayData(Patient5_Cancer_8PC_Iden.05_tumor, 
                                       slot = 'counts')))
NormCounts.Patient5_Cancer_8PC_Iden.05 <-
  as.data.frame(as.matrix(GetAssayData(Patient5_Cancer_8PC_Iden.05, 
                                       slot = 'data')))
Counts.Patient5_Cancer_8PC_Iden.05 <-
  as.data.frame(as.matrix(GetAssayData(Patient5_Cancer_8PC_Iden.05, 
                                       slot = 'counts')))
#Normal
NormCounts.Patient5_Normal_8PC_Iden.05_normal <- 
  as.data.frame(as.matrix(GetAssayData(Patient5_Normal_8PC_Iden.05_normal, 
                                       slot = 'data')))
Counts.Patient5_Normal_8PC_Iden.05_normal <- 
  as.data.frame(as.matrix(GetAssayData(Patient5_Normal_8PC_Iden.05_normal, 
                                       slot = 'counts')))
NormCounts.Patient5_Normal_8PC_Iden.05 <-
  as.data.frame(as.matrix(GetAssayData(Patient5_Normal_8PC_Iden.05, 
                                       slot = 'data')))
Counts.Patient5_Normal_8PC_Iden.05 <-
  as.data.frame(as.matrix(GetAssayData(Patient5_Normal_8PC_Iden.05, 
                                       slot = 'counts')))

#Assaying the ranges of expression of a gene of interest
gene_OF <- 'HLA-DPA1'
#First, for cancer cells
max(NormCounts.Patient5_Cancer_8PC_Iden.05_tumor[
  which(rownames(NormCounts.Patient5_Cancer_8PC_Iden.05_tumor)==gene_OF),])
min(NormCounts.Patient5_Cancer_8PC_Iden.05_tumor[
  which(rownames(NormCounts.Patient5_Cancer_8PC_Iden.05_tumor)==gene_OF),])
max(Counts.Patient5_Cancer_8PC_Iden.05_tumor[
  which(rownames(Counts.Patient5_Cancer_8PC_Iden.05_tumor)==gene_OF),])
min(Counts.Patient5_Cancer_8PC_Iden.05_tumor[
  which(rownames(Counts.Patient5_Cancer_8PC_Iden.05_tumor)==gene_OF),])
#
max(NormCounts.Patient5_Cancer_8PC_Iden.05[
  which(rownames(NormCounts.Patient5_Cancer_8PC_Iden.05)==gene_OF),])
min(NormCounts.Patient5_Cancer_8PC_Iden.05[
  which(rownames(NormCounts.Patient5_Cancer_8PC_Iden.05)==gene_OF),])
max(Counts.Patient5_Cancer_8PC_Iden.05[
  which(rownames(Counts.Patient5_Cancer_8PC_Iden.05)==gene_OF),])
min(Counts.Patient5_Cancer_8PC_Iden.05[
  which(rownames(Counts.Patient5_Cancer_8PC_Iden.05)==gene_OF),])
#Then, for normal cells
max(NormCounts.Patient5_Normal_8PC_Iden.05_normal[
  which(rownames(NormCounts.Patient5_Normal_8PC_Iden.05_normal)==gene_OF),])
min(NormCounts.Patient5_Normal_8PC_Iden.05_normal[
  which(rownames(NormCounts.Patient5_Normal_8PC_Iden.05_normal)==gene_OF),])
max(Counts.Patient5_Normal_8PC_Iden.05_normal[
  which(rownames(Counts.Patient5_Normal_8PC_Iden.05_normal)==gene_OF),])
min(Counts.Patient5_Normal_8PC_Iden.05_normal[
  which(rownames(Counts.Patient5_Normal_8PC_Iden.05_normal)==gene_OF),])
#
max(NormCounts.Patient5_Normal_8PC_Iden.05[
  which(rownames(NormCounts.Patient5_Normal_8PC_Iden.05)==gene_OF),])
min(NormCounts.Patient5_Normal_8PC_Iden.05[
  which(rownames(NormCounts.Patient5_Normal_8PC_Iden.05)==gene_OF),])
max(Counts.Patient5_Normal_8PC_Iden.05[
  which(rownames(Counts.Patient5_Normal_8PC_Iden.05)==gene_OF),])
min(Counts.Patient5_Normal_8PC_Iden.05[
  which(rownames(Counts.Patient5_Normal_8PC_Iden.05)==gene_OF),])
