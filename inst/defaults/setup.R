library(dplyr)
library(remotes)

####################### Install R packages

# read YAML
  d_scanme <- yaml::read_yaml("packages.yaml")

# scrape all
  helper_extract_yaml <- function(data){
    tibble::as_tibble(data)
  }

  data_pkgs <- tibble(
    title = character(),
    description = character(),
    website = character(),
    github = character()
  )

  for (i in seq_along(d_scanme)){
    data_pkgs <- helper_extract_yaml(d_scanme[[i]]) %>%
      bind_rows(data_pkgs)
  }

# install from github
  # for(i in 1:nrow(data_pkgs)){
  #   data_i <- data_pkgs %>% slice(i)
  #   remotes::install_git(data_i$github, upgrade = TRUE)
  # }

  # FROM R UNIVERSE
  for(i in 1:nrow(data_pkgs)){
    data_i <- data_pkgs %>% slice(i)
    install.packages(
      data_i$title,
      repos = c(
        "https://pharmaverse.r-universe.dev",
        "https://cloud.r-project.org"),
      type = "source")
  }





