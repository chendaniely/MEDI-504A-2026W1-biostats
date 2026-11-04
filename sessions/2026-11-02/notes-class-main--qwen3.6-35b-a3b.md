# Tidy Data, Wrangling, and First Modelling

Date Time: 2026-11-02 13:00:00

Location: ECC 100 LT

Instructor: Daniel Chen

## Summary

Session 1 introduced the foundational principles of data cleaning and manipulation in R using the `tidyverse` ecosystem. The instructor defined "tidy data" as a standardized format where each variable is a column, each observation is a row, and each value is a single cell. Students learned to identify common violations of these rules—such as column headers containing values, multiple variables packed into one column, and variables split across rows and columns—and practiced reshaping messy datasets into tidy formats using `pivot_longer()` and `pivot_wider()`.

After establishing tidy data, the lecture covered core data wrangling operations with `dplyr`. The class practiced selecting columns, filtering rows, and creating new variables with `mutate()`, emphasizing the pipe operator (`|>`) for chaining steps cleanly without creating intermediate variables. The session then transitioned to exploratory data visualization with `ggplot2`, demonstrating how to map variables to geometric objects like scatter plots, histograms, and bar charts based on their data types. 

Finally, the instructor provided a first look at statistical modelling, explaining how tidy data enables clear model specification. Using a linear regression example, the class learned to fit a model, interpret the slope coefficient as a rate of change, and use the `tidymodels` framework (`recipe`, `workflow`, `fit`) to standardize the modelling pipeline. The session concluded with a demonstration of GitHub Copilot in Codespaces, showing how agentic AI can edit code directly to streamline the workflow.

## Knowledge Points

### 1. Tidy Data Principles

- **Tidy data**: A consistent data structure that makes analysis, visualization, and modelling straightforward. Defined by three rules: each variable is a column, each observation is a row, each value is a cell.
- **Column headers as values**: When column names (e.g., income brackets, years, weeks) actually represent levels of a variable, the dataset violates tidy principles. Resolved by pivoting wide to long.
- **Multiple variables in one column**: When a single cell or header contains embedded information (e.g., `sp_m_014` for diagnosis, gender, and age). Resolved by splitting headers or using `separate()`.
- **Variables in rows and columns**: When multiple variables (e.g., `tmax` and `tmin`) are stacked in rows while other dimensions (e.g., days) are spread across columns. Requires both `pivot_longer()` and `pivot_wider()`.

### 2. Reshaping Data with tidyr

- **`pivot_longer()`**: Converts wide-format data into long-format data. Useful when values are spread across column headers. Key arguments include `cols` (which columns to pivot), `names_to` (new column for headers), and `values_to` (new column for values).
- **`pivot_wider()`**: Converts long-format data into wide-format data. Useful when variables are stacked in rows and need to become separate columns. Uses `names_from` and `values_from`.
- **`names_prefix` / `names_transform`**: Arguments in `pivot_longer()` to strip text prefixes from column names and immediately convert types (e.g., `as.integer`) during the pivot, avoiding messy strings.
- **`values_drop_na = TRUE`**: Drops missing values during pivoting to keep the resulting dataset cleaner and avoid empty rows.

### 3. Data Wrangling with dplyr

- **`select()`**: Chooses specific columns to retain. Can use exact names or helper functions like `starts_with()` or `ends_with()`.
- **`filter()`**: Subsets rows based on logical conditions (`>`, `<`, `==`, `!=`, `&`, `|`). Returns only rows where the condition evaluates to `TRUE`.
- **`mutate()`**: Adds new columns or modifies existing ones. Does not alter the original dataset; output must be assigned to a new variable or piped forward.
- **`group_by()`**: Groups the dataset by a categorical variable so that subsequent functions apply calculations to each group independently.
- **`summarize()`**: Computes a single summary value (e.g., `mean()`, `max()`, `n()`) for each group. Requires `na.rm = TRUE` when calculating means or sums with missing values.
- **`|>` (pipe operator)**: Passes the result of the expression on its left as the first argument to the function on its right. Enables linear, readable chaining of operations.

### 4. Visualization with ggplot2

- **`ggplot()`**: Initializes a plot by mapping the dataset and aesthetic variables (`aes()`), which link columns to visual properties (`x`, `y`, `colour`, `fill`).
- **`geom_point()`**: Creates scatter plots for two continuous/quantitative variables.
- **`geom_histogram()`**: Creates histograms for one continuous variable, binning the data to show distribution.
- **`geom_bar()`**: Creates bar charts for categorical variables. Automatically counts occurrences (`stat = "count"`).
- **`geom_col()`**: Creates bar charts when the counts are already calculated in the data (`stat = "identity"`), requiring explicit `y` mapping.
- **`labs()`**: Adds human-readable titles, axis labels, and legend titles to polish the figure.

### 5. Introduction to Modelling

- **Outcome variable types**: Dictates the modelling approach. Continuous outcomes (numbers) use regression; categorical outcomes (groups/labels) use classification.
- **Model formula**: Uses the tilde (`~`) to separate predictors from the outcome. The variable on the left is what you predict; variables on the right are inputs.
- **Linear regression**: Fits a straight line ($Y = \beta_0 + \beta_1 X$). The slope coefficient (`β₁`) represents the expected change in the outcome for a one-unit increase in the predictor. Highly interpretable in clinical/medical contexts.
- **`tidymodels` workflow**: Uses `recipe()` to define preprocessing, `linear_reg()`/`logistic_reg()` to define the model, and `workflow()` + `fit()` to train it. Standardizes the modelling pipeline.

## Code from class

### [Reshaping messy data](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#pivot_longer-wide-to-long)

```r
# Pew survey: pivot wide income columns into long rows
pew_tidy <- pew |>
  pivot_longer(
    cols = -religion,
    names_to = "income",
    values_to = "frequency"
  )
```

```r
# Billboard chart: pivot week columns, drop "wk" prefix, convert to integer
billboard_tidy <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    names_transform = list(week = as.integer),
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  mutate(date = date.entered + (week - 1) * 7) |>
  select(year, artist, track, time, week, rank, date)
```

```r
# WHO TB data: pivot all non-ID columns, split header on "_" into 3 new variables
who2 |>
  pivot_longer(
    cols = !(country:year),
    names_to = c("diagnosis", "gender", "age"),
    names_sep = "_",
    values_to = "count",
    values_drop_na = TRUE
  )
```

```r
# Weather data: pivot days to long, make dates, pivot temp types to wide
weather_tidy <- weather |>
  pivot_longer(
    cols = starts_with("d"),
    names_to = "day",
    names_prefix = "d",
    names_transform = list(day = as.integer),
    values_to = "temp",
    values_drop_na = TRUE
  ) |>
  mutate(date = make_date(year, month, day)) |>
  pivot_wider(
    names_from = element,
    values_from = temp
  ) |>
  select(id, date, tmax, tmin) |>
  arrange(id, date)
```

### [Wrangling with dplyr](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#the-pipe)

```r
# Chain select, mutate, filter using the pipe
penguins |>
  mutate(body_mass_kg = body_mass / 1000) |>
  filter(flipper_len > 190) |>
  select(species, flipper_len, body_mass_kg)
```

```r
# Group by species and calculate average body mass
penguins |>
  group_by(species) |>
  summarize(avg_body_mass = mean(body_mass, na.rm = TRUE))
```

*The pipe (`|>`) passes the output of the left side directly as the first argument to the function on the right. This allows you to read the code chronologically ("and then...") and avoids cluttering the environment with intermediate data frames.*

### [Plotting with ggplot2](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#scatter-plot-two-quantitative-variables)

```r
# Scatter plot of flipper length vs body mass
ggplot(penguins, aes(x = flipper_len, y = body_mass)) +
  geom_point()

# Add colour by species and custom axis labels
ggplot(penguins, aes(x = flipper_len, y = body_mass, colour = species)) +
  geom_point() +
  labs(
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    colour = "Species"
  )
```

*`ggplot2` uses a layering system. You map data to aesthetics inside `aes()`, then add geometric layers (`geom_`) with `+`. Colour and fill map categorical variables to visual distinctions.*

### [First look at modelling](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#fit-it-with-tidymodels)

```r
# Specify recipe, model specification, and fit workflow
house_recipe <- recipe(price ~ sqft, data = Sacramento)

house_spec <- linear_reg() |>
  set_engine("lm") |>
  set_mode("regression")

house_fit <- workflow() |>
  add_recipe(house_recipe) |>
  add_model(house_spec) |>
  fit(data = Sacramento)
```

```r
# View the fitted model coefficients
tidy(house_fit)
```

*The `recipe()` function defines the mathematical relationship (`price ~ sqft`). The `workflow()` combines preprocessing and model definition, and `fit()` trains it. The coefficient table shows an intercept of ~13,859 and a slope of ~138.5, meaning each additional square foot increases the predicted house price by $138.50.*

### What went wrong live

- **Codespace restart times & monitor setup**: The instructor spent the first few minutes troubleshooting Zoom screen sharing and realizing he was looking at the wrong monitor. He noted that if a Codespace times out or is accidentally closed, it takes several minutes to rebuild and install dependencies, so leaving it running is recommended.
- **Excel visual flags vs. computer parsing**: A student asked how computers handle Excel cells formatted with colours to indicate status. The instructor explained that R and other data tools do not read cell background colours; visual flags must be explicitly converted into a new column to be analyzable.

## Questions

- **Q:** What is the practical difference between `geom_bar()` and `geom_col()`?
  **A:** `geom_bar()` automatically counts the occurrences of categories in a single column (`stat = "count"`). `geom_col()` assumes the counts are already calculated in the dataset and draws bars based on the provided `y`-values (`stat = "identity"`). Use `geom_col()` when you've already summarized your data.

- **Q:** How does the LLM agent in GitHub Codespaces work compared to a standard chatbot?
  **A:** Unlike web chat interfaces that just return text to copy-paste, the agent in the Codespace reads your actual project files and can edit them directly. You can ask it to "make a plot from the patients data" and it will generate and save the code in your script, which you then review and accept. This shifts the workflow from typing from scratch to reviewing and verifying AI-generated code.

## Also on the slides

- [Welcome](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html): Course schedule, Codespace setup instructions, and reference textbooks.
- [How these pages work](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html#how-these-pages-work): Explains the website layout with slides followed by scrollable content.
- [Where we are](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html#where-we-are): Data science workflow diagram (import, tidy, transform, visualize, model, communicate).
- [Packages](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#packages): Loads the `tidyverse` meta-package.
- [The original definition (2014)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#the-original-definition-2014): Hadley Wickham's 2014 paper definition emphasizing observational units.
- [Why bother?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#why-bother): Illustration of how tidy data enables consistent analytical tools.
- [Five ways data gets messy](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#five-ways-data-gets-messy): Lists the five common messiness types from the original paper.
- [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#data-and-credits): Source files for the tidy data examples used in the lecture.
- [Data wrangling](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#data-wrangle): Palmer penguins dataset introduction and structure.
- [How many values are missing?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#how-many-values-are-missing): Techniques using `n()` and `sum(is.na())` to count missing data.
- [Bar plot: counts of a categorical variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#bar-plot-counts-of-a-categorical-variable): Code for a stacked bar chart of penguin island counts.
- [Rules of thumb](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#rules-of-thumb): Guidelines for clear visualization (one question per plot, label axes, avoid 3D/pie charts).
- [Sacramento house sales](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#sacramento-house-sales): Prints the raw Sacramento housing dataset structure.
- [Is size related to price?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#is-size-related-to-price): Scatter plot of house size vs price to visualize the relationship before modelling.
- [Linear regression: the line of best fit](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#linear-regression-the-line-of-best-fit): Mathematical formula for linear regression ($Y = \beta_0 + \beta_1 X$).
- [See the line](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#see-the-line): Plotting the fitted regression line over the scatter plot using `geom_smooth()`.
- [More than one predictor](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#more-than-one-predictor): Extending the recipe to include multiple predictors (`sqft + beds + baths`).
- [Coming up on Wednesday](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#coming-up-on-wednesday): Preview of the lab session on clinical data, linear regression, and logistic regression.

---

- prompt: prompt-notes.md @ uncommitted
- prompt-hash: ce286dee74ee
- model: qwen3.6-35b-a3b (requested: qwen3.6-35b-a3b)
- backend: local (llama-swap)
- inputs: transcript-plaud.md, materials.md
- generated: 2026-11-04
