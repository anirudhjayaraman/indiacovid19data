#' Funciton to source Covid-19 India datasets from the COVID-19 India API
#'
#' @note This function does not require any parameters to be passed.
#'
#' @import magrittr
#' @import stringr
#' @import data.table
#'
#' @return this function returns a list of data-sets sourced from
#' \url{https://api.covid19india.org/csv/latest/}
source_data <- function(){
  # Required Libraries ========================================================
  requireNamespace("magrittr")
  requireNamespace("stringr")
  requireNamespace("data.table")
  # ===========================================================================
  # COVID 19-India API: A volunteer-driven, crowdsourced database
  # for COVID-19 stats & patient tracing in India
  # ===========================================================================

  url <- "https://api.covid19india.org/documentation/csv/"

  # List out all CSV files to source ------------------------------------------

  html <- url %>% readLines %>% paste(collapse = "\n")

  # pattern for urls containing csv files
  pattern <- "https://api.covid19india.org/csv/latest/.*csv"

  # Minor hack in pattern to provide so as to parse links correctly
  modified_pattern <- paste0(">", pattern)

  # URLs with CSVs are stored in `matched`
  matched <- html %>%
    str_match_all(pattern = modified_pattern) %>%
    unlist %>%
    substring(first = 2)

  # Downloading the Data ------------------------------------------------------

  covid_datasets <- vector("list", length = length(matched))

  for (i in 1:length(matched)) {
    covid_datasets[[i]] <- tryCatch(fread(matched[i]), error = function(e) NA)
  }

  # Naming the data objects appropriately -------------------------------------

  exclude_chars <- "https://api.covid19india.org/csv/latest/"

  dataset_names <- substr(x = matched,
                          start = 1 + nchar(exclude_chars),
                          stop = nchar(matched)- nchar(".csv"))

  names(covid_datasets) <- dataset_names

  return(covid_datasets)
}
