#' A simple theme for schematics
#'
#' A simple ggplot2 theme for schematics.  Sometimes a person wants to
#' plot a general curve but without paying particular attention to the
#' axis values.  This is a very stripped back theme that removes axis
#' scale data and tick marks.
#'
#' @importFrom ggplot2 theme_classic theme element_blank
#' @export
theme_schematic <- function() {
    return(theme_classic() +
           theme(axis.ticks=element_blank(),
                 axis.text=element_blank()))
}
