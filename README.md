# Strongest Neighbor Coherence (SNC)

**Strongest Neighbor Coherence (SNC)** is a structural diagnostic that replaces Cronbach’s alpha.  
Instead of assuming unidimensionality, SNC computes the average absolute correlation between each item and its top-k most strongly correlated neighbors.

This allows SNC to quantify local coherence even in multidimensional or overlapping item structures.

## Method

The `snc()` function takes a correlation matrix and returns:
- The overall SNC value (mean top-k item coherence)
- Item-level SNC values
- Optional factor-level summaries (if a `factors` vector is provided)

## Citation

This method is described in:
> Wells (2025) <https://github.com/TheotherDrWells/snc>
