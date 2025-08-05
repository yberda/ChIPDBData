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

  # Mapping from user-friendly names to EH IDs
  eh_map <- list(
    ENCODE_rE2G          = "EH9847",
    ENCODE_rE2G_25score  = "EH9848",
    ENCODE_rE2G_50score  = "EH9849",
    ENCODE_rE2G_75score  = "EH9850",
    ENCODE_rE2G_50depth  = "EH9851",
    ENCODE_rE2G_100depth = "EH9852",
    ENCODE_rE2G_200depth = "EH9853",
    ENCODE_rE2G_300depth = "EH9854",
    CREdb                = "EH9855",
    GeneHancer           = "EH9856"
  )

  eh_id <- eh_map[[name]]

  if (is.null(eh_id)) {
    stop("Invalid dataset name. See ?getChIPDB for allowed options.")
  }

  eh <- ExperimentHub::ExperimentHub()

  tryCatch({
    obj <- eh[[eh_id]]
    return(obj)
  }, error = function(e) {
    stop("Failed to retrieve the dataset from ExperimentHub. Please ensure your internet connection is active and that the dataset exists.\n\n", conditionMessage(e))
  })
}

