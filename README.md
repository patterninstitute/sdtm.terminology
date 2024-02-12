
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sdtm.terminology <img src="man/figures/logo.svg" align="right" height="139" alt="" />

<!-- badges: start -->
<!-- badges: end -->

`{sdtm.terminology}` is an R data package providing CDISC SDTM
terminology (release 2023-12-15).

[CDISC SDTM Controlled
Terminology](https://www.cdisc.org/standards/terminology/controlled-terminology)
refers to a standardized set of terms developed by the [Clinical Data
Interchange Standards Consortium (CDISC)](https://www.cdisc.org/)
specifically for use with the [Standard Data Tabulation Model
(SDTM)](https://www.cdisc.org/standards/foundational/sdtm). Controlled
terminology provides a consistent vocabulary for coding various types of
data that are collected during clinical trials. This standardization is
crucial for ensuring that data from different studies, sponsors, and
sites can be understood, compared, and analyzed in a consistent manner.

In addition to supplying SDTM terminology data, this package includes
several utility functions designed to facilitate the conversion between
codes and terms, as well as to verify the association of terms with
specific code lists.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("patterninstitute/sdtm.terminology")
```

## Quick usage example

Convert terms to codes and codes to terms, and determine if a term is
included in a terminology code list:

``` r
# Convert a code list term to respective C-code and back again
cl_term_to_code("UNIT")
#> [1] "C71620"
cl_code_to_term("C71620")
#> [1] "UNIT"

# Are "%" and "%/s" terms from the UNIT code list?
is_term(c("%", "%/s"), cl_term_to_code("UNIT"))
#> [1] TRUE TRUE

# Find "%" and "%/s" codes within C71620 code list.
term_to_code(c("%", "%/s"), "C71620")
#> [1] "C25613"  "C163560"

# It seems "%" is also a term in the VSRESU code list but not "%/s".
is_term(c("%", "%/s"), cl_term_to_code("VSRESU"))
#> [1]  TRUE FALSE

# Or, equivalently, query using codes instead...
is_code(c("C25613", "C163560"), cl_term_to_code("VSRESU"))
#> [1]  TRUE FALSE

# Find which code lists contain the terms "DNA" or "RNA"
match_code_list_from_term(c("DNA", "RNA"))
#> # A tibble: 6 × 4
#>   code    term  cl_code cl_name                                 
#>   <chr>   <chr> <chr>   <chr>                                   
#> 1 C184459 DNA   C101832 Findings About Test Code                
#> 2 C449    DNA   C111114 Genetic Sample Type                     
#> 3 C135409 DNA   C65047  Laboratory Test Code                    
#> 4 C184459 DNA   C163027 Type 1 Diabetes Findings About Test Code
#> 5 C812    RNA   C111114 Genetic Sample Type                     
#> 6 C132301 RNA   C65047  Laboratory Test Code
```

## Data

`{sdtm.terminology}` bundles three data sets:

- `sdtm_terminology`: This is the same data set as provided upstream by
  CDISC, except for variable renaming and conversion of “Yes”/“No”
  values to `TRUE`/`FALSE` values in the `is_extensible` column.
- `sdtm_code_lists`: A subset of `sdtm_terminology` containing only code
  lists.
- `sdtm_code_terms`: A subset of `sdtm_terminology` containing terms
  other than code lists.

## `sdtm_terminology`

``` r
# SDTM controlled terminology version
sdtm_ct_version()
#> $quarter
#> [1] "Q4 2023"
#> 
#> $release
#> [1] "2023-12-15"

# SDTM terminology main data set
sdtm_terminology
#> # A tibble: 40,816 × 8
#>    code    term        cl_code is_extensible cl_name synonym definition nci_term
#>    <chr>   <chr>       <chr>   <lgl>         <chr>   <chr>   <chr>      <chr>   
#>  1 C141657 TENMW1TC    <NA>    FALSE         10-Met… 10-Met… 10-Meter … CDISC F…
#>  2 C174106 TENMW101    C141657 NA            10-Met… TENMW1… 10-Meter … 10-Mete…
#>  3 C141700 TENMW102    C141657 NA            10-Met… TENMW1… 10-Meter … 10-Mete…
#>  4 C147592 TENMW103    C141657 NA            10-Met… TENMW1… 10-Meter … 10-Mete…
#>  5 C141701 TENMW104    C141657 NA            10-Met… TENMW1… 10-Meter … 10-Mete…
#>  6 C141656 TENMW1TN    <NA>    FALSE         10-Met… 10-Met… 10-Meter … CDISC F…
#>  7 C141701 TENMW1-Tes… C141656 NA            10-Met… TENMW1… 10-Meter … 10-Mete…
#>  8 C141700 TENMW1-Tim… C141656 NA            10-Met… TENMW1… 10-Meter … 10-Mete…
#>  9 C174106 TENMW1-Was… C141656 NA            10-Met… TENMW1… 10-Meter … 10-Mete…
#> 10 C147592 TENMW1-Wea… C141656 NA            10-Met… TENMW1… 10-Meter … 10-Mete…
#> # ℹ 40,806 more rows
```

## `sdtm_code_lists`

``` r
# SDTM code lists
sdtm_code_lists
#> # A tibble: 1,081 × 7
#>    code    term          is_extensible cl_name       synonym definition nci_term
#>    <chr>   <chr>         <lgl>         <chr>         <chr>   <chr>      <chr>   
#>  1 C141657 TENMW1TC      FALSE         10-Meter Wal… 10-Met… 10-Meter … CDISC F…
#>  2 C141656 TENMW1TN      FALSE         10-Meter Wal… 10-Met… 10-Meter … CDISC F…
#>  3 C141663 A4STR1TC      FALSE         4-Stair Asce… 4-Stai… 4-Stair A… CDISC F…
#>  4 C141662 A4STR1TN      FALSE         4-Stair Asce… 4-Stai… 4-Stair A… CDISC F…
#>  5 C141661 D4STR1TC      FALSE         4-Stair Desc… 4-Stai… 4-Stair D… CDISC F…
#>  6 C141660 D4STR1TN      FALSE         4-Stair Desc… 4-Stai… 4-Stair D… CDISC F…
#>  7 C115388 SIXMW1TC      FALSE         6 Minute Wal… 6 Minu… 6 Minute … CDISC F…
#>  8 C115387 SIXMW1TN      FALSE         6 Minute Wal… 6 Minu… 6 Minute … CDISC F…
#>  9 C182464 AIMS0101T07OR FALSE         Abnormal Inv… Abnorm… Abnormal … CDISC C…
#> 10 C182465 AIMS0108T09OR FALSE         Abnormal Inv… Abnorm… Abnormal … CDISC C…
#> # ℹ 1,071 more rows
```

## `sdtm_code_terms`

``` r
# SDTM terms (other than code lists)
sdtm_code_terms
#> # A tibble: 39,735 × 6
#>    cl_code code    term                              synonym definition nci_term
#>    <chr>   <chr>   <chr>                             <chr>   <chr>      <chr>   
#>  1 C141657 C174106 TENMW101                          TENMW1… 10-Meter … 10-Mete…
#>  2 C141657 C141700 TENMW102                          TENMW1… 10-Meter … 10-Mete…
#>  3 C141657 C147592 TENMW103                          TENMW1… 10-Meter … 10-Mete…
#>  4 C141657 C141701 TENMW104                          TENMW1… 10-Meter … 10-Mete…
#>  5 C141656 C141701 TENMW1-Test Grade                 TENMW1… 10-Meter … 10-Mete…
#>  6 C141656 C141700 TENMW1-Time to Walk/Run 10 Meters TENMW1… 10-Meter … 10-Mete…
#>  7 C141656 C174106 TENMW1-Was Walk/Run Performed     TENMW1… 10-Meter … 10-Mete…
#>  8 C141656 C147592 TENMW1-Wear Orthoses              TENMW1… 10-Meter … 10-Mete…
#>  9 C141663 C174103 A4STR101                          A4STR1… 4-Stair A… 4-Stair…
#> 10 C141663 C141706 A4STR102                          A4STR1… 4-Stair A… 4-Stair…
#> # ℹ 39,725 more rows
```
