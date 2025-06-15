#' Retrieve ChIPDB dataset from ExperimentHub
#'
#' This function fetches ChIPDB objects (lists of transcription factor–target 
#' gene associations) for use with the TFEA.ChIP package. Available datasets 
#' include ENCODE, CREDB, and GeneHancer-derived collections.
#'
#' @param name A character string naming the dataset to retrieve.
#'             Options:   "ENCODE_rE2G", "ENCODE_rE2G_25score", "ENCODE_rE2G_50score",
#'             "ENCODE_rE2G_75score", "ENCODE_rE2G_50depth", "ENCODE_rE2G_100depth",
#'             "ENCODE_rE2G_200depth", "ENCODE_rE2G_300depth",
#'             "CREdb", "GeneHancer".
#' @return A list object of class ChIPDB containing transcription factor–target gene mappings.
#' @export
#'
#' @examples
#' ChIPDB <- getChIPDB("ENCODE_rE2G_300depth")
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

  file_map <- list(
    ENCODE_rE2G           = "ChIPDBData/records/15667485/files/encode_re2g_object_hg38.rda",
    ENCODE_rE2G_25score   = "ChIPDBData/records/15667485/files/encode_re2g-25_object_hg38.rda",
    ENCODE_rE2G_50score   = "ChIPDBData/records/15667485/files/encode_re2g-5_object_hg38.rda",
    ENCODE_rE2G_75score   = "ChIPDBData/records/15667485/files/encode_re2g-75_object_hg38.rda",
    ENCODE_rE2G_50depth   = "ChIPDBData/records/15667485/files/encode_re2g-50depth_object_hg38.rda",
    ENCODE_rE2G_100depth  = "ChIPDBData/records/15667485/files/encode_re2g-100depth_object_hg38.rda",
    ENCODE_rE2G_200depth  = "ChIPDBData/records/15667485/files/encode_re2g-200depth_object_hg38.rda",
    ENCODE_rE2G_300depth  = "ChIPDBData/records/15667485/files/encode_re2g-300depth_object_hg38.rda",
    CREdb                 = "ChIPDBData/records/15667485/files/credb_object_hg38.rda",
    GeneHancer            = "ChIPDBData/records/15667485/files/genehancer_object_hg38.rda"
  )

  eh <- ExperimentHub::ExperimentHub()
  resource <- file_map[[name]]

  if (is.null(resource)) {
    stop("Invalid dataset name. See ?getChIPDB for allowed options.")
  }

  tryCatch({
    path <- eh[[resource]]
    env <- new.env()
    loaded_names <- load(path, envir = env)

    if (length(loaded_names) != 1) {
      warning("More than one object was loaded; returning the first one: ", loaded_names[1])
    }

    get(loaded_names[1], envir = env)
  }, error = function(e) {
    stop("Failed to retrieve the dataset from ExperimentHub. Please ensure your internet connection is active and that the dataset exists.\n\n", conditionMessage(e))
  })
}

