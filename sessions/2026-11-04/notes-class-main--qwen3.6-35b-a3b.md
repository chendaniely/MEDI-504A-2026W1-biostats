# Lecture 2: Observational Units & Interpreting Regression Models

Date Time: 2026-11-04

Instructor: Daniel Chen

## Summary

This session bridged the gap between data cleaning and statistical modeling. It began by reinforcing the tidy data principle of observational units, demonstrating how to split a mixed dataset into separate, linked tables—a structure mirroring how hospital databases and health data standards like FHIR and OMOP organize patient records. The lecture then transitioned to fitting and interpreting linear and logistic regression models using the `tidymodels` package. Key concepts included dummy variable (one-hot) encoding for categorical predictors, selecting reference levels, and constructing human-readable interpretations for both continuous and categorical coefficients. For logistic regression, the instructor explained the log-odds transformation and how to convert coefficients into odds ratios. Finally, the session covered practical workflows for agentic coding in GitHub Codespaces, emphasizing strict data privacy protocols when using AI models with sensitive datasets and the importance of step-by-step code review.

## Knowledge Points

### 1. Observational Units & Database Design

- **Observational unit**: The specific entity being observed (e.g., a song, a patient, a hospital visit). A core tidy data rule states that each type of observational unit should form its own separate table.
  - **Splitting mixed tables**: When a single table mixes multiple observational units (e.g., song metadata repeated for every week on a chart), extract the unique metadata rows, create a unique identifier (e.g., `mutate(id = row_number())`), and split it into its own table. Attach the `id` back to the measurement table using `left_join()`, then drop the redundant metadata columns.
  - **Hospital data standards**: Clinical databases follow this exact structure, with separate tables for `patients`, `encounters`, `conditions`, and `medications`, all linked by ID columns. Standards like HL7, FHIR, and the OMOP Common Data Model formalize this to allow secure, multi-site research without moving actual patient data.

### 2. Linear Regression

- **Dummy variable encoding**: Also called one-hot encoding in computer science. Regression models require numeric inputs, so categorical variables are automatically converted into 0/1 columns. For a categorical variable with $k$ levels, $k-1$ dummy columns are created.
  - **Reference level**: The category that is omitted from the dummy variables serves as the baseline. R automatically sets the first factor level as the reference. All categorical coefficient estimates represent a comparison to this baseline.
  - **Continuous variables**: Interpreted as the expected change in the outcome for a one-unit increase in the predictor, holding all other variables in the model constant.
  - **Categorical variables**: Interpreted as the expected difference in the outcome between a specific level and the reference level, holding all else constant.
  - **The intercept**: Represents the expected outcome when all continuous predictors are zero and all categorical predictors are at their reference level. It is rarely interpreted in practice because the baseline condition (e.g., a house with 0 square feet) is often physically impossible.

### 3. Logistic Regression

- **Log-odds transformation**: Logistic regression models a binary outcome by applying a mathematical transformation to a straight line. The resulting coefficients represent changes in the **log-odds** of the outcome's second level, which are mathematically valid but difficult to interpret in plain English.
- **Odds ratios**: To make results interpretable, coefficients are exponentiated. An odds ratio of 1 indicates no effect; values below 1 indicate lower odds; values above 1 indicate higher odds.
  - **Interpreting odds ratios**: "For every 1-unit increase in [variable], we expect the odds of [outcome] to be multiplied by [odds ratio], all else remaining the same." For categorical predictors, the ratio compares the specific level to the reference level.
  - **Odds vs. Probability**: Odds ratios are not probabilities. They should never be phrased as "times as likely" or "less likely," as this conflates odds with probability. They are only equivalent when the outcome is very rare.

### 4. Agentic Coding & Data Privacy

- **AI agent file access**: Coding agents (like GitHub Copilot) run code locally to inspect dataframes and file structures. This means they must `print()` or dump data to see it, which can inadvertently transmit sensitive information (patient names, passwords, medical records) to external AI servers.
  - **Privacy protocol**: Never feed identifiable patient data or credentials into unapproved AI models. Use synthetic datasets (like Synthea) for practice. If working with real health data, use institutionally sanctioned, locally deployed models.
  - **Code review**: Agents can generate correct syntax but may misunderstand data context or make logical errors. Always review generated code step-by-step, run chunks incrementally, and explicitly guide the agent with technical terms rather than accepting massive, unreviewed outputs.

## Code from class

### [Splitting observational units](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html)

```r
song <- billboard_tidy |>
  distinct(artist, track, year, time) |>
  mutate(id = row_number(), .before = 1)

rank <- billboard_tidy |>
  left_join(song, by = c("artist", "track", "year", "time")) |>
  select(id, week, date, rank)
```

The instructor demonstrated breaking the Billboard dataset into two tables. `distinct()` isolates the song metadata, `mutate(id = row_number())` creates a unique identifier, and `left_join()` attaches the ID back to the weekly rankings. The final `select()` drops the redundant metadata, leaving a clean `rank` table linked by `id`.

### [Fitting a linear regression model](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html)

```r
house_fit <- linear_reg() |>
  fit(price ~ sqft + type, data = Sacramento)

tidy(house_fit, conf.int = TRUE)
```

    # A tibble: 4 × 7
      term             estimate std.error statistic   p.value conf.low conf.high
      <chr>               <dbl>     <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
    1 (Intercept)         6885.  12169.       0.566 5.72e-  1  -16996.    30766.
    2 sqft                 139.      3.88    35.7   1.64e-176     131.      146.
    3 typeMulti_Family  -66224.  26222.      -2.53  1.17e-  2 -117686.   -14762.
    4 typeResidential     8253.  12151.       0.679 4.97e-  1  -15594.    32100.

The `tidy()` function extracts a coefficient table. Notice that `sqft` has one estimate, while `type` (which has 3 levels) produces two estimates. `Condo` is missing because it is the reference level; the model estimates the price difference for multi-family and residential homes relative to condos.

### [Recode variables for logistic regression](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html)

```r
sore <- licorice_gargle |>
  mutate(
    sore_throat = factor(pacu30min_throatPain > 0,
                         levels = c(FALSE, TRUE),
                         labels = c("no", "yes")),
    treatment = factor(treat, levels = c(0, 1),
                       labels = c("sugar", "licorice")),
    smoking = factor(preOp_smoking, levels = c(3, 2, 1),
                     labels = c("never", "past",
                                "current"))
  ) |>
  select(sore_throat, treatment,
         bmi = preOp_calcBMI, smoking) |>
  drop_na()
```

Predictors and the outcome are explicitly recoded as factors. The order of levels in the `factor()` function determines the reference level (the first level specified). Here, `sugar`, `never`, and `no` are set as baselines.

### [Exponentiating logistic regression coefficients](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html)

```r
sore_or <- sore_fit |>
  tidy(exponentiate = TRUE, conf.int = TRUE)
sore_or
```

Passing `exponentiate = TRUE` applies the exponential function to the log-odds coefficients and confidence intervals, converting them into odds ratios. This step is essential for translating statistical output into clinical or practical interpretations.

### What went wrong live

- **Codespace timeout / maximum reached**: A student's Codespace went to sleep or hit the "maximum Codespaces reached" error because GitHub free accounts limit concurrent instances. The instructor advised deleting unused Codespaces via github.com/codespaces and keeping the active one open to prevent it from shutting down.
- **Quarto rendering error in VS Code/Positron**: A student encountered an error when trying to render the Quarto file locally. It was resolved by ensuring the Quarto extension was installed and clicking the "Render All Formats" button, which generates both HTML and PDF outputs.
- **Date printing format confusion**: A student noticed that after using `mdy()` to convert a date string, the printed output still displayed as `YYYY-MM-DD`. The instructor clarified that `mdy()` correctly parses a month-day-year string into a proper date object; the `YYYY-MM-DD` display is simply the standard ISO 8601 printing format for date objects in R.

## Questions

- **Q:** Does it matter what you choose as the reference level for a categorical variable?
  **A:** Mathematically, it doesn't matter; the model will still fit correctly regardless of which level is omitted. However, it heavily impacts interpretability. Choosing a logical baseline (e.g., "never smoker" instead of "current smoker") makes it much easier to construct clear, human-readable sentences about the results.
- **Q:** How do you interpret the model if you add many more covariates? Does it get more complicated?
  **A:** No, the interpretation skeleton remains exactly the same. You simply look at one coefficient at a time, assuming all other variables remain constant. Adding variables changes the numerical estimates (because the model is now accounting for confounding) and lengthens the coefficient table, but it doesn't change *how* you write the sentence for each individual term.
- **Q:** How do I predict the outcome (e.g., house price) if I have a new observation and many variables?
  **A:** You plug the new observation's values into the model's algebraic equation ($y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \dots$). You multiply each predictor value by its corresponding coefficient, sum them all together, and add the intercept to get the predicted value.
- **Q:** Can I ever interpret the intercept or the reference level itself?
  **A:** Generally, no. The intercept represents the expected outcome when all predictors are zero and all categorical predictors are at their reference level (e.g., a condo with 0 square feet), which is often nonsensical. If you want to report on the reference level, you should change the reference level to the category you want to report on, rather than interpreting the baseline directly.
- **Q:** Do I have to fork the repository to do the homework, and where does my work save in Codespaces?
  **A:** Forking is optional but recommended to preserve your work if the repo updates. Codespaces save your work locally to that specific cloud instance, not automatically to Git. If you close the tab, it may sleep, but if you delete the Codespace, the work is permanently lost. The instructor recommended copying the homework `.qmd` file to your local computer as a backup.

## Also on the slides

- [The original third rule](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#the-original-third-rule): Explains Hadley Wickham's original tidy data definition emphasizing that each type of observational unit should form its own table.
- [The tidy Billboard data, again](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#the-tidy-billboard-data-again): Shows the initial `pivot_longer()` code used in Lecture 1 to create the mixed Billboard dataset.
- [How hospitals store data](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#how-hospitals-store-data): Introduces the Synthea project for generating synthetic hospital datasets that follow the observational unit structure.
- [Beyond CSVs: health data standards](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#beyond-csvs-health-data-standards): Covers HL7, FHIR, and the OMOP Common Data Model for sharing health data across institutions securely.
- [When the interval includes 0](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#when-the-interval-includes-0): Notes that if a confidence interval for a coefficient includes zero, the data do not show a clear effect, though the estimate should still be reported transparently.
- [Odds, not probability](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#odds-not-probability): Warns against conflating odds ratios with probabilities or using phrases like "times as likely."

## Assignments

- [ ] Complete the homework assignment: tidy the Ebola dataset, create frequency tables, generate a plot, and fit a linear or logistic regression model on one of three provided medical datasets, interpreting the coefficients.

---

- prompt: prompt-notes.md @ fcb3cf5
- prompt-hash: ce286dee74ee
- model: qwen3.6-35b-a3b (requested: qwen3.6-35b-a3b)
- backend: local (llama-swap)
- inputs: transcript-plaud.md, materials.md
- generated: 2026-11-05
