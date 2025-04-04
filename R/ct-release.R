#' CDISC SDTM Controlled Terminology Release Date
#'
#' SDTM terminology release date.
#'
#' @returns A [Date][base::Dates] object.
#'
#' @examples
#' ct_release()
#'
#' @export
ct_release <- function() {
  as.Date(as.character(pkg_version()), format = "%Y.%m.%d")
}
