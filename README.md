# Strongest Neighbor Coherence (SNC)

**Strongest Neighbor Coherence (SNC)** is a structural diagnostic that replaces Cronbach’s alpha.  
Instead of assuming unidimensionality, SNC computes the average absolute correlation between each item and its top-k most strongly correlated neighbors.

This allows SNC to quantify local coherence even in multidimensional or overlapping item structures.

## Method

The `snc()` function takes a correlation matrix and returns:
- The overall SNC value (mean top-k item coherence)
- Item-level SNC values
- Optional factor-level summaries (if a `factors` vector is provided)

📄 Abstract

Strongest Neighbor Coherence (SNC) is a structural diagnostic that replaces Cronbach’s alpha.
SNC quantifies the degree to which each item aligns with its k most strongly correlated neighbors, using average absolute correlation values from a supplied item correlation matrix.
This method does not assume unidimensionality or simple structure and is robust to overlapping constructs.
The snc() function returns item-level, overall, and (optionally) factor-level coherence values.
SNC can be used for scale auditing, short form construction, and as a modern replacement for alpha in structural diagnostics.

This abstract is from the upcoming manuscript by Wells (2025)
## Citation

This method is described in:
> Wells (2025) <https://github.com/TheotherDrWells/snc>
