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
