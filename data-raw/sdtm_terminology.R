library(tidyverse)

col_types <-
  cols(
    Code = col_character(),
    `Codelist Code` = col_character(),
    `Codelist Extensible (Yes/No)` = col_character(),
    `Codelist Name` = col_character(),
    `CDISC Submission Value` = col_character(),
    `CDISC Synonym(s)` = col_character(),
    `CDISC Definition` = col_character(),
    `NCI Preferred Term` = col_character()
  )

ct <-
  readr::read_tsv(here::here("data-raw", "SDTM Terminology.tar.xz"), col_types = col_types) |>
  dplyr::rename(
    code = Code,
    clst_code = `Codelist Code`,
    ext = `Codelist Extensible (Yes/No)`,
    name = `Codelist Name`,
    term = `CDISC Submission Value`,
    syn = `CDISC Synonym(s)`,
    def = `CDISC Definition`,
    nci = `NCI Preferred Term`
  ) |>
  dplyr::mutate(
    ext = dplyr::case_when(
      ext == "No" ~ FALSE,
      ext == "Yes" ~ TRUE,
      .default = NA
    )
  ) |>
  dplyr::relocate(term, .after = "code") |>
  dplyr::mutate(is_clst = is.na(clst_code), .before = 1L) |>
  dplyr::relocate("clst_code", .before = 1L) |>
  dplyr::mutate(clst_code = dplyr::coalesce(.data$clst_code, .data$code))

readr::write_rds(x = ct, file = "inst/extdata/ct.rds", compress = "xz")
