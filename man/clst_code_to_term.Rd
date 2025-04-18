% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/code-to-term.R
\name{clst_code_to_term}
\alias{clst_code_to_term}
\title{SDTM codelist code to respective term}
\usage{
clst_code_to_term(code)
}
\arguments{
\item{code}{A C-code with a leading character C followed by a sequence of
digits used for uniquely identifying each SDTM terminology codelist.}
}
\value{
A character vector of SDTM terms for codelists. The number
of elements returned matches the number of elements in \code{code}, i.e. there
is a one-to-one correspondence between input and output. Invalid codes in
\code{code} are mapped to \code{NA}.
}
\description{
\code{\link[=clst_code_to_term]{clst_code_to_term()}} maps SDTM terminology codelists' C-codes to respective
terms. For mapping codes other than those representing codelists, use
\code{\link[=code_to_term]{code_to_term()}} instead.
}
\examples{
clst_code_to_term(code = "C66731")

# `code` is vectorized.
clst_code_to_term(code = c("C66731", "C66733"))

# Invalid codes (e.g. `"C007"`) map to `NA`.
clst_code_to_term(code = c("C66731", "C66733", "C007"))

}
\seealso{
See \code{\link[=clst_term_to_code]{clst_term_to_code()}} for the inverse operation.
}
