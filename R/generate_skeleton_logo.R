#' Add together two numbers
#'
#' @param logo_url Url of the .png logo file of the form `"http://logo.com/logo.png"`
#' @param path Path to where the site is. Mus end in /
#' @examples
#' add(1, 1)
#' add(10, 1)

generate_skeleton_logo <- function(
  logo_url,
  path
  ) {
  file_location <- glue::glue("{path}logo-large.png")

  # check png
  if (paste0(".", tools::file_ext(logo_url)) != ".png") stop("logo URL is not a png")
  # check exists
  if (file.exists(file_location)) {
    message(glue::glue("Logo aleady exists at {file_location}"))
    message(glue::glue("Skipping logo download"))
    return()
  }

  download.file(
    url = logo_url,
    destfile = file_location,
    mode = 'wb')
}
