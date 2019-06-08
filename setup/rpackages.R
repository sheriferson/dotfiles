getthese <- c('caret',
              'classInt',
              'data.table',
              'devtools',
              'doParallel',
              'dplyr',
              'forecast',
              'ggmap',
              'ggrepel',
              'gridExtra',
              'httr',
              'jsonlite',
              'knitr',
              'lubridate',
              'magrittr',
              'purrr',
              'RColorBrewer',
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
