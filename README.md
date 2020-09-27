**NOTE: This is a package created for sourcing all COVID-19 data available
in CSV format at [COVID19-India API](https://api.covid19india.org/) at once.
If I had more time outside of my I could rapidly add features to this library.
For now however, I'm treading at my own pace on weekends. I hope it is
useful to the extent of sourcing all available data on Indian COVID-19 data
at one place with a simple function call.

# indiacovid19data

<!-- badges: start -->
[![Travis build status](https://api.travis-ci.org/anirudhjayaraman/indiacovid19data.svg?branch=master)](https://travis-ci.org/github/anirudhjayaraman/indiacovid19data)
<!-- badges: end -->


This package provides a function to load all available COVID-19 India data
into an R list containing R Data Frames.

## Installation

You can install indiacovid19data like so:

``` r
devtools::install_github("anirudhjayaraman/indiacovid19data")
```

## Quick demo

Binding two factors via `fbind()`:

``` r
library(indiacovid19data)
source_data()
```

