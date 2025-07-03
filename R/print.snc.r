#' Print Method for SNC Objects
#'
#' Prints summary output for an object of class \code{"snc"}.
#'
#' @param x An object of class \code{"snc"} returned by the \code{\link{snc}} function.
#' @param ... Ignored.
#'
#' @export

print.snc <- function(x, ...) {
  cat("Strongest Neighbor Coherence (SNC)\n")
  cat("----------------------------------\n")
  cat("Overall SNC:", x$overall, "\n\n")
  
  if (!is.null(x$factors)) {
    cat("Item-level SNC:\n")
    print(x$items, row.names = FALSE)
    cat("\nFactor-level SNC:\n")
    print(x$factors, row.names = FALSE)
  } else {
    cat("Item-level SNC:\n")
    print(x$items, row.names = FALSE)
  }
}
