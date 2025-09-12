## ---------------------------------------------------------------------------
## Script to generate the ChIPDBs object included in this package
##
## The ChIPDB object contains transcription factor (TF)–target associations
## inferred from ChIP-seq datasets in ReMap2022 by linking peaks to candidate 
## target genes through cis-regulatory element (CRE)–gene connections.
##
## Data sources:
## - ReMap2022 (ChIP-seq binding sites, see: https://remap2022.univ-amu.fr/)
## - ENCODE rE2G (regulatory element-to-gene links; cell-type specific)
## - CREdb (curated CRE–gene links; used for generalization across cell types)
## - GeneHancer (integrated enhancer–gene links from multiple sources)
##
## Processing summary:
## 1. Load CRE–gene links from ENCODE rE2G, CREdb, or GeneHancer.
##    - To avoid cell-type specificity in ENCODE rE2G, we generalized 
##      the links. We kept only high-confidence CRE–gene pairs, either:
##        a) with a high associated rE2G score, or
##        b) supported in multiple cell types (“depth” criterion).
##    - Full details of the strategy are described in:
##      Yosra Berrouayel and Luis del Peso, bioRxiv 2025.07.28.667192v1
##      https://www.biorxiv.org/content/10.1101/2025.07.28.667192v1
##
## 2. Load ReMap2022 ChIP-seq peak sets.
##
## 3. For each ChIP-seq dataset, check overlap between peaks and CREs. If a
##    peak overlaps a CRE, assign the linked gene(s) as potential targets
##    of the corresponding TF experiment. Result: ChIPDB, a list mapping each
##    TF ChIP-seq experiment to its inferred targets.
##    
## 4. Save ChIPDB as an .rda object for package distribution.
##
## ---------------------------------------------------------------------------

library(GenomicRanges)
library(TFEA.ChIP)

# Load ReMap2022 ChIP-seq peaks (list of GRanges objects)
load("data/remap.rdata")

# Load CRE–gene ranges from ENCODE rE2G, CREdb or GeneHancer (GRanges object)
load("data/cre_ranges.rdata")

# Generate the ChIPDB object using makeChIPGeneDB fx (TFEA.ChIP package)
ChIPDB <- makeChIPGeneDB(cre_ranges, remap)

# Save for package inclusion
save(ChIPDB, file = "data/ChIPDB.rda")

