main.data <- data.frame(
  Title = c(
    "ENCODE rE2G complete",
    "ENCODE rE2G greater than 0.25 score",
    "ENCODE rE2G greater than 0.5 score",
    "ENCODE rE2G greater than 0.75 score",
    "ENCODE rE2G greater than 50 depth",
    "ENCODE rE2G greater than 100 depth",
    "ENCODE rE2G greater than 200 depth",
    "ENCODE rE2G greater than 300 depth",
    "CREdb",
    "GeneHancer"
  ),
  
  Description = paste(
    "ChIPDB object for TFEA.ChIP.",
    c(
      rep("Processed rE2G dataset.", 8),
      "Comprehensive database of Cis-Regulatory Elements.",
      "Genome-Wide Integration of Enhancers and Target Genes."
    )
  ),
  
<<<<<<< HEAD
  BiocVersion = rep("3.18", 10),  # Current version, change if needed
  Genome = rep("GRCh38", 10),
  SourceType = rep("RDS", 10),
  
  SourceUrl = c(
    rep("https://zenodo.org/records/15646710", 10)
=======
  BiocVersion = rep("3.22", 10), 
  Genome = rep("GRCh38", 10),
  SourceType = rep("RDA", 10),
  
  SourceUrl = c(
    rep("https://zenodo.org/records/15667485", 10)
>>>>>>> master
  ),
  
  SourceVersion = rep("2024", 10),
  Species = rep("Homo sapiens", 10),
  TaxonomyId = rep("9606", 10),
  Coordinate_1_based = rep(TRUE, 10),
  
  DataProvider = c(
    rep("ENCODE", 8),
    "CREDB",
    "GeneHancer"
  ),
  
  RDataClass = rep("list", 10),
<<<<<<< HEAD
  DispatchClass = rep("Rds", 10),
  
  RDataPath = paste0("ChIPDBData/data/", c(
    "encode_re2g_object_hg38.rds",
    "encode_re2g-25_object_hg38.rds",
    "encode_re2g-5_object_hg38.rds",
    "encode_re2g-75_object_hg38.rds",
    "encode_re2g-50depth_object_hg38.rds",
    "encode_re2g-100depth_object_hg38.rds",
    "encode_re2g-200depth_object_hg38.rds",
    "encode_re2g-300depth_object_hg38.rds",
    "credb_object_hg38.rds",
    "genehancer_object_hg38.rds"
  )),
=======
  DispatchClass = rep("Rda", 10),
  
  Location_Prefix =  c(
    rep("https://zenodo.org/", 10)
  ),
  
  RDataPath = c(
    "records/15667485/files/encode_re2g_object_hg38.rda",
    "records/15667485/files/encode_re2g-25_object_hg38.rda",
    "records/15667485/files/encode_re2g-5_object_hg38.rda",
    "records/15667485/files/encode_re2g-75_object_hg38.rda",
    "records/15667485/files/encode_re2g-50depth_object_hg38.rda",
    "records/15667485/files/encode_re2g-100depth_object_hg38.rda",
    "records/15667485/files/encode_re2g-200depth_object_hg38.rda",
    "records/15667485/files/encode_re2g-300depth_object_hg38.rda",
    "records/15667485/files/credb_object_hg38.rda",
    "records/15667485/files/genehancer_object_hg38.rda"
  ),
>>>>>>> master
  
  Tags = c(
    rep("ChIP-seq,TF,ENCODE", 8),
    "ChIP-seq,TF,CRE",
    "ChIP-seq,TF,Enhancer"
  ),
  
  Maintainer = rep("Yosra Berrouayel <yosraberrouayel@gmail.com>", 10),
  
  stringsAsFactors = FALSE
)

# Save to file
write.csv(main.data, file = "../extdata/metadata.csv", row.names = FALSE)

