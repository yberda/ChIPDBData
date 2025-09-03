#  ChIPDBData

`ChIPDBData` is a Bioconductor data package providing preprocessed ChIP-seq datasets for transcription factor enrichment analyses with TFEA.ChIP.

## Installation

You can install the package from Bioconductor with:

```r
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("ChIPDBData")
```

## Usage

Load a ChIPDB dataset from the ChIPDBData package:

```r
library(ChIPDBData)

# For example, load the ENCODE dataset filtered by depth >= 300
ChIPDB <- getChIPDB("ENCODE_rE2G_300depth")
```
Once loaded, the datasets can be used to perform transcription factor enrichment analysis with TFEA.ChIP. Begin by importing your differential expression data and defining the regulated and control gene sets. Then, run the enrichment analysis as follows:

```r
# Load and preprocess differential expression table
library(TFEA.ChIP)
data('hypoxia_DESeq')
hypoxia_table <- preprocessInputData(hypoxia_DESeq)

# Define gene sets
Genes.Upreg <- Select_genes(hypoxia_table, min_LFC = 1)
Genes.Control <- Select_genes(hypoxia_table,
  min_pval = 0.5, max_pval = 1,
  min_LFC = -0.25, max_LFC = 0.25
)

# Run TF enrichment
CM_list <- contingency_matrix(Genes.Upreg, Genes.Control)
results <- getCMstats(CM_list)

# Display results
head(results)
```
