#' @importFrom ExperimentHub ExperimentHub
#' @importFrom SummarizedExperiment SummarizedExperiment
#' @importFrom HDF5Array HDF5Array
#' @importFrom rhdf5 h5read
# TODO: Update function name once I've settled on return type.
.create_se <- function(
  dataset,
  assays,
  hub = ExperimentHub(),
  # TODO: Use [context]-[strand] suffix for filenames?
  suffix = NULL,
  HDF5Array = TRUE) {
  host <- file.path("MethylSeqData", dataset)
  if (is.null(suffix)) {
    suffix <- dataset
  }
  h5_fname <- file.path(host, dataset, paste0(suffix, ".h5"))
  # TODO: Is h5_file the path to the local copy of the file?
  h5_file <- hub[hub$rdatapath == h5_fname]

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
    # TODO: seqnames are missing from
    #       `MethylSeqData/rizzardi_hickey_brain/bulk_CpG.h5`
    seqnames = as.vector(rowranges[["seqinfo"]][["seqnames"]]),
    seqlengths = as.vector(rowranges[["seqinfo"]][["seqlengths"]]),
    isCircular = as.vector(rowranges[["seqinfo"]][["isCirculus"]]),
    genome = as.vector(rowranges[["seqinfo"]][["genome"]]))
  rowranges <- GPos(
    seqnames = as.vector(rowranges[["seqnames"]]),
    pos = as.vector(rowranges[["pos"]]),
    srand = as.vector(rowranges[["strand"]]),
    seqinfo = seqinfo)

  # colData
  coldata <- as.data.frame(h5read(h5_file, "colData"))

  # TODO: Return as SE, SCE, ME?
  SummarizedExperiment(
    assays = all_assays,
    rowRanges = rowranges,
    colData = coldata)
}
