# TODO
write.csv(
  file = "../../extdata/metadata_chen_mammary.csv",
  data.frame(
    # Title = sprintf("Wu %s mouse kidney %s",
    #                 rep(c("healthy", "diseased"), each=2),
    #                 rep(c("counts", "colData"), 2)),
    # Description = sprintf("%s for %s in the Wu mouse kidney single-nucleus RNA-seq dataset",
    #                       rep(c("Count matrix", "Per-cell metadata"), 2),
    #                       rep(c("healthy tissue", "fibrotic tissue"), each=2)),
    RDataPath = file.path(
      "MethylSeqData", "chen_mammary",
      # paste0(c("counts-healthy", "coldata-healthy", "counts-disease", "coldata-disease"),
      # ".rds"))
    ),
    BiocVersion = "3.12",
    Genome = "mm10",
    SourceType = "TSV",
    # SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE96612",
    # SourceVersion = c(
    #   "GSE119531_Healthy.combined.dge.txt.gz",
    #   "GSE119531_Healthy.combined.cell.annotation.txt.gz",
    #   "GSE119531_UUO.dge.txt.gz",
    #   "GSE119531_UUO.cell.annotation.txt.gz"
    # ),
    Species = "Mus musculus",
    # TaxonomyId = "10090",
    # Coordinate_1_based = NA,
    # DataProvider = "GEO",
    Maintainer = "Peter Hickey <peter.hickey@gmail.com>",
    # RDataClass = c("dgCMatrix", "data.frame", "dgCMatrix", "data.frame"),
    DispatchClass = "Rds"),
  row.names = FALSE)
