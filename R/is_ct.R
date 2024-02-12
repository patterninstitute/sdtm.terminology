#' Is a code or term in a codelist?
#'
#' [is_code()] and [is_term()] evaluate whether query codes or terms are part of
#' the SDTM controlled terminology within the context of a codelist.
#'
#' @param term A character vector of terms (e.g. `"TENMW102"`).
#' @param code A character vector of C-codes (e.g. `"C174106"`).
#' @param codelist A character vector of codes referring to SDTM terminology
#'   codelists (e.g. `"C141657"`).
#'
#' @returns A `logical` vector, where `TRUE` indicates that `term` is a
#'   controlled terminology term within the `codelist` provided, and `FALSE`,
#'   otherwise.
#'
#' @examples
#' is_term(term = "TENMW101", codelist = "C141657")
#'
#' # Note that the codelist term itself (`"TENMW1TC"`) is not part of its own
#' # codelist (`"C141657"`).
#' is_term(term = "TENMW1TC", codelist = "C141657")
#'
#' # `is_term()` is vectorized over `term` and `codelist`
#' is_term(term = c("TENMW101", "TENMW104"), codelist = "C141657")
#'
#' @export
is_term <- function(term, codelist) {
  code <- term_to_code(term = term, code_list = codelist)
  ! is.na(code)
}

#' @examples
#' is_code(code = "C174106", codelist = "C141657")
#'
#' # Note that the codelist code itself (`"C141657"`) is not part of its own
#' # codelist (`"C141657"`).
#' is_code(code = "C141657", codelist = "C141657")
#'
#' # `is_code()` is vectorized over `code` and `codelist`
#' is_code(code = c("C174106", "C141701"), codelist = "C141657")
#'
#' @rdname is_term
#' @export
is_code <- function(code, codelist) {
  term <- code_to_term(code = code, code_list = codelist)
  ! is.na(term)
}
