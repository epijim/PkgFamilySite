#' Add together two numbers
#'
#' @param family_name The name of this family of packages.
#' @param family_description Description of this family of packages.
#' @param family_site_url What link will this site be on.
#' @param github_link What is the link to the github repo (or github organisation)
#' @param google_analytics GA-XXXXXX number.
#' @param path Path to where the site is. Mus end in /
#' @return A number.
#' @examples
#' add(1, 1)
#' add(10, 1)

generate_skeleton_quartoyaml <- function(
    family_name,
    family_description,
    family_site_url = "/",
    github_link = "",
    google_analytics = "",
    path

){

### Quarto --------------------------------
  glue::glue(
'
project:
  type: website
output-dir: _site

website:
  title: "{family_name}"
description: "{family_description}"
site-url: {family_site_url}
  repo-url: {github_link}
google-analytics: "{google_analytics}"
open-graph: true
favicon: favicon.png
card-style: "summary_large_image"
search:
  location: navbar
type: overlay
navbar:
  background: dark
foreground: light
left:
  - href: index.qmd
text: Home
- href: packages.qmd
- href: functions.qmd
- href: people.qmd
- href: blog.qmd

format:
  html:
  theme: journal
css: styles.css
toc: true
toc-depth: 4
toc-title: "Contents"
html-math-method: katex
include-in-header:
  - includes.html
highlight-style: tango
') %>% readr::write_lines(glue::glue("{path}_quarto.yml"))
}
