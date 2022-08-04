#' Add together two numbers
#'
#' @param x A number.
#' @param path Path to where the site is. Mus end in /
#' @return A number.
#' @examples
#' add(1, 1)
#' add(10, 1)
#' @export

generate_skeleton_favicon <- function(
    path
){
  if (!file.exists(glue::glue("{path}logo-large.png"))) stop("logo-large.png missing")
  img <- magick::image_read(glue::glue("{path}logo-large.png"))
  img <- magick::image_scale(img,'80x80')
  magick::image_write(img,glue::glue("{path}favicon.png"))
}
