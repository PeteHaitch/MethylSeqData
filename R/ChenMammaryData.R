# TODO: Finish and document.
ChenMammaryData <- function(HDF5Array = TRUE) {
  se <- .create_se("chen-brain", assays = c("M", "U"), HDF5Array = HDF5Array)
}
