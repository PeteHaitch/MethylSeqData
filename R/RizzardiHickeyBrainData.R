#' Obtain the Rizzardi/Hickey brain data
#'
#' Obtain the human brain nuclei whole genome bisulfite sequencing (WGBS) data from Rizzardi, Hickey, et al. (2019).
#'
#' @param context A string specifying the context of the methylation loci to be obtained.
#' @param strand A string specifying the strand of the methylation loci to be obtained.
#' @param HDF5Array Logical scalar indicating whether the assays should be returned as \linkS4class{HDF5Array} objects or as ordinary \link{matrix} objects.
#'
#' @details
#' The data consists of WGBS methylation profiles of neuronal, non-neuronal, and unsorted  nuclei populations from four different regions of the human brain, with \eqn{n = 4 - 9} biological replicates for each condition (i.e. the combination of nuclei population and brain region).
#'
#' Column metadata include:
#' \itemize{
#'   \item \code{donor} The donor ID
#'   \item \code{neun} The nuclei population as determined using fluorescence-activated nuclear sorting based on the neuronal marker NeuN
#'   \itemize{
#'     \item \code{"pos"} Neuronal (NeuN+) nuclei
#'     \item \code{"neg"} Non-neuronal (NeuN-) nuclei
#'     \item \code{"unsorted"} Unsorted nuclei (i.e. including both neuronal (Neun+) and non-neuronal (NeuN-) nuclei in unknown proportions).
#'   }
#'   \item \code{tissue} The brain region
#'   \itemize{
#'     \item \code{"BA9"} Brodmann area 9 (part of the frontal cortex)
#'     \item \code{"BA24"} Brodmann area 9 (part of the anterior cingulate)
#'     \item \code{"HC"} Hippocampus
#'     \item \code{"NAcc"} Nucleus accumbens
#'   }
#' }
#' The majority of donors were matched between sorted and unsorted populations, but not all.
#'
#' Separate datasets are provided for each set of methylation loci:
#' \itemize{
#'   \item CpGs (\code{context = "CpG"}) aggregated by strand \code{strand = "*"})
#'   \item CpAs (\code{context = "CpA"}) on the forward strand (\code{strand = "+"})
#'   \item CpAs (\code{context = "CpA"}) on the reverse strand (\code{strand = "-"})
#'   \item CpTs (\code{context = "CpT"}) on the forward strand (\code{strand = "+"})
#'   \item CpTs (\code{context = "CpT"}) on the reverse strand (\code{strand = "-"})
#' }
#' Data from the unsorted nuclei are not available for the CpA or CpT datasets.
#'
#' If \code{HDF5Array = TRUE} then the each assay is returned as a \linkS4class{HDF5Array} object.
#' Each \linkS4class{HDF5Array} occupies approximately 2 KB in memory.

#' If \code{HDF5Array = FALSE} then the each assay is returned as an ordinary \link{matrix} objects.
#' Each matrix occupies approximately \eqn{6 - 33} GiB in memory (smaller for CpG, larger for CpA and CpT).
#'
#' All data are downloaded from ExperimentHub and cached for local re-use.
#' Specific resources can be retrieved by searching for \code{MethylSeqdata/rizzardi_hickey_brain}.
#'
#' @return A \linkS4class{SummarizeExperiment} object with assays containing a matrix of methylated read counts (\code{M}) and a matrix of unmethylated read counts (\code{U}).
#'
#' @author Peter Hickey
#'
#' @references
#' Rizzardi, Hickey, et al. (2019)
#' Neuronal brain-region-specific DNA methylation and chromatin accessibility are associated with neuropsychiatric trait heritability.
#' \emph{Nature neuroscience} 22(2), 307-316.
#' \url{https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6348048/}
#'
#' @examples
#' se <- RizzardiHickeyBrain()
#'
#' @export
RizzardiHickeyBrain <- function(context = c("CpG", "CpA", "CpT"), strand = c("*", "+", "-"), HDF5Array = TRUE) {
  context <- match.arg(context)
  strand <- match.arg(strand)
  if (context == "CpG" & strand != "*") {
    stop("'strand' must be '*' if 'context' is 'CpG'.")
  }
  if (strand == "*") {
    suffix <- context
  } else {
    suffix <- paste0(context, "_", ifelse(strand == "+", "fwd", "rev"))
  }
  .create_se(
    dataset = "rizzardi_hickey_brain",
    assays = c("M", "Cov"),
    suffix = suffix,
    HDF5Array = HDF5Array)
}
