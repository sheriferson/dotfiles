getthese <- c('caret',
              'devtools',
              'doParallel',
              'dplyr',
              'httr',
              'jsonlite',
              'knitr',
              'lubridate',
              'magrittr',
              'purrr',
              'RColorBrewer',
              'readr',
              'scales',
              'svglite'
              )

for (package in getthese) {
  if (package %in% installed.packages()) {
    print(paste(package, 'already installed.'))
  } else {
    install.packages(package, repos = 'https://cloud.r-project.org')
  }
}
