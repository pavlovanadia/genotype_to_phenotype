# This script allows for GO term enrichment analysis in mouse and human

# R version 4.1.2 (2021-11-01)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 19044)

BiocManager::install(version = "3.14")
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("org.Mm.eg.db")
BiocManager::install("enrichplot")
BiocManager::install("GOSemSim")
BiocManager::install("DOSE")
BiocManager::install("ggnewscale")


library(clusterProfiler)
library(org.Hs.eg.db)
library(org.Mm.eg.db)
library(enrichplot)
library(GOSemSim)
library(DOSE)
library(ggnewscale)
library(ggplot2)


# Read the data from the file
pleiotropy_genes <- read.csv("pleiotropy_genes.csv", header=TRUE)

# Define the variables
animal <- "mouse"
db_organism <- org.Mm.eg.db
group_pleiotropy <- 2
ontol <- "CC"

# Preparing the genetic list data
gene_list <- pleiotropy_genes$entrez_id_mouse[pleiotropy_genes$pleiotropy_MPO == group_pleiotropy]
gene_list <- as.character(unique(na.omit(gene_list)))


# Preparing the universe list data
gene_universe <- pleiotropy_genes$entrez_id_mouse[(pleiotropy_genes$pleiotropy_MPO == 0)
                                                 | (pleiotropy_genes$pleiotropy_MPO == 1)
                                                 | (pleiotropy_genes$pleiotropy_MPO == 2)]
gene_universe <- as.character(unique(na.omit(gene_universe)))


# Enrichment starts                      
ego <- enrichGO(gene = gene_list,
                OrgDb = db_organism,
                universe = gene_universe,
                keyType = "ENTREZID",
                ont = ontol,
                pvalueCutoff = 0.05,
                pAdjustMethod = "BH",
                maxGSSize = 2500,
                readable = TRUE)

# Printing the results to console
ego

# Save the file
write.csv(ego, file = paste0("ego_", animal, "_", group_pleiotropy, "_", ontol, ".csv"), row.names = FALSE)

# Save the dotplot
plot <- dotplot(ego, showCategory=15)
plot_name <- paste0(animal, "_dot_", group_pleiotropy, "_", ontol, ".png")
ggsave(plot_name, plot, dpi = 300, width = 10, height = 8)