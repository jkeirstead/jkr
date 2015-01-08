#' Makes a Monte Carlo sample using Sobol' sequences
#'
#' Generates a Monte Carlo sample using Sobol' low-discrepancy
#' quasi-random sequences. Random sampling with R's standard methods
#' is inefficient for Monte Carlo analysis as the sampled values do
#' not cover the parameter space evenly.  This function allows users
#' to create parameter samples using quasi-random low-discrepancy
#' Sobol' sequences to get around this problem.
#'
#' @param n number of samples to draw
#' 
#' @param vals a list describing distributions.  Each list entry
#' should consist of the following named fields:
#' 
#' \itemize{
#' 
#' \item \code{var} a variable name
#' 
#' \item \code{dist} the distribution name, e.g. 'unif' for Uniform
#' (see R's distribution names)
#' 
#' \item \code{params} a list of distribution parameters.  The list
#' names will vary by distribution.
#' 
#' }
#'
#' @return a data frame with an index column "n" and each distribution
#' in a named column
#'
#' @seealso \url{https://gist.github.com/jkeirstead/1730440}
#' @export
#' @examples {
#' ## Define the distributions
#' vals <- list(list(var="Uniform",
#'               dist="unif",
#'               params=list(min=0,max=1)),
#'          list(var="Normal",
#'               dist="norm",
#'               params=list(mean=0,sd=1)),
#'          list(var="Weibull",
#'               dist="weibull",
#'               params=list(shape=2,scale=1)))
#' 
#' ## Generate 100 samples
#' samp <- make_MC_sample(100, vals)
#' }
#' 
#' @importFrom randtoolbox sobol
make_MC_sample <- function(n, vals) {
 
  # Generate a Sobol' sequence
  sob <- sobol(n, length(vals))
 
  # Fill a matrix with the values inverted from uniform values to
  # distributions of choice
  samp <- matrix(rep(0, n*(length(vals) + 1)), nrow=n)
  samp[,1] <- 1:n
  for (i in 1:length(vals)) {
    l <- vals[[i]]
    dist <- l$dist
    params <- l$params
    fname <- paste("q", dist, sep="")
    samp[,i+1] <- do.call(fname, c(list(p=sob[,i]), params))
  }
 
  # Convert matrix to data frame and add labels
  samp <- as.data.frame(samp)
  names(samp) <- c("n", lapply(vals, function(l) l$var))
  return(samp)
}
