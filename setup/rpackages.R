getthese <- c(
              'data.table',
              'devtools',
              'dplyr',
              'ggplot2',
              'ggrepel',
              'gridExtra',
              'lubridate',
              'readr',
              'reshape2',
              'svglite'
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
