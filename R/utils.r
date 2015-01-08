#' Finds named columns or fields within workspace
#'
#' Finds columns in data frames or entries in lists by name.  Often
#' you want to find a specific named column but can't remember which
#' data frame it was held in.  
#'
#' @param name a character vector of names to find
#' @return a list of objects giving both the object name and its value
#' @export
find_columns <- function(name) {
  result <- list()
  for (o in ls(.GlobalEnv)) {
    obj <- get(o)
    if (!is.null(names(obj))) {
      if (name %in% names(obj)) {
        result <- c(result, list(name=o, object=obj))
      }
    } 
  }
  return(result)
}
  
