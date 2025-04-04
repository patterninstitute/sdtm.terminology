#' SDTM code to term
#'
#' [code_to_term()] maps SDTM terminology C-codes to respective terms. For
#' mapping codes representing codelists, use [clst_code_to_term()] instead.
#'
#' @param code A C-code with a leading character C followed by a sequence of
#'   digits used for uniquely identifying each concept in NCI Thesaurus (NCIt),
#'   including all CDISC concepts.
#'
#' @param clst_code Parent codelist code.
#'
#' @returns A character vector of SDTM controlled terminology terms. The number
#'   of elements returned matches the number of elements in `code`, i.e. there
#'   is a one-to-one correspondence between input and output. Invalid codes in
#'   `code` are mapped to `NA`.
#'
#' @examples
#' code_to_term(code = "C174106", clst_code = "C141657")
#'
#' # Both `code` and `clst_code` are vectorized. `clst_code` will be recycled
#' # to match `code` number of elements.
#' code_to_term(code = c("C174106", "C141700"), clst_code = "C141657")
#'
#' # You may mix codelists as long as `code` and `clst_code` have the same
#' # number of elements; they will be matched element-wise.
#' code_to_term(
#'   code = c("C174106", "C141700", "C141701"),
#'   clst_code = c("C141657", "C141657", "C141656")
#' )
#'
#' # Invalid codes (e.g. `"C00000"`) map to `NA`.
#' code_to_term(code = c("C174106", "C141700", "C00000"), clst_code = "C141657")
#'
#' @seealso See [term_to_code()] for the inverse operation.
#'
#' @export
code_to_term <- function(code, clst_code) {
  query <- tibble::tibble(code = code, clst_code = clst_code)

  dplyr::left_join(query, ct(), by = c("code", "clst_code")) |>
    dplyr::pull("term")

}

#' SDTM term to code
#'
#' [term_to_code()] maps SDTM terminology terms to respective C-codes. For
#' mapping terms referring to codelists, use [clst_term_to_code()] instead.
#'
#' @param term A SDTM controlled terminology term (as expected in submissions).
#'
#' @param clst_code Parent codelist code.
#'
#' @returns A character vector of SDTM controlled terminology C-codes. The number
#'   of elements returned matches the number of elements in `term`, i.e. there
#'   is a one-to-one correspondence between input and output. Invalid codes in
#'   `term` are mapped to `NA`.
#'
#' @examples
#' term_to_code(term = "TENMW101", clst_code = "C141657")
#'
#' # Both `term` and `clst_code` are vectorized. `clst_code` will be recycled
#' # to match `term` number of elements.
#' term_to_code(term = c("TENMW101", "TENMW102"), clst_code = "C141657")
#'
#' # You may mix codelists as long as `term` and `clst_code` have the same
#' # number of elements; they will be matched element-wise.
#' term_to_code(
#'   term = c("TENMW101", "TENMW102", "TENMW1-Test Grade"),
#'   clst_code = c("C141657", "C141657", "C141656")
#' )
#'
#' # Invalid terms (e.g. `"Gambelas"`) map to `NA`.
#' term_to_code(term = c("TENMW101", "TENMW102", "Gambelas"), clst_code = "C141657")
#'
#' @seealso See [code_to_term()] for the inverse operation.
#'
#' @export
term_to_code <- function(term, clst_code) {
  query <- tibble::tibble(term = term, clst_code = clst_code)
  dplyr::left_join(query, ct(), by = c("term", "clst_code")) |>
    dplyr::pull("code")
}

#' SDTM codelist code to respective term
#'
#' [clst_code_to_term()] maps SDTM terminology codelists' C-codes to respective
#' terms. For mapping codes other than those representing codelists, use
#' [code_to_term()] instead.
#'
#' @param code A C-code with a leading character C followed by a sequence of
#'   digits used for uniquely identifying each SDTM terminology codelist.
#'
#' @returns A character vector of SDTM terms for codelists. The number
#'   of elements returned matches the number of elements in `code`, i.e. there
#'   is a one-to-one correspondence between input and output. Invalid codes in
#'   `code` are mapped to `NA`.
#'
#' @examples
#' clst_code_to_term(code = "C66731")
#'
#' # `code` is vectorized.
#' clst_code_to_term(code = c("C66731", "C66733"))
#'
#' # Invalid codes (e.g. `"C007"`) map to `NA`.
#' clst_code_to_term(code = c("C66731", "C66733", "C007"))
#'
#' @seealso See [clst_term_to_code()] for the inverse operation.
#'
#' @export
clst_code_to_term <- function(code) {
  query <- tibble::tibble(code = code)

  dplyr::left_join(query, ct("list"), by = "code") |>
    dplyr::pull("term")

}

#' SDTM code list term to respective code
#'
#' [clst_term_to_code()] maps SDTM terminology codelists' terms to respective
#' C-codes. For mapping terms other than those representing codelists, use
#' [term_to_code()] instead.
#'
#' @param term A SDTM controlled terminology term referring to a codelist.
#'
#' @returns A character vector of SDTM codes for codelists. The number
#'   of elements returned matches the number of elements in `term`, i.e. there
#'   is a one-to-one correspondence between input and output. Invalid codes in
#'   `term` are mapped to `NA`.
#'
#' @examples
#' clst_term_to_code(term = "SEX")
#'
#' # `term` is vectorized.
#' clst_term_to_code(term = c("SEX", "SIZE"))
#'
#' # Invalid codes (e.g. `"YODA"`) map to `NA`.
#' clst_term_to_code(term = c("SEX", "SIZE", "YODA"))
#'
#' @seealso See [clst_code_to_term()] for the inverse operation.
#'
#' @export
clst_term_to_code <- function(term) {
  query <- tibble::tibble(term = term)
  dplyr::left_join(query, ct("list"), by = "term") |>
    dplyr::pull("code")

}
