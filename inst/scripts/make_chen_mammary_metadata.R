write.csv(
  file = "inst/extdata/metadata_chen_mammary.csv",
  data.frame(
    Title = "Chen mouse mammary dataset",
    Description = "Count matrices, rowRanges, and colData in the Chen mouse mammary reduced representation bisulfite-sequencing dataset",
    RDataPath = file.path("MethylSeqData", "chen_mammary", "chen_mammary.h5"),
    BiocVersion = "3.12",
    Genome = "mm10",
    SourceType = "HDF5",
    SourceUrl = "https://doi.org/10.5281/zenodo.1052871",
    SourceVersion = "v1",
    Species = "Mus musculus",
    TaxonomyId = "10090",
    Coordinate_1_based = TRUE,
    DataProvider = "Zenodo",
    Maintainer = "Peter Hickey <peter.hickey@gmail.com>",
    RDataClass = "SummarizedExperiment",
    DispatchClass = "H5File"),
  row.names = FALSE)
