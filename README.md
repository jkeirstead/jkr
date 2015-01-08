# jkr

This is an R package containing some commonly used functions and variable definitions.  The idea is that students and other collaborators can just install the package and my code should work on their systems.

## Installation

The package can be installed directly from the R command line using `devtools`:

    # install.packages("devtools")
    library(devtools)
    install_github("jkeirstead/jkr")
    library(jkr)

## Features

* **Plotting**: `theme_schematic()` is a ggplot2 theme for simple plots.  `jkcolours` is a list of named colours that I frequently use in plots.

* **Modelling** `make_MC_sample()` for efficient Monte Carlo
  sample generation with Sobol' sequences based on this earlier [Gist](https://gist.github.com/jkeirstead/1730440) and [blog post](http://www.jameskeirstead.ca/blog/sampling-for-monte-carlo-simulations-with-r/).

* **Strings**: provides `lm_to_latex()` and `prose_vector()` for
  formatting objects for knitr reports.  For example:

        # Nicely formatted lists of characters
        > animals <- c("dog", "cat", "mouse")
        > prose_vector(animals)
        [1] "dog, cat and mouse"
        # Nicely formatted model formulas
        mod <- lm(y~x)
        > lm_to_latex(mod)
        > lm_to_latex(mod, mathmode=TRUE)
        [1] "y \\sim x"

* Other: `find_columns()` to locate data frames or lists with named columns or entries.

        > find_columns("x")
        $name
        [1] "df"
        $object
            x  y
        1   1  1
        2   2  2
        3   3  3
        4   4  4
        5   5  5
        6   6  6
        7   7  7
        8   8  8
        9   9  9
        10 10 10

## Notes

Like a normal R package, `jkr` only loads other packages when it needs to.  But the one exception is that `jkr` will load the `arm` package by default since it provides so many useful modelling functions like `logit()` or `se.coef()`.
