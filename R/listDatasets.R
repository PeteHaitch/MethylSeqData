#' List all available datasets
#'
#' Summary information for all available datasets in the \pkg{MethylSeqData} package.
#'
#' @details
#' A study may contribute multiple datasets if they cannot be reasonably combined (e.g., different sets methylation loci or different species).
#' The reported number of samples refers only to the dataset as it is stored in \pkg{MethylSeqData}; this may be different to the number of samples used by the authors in their analysis, e.g., due to filtering.
#'
#' @return
#' A \linkS4class{DataFrame} where each row corresponds to a dataset, containing the fields:
#' \itemize{
#' \item \code{Reference}, a Markdown-formatted citation to \code{scripts/ref.bib} in the \pkg{MethylSeqData} installation directory.
#' \item \code{Taxonomy}, an identifier for the organism.
#' \item \code{Part}, the part of the organism being studied.
#' \item \code{Number}, the total number of samples in the dataset.
#' \item \code{Call}, the relevant R call required to construct the dataset.
#' }
#'
#' @author Peter Hickey
#'
#' @examples
#' listDatasets()
#'
#' @export
#' @importFrom S4Vectors DataFrame
#' @importFrom utils read.csv
listDatasets <- function() {
  path <- system.file("extdata", "manifest.csv", package = "MethylSeqData")
  DataFrame(read.csv(path, stringsAsFactors=FALSE))
}
