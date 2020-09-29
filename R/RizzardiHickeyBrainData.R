# TODO: Document
RizzardiHickeyBrain <- function(context = c("CpG", "CpA", "CpT"), strand = NULL, HDF5Array = TRUE) {
  context <- match.arg(context)
  if (context == "CpG" & !is.null(strand)) {
    stop("'strand' must be NULL if 'context' is 'CpG'.")
  }
  if (is.null(strand)) {
    suffix <- context
  } else {
    suffix <- paste0(context, "_", strand)
  }
  .create_se(
    "rizzardi_hickey_brain",
    assays = c("M", "Cov"),
    suffix = suffix,
    HDF5Array = HDF5Array,)
}
