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

Cronbach’s alpha remains the most widely used metric for internal consistency, yet it is well known to inflate with item count, fail under multidimensionality, and collapse in the presence of reversed items. I introduce Strongest Neighbor Coherence (SNC), a structure-aware, polarity-agnostic alternative that evaluates how well each item aligns with its top correlational neighbors. SNC operates entirely from a correlation matrix and requires no assumptions about scoring direction, unidimensionality, or model fit. I compare SNC and alpha across 81 fully crossed simulation conditions, varying number of latent factors, items per factor, reversals, and sample size. Results show that SNC remains stable and interpretable across all structures, while alpha varies dramatically, especially under factor complexity and short forms. Two real-world instruments demonstrate the practical contrast: the Rosenberg Self-Esteem Scale (Rosenberg, 1965), where alpha appears strong despite reversed items, and the DASS-21 (Lovibond & Lovibond, 1995), where SNC reveals clean subscale coherence despite an inflated total alpha. I propose SNC as a replacement for alpha in both simulation workflows and applied scale evaluation.

This abstract is from the upcoming manuscript by Wells (2025)
## Citation


