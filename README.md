# indiacovid19data

<!-- badges: start -->
[![Travis build status](https://api.travis-ci.org/anirudhjayaraman/indiacovid19data.svg?branch=master)](https://travis-ci.org/github/anirudhjayaraman/indiacovid19data)
[![Build status](https://ci.appveyor.com/api/projects/status/r66r2qbm5o1kco26/branch/master?svg=true)](https://ci.appveyor.com/project/anirudhjayaraman/indiacovid19data-x19vb/branch/master)
<!-- badges: end -->


This package provides a function to load all CSV data available  at 
[COVID19-India API](https://api.covid19india.org/) at once in your R environment.
The data sets are loaded into an R list of R Data Frames.

## Installation

You can install indiacovid19data like so:

``` r
devtools::install_github("anirudhjayaraman/indiacovid19data")
```

## Quick demo

In order to store the data:

``` r
library(indiacovid19data)
covid_datasets_india <- source_data()
```

In order see which data sets are available:
```r
names(covid_datasets_inda)
```

For example, if you want the case_time_series data set:
```r
case_time_series <- covid_datasets$case_time_series
View(case_time_series)
```

