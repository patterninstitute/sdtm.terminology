#' Retrieve CDISC SDTM Controlled Terminology
#'
#' Returns a [tibble][tibble::tibble] of CDISC SDTM controlled terminology,
#' optionally filtered to include only term-level entries, only code list
#' definitions, or both.
#'
#' # Version
#'
#' Controlled terminology data comes from the release dated `r ct_release()`.
#'
#' @param subset One of `"term"`, `"list"`, or `"all"` to specify which part of the
#'   terminology to return.
#'
#' @returns A [tibble][tibble::tibble] containing the requested subset of CDISC
#'   controlled terminology:
#' \describe{
#'   \item{clst_code}{C-code of the code list that the term belongs to.
#'   Identifies the parent code list concept (e.g., \code{C66742} for
#'   Yes/No/Unknown).}
#'
#'   \item{is_clst}{Logical indicator: \code{TRUE} if the row represents a code
#'   list definition; \code{FALSE} if it represents a term within a code list.}
#'
#'   \item{code}{C-code of the concept (either a term or a code list). Each term
#'   and list has a unique NCI Thesaurus concept code (e.g., \code{C49487} for
#'   "Yes").}
#'
#'   \item{term}{Submission value or label for the term (e.g., \code{"Y"},
#'   \code{"TENMW1-Was Walk/Run Performed"}). For code list rows, this may be
#'   the list name.}
#'
#'   \item{ext}{Extensibility of the code list (\code{TRUE}, \code{FALSE}, or
#'   \code{NA}). \code{NA} for term-level rows.}
#'
#'   \item{name}{Name of the code list or term category (e.g.,
#'   \code{"Yes/No/Unknown Response"} or \code{"10-Meter Walk/Run Functional
#'   Test Test Code"}).}
#'
#'   \item{syn}{Synonyms or alternative names for the term, often used in CRF
#'   annotations or mappings.}
#'
#'   \item{def}{Definition or description of the term or code list, taken from
#'   the NCI Thesaurus.}
#'
#'   \item{nci}{Preferred label from the NCI Thesaurus; usually a short
#'   human-readable label for the concept.}
#' }
#'
#' @source \url{https://evs.nci.nih.gov/ftp1/CDISC/SDTM/SDTM%20Terminology.txt}
#'
#' @examples
#' # Return only the terms
#' ct("term")
#'
#' # Return only the code lists
#' ct("list")
#'
#' # Return the full terminology (code lists and individual terms)
#' ct("all")
#'
#' @export
ct <- function(subset = c("term", "list", "all")) {

  subset <- match.arg(arg = subset)
  ct_file <- system.file("extdata/ct.rds", package = pkg_name(), mustWork = TRUE)
  ct <- readRDS(file = ct_file)

  switch (subset,
    "term" = dplyr::filter(ct, !.data$is_clst) |> dplyr::select(-dplyr::all_of(c("is_clst", "ext"))),
    "list" = dplyr::filter(ct, .data$is_clst),
    ct
  )
}

