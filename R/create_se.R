#' @importFrom ExperimentHub ExperimentHub
#' @importFrom SummarizedExperiment SummarizedExperiment
#' @importFrom HDF5Array HDF5Array
#' @importFrom rhdf5 h5read
#' @importFrom GenomeInfoDb Seqinfo
#' @importFrom S4Vectors endoapply
#' @importFrom GenomicRanges GPos GRanges
.create_se <- function(dataset, assays, hub = ExperimentHub(), suffix = NULL, HDF5Array = TRUE) {
  host <- file.path("MethylSeqData", dataset)
  if (is.null(suffix)) {
    suffix <- ""
  } else {
    suffix <- paste0(".", suffix)
  }
  h5_fname <- file.path(host, sprintf("%s%s.h5", dataset, suffix))
  # TODO: Is h5_file the path to the local copy of the file?
  h5_file <- hub[hub$rdatapath == h5_fname][[1]]

  # Assays
  all_assays <- setNames(vector("list", length(assays)), assays)
  for (a in assays) {
    all_assays[[a]] <- HDF5Array(filepath = h5_file, name = a)
  }
  if (!HDF5Array) {
    all_assays <- endoapply(all_assays, as.matrix)
  }

  # rowRanges
  rowranges <- h5read(h5_file, "rowRanges")
  seqinfo <- Seqinfo(
    seqnames = as.vector(rowranges[["seqinfo"]][["seqnames"]]),
    seqlengths = as.vector(rowranges[["seqinfo"]][["seqlengths"]]),
    isCircular = as.vector(rowranges[["seqinfo"]][["isCircular"]]),
    genome = as.vector(rowranges[["seqinfo"]][["genome"]]))
  # rowRanges may be stored as GRanges or a GPos.
  if ("width" %in% names(rowranges)) {
    rowranges <- GRanges(
      seqnames = as.vector(rowranges[["seqnames"]]),
      ranges = IRanges(
        start = as.vector(rowranges[["start"]]),
        width = as.vector(rowranges[["width"]])),
      strand = as.vector(rowranges[["strand"]]),
      seqinfo = seqinfo)
  } else {
    rowranges <- GPos(
      seqnames = as.vector(rowranges[["seqnames"]]),
      pos = as.vector(rowranges[["pos"]]),
      strand = as.vector(rowranges[["strand"]]),
      seqinfo = seqinfo)
  }

  # colData
  coldata <- as.data.frame(h5read(h5_file, "colData"))

  SummarizedExperiment(
    assays = all_assays,
    rowRanges = rowranges,
    colData = coldata)
}
