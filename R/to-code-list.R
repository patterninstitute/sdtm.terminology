#' Match code lists
#'
#' @description
#' [match_code_list_from_term()] takes terms as queries to look for associated
#' code lists.
#'
#' [match_code_list_from_code()] does the same starting from
#' C-codes.
#'
#' Note that both mappings are potentially one to many as the same code
#' or term may associate with more than one code list.
#'
#' @param term A character vector of SDTM terminology terms.
#' @param code A character vector of SDTM terminology C-codes.
#'
#' @returns A [tibble][tibble::tibble-package] with at least as many rows as
#' there are elements in `term`, but potentially more because of one-to-many
#' mappings. The returned tibble comprises three columns:
#' \describe{
#' \item{`code`}{An SDTM terminology code (e.g. `"C141701"`).}
#' \item{`term`}{An SDTM terminology term (e.g. `"TENMW104"`).}
#' \item{`clst_code`}{The code of the associated code list.}
#' }
#'
#' @examples
#' # Find code lists where "DNA" and "RNA" are used.
#' match_code_list_from_term(c("DNA", "RNA"))
#'
#' # Find code lists where "Yes"/"No" terms are controlled vocabulary.
#' match_code_list_from_term(c("Yes", "No"))
#'
#' @export
match_code_list_from_term <- function(term) {

  query <- tibble::tibble(term = term)

  dplyr::left_join(query, ct(), by = "term") |>
    dplyr::select(c("code", "term", "clst_code"))

}

#' @examples
#' # C163560 is found in code list C71620.
#' match_code_list_from_code("C163560")
#'
#' # C25613 however is mapped to many code lists.
#' match_code_list_from_code("C25613")
#'
#' # Unmappable codes or terms map to `NA`.
#' match_code_list_from_code("Yoda")
#' match_code_list_from_term("R2D2")
#'
#' # Codes for code lists are for all intents and purposes not mappable to
#' # parent code lists.
#' match_code_list_from_code(code = "C141657")
#'
#' @rdname match_code_list_from_term
#' @export
match_code_list_from_code <- function(code) {

  query <- tibble::tibble(code = code)
  dplyr::left_join(query, ct(), by = "code") |>
    dplyr::select(c("code", "term", "clst_code"))
}
