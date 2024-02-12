#' SDTM controlled terminology version
#'
#' [sdtm_ct_version()] returns the version of the SDTM controlled terminology
#' data that this package is built upon.
#'
#' @returns A list of two strings:
#' \describe{
#' \item{`quarter`}{Quarter.}
#' \item{`release`}{Release date.}
#' }
#'
#' @examples
#' sdtm_ct_version()
#'
#' @export
sdtm_ct_version <- function() {
  list(
    quarter = "Q4 2023",
    release = "2023-12-15"
  )
}
