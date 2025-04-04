
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sdtm.terminology <img src="man/figures/logo-wo-fonts.svg" align="right" height="139" alt="" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/patterninstitute/sdtm.terminology/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/patterninstitute/sdtm.terminology/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/sdtm.terminology)](https://CRAN.R-project.org/package=sdtm.terminology)
<!-- badges: end -->

`{sdtm.terminology}` is an R data package providing CDISC SDTM
terminology.

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
# install.packages("pak")
pak::pak("patterninstitute/sdtm.terminology")
```

## Version

The current controlled terminology release bundled with this package is:

``` r
# SDTM controlled terminology version
ct_release()
#> [1] "2025-03-25"
```

## SDTM terms

``` r
# SDTM terms (other than code lists)
ct()
#> # A tibble: 43,698 × 7
#>    clst_code code    term                              name    syn   def   nci  
#>    <chr>     <chr>   <chr>                             <chr>   <chr> <chr> <chr>
#>  1 C141657   C174106 TENMW101                          10-Met… TENM… 10-M… 10-M…
#>  2 C141657   C141700 TENMW102                          10-Met… TENM… 10-M… 10-M…
#>  3 C141657   C147592 TENMW103                          10-Met… TENM… 10-M… 10-M…
#>  4 C141657   C141701 TENMW104                          10-Met… TENM… 10-M… 10-M…
#>  5 C141656   C141701 TENMW1-Test Grade                 10-Met… TENM… 10-M… 10-M…
#>  6 C141656   C141700 TENMW1-Time to Walk/Run 10 Meters 10-Met… TENM… 10-M… 10-M…
#>  7 C141656   C174106 TENMW1-Was Walk/Run Performed     10-Met… TENM… 10-M… 10-M…
#>  8 C141656   C147592 TENMW1-Wear Orthoses              10-Met… TENM… 10-M… 10-M…
#>  9 C141663   C174103 A4STR101                          4-Stai… A4ST… 4-St… 4-St…
#> 10 C141663   C141706 A4STR102                          4-Stai… A4ST… 4-St… 4-St…
#> # ℹ 43,688 more rows
```

## Code lists

``` r
# SDTM code lists
ct("list")
#> # A tibble: 1,158 × 9
#>    clst_code is_clst code    term          ext   name          syn   def   nci  
#>    <chr>     <lgl>   <chr>   <chr>         <lgl> <chr>         <chr> <chr> <chr>
#>  1 C141657   TRUE    C141657 TENMW1TC      FALSE 10-Meter Wal… 10-M… 10-M… CDIS…
#>  2 C141656   TRUE    C141656 TENMW1TN      FALSE 10-Meter Wal… 10-M… 10-M… CDIS…
#>  3 C141663   TRUE    C141663 A4STR1TC      FALSE 4-Stair Asce… 4-St… 4-St… CDIS…
#>  4 C141662   TRUE    C141662 A4STR1TN      FALSE 4-Stair Asce… 4-St… 4-St… CDIS…
#>  5 C141661   TRUE    C141661 D4STR1TC      FALSE 4-Stair Desc… 4-St… 4-St… CDIS…
#>  6 C141660   TRUE    C141660 D4STR1TN      FALSE 4-Stair Desc… 4-St… 4-St… CDIS…
#>  7 C115388   TRUE    C115388 SIXMW1TC      FALSE 6 Minute Wal… 6 Mi… 6 Mi… CDIS…
#>  8 C115387   TRUE    C115387 SIXMW1TN      FALSE 6 Minute Wal… 6 Mi… 6 Mi… CDIS…
#>  9 C182464   TRUE    C182464 AIMS0101T07OR FALSE Abnormal Inv… Abno… Abno… CDIS…
#> 10 C182465   TRUE    C182465 AIMS0108T09OR FALSE Abnormal Inv… Abno… Abno… CDIS…
#> # ℹ 1,148 more rows
```

## Full SDTM terminology

``` r
# SDTM terminology individual terms and code list terms.
ct("all")
#> # A tibble: 44,856 × 9
#>    clst_code is_clst code    term                  ext   name  syn   def   nci  
#>    <chr>     <lgl>   <chr>   <chr>                 <lgl> <chr> <chr> <chr> <chr>
#>  1 C141657   TRUE    C141657 TENMW1TC              FALSE 10-M… 10-M… 10-M… CDIS…
#>  2 C141657   FALSE   C174106 TENMW101              NA    10-M… TENM… 10-M… 10-M…
#>  3 C141657   FALSE   C141700 TENMW102              NA    10-M… TENM… 10-M… 10-M…
#>  4 C141657   FALSE   C147592 TENMW103              NA    10-M… TENM… 10-M… 10-M…
#>  5 C141657   FALSE   C141701 TENMW104              NA    10-M… TENM… 10-M… 10-M…
#>  6 C141656   TRUE    C141656 TENMW1TN              FALSE 10-M… 10-M… 10-M… CDIS…
#>  7 C141656   FALSE   C141701 TENMW1-Test Grade     NA    10-M… TENM… 10-M… 10-M…
#>  8 C141656   FALSE   C141700 TENMW1-Time to Walk/… NA    10-M… TENM… 10-M… 10-M…
#>  9 C141656   FALSE   C174106 TENMW1-Was Walk/Run … NA    10-M… TENM… 10-M… 10-M…
#> 10 C141656   FALSE   C147592 TENMW1-Wear Orthoses  NA    10-M… TENM… 10-M… 10-M…
#> # ℹ 44,846 more rows
```

## Crosswalks

Convert terms to codes and codes to terms, and determine if a term is
included in a terminology code list:

``` r
# Convert a code list term to respective C-code and back again
clst_term_to_code("UNIT")
#> [1] "C71620"
```

``` r
clst_code_to_term("C71620")
#> [1] "UNIT"
```

``` r
# Are "%" and "%/s" terms from the UNIT code list?
is_term(c("%", "%/s"), clst_term_to_code("UNIT"))
#> [1] TRUE TRUE
```

``` r
# Find "%" and "%/s" codes within C71620 code list.
term_to_code(c("%", "%/s"), "C71620")
#> [1] "C25613"  "C163560"
```

``` r
# It seems "%" is also a term in the VSRESU code list but not "%/s".
is_term(c("%", "%/s"), clst_term_to_code("VSRESU"))
#> [1]  TRUE FALSE
```

``` r
# Or, equivalently, query using codes instead...
is_code(c("C25613", "C163560"), clst_term_to_code("VSRESU"))
#> [1]  TRUE FALSE
```

``` r
# Find which code lists contain the terms "DNA" or "RNA"
match_code_list_from_term(c("DNA", "RNA"))
#> # A tibble: 6 × 3
#>   code    term  clst_code
#>   <chr>   <chr> <chr>    
#> 1 C184459 DNA   C101832  
#> 2 C449    DNA   C111114  
#> 3 C135409 DNA   C65047   
#> 4 C184459 DNA   C163027  
#> 5 C812    RNA   C111114  
#> 6 C132301 RNA   C65047
```

``` r
# Round trip from terms to codes to parent code list codes...
match_code_list_from_code(term_to_code(c("%", "%/s"), "C71620"))
#> # A tibble: 4 × 3
#>   code    term  clst_code
#>   <chr>   <chr> <chr>    
#> 1 C25613  %     C85494   
#> 2 C25613  %     C71620   
#> 3 C25613  %     C66770   
#> 4 C163560 %/s   C71620
```
