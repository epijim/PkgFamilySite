#' Add together two numbers
#'
#' @param ... This is a wrapper function, see details
#' @return A number.
#' @details Coming soon
#' COming soon
#' @examples
#' add(1, 1)
#' add(10, 1)
#' @export

generate_skeleton <- function(
    ...
    ) {
  # argument checks -----------------------------------------------

  # no default
  if (is.null(list(...)$family_name)) stop("family_name is missing")
  if (is.null(list(...)$family_description)) stop("family_description is missing")
  if (is.null(list(...)$path)) stop("path is missing")
  if (is.null(list(...)$logo_url)) stop("logo_url is missing")

  # inject default - add later...
  if (is.null(list(...)$family_site_url)) {
    message("URL of where this site will be hosted is missing, setting to '/'")
    family_site_url <- "/"
  } else {
    family_site_url <- list(...)$family_site_url
  }

  if (is.null(list(...)$github_link)) {
    message("github_link is missing")
    github_link <- ""
  } else {
    github_link <- list(...)$github_link
  }

  if (is.null(list(...)$google_analytics)) {
    message("google_analytics is missing")
    google_analytics <- ""
  } else {
    google_analytics <- list(...)$google_analytics
  }

  if (is.null(list(...)$packages_yaml_file_path)) {
    message("packages_yaml_file_path is missing so using default")
    packages_yaml_file_path <- system.file("defaults/",package = "PkgFamilySite")
  } else {
    packages_yaml_file_path <- list(...)$packages_yaml_file_path
  }

  # general checks -----------------------------------------------
  if (!file.exists(list(...)$path)) {
    option <- menu(
      c("Yes", "No"),
      title = glue::glue("{list(...)$path} does not exist. Shall I create it?")
      )
    if (option == 1) {
      dir.create(list(...)$path)
    } else {stop("Folder to put site doesn't exist, and you don't want me to make it")}
  }

  if (!endsWith(list(...)$path,"/")) stop("path must end with /")


  # skeleton -----------------------------------------------
  message("Copying fixed files")
  generate_skeleton_defaults(
    path = list(...)$path,
    packages_yaml_file_path = packages_yaml_file_path
  )

  message("Creating quarto yml")
  generate_skeleton_quartoyaml(
    family_name = list(...)$family_name,
    family_description = list(...)$family_description,
    family_site_url = "/",
    github_link = "",
    google_analytics = "",
    path = list(...)$path
  )

  message("Creating index/homepage")
  generate_skeleton_index(
    family_name = list(...)$family_name,
    family_description = list(...)$family_description,
    path = list(...)$path
  )

  message("Pulling logo")
  generate_skeleton_logo(
    logo_url = list(...)$logo_url,
    path = list(...)$path
  )

  message("Generating favicon from logo")
  generate_skeleton_favicon(
    path = list(...)$path
  )
}
