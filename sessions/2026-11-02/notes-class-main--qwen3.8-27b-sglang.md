# Tidy data, `tidyr`, `dplyr`, `ggplot2`, and a first linear regression

Date Time: 2026-11-02 13:00:00

Location: ECC 100 LT

Instructor: Daniel Chen

## Summary

This was Lecture 1 of Daniel Chen’s two-session biostatistics module in MEDI 504A. The session assumed that students had not coded before and introduced the tidyverse workflow for getting data into a usable form. Daniel live-coded from the course slides, starting with the formal idea of tidy data and then working through the examples from Hadley Wickham’s 2014 *Tidy Data* paper: Pew religion/income counts, Billboard weekly song rankings, WHO tuberculosis counts, and daily weather temperatures. The main goal was to learn how to recognize messy data, reshape it so that variables, observations, and values are aligned, and then point to real columns for later analysis.

After the tidying portion, the session moved to basic `dplyr` wrangling on the Palmer penguins dataset: selecting columns with `select()`, filtering rows with `filter()`, adding or changing columns with `mutate()`, chaining steps with the pipe `|>`, and summarizing groups with `group_by()` and `summarize()`. Daniel then showed how tidy data supports `ggplot2` visualization, including scatter plots, histograms, and bar plots, and how variable type drives the choice of plot. The session ended with a first look at modelling using the `Sacramento` house-sales dataset and a linear regression fit with `tidymodels`.

By the end, a student should be able to explain the tidy data rules, choose between `pivot_longer()` and `pivot_wider()`, write simple tidyverse pipelines, produce basic plots, and interpret a fitted linear model’s coefficients. The session also set up the practical environment: students were told to start the course GitHub Codespace, render `example.qmd`, and understand that Lecture 2 on Wednesday, 2026-11-04, will be a hands-on lab with medical data, linear regression, logistic regression, and a homework assignment.

## Knowledge Points

### 1. Course setup and workflow

- **MEDI 504A biostatistics sessions**:
  - Lecture 1: Tidy data, Monday, 2026-11-02, 1:00–3:00 PM, ECC 100 LT.
  - Lecture 2: Modelling lab, Wednesday, 2026-11-04, 1:00–3:00 PM, DHCC 4223.
- **GitHub Codespace**:
  - The course repository has a Codespace configured so students do not need to install everything locally.
  - The published slide says starting it takes about 4 minutes the first time; the live demo described it as taking about 10 minutes.
  - On Monday the task was only to test the Codespace. On Wednesday, students will fork the repository and work in their own copy.
- **GitHub Copilot / LLM use in the Codespace**:
  - The Codespace has Copilot available on the right-hand side and can act as a coding agent: it can read files, propose edits, and modify code.
  - A specific LLM course will be taught later by another instructor; this session only gave a preview.
  - **Warning**: because the agent can read and edit files, do **not** put passwords or identifiable patient data into code files or prompts. Be cautious even with column names if they could reveal sensitive information.
- **Data science workflow**:
  - The course follows the *R for Data Science* workflow: import, tidy, transform, visualize, model, and communicate.
  - Lecture 1 focused mostly on tidy and transform, with first looks at visualize and model.

### 2. Tidy data

- **Tidy data**:
  - Each **variable** is a column; each column is a variable.
  - Each **observation** is a row; each row is an observation.
  - Each **value** is a cell; each cell is a single value.
- **Original 2014 definition**:
  - Wickham’s original *Tidy Data* paper defined:
    1. Each variable forms a column.
    2. Each observation forms a row.
    3. Each type of observational unit forms a table.
  - The third rule is mainly about databases, where different observational units are stored in separate tables and joined later.
  - The newer tidyverse definition replaces that third rule with “each value is a cell.”
- **Sniff test for messiness**:
  - If multiple column headers look like values of the same variable, the data is probably not tidy.
    - Examples: `1999`, `2000`, `$10-20k`, `wk1`, `wk2`, `d1`, `d2`.
  - If a summary statistic on a column would be meaningless, the column may be mixing different variables.
    - Example: averaging a column that contains both case counts and population totals.
- **Five common ways data gets messy**:
  1. Column headers are values, not variable names.
  2. Multiple variables are stored in one column.
  3. Variables are stored in both rows and columns.
  4. Multiple types of observational units are stored in the same table.
  5. A single observational unit is stored in multiple tables.
- **Human-friendly vs computer-friendly storage**:
  - Spreadsheets can store extra information in cells, such as colors or manual totals, but R does not read those as data.
  - If you need to flag rows as good/bad, create an explicit column instead of relying on cell color.
  - Adding a total row to a spreadsheet can contaminate later calculations; in R, compute summaries in code instead of writing totals into the raw data.

### 3. Reshaping data with `tidyr`

- **`pivot_longer()`**:
  - Used when values are spread across many column headers.
  - Converts wide data into long data.
  - Important arguments:
    - `cols`: which columns to pivot.
    - `names_to`: name of the new column that will hold the old column headers.
    - `values_to`: name of the new column that will hold the old cell values.
    - `names_prefix`: text to remove from the old column names.
    - `names_transform`: functions to apply to the new name column, e.g. `list(week = as.integer)`.
    - `values_drop_na`: set `TRUE` to drop rows whose values were `NA`.
- **`pivot_wider()`**:
  - Used when variable names are stuck in rows and should become columns.
  - Important arguments:
    - `names_from`: column whose unique values become new column names.
    - `values_from`: column whose values fill the new columns.
- **Splitting multiple variables in one name or column**:
  - `pivot_longer()` can split old column names with `names_to = c("diagnosis", "gender", "age")` and `names_sep = "_"`.
  - For splitting an already-existing column, the instructor mentioned `separate()` as a two-step alternative; the slides’ toolkit also mentions `separate_wider_delim()`.
- **Selecting columns**:
  - You can select by position/range, by pattern, or by exclusion.
  - Examples:
    - `cols = -religion` pivots every column except `religion`.
    - `cols = starts_with("wk")` selects columns beginning with `wk`.
    - `cols = !(country:year)` pivots all columns from after `country` through after `year`, i.e. all variables except `country` and `year`.
- **Leave yourself breadcrumbs**:
  - Use prefixes, delimiters, and consistent naming so you can later select or split columns.
  - Many programming languages dislike names that begin with a number, so prefixes such as `wk`, `d`, `q`, or `_text` are useful.
- **Converting names to numbers**:
  - If week labels remain strings, sorting may produce `1`, `10`, `11`, `2`.
  - Use `names_transform = list(week = as.integer)` to convert the new `week` column to integers.
- **Dates and date arithmetic**:
  - R can perform date arithmetic only when values are proper dates or date-time objects.
  - The weather example used `make_date(year, month, day)` to combine `year`, `month`, and `day` into a `date` column.
  - Computers ultimately perform date arithmetic by converting to seconds and then converting back to human-readable dates.
- **Warning: do not store time series as new columns**:
  - Daniel told a story about NHS pandemic tracking where each new day became a new column.
  - Spreadsheets have column limits; once the limit was reached, new data overwrote or disturbed existing columns and created gaps that broke models.
  - Tidy long-form data with a date column is more sustainable for repeated data entry and modelling.

### 4. Wrangling with `dplyr`

- **`select()`**:
  - Chooses columns.
  - You can select named columns or use patterns such as `starts_with("bill")`.
- **`filter()`**:
  - Chooses rows.
  - Keep rows where the condition is `TRUE`.
  - Operators:
    - `&` means “and”.
    - `|` means “or”.
    - `!` means “not”.
    - `==` compares equality.
    - A single `=` is for assignment, not comparison.
- **`mutate()`**:
  - Adds or changes columns.
  - It returns a new data frame; the original data are not changed unless you assign the result.
- **Pipe `|>`**:
  - The pipe passes the object on the left into the first argument of the function on the right.
  - A piped pipeline can be read top-down as “and then”.
  - `|>` has been part of base R since R 4.0.
  - `%>%` is the older tidyverse pipe; many people still use it out of habit, especially when working with older R environments.
  - Type `|>` as one token; do not put a space between `|` and `>`.
- **`group_by()` and `summarize()`**:
  - `group_by()` splits the data into groups.
  - `summarize()` collapses each group to one row.
  - Summary functions take many numbers and return one number, such as `mean()`, `min()`, `max()`, or `n()`.
  - Use `na.rm = TRUE` in `mean()` when missing values are present; otherwise one `NA` can make the whole mean `NA`.
- **Missing values**:
  - R uses `NA` to represent missingness.
  - An empty string is not the same as `NA`; empty strings can mean “not applicable,” “unknown,” “did not answer,” or a data-entry code.
  - Health datasets sometimes use sentinel codes such as `99` to mean “no” or “not applicable.”
  - `is.na(x)` returns `TRUE`/`FALSE`.
  - `sum(is.na(x))` counts missing values because `TRUE` is treated as 1 and `FALSE` as 0 in sums.
  - `sum(!is.na(x))` counts non-missing values.

### 5. Visualization with `ggplot2`

- **Why tidy data matters for plots**:
  - `ggplot2` maps columns to visual properties.
  - If the data are not tidy, you cannot point to the right columns for `x`, `y`, colour, fill, etc.
- **Three parts of a `ggplot2` plot**:
  1. Aesthetic mappings: `aes(x = ..., y = ..., colour = ..., fill = ...)`.
  2. Geometric objects: `geom_point()`, `geom_histogram()`, `geom_bar()`, etc.
  3. Scales and labels: axis titles, colour legends, plot labels.
  - Layers are added with `+`, not with the pipe.
- **Variable type determines the plot type**:
  - Two continuous variables: scatter plot with `geom_point()`.
  - One continuous variable: histogram with `geom_histogram()`.
  - One categorical variable: bar chart of counts with `geom_bar()`.
- **`geom_point()`**:
  - The scatter-plot geom is `geom_point()`, not a function called `geom_scatter()`.
- **`geom_bar()` vs `geom_col()`**:
  - Both can produce bar charts.
  - `geom_bar()` defaults to counting rows, effectively `stat = "count"`.
  - `geom_col()` defaults to `stat = "identity"`, so it expects the height to already be calculated.
  - Do not use `geom_bar()` on a table that has already been summarized into counts, or it will recount the rows and produce the wrong bar heights.
- **Stacked vs dodged bar charts**:
  - `fill = species` creates stacked bars by default.
  - A one-word position change can create a dodged bar chart, where category bars sit next to each other instead of stacked.
- **Polish and privacy**:
  - Use `labs()` for axis titles and legend labels.
  - Themes can remove backgrounds and adjust aesthetics.
  - If you are only pasting code into an LLM to polish a plot, usually the main privacy concern is whether column names or data values are sensitive.
  - **Warning**: never put passwords or identifiable patient data into code or prompts.

### 6. First look at modelling

- **Two main kinds of modelling questions**:
  - Regression: outcome is quantitative, e.g. house price or birth weight.
  - Classification: outcome is categorical, e.g. yes/no disease recurrence.
- **Model formulas**:
  - A formula such as `price ~ sqft` reads as “predict `price` using `sqft`.”
  - The left side is the outcome/response variable.
  - The right side contains predictors/independent variables.
  - Only the outcome’s type primarily determines whether the model is regression or classification.
- **Linear regression concept**:
  - The model is a straight-line relationship: `price = beta_0 + beta_1 * sqft`.
  - `beta_0` is the intercept.
  - `beta_1` is the slope: the change in predicted price for one extra square foot.
- **`tidymodels` workflow used in class**:
  - `recipe(price ~ sqft, data = Sacramento)`: prepares the formula and data.
  - `linear_reg()` creates a model specification.
  - `set_engine("lm")` uses base R linear models.
  - `set_mode("regression")` sets the task type.
  - `workflow()` combines the recipe and model specification.
  - `add_recipe()`, `add_model()`, and `fit(data = Sacramento)` build and fit the workflow.
- **Interpreting output**:
  - `tidy(house_fit)` returns a table of coefficients.
  - The `sqft` coefficient was about 138.5–139: for every extra square foot, predicted price increases by about that amount.
- **Multiple predictors**:
  - Add more predictors to the formula, e.g. `price ~ sqft + beds + baths`.
  - With multiple predictors, each slope is interpreted while the other predictors are held constant.
- **Modeling needs tidy data**:
  - You must be able to point to columns as the outcome and predictors.
  - Data cleaning can be revisited before modelling; the process is iterative.

## Code from class

### [Tidy Pew income data with `pivot_longer()`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-1-column-headers-are-values)

```r
library(tidyverse) # load tidyverse, including tidyr, dplyr, ggplot2

pew <- read_csv("data/pew.csv") # Pew religion counts by income group
pew

pew_tidy <- pew |>
  pivot_longer(
    cols = -religion, # pivot every column except religion
    names_to = "income", # old income-group headers become values
    values_to = "frequency" # old counts become one column
  )
pew_tidy

pew_tidy |>
  group_by(religion) |>
  summarize(count = sum(frequency)) # total people per religion
```

The important change is the shape: the original table had income groups as separate columns, while `pew_tidy` has one `income` column and one `frequency` column.

Key output:

```text
Rows: 18 Columns: 11
chr  (1): religion
dbl (10): <$10k, $10-20k, $20-30k, $30-40k, $40-50k, $50-75k, $75-100k, $100...
```

```text
# A tibble: 180 × 3
   religion income             frequency
   <chr>    <chr>                  <dbl>
 1 Agnostic <$10k                     27
 2 Agnostic $10-20k                   34
```

### [Tidy the Billboard weekly rankings](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-1-again-the-billboard-chart)

```r
billboard <- read_csv("data/billboard.csv")
billboard

billboard_tidy <- billboard |>
  pivot_longer(
    cols = starts_with("wk"), # select week columns by pattern
    names_to = "week",
    names_prefix = "wk", # remove the "wk" prefix
    names_transform = list(week = as.integer), # make week a number
    values_to = "rank",
    values_drop_na = TRUE # drop weeks the song was not on the chart
  ) |>
  # the date at a rank = the date it entered + (week - 1) weeks
  mutate(date = date.entered + (week - 1) * 7) |>
  arrange(artist, track, week) |>
  select(year, artist, track, time, week, rank, date)
billboard_tidy
```

The original data stored week numbers in column names, `wk1` through `wk76`. After pivoting, each row is one song-week observation with a numeric `week` and a `rank`.

Key output:

```text
# A tibble: 5,307 × 7
   year artist  track                   time    week  rank date
  <dbl> <chr>   <chr>                   <time> <int> <dbl> <date>
1  2000 2 Pac   Baby Don't Cry (Keep... 04:22      1    87 2000-02-26
2  2000 2 Pac   Baby Don't Cry (Keep... 04:22      2    82 2000-03-04
```

### [Tidy WHO tuberculosis counts](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-2-multiple-variables-in-one-column)

```r
who2

who2 |>
  pivot_longer(
    cols = !(country:year), # keep country and year, pivot everything else
    names_to = c("diagnosis", "gender", "age"), # split each old column name
    names_sep = "_", # split on underscores, e.g. sp_m_014
    values_to = "count",
    values_drop_na = TRUE
  )
```

Old column names such as `sp_m_014` contained three variables: diagnosis method, gender, and age group. Splitting the header creates three separate columns.

Key output:

```text
# A tibble: 76,046 × 6
   country      year diagnosis gender age   count
   <chr>       <dbl> <chr>     <chr>  <chr> <dbl>
 1 Afghanistan  1997 sp        m      014       0
 2 Afghanistan  1997 sp        m      1524     10
```

### [Tidy weather data: `pivot_longer()` then `pivot_wider()`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-3-variables-in-rows-and-columns)

```r
weather <- read_csv("data/weather.csv")
weather

weather_tidy <- weather |>
  pivot_longer(
    cols = starts_with("d"), # day columns d1, d2, ...
    names_to = "day",
    names_prefix = "d",
    names_transform = list(day = as.integer),
    values_to = "temp",
    values_drop_na = TRUE
  ) |>
  mutate(date = make_date(year, month, day)) |>
  pivot_wider(
    names_from = element, # tmax and tmin become their own columns
    values_from = temp
  ) |>
  select(id, date, tmax, tmin) |>
  arrange(id, date)
weather_tidy
```

This dataset had two problems: days were spread across columns, and the two variables `tmax` and `tmin` were stored in the `element` column. The pipeline first makes the data longer by day, then makes it wider so that `tmax` and `tmin` are separate columns.

Key output:

```text
# A tibble: 33 × 4
   id      date        tmax  tmin
   <chr>   <date>     <dbl> <dbl>
 1 MX17004 2010-01-30  27.8  14.5
 2 MX17004 2010-02-02  27.3  14.4
```

### [Select penguin columns](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#select-choose-columns)

```r
penguins <- as_tibble(penguins) # print the built-in penguins dataset cleanly
penguins

select(penguins, species, bill_len, body_mass) # keep named columns
select(penguins, starts_with("bill")) # keep columns matching a pattern
```

The penguins dataset has 344 rows and 8 columns. `select()` changes only the columns.

Key output:

```text
# A tibble: 344 × 8
   species island    bill_len bill_dep flipper_len body_mass sex     year
   <fct>   <fct>        <dbl>    <dbl>       <int>     <int> <fct>  <int>
 1 Adelie  Torgersen     39.1     18.7         181      3750 male    2007
```

### [Filter penguin rows](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#filter-choose-rows)

```r
filter(penguins, flipper_len > 190)

filter(penguins, flipper_len > 190 & species == "Chinstrap")
```

`filter()` changes the rows, not the columns. The second example combines two conditions with `&`.

Key output:

```text
# A tibble: 243 × 8
```

```text
# A tibble: 53 × 8
```

### [Add a derived column and chain steps](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#doing-many-steps-at-once)

```r
mutate(penguins, body_mass_kg = body_mass / 1000) # body_mass is in grams

# Intermediate-object version:
penguins_1 <- mutate(penguins, body_mass_kg = body_mass / 1000)
penguins_2 <- filter(penguins_1, flipper_len > 190)
penguins_3 <- select(penguins_2, species, flipper_len, body_mass_kg)

# Nested version, read from the inside out:
penguins_nested <- select(
  filter(mutate(penguins, body_mass_kg = body_mass / 1000), flipper_len > 190),
  species, flipper_len, body_mass_kg
)

# Piped version, read top to bottom:
penguins |>
  mutate(body_mass_kg = body_mass / 1000) |>
  filter(flipper_len > 190) |>
  select(species, flipper_len, body_mass_kg)
```

The pipe avoids creating many intermediate objects and makes the sequence easier to scan: `mutate`, then `filter`, then `select`.

Key output:

```text
# A tibble: 243 × 3
   species flipper_len body_mass_kg
   <fct>         <int>        <dbl>
 1 Adelie          195         3.25
 2 Adelie          193         3.45
```

### [Summarize penguins and count missing values](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#group_by-and-summarize)

```r
penguins |>
  group_by(species) |>
  summarize(avg_body_mass = mean(body_mass, na.rm = TRUE))

penguins |>
  summarize(n = n(), missing_body_mass = sum(is.na(body_mass)))

penguins |>
  count(species, island)
```

`group_by()` + `summarize()` gives one row per group. `n()` counts rows, and `sum(is.na(body_mass))` counts missing values.

Key output:

```text
# A tibble: 3 × 2
  species   avg_body_mass
  <fct>             <dbl>
1 Adelie            3701.
2 Chinstrap         3733.
3 Gentoo            5076.
```

```text
# A tibble: 1 × 2
      n missing_body_mass
  <int>             <int>
1   344                 2
```

### [Plot penguins with `ggplot2`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#scatter-plot-two-quantitative-variables)

```r
# Two quantitative variables: scatter plot
ggplot(penguins, aes(x = flipper_len, y = body_mass)) +
  geom_point()

# Add colour and labels
ggplot(penguins, aes(x = flipper_len, y = body_mass, colour = species)) +
  geom_point() +
  labs(
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    colour = "Species"
  )

# One quantitative variable: histogram
ggplot(penguins, aes(x = body_mass, fill = species)) +
  geom_histogram(binwidth = 250, alpha = 0.6, position = "identity") +
  labs(x = "Body mass (g)", y = "Number of penguins", fill = "Species")

# One categorical variable: bar plot of counts
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar() +
  labs(x = "Island", y = "Number of penguins", fill = "Species")
```

The choice of `geom` depends on the variable types: continuous/continuous uses `geom_point()`, continuous counts use `geom_histogram()`, and categorical counts use `geom_bar()`.

### [Load model data and check `Sacramento`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#sacramento-house-sales)

```r
library(tidyverse)
library(tidymodels)

Sacramento
```

The `Sacramento` dataset comes with `tidymodels`/`modeldata`. It contains house-sale rows with predictors such as `sqft`, `beds`, `baths`, and an outcome `price`.

Key output:

```text
# A tibble: 932 × 9
   city           zip     beds baths  sqft type        price
   <fct>          <fct>  <int> <dbl> <int> <fct>       <int>
 1 SACRAMENTO     z95838     2     1   836 Residential 59222
```

### [Fit and read the first linear regression](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#fit-it-with-tidymodels)

```r
ggplot(Sacramento, aes(x = sqft, y = price)) +
  geom_point(alpha = 0.4) +
  labs(x = "House size (square feet)", y = "Sale price (USD)")

house_recipe <- recipe(price ~ sqft, data = Sacramento)

house_spec <- linear_reg() |>
  set_engine("lm") |>
  set_mode("regression")

house_fit <- workflow() |>
  add_recipe(house_recipe) |>
  add_model(house_spec) |>
  fit(data = Sacramento)
house_fit

tidy(house_fit)
```

The model is a linear regression because the outcome, `price`, is numeric. The `sqft` coefficient tells you how much the predicted price changes for one extra square foot.

Key output:

```text
Coefficients:
(Intercept)         sqft  
    13859.4        138.5
```

```text
# A tibble: 2 × 5
  term        estimate std.error statistic   p.value
  <chr>          <dbl>     <dbl>     <dbl>     <dbl>
1 (Intercept)   13859.   6949.        1.99 4.64e-  2
2 sqft            139.      3.80     36.5  1.11e-181
```

### What went wrong live

- **Codespace timed out during the Copilot demo**: Daniel’s Codespace timed out while he was showing the agent interface. It had to be restarted, which took time. He noted the tradeoff: waiting is annoying, but the free AI tokens can be useful for learning.
- **Display/Zoom mirroring question**: A student asked how to make the external display look like a particular two-screen layout. Daniel identified that the visible controls were Zoom window controls, not display-mirroring controls. He explained that the setup involved a separate computer/HDMI path and that it may not have been possible in that room; the issue was not a data or R problem.
- **Student confusion about `geom_col()` vs `geom_bar()`**: A student said they had used `geom_col()` and had not used `geom_bar()`. Daniel explained that both can make bar charts: `geom_bar()` counts rows by default, while `geom_col()` expects already-counted values. He warned against applying `geom_bar()` to an already summarized count table because it would recount the rows.

## Questions

- **Q:** A student asked why there was a `diagnosis` variable in the WHO tuberculosis example.
  **A:** The WHO `who2` column names encode three pieces of information: diagnosis method, gender, and age group, such as `sp_m_014`. The strategically placed underscores allow `pivot_longer()` to split the old column names into `diagnosis`, `gender`, and `age` using `names_to = c("diagnosis", "gender", "age")` and `names_sep = "_"`.

- **Q:** A student asked whether there is a difference between `|>` and `%>%`, and why one version would be used.
  **A:** `|>` is the newer base R pipe, available since R 4.0. `%>%` is the older tidyverse pipe. For basic `filter()`, `mutate()`, and `select()` code, they usually behave similarly, and old code can often be updated by find-and-replace. `%>%` may still appear in older R environments or in clinical-trial work where the R version is fixed.

- **Q:** A student asked how to make the display look like a particular two-panel layout.
  **A:** Daniel explained that the issue was a display/Zoom/HDMI mirroring problem, not a window-zoom problem. The separate computer setup may have made the desired mirroring impossible, but he was able to continue the class and noted that the session was being recorded.

- **Q:** A student said they had never used `geom_col()` and asked whether it was the same as `geom_bar()`.
  **A:** Yes, both can produce bar charts, but their defaults differ. `geom_bar()` counts the rows for each category. `geom_col()` expects the y-values to already be calculated. If the data are already summarized into counts, use `geom_col()` or explicitly set the stat to identity; otherwise `geom_bar()` may recount and give incorrect bar heights.

## Also on the slides

- [The tidyr toolkit](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#the-tidyr-toolkit): One-row table for when to use `pivot_longer()`, `pivot_wider()`, and delimiter-based splitting.
- [Rules of thumb](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#rules-of-thumb): Plotting checklist: answer one question per plot, label axes with units, use colorblind-friendly palettes, and avoid pie charts, 3D plots, and tables of numbers when a plot will do.
- [See the line](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#see-the-line): Adds `geom_smooth(method = "lm")` to the Sacramento scatter plot to draw the fitted regression line.
- [Coming up on Wednesday](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#coming-up-on-wednesday): Previews Lecture 2: a linear regression on periodontal treatment during pregnancy and birth weight, and a logistic regression on storage age of transfused blood and prostate cancer recurrence, with odds ratios.
- [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#data-and-credits): Sources for `pew.csv`, `billboard.csv`, `weather.csv`, and `who2`.
- [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#data-and-credits): Source for the Palmer penguins dataset and adapted *Data Science: A First Introduction* material.
- [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#data-and-credits): Source for the `Sacramento` dataset and adapted *Data Science: A First Introduction* chapter 8 material.

## Assignments

- [ ] Before Wednesday, 2026-11-04: start the course GitHub Codespace, trust the folder, open `example.qmd`, and render it.
- [ ] Wednesday, 2026-11-04: fork the repository and work in your own copy for the modelling lab.
- [ ] Optional, no stated due date: read Wickham (2014) *Tidy Data* through Section 4 as a reference for the examples used in class.

---

- prompt: prompt-notes.md @ uncommitted
- prompt-hash: ce286dee74ee
- model: qwen3.8-27b-sglang (requested: qwen3.8-27b-sglang)
- backend: local (SGLang)
- inputs: transcript-plaud.md, materials.md
- generated: 2026-11-04
