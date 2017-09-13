getthese <- c('caret',
              'data.table',
              'devtools',
              'doParallel',
              'dplyr',
              'ggrepel',
              'gridExtra',
              'httr',
              'jsonlite',
              'knitr',
              'lubridate',
              'magrittr',
              'purrr',
              'RColorBrewer',
              'rmarkdown',
              'readr',
              'scales',
              'svglite',
              'zoo'
              )

for (package in getthese) {
  if (package %in% installed.packages()) {
    print(paste(package, 'already installed.'))
  } else {
    install.packages(package, repos = 'https://cloud.r-project.org')
  }
}
