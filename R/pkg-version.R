#' Get package version
#'
#' [pkg_name()] returns package version
#'
#' @returns Package version as an object of class
#'   [package_version][base::numeric_version].
#'
#' @keywords internal
pkg_version <- function() {
  utils::packageVersion(pkg_name())
}
