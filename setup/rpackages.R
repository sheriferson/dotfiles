getthese <- c('caret',
              'classInt',
              'DBI',
              'data.table',
              'devtools',
              'doMC',
              'doParallel',
              'dplyr',
              'forecast',
              'ggmap',
              'ggrepel',
              'gridExtra',
              'httr',
              'jsonlite',
              'knitr',
              'languageserver',
              'lintr',
              'lubridate',
              'magrittr',
              'purrr',
              'RColorBrewer',
              'RPostgreSQL',
              'readr',
              'rdoc',
              'rmarkdown',
              'scales',
              'svglite',
              'viridis',
              'zoo'
              )

for (package in getthese) {
  if (package %in% installed.packages()) {
    print(paste(package, 'already installed.'))
  } else {
    install.packages(package, repos = 'https://cloud.r-project.org')
  }
}

# install IRKernel package
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()
