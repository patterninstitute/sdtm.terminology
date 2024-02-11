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

sdtm_terminology <-
  readr::read_tsv(here::here("data-raw", "SDTM Terminology.tar.xz"), col_types = col_types) |>
  dplyr::rename(
    code = Code,
    cl_code = `Codelist Code`,
    is_extensible = `Codelist Extensible (Yes/No)`,
    cl_name = `Codelist Name`,
    term = `CDISC Submission Value`,
    synonym = `CDISC Synonym(s)`,
    definition = `CDISC Definition`,
    nci_term = `NCI Preferred Term`
  ) |>
  dplyr::mutate(
    is_extensible = dplyr::case_when(
      is_extensible == "No" ~ FALSE,
      is_extensible == "Yes" ~ TRUE,
      .default = NA
    )
  ) |>
  dplyr::relocate(term, .after = "code")

sdtm_code_lists <-
  sdtm_terminology |>
  dplyr::filter(is.na(cl_code)) |>
  dplyr::select(-"cl_code")

sdtm_code_terms <-
  sdtm_terminology |>
  dplyr::filter(!is.na(cl_code)) |>
  dplyr::relocate(cl_code, .before = 1L) |>
  dplyr::select(-c("is_extensible", "cl_name"))

usethis::use_data(sdtm_terminology, overwrite = TRUE, compress = "xz")
usethis::use_data(sdtm_code_lists, overwrite = TRUE, compress = "xz")
usethis::use_data(sdtm_code_terms, overwrite = TRUE, compress = "xz")
