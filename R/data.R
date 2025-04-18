#' #' SDTM code lists
#' #'
#' #' [sdtm_code_lists] is a subset of the data provided in provided in
#' #' [sdtm_terminology]. It contains only the terms for code lists from CDISC SDTM
#' #' Terminology.
#' #'
#' #' @format A [tibble][tibble::tibble-package] providing a data set of controlled
#' #'   terms for SDTM code lists.
#' #'
#' #' \describe{
#' #' \item{`code`}{A C-code with a leading character C followed by a sequence of
#' #' digits used for uniquely identifying each concept in NCI Thesaurus (NCIt),
#' #' including all CDISC concepts.}
#' #' \item{`term`}{This is the specific value expected for submissions.}
#' #' \item{`is_extensible`}{Defines if controlled terms may be added to the
#' #' codelist. New terms may be added to existing codelist values when the
#' #' codelist has value `TRUE` as long as the terms are not duplicates or synonyms
#' #' of existing terms. The expectation is that sponsors will use the published
#' #' controlled terminology as a standard baseline and codelists defined as
#' #' extensible may have terms added by the sponsor internally.  For codelists
#' #' with `FALSE` sponsor organizations may not add to the published lists.
#' #' Suggestions for new terms may be requested through the New Term Request
#' #' Page.}
#' #' \item{`cl_name`}{Contains the descriptive name of the codelist.}
#' #' \item{`synonym`}{This identifies the applicable synonyms for the CDISC
#' #' submission value indicated in column `term`. These terms should not be
#' #' submitted, but are included for collection and mapping purposes. Note: this
#' #' is especially important in instances where a test name or parameter test name
#' #' contains a corresponding test code or parameter test code.}
#' #' \item{`definition`}{This identifies the value of an `ALT_DEFINITION` property
#' #' of a CDISC source for a particular concept. In many cases an existing NCI
#' #' definition has been used. The source for a definition is noted in parentheses
#' #' (e.g. NCI, CDISC glossary).}
#' #' \item{`nci_term`}{This identifies the value of a `PREFERRED_NAME` property for
#' #' a concept in NCIt. This column designates the human readable, fully specified
#' #' preferred term corresponding to the NCI C-code, and is especially helpful for
#' #' searching NCIt to get the entire concept with links to all instances of the
#' #' term.}
#' #' }
#' #'
#' #' @seealso
#' #' - [sdtm_terminology] for all terms included in CDISC SDTM Terminology.
#' #' - [sdtm_code_terms] for other terms (excluding code lists).
#' #'
#' #' @source \url{https://evs.nci.nih.gov/ftp1/CDISC/SDTM/}
#' #'
#' #' @examples
#' #' sdtm_code_lists
#' #'
#' "sdtm_code_lists"

#' #' SDTM controlled terms (exclusive of code lists)
#' #'
#' #' [sdtm_code_terms] is a subset of the data provided in provided in
#' #' [sdtm_terminology]. It contains controlled terms from CDISC SDTM
#' #' Terminology, excluding the terms for code lists. Use [sdtm_code_lists]
#' #' instead for terms for code lists only.
#' #'
#' #' @format A [tibble][tibble::tibble-package] providing a data set of controlled
#' #'   terms, excluding terms for code lists.
#' #'
#' #' \describe{
#' #' \item{`cl_code`}{An NCIt C-code assigned to the parent codelist name. This
#' #' code is repeated for each concept (aka permissible value) belonging to a
#' #' codelist.}
#' #' \item{`code`}{A C-code with a leading character C followed by a sequence of
#' #' digits used for uniquely identifying each concept in NCI Thesaurus (NCIt),
#' #' including all CDISC concepts.}
#' #' \item{`term`}{This is the specific value expected for submissions.}
#' #' \item{`synonym`}{This identifies the applicable synonyms for the CDISC
#' #' submission value indicated in column `term`. These terms should not be
#' #' submitted, but are included for collection and mapping purposes. Note: this
#' #' is especially important in instances where a test name or parameter test name
#' #' contains a corresponding test code or parameter test code.}
#' #' \item{`definition`}{This identifies the value of an `ALT_DEFINITION` property
#' #' of a CDISC source for a particular concept. In many cases an existing NCI
#' #' definition has been used. The source for a definition is noted in parentheses
#' #' (e.g. NCI, CDISC glossary).}
#' #' \item{`nci_term`}{This identifies the value of a `PREFERRED_NAME` property for
#' #' a concept in NCIt. This column designates the human readable, fully specified
#' #' preferred term corresponding to the NCI C-code, and is especially helpful for
#' #' searching NCIt to get the entire concept with links to all instances of the
#' #' term.}
#' #' }
#' #'
#' #' @seealso
#' #' - [sdtm_terminology] for all terms included in CDISC SDTM Terminology.
#' #' - [sdtm_code_lists] for terms corresponding to code lists.
#' #'
#' #' @source \url{https://evs.nci.nih.gov/ftp1/CDISC/SDTM/}
#' #'
#' #' @examples
#' #' sdtm_code_terms
#' #'
#' "sdtm_code_terms"
#'
