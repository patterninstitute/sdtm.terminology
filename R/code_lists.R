get_cl_var <- function(var, extensible = c("any", "yes", "no")) {
  sdtm_code_lists <- sdtm.terminology::sdtm_code_lists
  var <- match.arg(var, choices = names(sdtm_code_lists))
  extensible <- match.arg(extensible)

  if (identical(extensible, "any")) {
    values <- sdtm_code_lists[[var]]
  }

  if (identical(extensible, "yes")) {
    values <-
      dplyr::filter(sdtm_code_lists, sdtm_code_lists$is_extensible) |>
      dplyr::pull(var)
  }

  if (identical(extensible, "no")) {
    values <-
      dplyr::filter(sdtm_code_lists, !sdtm_code_lists$is_extensible) |>
      dplyr::pull(var)
  }

  return(values)
}

#' SDTM terminology codelists' codes
#'
#' [cl_codes()] returns the set of possible codelists' codes.
#'
#' @param extensible Should the returned value be restricted to codelists that
#'   are extensible (`"yes"`), not extensible (`"no"`), or both
#'   (`"any"`).
#'
#' @returns A character vector of codelists' codes.
#'
#' @examples
#' # `cl_codes()` is the same as `cl_codes(extensible = "any")`
#' cl_codes()
#'
#' cl_codes(extensible = "yes")
#'
#' cl_codes(extensible = "no")
#'
#' @export
cl_codes <- function(extensible = c("any", "yes", "no")) {
  get_cl_var("code", extensible = extensible)

}

#' SDTM terminology codelists' terms
#'
#' [cl_terms()] returns the set of possible codelists' terms.
#'
#' @param extensible Should the returned value be restricted to codelists that
#'   are extensible (`"yes"`), not extensible (`"no"`), or both
#'   (`"any"`).
#'
#' @returns A character vector of codelists' terms.
#'
#' @examples
#' # `cl_terms()` is the same as `cl_terms(extensible = "any")`
#' cl_terms()
#'
#' cl_terms(extensible = "yes")
#'
#' cl_terms(extensible = "no")
#'
#' @export
cl_terms <- function(extensible = c("any", "yes", "no")) {
  get_cl_var("term", extensible = extensible)
}

#' SDTM terminology codelists' names
#'
#' [cl_names()] returns the set of possible codelists' names.
#'
#' @param extensible Should the returned value be restricted to codelists that
#'   are extensible (`"yes"`), not extensible (`"no"`), or both
#'   (`"any"`).
#'
#' @returns A character vector of codelists' names.
#'
#' @examples
#' # `cl_names()` is the same as `cl_names(extensible = "any")`
#' cl_names()
#'
#' cl_names(extensible = "yes")
#'
#' cl_names(extensible = "no")
#'
#' @export
cl_names <- function(extensible = c("any", "yes", "no")) {
  get_cl_var("cl_name", extensible = extensible)
}

#' SDTM terminology codelists' synonyms
#'
#' [cl_synonyms()] returns the set of possible codelists' synonyms.
#'
#' @param extensible Should the returned value be restricted to codelists that
#'   are extensible (`"yes"`), not extensible (`"no"`), or both
#'   (`"any"`).
#'
#' @returns A character vector of codelists' synonyms.
#'
#' @examples
#' # `cl_synonyms()` is the same as `cl_synonyms(extensible = "any")`
#' cl_synonyms()
#'
#' cl_synonyms(extensible = "yes")
#'
#' cl_synonyms(extensible = "no")
#'
#' @export
cl_synonyms <- function(extensible = c("any", "yes", "no")) {
  get_cl_var("synonym", extensible = extensible)
}

#' SDTM terminology codelists' definitions
#'
#' [cl_definitions()] returns the set of possible codelists' definitions.
#'
#' @param extensible Should the returned value be restricted to codelists that
#'   are extensible (`"yes"`), not extensible (`"no"`), or both
#'   (`"any"`).
#'
#' @returns A character vector of codelists' definitions.
#'
#' @examples
#' # `cl_definitions()` is the same as `cl_definitions(extensible = "any")`
#' cl_definitions()
#'
#' cl_definitions(extensible = "yes")
#'
#' cl_definitions(extensible = "no")
#'
#' @export
cl_definitions <- function(extensible = c("any", "yes", "no")) {
  get_cl_var("definition", extensible = extensible)
}

#' SDTM terminology codelists' NCIt preferred names.
#'
#' [cl_nci_terms()] returns the set of possible codelists' NCIt preferred names.
#'
#' @param extensible Should the returned value be restricted to codelists that
#'   are extensible (`"yes"`), not extensible (`"no"`), or both
#'   (`"any"`).
#'
#' @returns A character vector of codelists' NCIt preferred names.
#'
#' @examples
#' # `cl_nci_terms()` is the same as `cl_nci_terms(extensible = "any")`
#' cl_nci_terms()
#'
#' cl_nci_terms(extensible = "yes")
#'
#' cl_nci_terms(extensible = "no")
#'
#' @export
cl_nci_terms <- function(extensible = c("any", "yes", "no")) {
  get_cl_var("nci_term", extensible = extensible)
}
