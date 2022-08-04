#' Add together two numbers
#'
#' @param x A number.
#' @param path Path to where the site is. Mus end in /
#' @return A number.
#' @examples
#' add(1, 1)
#' add(10, 1)

generate_skeleton_index <- function(
  family_name,
  family_description,
  path
  ) {
  file <- glue::glue(
'
---
title: "{family_name}"
description: "{family_description}"
page-layout: full
image: /logo-large.png
resources:
    - "logo-large.png"
---

::: {{.column-page-inset}}
::: {{.column-page-inset-left}}

### What is {family_name}?

{family_description}

### What is this site?

> THIS SECTION WOULD BE DELETED - JUST TO EXPLAIN PoC

This is a PoC - hacked together on a Sunday morning. The only thing the website maintainer needs to
maintain is below.
Everything else (the people, packages and functions pages)
are generated on the fly by scraping the package docs and github repos.

In summary, the places you need to edit are:

* `packages.yaml` - YAML file to list packages in the package family
* `logo-large.yaml` - The logo / image you want to use (will set this to be auto-shrunk into an icon)
* `index.qmd` - The file that rendered this page, where you can put some info on the family.

There is also a blog section (could be disabled).

An example
entry is below for teal.

```yaml
- title: "teal"
  description: |
    Here is some text on teal.
    And this is a new line.
  website: https://insightsengineering.github.io/teal
  github: https://github.com/insightsengineering/teal
```

This site is a fork of https://github.com/ddimmery/quarto-website, the packages
page is almost the same, but functions and people are new.
:::

<div class="column-margin column-container">
![](logo-large.png){{.rounded}}
</div>
:::

{{< pagebreak >}}

::: {{.column-page-inset .text-center}}
```{{=html}}
<a class="btn btn-outline-dark", href="https://github.com/insightsengineering" target="_blank" rel="noopener noreferrer">
    <i class="bi bi-github" role="img" aria-label="Github"></i>
</a>

<a class="btn btn-outline-dark", href="https://www.linkedin.com/in/pharmaverse/" target="_blank" rel="noopener noreferrer">
    <i class="bi bi-linkedin" role="img" aria-label="LinkedIn"></i>
</a>

<a class="btn btn-outline-dark", href="https://pharmaverse.org/" target="_blank" rel="noopener noreferrer">
    <i class="bi bi-windo" role="img" aria-label="pharmaverse"></i>pharmaverse.org
</a>


<!-- <a class="btn btn-outline-dark", href="mailto:" target="_blank" rel="noopener noreferrer"> -->
<!--     <i class="ai bi-envelope" role="img" aria-label="email"></i> -->
<!-- </a> -->
```
:::
'
  )
  readr::write_lines(file,glue::glue("{path}index.qmd"))
}
