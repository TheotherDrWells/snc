#' Strongest Neighbor Coherence (SNC)
#'
#' Computes Strongest Neighbor Coherence (SNC), a rotation-free structural diagnostic
#' that evaluates how well each item aligns with its top-k most strongly correlated neighbors.
#'
#' @param R A square item correlation matrix (symmetric, 1s on the diagonal).
#' @param k Integer. Number of strongest neighbors to use for each item (default = 2).
#' @param factors Optional. A vector of factor assignments for items, used to compute group-level means.
#' @param digits Number of decimal places to round to (default = 3).
#'
#' @return An object of class \code{"snc"} with:
#' \describe{
#'   \item{overall}{Mean SNC value across all items}
#'   \item{items}{A data frame of item-level SNC values}
#'   \item{factors}{(Optional) A data frame of factor-level mean SNC values}
#' }
#'
#' @examples
#' R <- matrix(c(1, .6, .3, .6, 1, .5, .3, .5, 1), 3, 3)
#' rownames(R) <- colnames(R) <- c("Item1", "Item2", "Item3")
#' snc(R)
#'
#' @importFrom stats aggregate
#' @export
snc <- function(R, k = 2, factors = NULL, digits = 3) {
  # Enforce symmetry
  R <- (R + t(R)) / 2
  diag(R) <- 1
  
  p <- nrow(R)
  if (p < 3) stop("Correlation matrix must be at least 3x3.")
  if (k < 1 || k >= p) stop(paste0("k must be between 1 and ", p - 1))
  
  snc_values <- numeric(p)
  for (i in 1:p) {
    neighbors <- order(abs(R[i, -i]), decreasing = TRUE)[1:k]
    adjusted <- ifelse(neighbors >= i, neighbors + 1, neighbors)
    snc_values[i] <- mean(abs(R[i, adjusted]))
  }
  
  snc_values <- round(snc_values, digits)
  overall_val <- round(mean(snc_values), digits)
  item_names <- rownames(R)
  if (is.null(item_names)) item_names <- paste0("Item", 1:p)
  
  if (is.null(factors)) {
    item_df <- data.frame(item = item_names, snc = snc_values, stringsAsFactors = FALSE)
    result <- list(overall = overall_val, items = item_df)
  } else {
    if (length(factors) != p) stop("Length of 'factors' must match number of items.")
    item_df <- data.frame(item = item_names, snc = snc_values, factor = as.character(factors), stringsAsFactors = FALSE)
    factor_df <- aggregate(snc ~ factor, data = item_df, FUN = mean)
    factor_df$snc <- round(factor_df$snc, digits)
    result <- list(overall = overall_val, items = item_df, factors = factor_df)
  }
  
  class(result) <- "snc"
  return(result)
}

