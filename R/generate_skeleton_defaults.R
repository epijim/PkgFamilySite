#' Add together two numbers
#'
#' @param packages_yaml_file_path Path to the packages.yaml file
#' @param path Path to where the site is. Mus end in /
#' @return A number.
#' @examples
#' add(1, 1)
#' add(10, 1)

generate_skeleton_defaults <- function(
  packages_yaml_file_path = system.file("defaults/",package = "PkgFamilySite"),
  path
  ) {
  file.copy(glue::glue("{packages_yaml_file_path}/"), path, recursive = TRUE)
}
