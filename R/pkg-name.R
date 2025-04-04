#' Get package name
#'
#' [pkg_name()] returns package name.
#'
#' @returns Package name as character.
#'
#' @keywords internal
pkg_name <- function() {
  utils::packageName()
}
