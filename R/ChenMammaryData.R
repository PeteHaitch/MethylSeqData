#' Obtain the Chen mammary data
#'
#' Obtain the mouse mammary reduced representation bisulfite sequencing (RRBS) data from Chen et al. (2017).
#'
#' @param HDF5Array Logical scalar indicating whether the assays should be returned as \linkS4class{HDF5Array} objects or as ordinary \link{matrix} objects.
#'
#' @details
#' The data consists of RRBS methylation profiles of epithelial populations from the mouse mammary gland, with \eqn{n = 2} biological replicates for each of three cell populations.
#' The dataset contains unstranded CpG loci and the counts have not been aggregated by strand.
#'
#' Column metadata include:
#' \itemize{
#'   \item \code{Sample} The sample ID
#'   \item \code{Population} The epithelial population ID
#'   \item \code{Description} The description of the epithelial population
#' }

#' If \code{HDF5Array = TRUE} then the each assay is returned as a \linkS4class{HDF5Array} object.
#' Each \linkS4class{HDF5Array} occupies approximately 2 Kib in memory.

#' If \code{HDF5Array = FALSE} then the each assay is returned as an ordinary \link{matrix} objects.
#' Each matrix occupies approximately 81 MiB in memory.
#'
#' All data are downloaded from ExperimentHub and cached for local re-use.
#' Specific resources can be retrieved by searching for \code{MethylSeqdata/chen_mammary}.
#'
#' @return A \linkS4class{SummarizeExperiment} object with assays containing a matrix of methylated read counts (\code{M}) and a matrix of unmethylated read counts (\code{U}).
#'
#' @author Peter Hickey
#'
#' @references
#' Chen, et al. (2017).
#' Differential methylation analysis of reduced representation bisulfite sequencing experiments using edgeR.
#' \emph{F1000Research} 6, 23-32.
#' \url{https://doi.org/10.12688/f1000research.13196.2}
#'
#' @examples
#' se <- ChenMammaryData()
#'
#' @export
ChenMammaryData <- function(HDF5Array = TRUE) {
  .create_se("chen_mammary", assays = c("M", "U"), HDF5Array = HDF5Array)
}
