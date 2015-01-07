#' Converts a character vector to readable prose
#'
#' Converts a character vector to a prose list.  Often when working
#' with reproducible reports, a user will want to print a list of
#' character values but needs to respect English grammar: for example,
#' \code{"dog", "cat", "mouse"} should be rendered as "dog, cat and
#' mouse".
#'
#' @seealso https://gist.github.com/jkeirstead/48bf5845b235dc7a8d5a
#' @param vals a character vector 
#' @param oxford a boolean indicating whether Oxford comma should be
#' used.  If true a comma is placed before the \code{and} word.
#' @param and word before penultimate entry.  Default = "and"
#' @return a character of length one
#' @export
prose_vector <- function(vals, oxford=FALSE, and="and") {
    if (length(vals)>1) {
        start <- head(vals, -1)
        start <- paste0(start, collapse=", ")
        end <- tail(vals, 1)
        return(paste0(start, ifelse(oxford, ", ", " "), and, " ", end))
    } else {
        return(vals)
    }
}

#' Converts a model formula to LaTeX code
#'
#' Converts the formula of a model object to LaTeX code for use in a
#' knitr report or similar.
#' 
#' @param model a model object
#' @param mathmode boolean indicating whether the formula will be
#' displayed in math mode.  Default = false.
#' @return a character string formatted for LaTeX (with knitr,
#' i.e. multiple escapes).  Users can add mathmode or texttt as they
#' wish from knitr.
#' @export
lm_to_latex <- function(model, mathmode=FALSE) {
    f <- deparse(formula(model))

    if (mathmode) {
        f <- gsub("(.*)_(.*)", "\\1_{\\2}", f)
        f <- gsub("~", "\\\\sim", f)        
    } else {
        f <- gsub("_", "\\\\_", f)
        f <- gsub("~", "\\\\ensuremath{\\\\sim}", f)        
    }
    
    return(f)
}

