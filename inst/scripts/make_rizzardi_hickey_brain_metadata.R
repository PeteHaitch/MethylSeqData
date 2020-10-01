write.csv(
  file = "inst/extdata/metadata_rizzardi_hickey_brain.csv",
  data.frame(
    Title = sprintf(
      "Rizzardi/Hickey human brain dataset for %s loci %s.",
      c("CpG", "CpA", "CpA", "CpT", "CpT"),
      c("aggregated by strand", "on the forward strand", "on the reverse strand", "on the forward strand", "on the reverse strand")),
    Description =
      sprintf(
        "Count matrices, rowRanges, and colData in the Rizzardi/Hickey human brain whole genome bisulfite-sequencing dataset for %s loci %s.",
        c("CpG", "CpA", "CpA", "CpT", "CpT"),
        c("aggregated by strand", "on the forward strand", "on the reverse strand", "on the forward strand", "on the reverse strand")),
    RDataPath = file.path(
      "MethylSeqData",
      "rizzardi_hickey_brain",
      paste0(
        "rizzardi_hickey_brain.",
        c("CpG", "CpA_fwd", "CpA_rev", "CpT_fwd", "CpT_rev"),
        ".h5")),
    BiocVersion = "3.12",
    Genome = "hg19",
    SourceType = "HDF5",
    SourceUrl = "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE96nnn/GSE96612/suppl/",
    SourceVersion = "v1",
    Species = "Homo sapiens",
    TaxonomyId = "9606",
    Coordinate_1_based = TRUE,
    DataProvider = "GEO",
    Maintainer = "Peter Hickey <peter.hickey@gmail.com>",
    RDataClass = "SummarizedExperiment",
    DispatchClass = "H5File"),
  row.names = FALSE)
