library(GenomicRanges)
library(TFEA.ChIP)

# load remap2022 ChIP-seq peaks
load('data/remap.rdata')
# load CRE ranges
load('data/cre_ranges.rdata')

# generate ChIPDB
ChIPDB <- makeChIPGeneDB(cre_ranges, remap)

# save
save(ChIPDB, 'data/ChIPDB.rdata')
