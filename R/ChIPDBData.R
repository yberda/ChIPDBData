#' Retrieve ChIPDB dataset from ExperimentHub
#'
#' This function fetches ChIPDB objects (lists of transcription factor–target 
#' gene associations) for use with the TFEA.ChIP package. Available datasets 
#' include ENCODE, CREDB, and GeneHancer-derived collections.
#'
#' @param name A character string naming the dataset to retrieve.
#'             Options: "ENCODE_rE2G", "ENCODE_rE2G_25", "ENCODE_rE2G_50", "ENCODE_rE2G_75",
#'             "ENCODE_depth_50", "ENCODE_depth_100", "ENCODE_depth_200", "ENCODE_depth_300",
#'             "CREdb", "GeneHancer".
#' @importFrom AnnotationHub query
#' @return A list object of class ChIPDB containing transcription factor–target gene mappings.
#' @examples
#' ChIPDB <- getChIPDB("ENCODE_rE2G")
#' @export
getChIPDB <- function(name = c(
  "ENCODE_rE2G",
  "ENCODE_rE2G_25score",
  "ENCODE_rE2G_50score",
  "ENCODE_rE2G_75score",
  "ENCODE_rE2G_50depth",
  "ENCODE_rE2G_100depth",
  "ENCODE_rE2G_200depth",
  "ENCODE_rE2G_300depth",
  "CREdb",
  "GeneHancer"
)) {
  name <- match.arg(name)

  # Create mapping from friendly names to file paths in ExperimentHub
  file_map <- list(
    ENCODE_rE2G           = "ChIPDBData/data/encode_re2g_object_hg38.rds",
    ENCODE_rE2G_25score   = "ChIPDBData/data/encode_re2g-25_object_hg38.rds",
    ENCODE_rE2G_50score   = "ChIPDBData/data/encode_re2g-5_object_hg38.rds",
    ENCODE_rE2G_75score   = "ChIPDBData/data/encode_re2g-75_object_hg38.rds",
    ENCODE_rE2G_50depth   = "ChIPDBData/data/encode_re2g-50depth_object_hg38.rds",
    ENCODE_rE2G_100depth  = "ChIPDBData/data/encode_re2g-100depth_object_hg38.rds",
    ENCODE_rE2G_200depth  = "ChIPDBData/data/encode_re2g-200depth_object_hg38.rds",
    ENCODE_rE2G_300depth  = "ChIPDBData/data/encode_re2g-300depth_object_hg38.rds",
    CREdb                 = "ChIPDBData/data/credb_object_hg38.rds",
    GeneHancer            = "ChIPDBData/data/genehancer_object_hg38.rds"
  )

  eh <- ExperimentHub::ExperimentHub()
  res <- AnnotationHub::query(eh, file_map[[name]])
  
  if (length(res) == 0) {
    stop("Could not find the dataset in ExperimentHub. Please check the name and ensure the metadata is loaded.")
  }

  return(res[[1]])
}

