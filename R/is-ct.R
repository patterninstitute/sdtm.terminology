#' Is a code or term in a code list?
#'
#' [is_code()] and [is_term()] evaluate whether query codes or terms are part of
#' the SDTM controlled terminology within the context of a code list.
#'
#' @param term A character vector of terms (e.g. `"TENMW102"`).
#' @param code A character vector of C-codes (e.g. `"C174106"`).
#' @param clst_code A character vector of codes referring to SDTM terminology
#'   codelists (e.g. `"C141657"`).
#'
#' @returns A `logical` vector, where `TRUE` indicates that `term` is a
#'   controlled terminology term within the `clst_code` provided, and `FALSE`,
#'   otherwise.
#'
#' @examples
#' is_term(term = "TENMW101", clst_code = "C141657")
#'
#' # Note that the clst_code term itself (`"TENMW1TC"`) is not part of its own
#' # code list (`"C141657"`).
#' is_term(term = "TENMW1TC", clst_code = "C141657")
#'
#' # `is_term()` is vectorized over `term` and `clst_code`
#' is_term(term = c("TENMW101", "TENMW104"), clst_code = "C141657")
#'
#' @export
is_term <- function(term, clst_code) {
  code <- term_to_code(term = term, clst_code = clst_code)
  ! is.na(code)
}

#' @examples
#' is_code(code = "C174106", clst_code = "C141657")
#'
#' # Note that the code list code itself (`"C141657"`) is not part of its own
#' # code list (`"C141657"`).
#' is_code(code = "C141657", clst_code = "C141657")
#'
#' # `is_code()` is vectorized over `code` and `clst_code`
#' is_code(code = c("C174106", "C141701"), clst_code = "C141657")
#'
#' @rdname is_term
#' @export
is_code <- function(code, clst_code) {
  term <- code_to_term(code = code, clst_code = clst_code)
  ! is.na(term)
}
