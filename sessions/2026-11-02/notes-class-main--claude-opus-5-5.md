# Tidy Data, Wrangling with dplyr, Plotting with ggplot2, and a First Linear Model

Date Time: 2026-11-02 13:00:00

Location: ECC 100 LT

Instructor: Daniel Chen, PhD, MPH

## Summary

This was the first of Daniel Chen's two sessions in MEDI 504A. It was a lecture with live coding. Most of the time went to **tidy data**. A dataset is tidy when each variable is a column, each observation is a row, and each cell holds a single value. Data that is easy for a person to enter or read, like a spreadsheet with one column per year or per week, is often not tidy. We worked through the examples from Hadley Wickham's 2014 *Tidy Data* paper: the Pew religion and income survey, the Billboard top 100 from 2000, the WHO tuberculosis counts (`who2`), and a weather station dataset. For each one we first spotted the pattern in the messy columns, then fixed it with `pivot_longer()`, sometimes followed by `pivot_wider()`. Real examples showed why this matters. Colour-coded Excel cells lose their meaning in R. Adding a totals row contaminates the data. The NHS in England tracked COVID counts with one new spreadsheet column per day until they ran out of columns.

The second part used the Palmer penguins to introduce the core dplyr functions: `select()` for columns, `filter()` for rows, `mutate()` to add or change columns, and `group_by()` with `summarize()` for per-group summaries. We chained them together with the pipe, `|>`. We also saw a trick for counting missing values with `sum(is.na())`. Next came ggplot2. The first step in making a plot is to decide which variables you want and what type each one is. Two continuous variables call for a scatter plot (`geom_point()`), one continuous variable for a histogram, and a categorical variable for a bar chart.

The session ended with a first look at modelling. The type of the outcome variable, the one on the left of the `~`, decides whether you are doing regression (a number) or classification (a category). We fit a linear regression of house price on square footage for the Sacramento data with tidymodels and read the slope: about 138.5 USD more per extra square foot. The instructor also demonstrated the Copilot coding agent inside the course's GitHub Codespace, with a strong warning about data privacy. The next session is the hands-on lab on Wednesday, 2026-11-04, covering linear and logistic regression on medical data.

## Knowledge Points

### 1. The course setup and resources

- **Course website**: <https://chendaniely.github.io/MEDI-504A-2026W1-biostats/>. Each section has the slides at the top, with the slide contents written out below. You can scroll and copy code without clicking through the slides, and some people print it to PDF to annotate.
- **The two sessions**:
  - Lecture 1, Tidy data: Monday, 2026-11-02, 1:00–3:00 PM, ECC 100 LT.
  - Lecture 2, Modelling lab: Wednesday, 2026-11-04, 1:00–3:00 PM, DHCC 4223, a different building. Anything that didn't fit today spills over into Wednesday.
- **GitHub Codespace**: a ready-made R/Quarto environment in the browser, useful if you don't want to install anything or risk messing up your own computer.
  - You need a GitHub account. Signing up for the **GitHub Student Pack** gives you free credits for things that are normally paid.
  - The right-hand panel is GitHub Copilot connected to an LLM, so you can do agentic coding without paying for an API key. By the instructor's recollection, the free allowance is about 1,500 requests per month before you are rate-limited.
  - Startup is slow because everything installs from scratch. The slides say about 4 minutes the first time, and in class it took closer to 10. If it times out, it has to restart, which means waiting again.
- **Data science workflow** (from *R for Data Science*): import, then tidy, then a cycle of transform, visualize, and model, then communicate. Today was mostly tidy and transform, with a first look at visualize and model. Communicating means writing a report, for example a Quarto document that holds your cleaning, findings, and figures and can be exported.
- **References** (all freely available; you can paste a chapter into an LLM and ask for help working through it):
  - *Data Science: A First Introduction*, the UBC DSCI 100 textbook: <https://datasciencebook.ca/>
  - *Data Science for the Biomedical Sciences* (ds4biomed), the instructor's dissertation textbook for teaching data science to clinicians, with many health datasets: <https://ds4biomed.tech/>
  - *R for Data Science* (2e): <https://r4ds.hadley.nz/>
  - *Tidy Modeling with R*: <https://www.tmwr.org/>
  - Wickham (2014), *Tidy Data*: <https://doi.org/10.18637/jss.v059.i10>. Read only up to section 4. From the "tidy tools" section onward the paper uses functions you won't be using, since it dates from 2014.

### 2. What tidy data is

- **tidyverse**: a meta-package. One `library(tidyverse)` loads seven or eight packages, including **tidyr** (tidying), **dplyr** (wrangling), and **ggplot2** (plotting).
- **The three rules of tidy data** (*R for Data Science* 2e, chapter 5):
  1. Each **variable** is a column, and each column is a variable.
  2. Each **observation** is a row, and each row is an observation.
  3. Each **value** is a cell, and each cell is a single value.
- **The original 2014 definition**: the third rule was "each type of observational unit forms a table". That rule is really about databases, where data is split into separate tables and joined back together. The newer definition replaces it with "each value is a cell". Observational units come back in Lecture 2.
- **"Messy in many ways, tidy in only one"**: datasets from the wild are messy in all sorts of ways, but every tidy dataset fits the same three rules. Find the small patterns and fix them one piece at a time.
- **Easy for a human vs. easy for a computer**: a wide table is easy to hand-curate and fits a lot on a published page. The tidy version is often longer and harder for a person to read. That's fine. Tidy data lets you point the computer at actual columns to summarize, plot, and model.
- **A cell holding more than one thing**: the most common case is colour-coding in Excel, such as green for good and red for bad. The cell then holds a number *and* a colour. R and other data science languages have no concept of cell colour, so that information is lost on import. **If you need to flag rows, create a new column for the flag.**
- **Don't add a totals row to your data**: in Excel you might add a row at the bottom with `=SUM(...)` and drag it across. That contaminates the data, because the sum of the column now includes your total, and so would anything else you compute or any model you fit. Do summaries in code without modifying the original data.

### 3. Tidy or not? (the quiz)

- **Table 1, a `rate` column like `745/19987071`**: not tidy. Each cell holds two values, cases and population. (A rate in epidemiology is counts over some period or population.) You can't directly ask for the case count or the population.
- **Table 2, columns named `1999` and `2000`**: not tidy. The years are column headers but are really values of a `year` variable. **Sniff test:** if several column names follow a pattern you could describe ("those look like years"), the headers are values.
- **Table 3, a `type` column (cases/population) and a `count` column**: not tidy, and this one is tricky. Each column does hold one thing, but `count` mixes two variables. **Sniff test:** take a summary statistic of the column (mean, min, max). If the single number you get back doesn't make sense, as with averaging cases together with total population, something is wrong.
- **Table 4, `country`, `year`, `cases`, `population`**: tidy. Each column is a variable, and you can ask meaningful questions like "what is the maximum number of cases?"
- **Getting from table 3 to table 4**: pivot the table wider. The unique values of `type` become new columns (`cases`, `population`), and `count` fills in the body. This is the same operation as an Excel pivot table.

### 4. Five ways data gets messy (from the 2014 paper)

1. Column headers are values, not variable names.
2. Multiple variables are stored in one column.
3. Variables are stored in both rows and columns.
4. Multiple types of observational units are stored in the same table.
5. A single observational unit is stored in multiple tables.
- **Why 4 and 5 matter for health data**: hospital data isn't one dataset. There are encounters, patients, procedures, and other tables. Splitting them avoids duplication: your demographics don't need repeating at every encounter, only your patient ID. This is why a data request isn't as simple as "give me the data", since someone has to find the pieces and join them. Problems 4 and 5 are covered in Lecture 2.
- **Data formats**: tutorials usually use CSV because any computer can open one without installing anything. The tidyverse can also read Excel files. Hospital data isn't really stored as a pile of CSVs.

### 5. Reshaping with tidyr

- **`pivot_longer()`**: takes many columns and pivots them into many rows (wide to long). It is the function you'll use most. Main arguments:
  - `cols =`: which columns to pivot. You can choose them in several ways:
    - **by exclusion**: `-religion` ("everything except religion") or `!(country:year)`. Here `!` means "not", the opposite.
    - **by pattern**: `starts_with("wk")`.
    - **by position**: a range of columns.
  - `names_to =`: the name of the new column that holds the old column names.
  - `values_to =`: the name of the new column that holds the cell values.
  - `names_prefix =`: strips a prefix such as `"wk"` from the names, so you get `1` instead of `wk1`.
  - `names_transform = list(week = as.integer)`: turns the remaining text into a number.
  - `names_sep = "_"`: splits each column name into several new columns, used together with a vector in `names_to`.
  - `values_drop_na = TRUE`: drops rows where the value is missing, for example the weeks a song wasn't on the chart.
- **`pivot_wider()`**: the reverse (long to wide). The unique values of one column become new columns. Two key arguments:
  - `names_from =`: the column to pivot out.
  - `values_from =`: the column whose values fill in the table.
  - Watch out for duplicate rows. If two rows share the same identifiers, for example two people measuring Afghanistan in 2000, the pivot can't put both in one cell. The instructor wasn't sure what R does by default and said to pay attention when this can happen. One fix is to add a column recording who took the measurement.
- **`separate()`**: splits one column into several. Splitting a column name can be done in two steps (`pivot_longer()` then `separate()`) or in one step with `names_sep` inside `pivot_longer()`. The slides' toolkit table names `separate_wider_delim()` as the function for this.
- **One step or two?** The slides do it all in one call to save space. The instructor often writes it in two steps because the code is clearer.
- **Big picture**: tidying is mostly a big `pivot_longer()` or `pivot_wider()` step. Everything else, such as how you pick columns or split names, is details that vary by dataset. It's rarely one function alone: maybe `pivot_longer()` with a separate, or `pivot_longer()` then `pivot_wider()`. **Fix the easier problem first.** When you ask an LLM for help with headers-as-values, the thing to look for is `pivot_longer()`.
- **Text vs. numbers**: if a "number" column is really text, sorting it gives 1, 10, 11, 12, … instead of 1, 2, 3, because it is sorted alphabetically. Converting with `as.integer` fixes this.

### 6. The worked tidying examples

- **Pew survey** (`data/pew.csv`): one row per religion, with income brackets (`<$10k`, `$10-20k`, …) as column headers. These are values of an `income` variable. `pivot_longer()` takes it from 18 × 11 to 180 × 3 (`religion`, `income`, `frequency`). Each religion is now repeated, which is harder to read. But you can now `group_by(religion)` and `summarize()` a total, or find the maximum frequency and which religion and income group it belongs to.
- **Billboard** (`data/billboard.csv`): one row per song in 2000, with `wk1` to `wk76` holding its rank each week. Tidy, it has seven columns: `year`, `artist`, `track`, `time`, `week`, `rank`, `date`. A song gets one row per week on the chart: as many as 76, as few as one. You can then ask, for each week, what the average rank is across songs, or for each artist, what their best rank was.
- **WHO tuberculosis** (`who2`, ships with tidyr): column names like `sp_m_014` pack three variables into one name: diagnosis method (`sp`), gender (`m`), and age group (`014`). Each count belongs to that combination, and you can't ask for "all 0–14 counts" or "the total per age group" because there's no column to point at. Pivot longer and split on `_` to get `diagnosis`, `gender`, `age`, `count`. US census data is notorious for headers like this.
- **Weather** (`data/weather.csv`, a weather station in Mexico): days are spread across `d1` to `d31` (problem 1), *and* `tmax` and `tmin` sit as rows of the `element` column (problem 3). After pivoting longer, a single `temp` column mixes maximums and minimums. Its average or maximum is meaningless, since the maximum of that column is just the max of the maximums. That failed sniff test is the hint that you also need `pivot_wider()` on `element`.
- **Leave yourself breadcrumbs**: when hand-curating data, use consistent prefixes, dashes, or underscores in column names (like `wk1`, `wk2`, … or `sp_m_014`) so you can later select and split columns by pattern. Many languages don't allow names starting with a number anyway. The instructor has even used `!!` as a separator when the data already contained dashes and underscores.
- **Warning: spreadsheets run out of columns.** The NHS in England tracked COVID counts by adding a new column for each day and fit models from that spreadsheet. When they hit the column limit, new data overwrote the last column. Gaps of days to months appeared and the models fell apart. Spreadsheets have far more rows than columns, so **add new data as rows, and keep each column a variable.**

### 7. Dates

- **Make dates real dates**: computers can only do date arithmetic, such as subtracting two dates to get the days between them, on a proper date/date-time type. Under the hood, computers convert dates to seconds, do the maths, and convert back. Time zones matter too.
- **`make_date(year, month, day)`**: builds a date from three columns (used in the weather example).
- **Billboard dates**: `date = date.entered + (week - 1) * 7` gives the date for each week on the chart.
- **Excel caution**: Excel tries to be helpful and may silently turn values such as rates into dates.

### 8. Wrangling with dplyr

- **Palmer penguins**: 344 penguins, 3 species, 3 islands near Palmer Station, Antarctica. It is built into R since version 4.5. Columns: `species`, `island`, `bill_len`, `bill_dep`, `flipper_len`, `body_mass`, `sex`, `year`. `as_tibble()` makes it print nicely.
- **`select()` chooses columns**: by name (`select(penguins, species, bill_len, body_mass)`) or by pattern (`starts_with("bill")`), and you can mix the two.
  - With survey data, keep only the questions you need, for example demographics plus Q21–Q47. In Qualtrics, free-text "other" answers are in columns ending in `_text`, which you can select with an "ends with" pattern.
  - You don't need one clever pattern that does everything. Several simple patterns are fine.
- **`filter()` chooses rows**: rows where the condition is `TRUE` pass through.
  - **Say it right: you *select* columns and *filter* rows.** Using the words that match the function names helps you remember them.
  - `>` means strictly greater than, not greater than or equal.
  - `==` tests equality. A single `=` *sets* a value. Use two equal signs to compare.
  - `&` means "and". `|` (the vertical bar, Shift plus the key above Enter on a North American keyboard) means "or", for example `species == "Chinstrap" | species == "Adelie"`.
  - `!` negates a condition. Sometimes "sex is not male" is easier than listing every other value. This is common with free-text survey answers, where people won't follow the instructions the way you expected.
- **`mutate()` adds or changes columns**: for example `body_mass_kg = body_mass / 1000`. Use it for new calculations or for converting a column's type.
  - `mutate()` returns a new data frame and does not change `penguins`. To keep the result, assign it with `<-`.
  - The instructor's habit: create a *new* column (e.g., a numeric version of a text column) so you can visually check the conversion worked, then drop the originals with `select()` at the end. Using the functions repeatedly like this is a common pattern.
- **Three ways to chain steps**:
  - save each step as its own object (`penguins_1`, `penguins_2`, …), which is fine but creates intermediate objects
  - nest the calls, f(g(h(x))), which you have to read inside out
  - **the pipe `|>`**: passes what's on its left as the first argument of the function on its right. Read each `|>` as "and then".
- **Warning: type `|>` with no space.** With a space, `| >` is read as "or" followed by "greater than", which makes no sense.
- **Reading piped code**: scan down the function names first (penguins, mutate, filter, select) to get the gist, then go back for the details. Reading code "in circles" is fine. Shorter code isn't always better. Write steps you'll understand later, because the extra microsecond doesn't matter.
- **Summary function**: takes many numbers and returns one (mean, median, min, max, count, standard deviation).
- **`group_by()` + `summarize()`**: whenever you think "for each unique value of …", reach for `group_by()`. `summarize()` puts one or more summary functions into a table, e.g., `avg_body_mass = mean(body_mass, na.rm = TRUE)`. You can compute several at once by adding more, separated by commas, e.g., a max, a min, and a standard deviation. Think of a patient's lab values: average, minimum, maximum, and current value.
- **`na.rm = TRUE`**: without it, a single `NA` makes the whole mean `NA`.

### 9. Missing values

- **`NA`**: how R (and Python) represent a truly missing value. An empty string isn't the same thing. Someone may have typed a space or skipped past the question, which is different from not answering. Health datasets often use codes like `99` to mark "missing" explicitly, so they can tell "forgot to ask" apart from "not applicable".
- **`n()`**: counts the number of rows.
- **`sum(is.na(body_mass))`**: `is.na()` returns `TRUE`/`FALSE` for each value. `TRUE` counts as 1 and `FALSE` as 0, so summing gives the number missing. `sum(!is.na(...))` counts the values that are *not* missing. Dense tricks like this are a good thing to paste into an LLM with "what is happening here?"

### 10. Plotting with ggplot2

- **Start from the variables**: ggplot2 needs tidy data, because you have to point at columns. First decide which variables you want and their type:
  - **continuous / quantitative**: a number, e.g., `flipper_len`, `body_mass`
  - **categorical**: groups with no order, e.g., `sex`, `island`
  - **ordered categorical**: categories with an order, e.g., stages of disease
- **Three parts of every plot**: aesthetic mappings with `aes()`, mapping columns to `x`, `y`, `colour`, `fill`; geoms, which say how to draw them; and scales and labels. Layers are added with `+`. (Hadley Wickham has said he wishes `+` had been a pipe, but ggplot2 predates the tidyverse.)
- **Two continuous variables, so a scatter plot**: `geom_point()`. It isn't called `geom_scatter()`, but that's easy to look up. Knowing "two continuous variables, so a scatter plot" matters more, because if you can say that sentence, an LLM can fill in the code.
- **`colour = species`** in `aes()` colours points by a column. In the penguins plot the Gentoo points separate clearly from the other two species, and you could almost draw a line between them. A model could handle that split first, and a harder model could handle the rest. Doing things in steps is fine.
- **`labs()`**: human-readable axis and legend labels. Themes and backgrounds are polish. An LLM can help with these ("remove the grey background"). For exploration, the default plot is fine.
- **One continuous variable, so a histogram**: `geom_histogram()`.
- **Categorical variable, so count it with a bar chart**: `geom_bar()`. Adding `fill =` with another categorical variable gives a stacked bar chart. A one-word change gives a **dodged** bar chart with the bars side by side. Use stacked if you care about totals and the rough breakdown, dodged if you care about comparing the height of each group. In exploration, it's fine to make every plot.
- **`geom_bar()` vs `geom_col()`**: see the questions section below.
- **Privacy when getting LLM help with plots**: pasting *code* into a chat interface generally leaks nothing beyond column names. Something like tumour width or length gives nothing away, though in some settings column names themselves could be sensitive. Think about it before you paste.

### 11. From tidy data to models

- **Two kinds of prediction questions**, decided by the type of the outcome:
  - **regression**: the outcome is a number (house price, birth weight, an albumin score)
  - **classification**: the outcome is a category (will the patient die, yes or no; what disease stage). The simplest is a **binary outcome** (yes/no), modelled with logistic regression on Wednesday.
- **Only the outcome's type matters**: predictors on the right can be numbers or categories. Treating a continuous lab value as a category would leave the model trying to predict an endless number of categories.
- **Names for the same things**: inputs are predictors, independent variables, or X's. The output is the response, dependent variable, or Y.
- **Model formula `price ~ sqft`**: the outcome is on the left of the tilde `~` (Shift plus the key left of 1) and the predictors are on the right. It needs one row per observation and one column per variable, which is exactly tidy data. If you can't point to a column, you can't put it in a model.
- **Explore first**: don't start modelling straight away. Two numeric variables, so draw a scatter plot. With more than two variables you can't see everything at once, but that doesn't mean a model should only use two. You might use all of a patient's CBC values to predict something.
- **Linear regression is the line y = mx + b, written by a statistician**: $\text{price} = \beta_0 + \beta_1 \times \text{sqft}$. $\beta_0$ is the intercept, which the computer works out. $\beta_1$ is the slope. With more predictors it becomes $\beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots$ (statisticians write the intercept first). Past three dimensions you can't see the line, but the model still works. With several predictors, each slope is the change in the outcome for that predictor while the others stay the same.
- **Reading the slope**: for every extra square foot, the predicted Sacramento house price goes up by about 138.5 USD. Linear and logistic regression are common in biostatistics because you can state results in a sentence like that. Many fancier machine learning methods (covered in a later course) don't give you that sentence.
- **Cleaning is cyclic**: it's fine to clean, visualize, and then re-`filter()` and `select()` right before modelling. Data doesn't have to be processed once in one place.

### 12. The coding agent in the Codespace

- **What makes it different from a chatbot**: the Copilot agent can read your files and edit them directly. You don't copy and paste. It then asks whether to keep the changes. This is how most agentic coding works.
- **Warning: the agent literally reads your files. Never put passwords in your code, and keep data privacy in mind.**
- **The catch**: one request can produce hundreds of lines of edits that you then have to understand and manage. Your role shifts to confirming that results are correct, so you need to be able to follow the process.
- How to use LLMs properly is taught later in the course by another instructor.

## Code from class

### [Loading the tidyverse](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#packages)

```r
library(tidyverse)   # loads tidyr, dplyr, ggplot2, readr, and more
```

### [Reading and tidying the Pew survey](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-1-column-headers-are-values)

```r
pew <- read_csv("data/pew.csv")
pew

pew_tidy <- pew |>
  pivot_longer(
    cols = -religion,          # pivot every column except religion
    names_to = "income",       # old column headers go into `income`
    values_to = "frequency"    # old cell values go into `frequency`
  )
pew_tidy
```

Before, one row per religion and income brackets across the top (18 rows × 11 columns):

```
# A tibble: 18 × 11
   religion `<$10k` `$10-20k` `$20-30k` `$30-40k` `$40-50k` `$50-75k` `$75-100k`
   <chr>      <dbl>     <dbl>     <dbl>     <dbl>     <dbl>     <dbl>      <dbl>
 1 Agnostic      27        34        60        81        76       137        122
```

After [`pivot_longer()`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#pivot_longer-wide-to-long), "Agnostic" is repeated and each income bracket is its own row (180 rows × 3 columns):

```
# A tibble: 180 × 3
   religion income             frequency
   <chr>    <chr>                  <dbl>
 1 Agnostic <$10k                     27
 2 Agnostic $10-20k                   34
 3 Agnostic $20-30k                   60
 ...
10 Agnostic Don't know/refused        96
```

### [Total people per religion](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#now-we-can-summarize-it)

```r
pew_tidy |>
  group_by(religion) |>                  # for each unique religion...
  summarize(count = sum(frequency))      # ...add up the frequencies
```

```
# A tibble: 18 × 2
   religion                count
   <chr>                   <dbl>
 1 Agnostic                  826
 2 Atheist                   515
 3 Buddhist                  411
 4 Catholic                 8054
```

### [Tidying the Billboard chart](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-1-again-the-billboard-chart)

```r
billboard <- read_csv("data/billboard.csv")
billboard
```

`read_csv()` reports the column types. Note that `wk66` to `wk76` came in as logical (`lgl`) because they are entirely empty, and that `date.entered` was recognised as a date:

```
Rows: 317 Columns: 81
chr   (2): artist, track
dbl  (66): year, wk1, wk2, wk3, wk4, wk5, wk6, wk7, wk8, wk9, wk10, wk11, wk...
lgl  (11): wk66, wk67, wk68, wk69, wk70, wk71, wk72, wk73, wk74, wk75, wk76
date  (1): date.entered
time  (1): time
```

[Tidy the weeks](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#tidy-the-weeks):

```r
billboard_tidy <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),                 # select columns by pattern
    names_to = "week",
    names_prefix = "wk",                      # "wk1" becomes "1"
    names_transform = list(week = as.integer),# "1" (text) becomes 1 (number)
    values_to = "rank",
    values_drop_na = TRUE # drop weeks the song was not on the chart
  ) |>
  # the date at a rank = the date it entered + (week - 1) weeks
  mutate(date = date.entered + (week - 1) * 7) |>
  arrange(artist, track, week) |>             # tidy up the display
  select(year, artist, track, time, week, rank, date)
billboard_tidy
```

```
# A tibble: 5,307 × 7
    year artist  track                   time    week  rank date      
   <dbl> <chr>   <chr>                   <time> <int> <dbl> <date>    
 1  2000 2 Pac   Baby Don't Cry (Keep... 04:22      1    87 2000-02-26
 2  2000 2 Pac   Baby Don't Cry (Keep... 04:22      2    82 2000-03-04
 3  2000 2 Pac   Baby Don't Cry (Keep... 04:22      3    72 2000-03-11
```

`week` is now `<int>`, a real number that sorts 1, 2, 3, and `date` is a real `<date>`.

### [Splitting the WHO tuberculosis headers](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#split-the-header-into-three-variables)

```r
who2   # ships with tidyr; 7,240 rows × 58 columns like sp_m_014

who2 |>
  pivot_longer(
    cols = !(country:year),                     # everything NOT country to year
    names_to = c("diagnosis", "gender", "age"), # three new columns...
    names_sep = "_",                            # ...split on the underscore
    values_to = "count",
    values_drop_na = TRUE
  )
```

```
# A tibble: 76,046 × 6
   country      year diagnosis gender age   count
   <chr>       <dbl> <chr>     <chr>  <chr> <dbl>
 1 Afghanistan  1997 sp        m      014       0
 2 Afghanistan  1997 sp        m      1524     10
```

### [Tidying the weather data: longer, then wider](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-3-variables-in-rows-and-columns)

```r
weather <- read_csv("data/weather.csv")
weather
```

```
   id       year month element    d1    d2    d3 ...
 1 MX17004  2010     1 tmax       NA  NA    NA
 2 MX17004  2010     1 tmin       NA  NA    NA
 3 MX17004  2010     2 tmax       NA  27.3  24.1
 4 MX17004  2010     2 tmin       NA  14.4  14.4
```

[Pivot longer, then wider](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#pivot-longer-then-wider):

```r
weather_tidy <- weather |>
  pivot_longer(                               # problem 1: days in the headers
    cols = starts_with("d"),
    names_to = "day",
    names_prefix = "d",
    names_transform = list(day = as.integer),
    values_to = "temp",
    values_drop_na = TRUE
  ) |>
  mutate(date = make_date(year, month, day)) |> # a real date for date arithmetic
  pivot_wider(                                # problem 3: tmax/tmin stuck in rows
    names_from = element, # tmax and tmin become their own columns
    values_from = temp
  ) |>
  select(id, date, tmax, tmin) |>
  arrange(id, date)
weather_tidy
```

```
# A tibble: 33 × 4
   id      date        tmax  tmin
   <chr>   <date>     <dbl> <dbl>
 1 MX17004 2010-01-30  27.8  14.5
 2 MX17004 2010-02-02  27.3  14.4
```

### [Loading the penguins](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#the-palmer-penguins)

```r
penguins <- as_tibble(penguins)   # built into R 4.5+; tibble prints nicely
penguins
```

```
# A tibble: 344 × 8
   species island    bill_len bill_dep flipper_len body_mass sex     year
   <fct>   <fct>        <dbl>    <dbl>       <int>     <int> <fct>  <int>
```

### [Choosing columns with `select()`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#select-choose-columns)

```r
select(penguins, species, bill_len, body_mass)   # by name
select(penguins, starts_with("bill"))            # by pattern: bill_len, bill_dep
```

### [Choosing rows with `filter()`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#filter-choose-rows)

```r
filter(penguins, flipper_len > 190)                            # 243 rows
filter(penguins, flipper_len > 190 & species == "Chinstrap")   # 53 rows; == compares
```

### [Adding a column with `mutate()`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#mutate-add-or-change-columns)

```r
mutate(penguins, body_mass_kg = body_mass / 1000)   # grams to kilograms
```

The new column doesn't fit on screen. It shows up in the footer as `# ℹ 1 more variable: body_mass_kg <dbl>`, and the table now has 9 columns instead of 8. `penguins` itself is unchanged unless you assign the result with `<-`.

### [Doing many steps at once](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#doing-many-steps-at-once)

```r
# option 1: save each step as its own object
penguins_1 <- mutate(penguins, body_mass_kg = body_mass / 1000)
penguins_2 <- filter(penguins_1, flipper_len > 190)
penguins_3 <- select(penguins_2, species, flipper_len, body_mass_kg)

# option 2: nest the calls (read from the inside out)
penguins_nested <- select(
  filter(mutate(penguins, body_mass_kg = body_mass / 1000), flipper_len > 190),
  species, flipper_len, body_mass_kg
)
```

[Option 3, the pipe `|>`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#the-pipe), read as "and then":

```r
penguins |>
  mutate(body_mass_kg = body_mass / 1000) |>
  filter(flipper_len > 190) |>
  select(species, flipper_len, body_mass_kg)
```

### [Average body mass per species](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#group_by-and-summarize)

```r
penguins |>
  group_by(species) |>
  summarize(avg_body_mass = mean(body_mass, na.rm = TRUE))   # skip NAs
```

```
  species   avg_body_mass
  <fct>             <dbl>
1 Adelie            3701.
2 Chinstrap         3733.
3 Gentoo            5076.
```

### [Counting missing values](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#how-many-values-are-missing)

```r
penguins |>
  summarize(n = n(), missing_body_mass = sum(is.na(body_mass)))  # TRUE = 1, FALSE = 0
```

```
      n missing_body_mass
  <int>             <int>
1   344                 2
```

### [Scatter plot: flipper length vs body mass](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#scatter-plot-two-quantitative-variables)

```r
ggplot(penguins, aes(x = flipper_len, y = body_mass)) +   # data + which columns
  geom_point()                                            # points = scatter plot
```

[Add colour and labels](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#add-colour-and-labels):

```r
ggplot(penguins, aes(x = flipper_len, y = body_mass, colour = species)) +
  geom_point() +
  labs(
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    colour = "Species"
  )
```

### [Histogram: one continuous variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#histogram-one-quantitative-variable)

```r
ggplot(penguins, aes(x = body_mass, fill = species)) +
  geom_histogram(binwidth = 250, alpha = 0.6, position = "identity") +
  labs(x = "Body mass (g)", y = "Number of penguins", fill = "Species")
```

### [Bar plot: counting a categorical variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#bar-plot-counts-of-a-categorical-variable)

```r
ggplot(penguins, aes(x = island, fill = species)) +   # fill = stacked bars
  geom_bar() +                                         # geom_bar() does the counting
  labs(x = "Island", y = "Number of penguins", fill = "Species")
```

### [Modelling Sacramento house prices](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#sacramento-house-sales)

```r
library(tidyverse)
library(tidymodels)   # Sacramento comes with it, in modeldata

Sacramento            # 932 sales: city, zip, beds, baths, sqft, type, price, ...
```

[Explore first with a scatter plot](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#is-size-related-to-price):

```r
ggplot(Sacramento, aes(x = sqft, y = price)) +
  geom_point(alpha = 0.4) +
  labs(x = "House size (square feet)", y = "Sale price (USD)")
```

[Fit it with tidymodels](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#fit-it-with-tidymodels):

```r
house_recipe <- recipe(price ~ sqft, data = Sacramento)  # outcome ~ predictor

house_spec <- linear_reg() |>
  set_engine("lm") |>
  set_mode("regression")          # regression because price is a number

house_fit <- workflow() |>        # put the recipe and model together, then fit
  add_recipe(house_recipe) |>
  add_model(house_spec) |>
  fit(data = Sacramento)
house_fit
```

```
Coefficients:
(Intercept)         sqft  
    13859.4        138.5  
```

The `sqft` coefficient is the slope: for every one-square-foot increase, the predicted price goes up by about 138.50 USD. Wednesday's session explains the rest of this code in detail.

### What went wrong live

- **Codespace timed out**: during the break the instructor's Codespace timed out. Restarting meant waiting for the full startup again, about 10 minutes. Because it was still loading, some demos (more detail on `summarize()`) were pushed to Wednesday. If you close or idle a Codespace, expect to wait for it to start again.
- **`who2` printed as all `NA`**: the instructor was briefly puzzled that the table looked entirely missing. The first rows are Afghanistan 1980–1989, which have no counts. Real data appears further down (from 1997 in the tidied output), and `values_drop_na = TRUE` in the pivot drops the empty cells.
- **Output running off the screen**: a last-minute font change meant some slides, such as the `mutate()` output, didn't fit. The new `body_mass_kg` column was there but only listed in the footer as "1 more variable".
- **No animation for `pivot_longer()`**: the instructor looked for an animation in *R for Data Science* and couldn't find one, so he explained by comparing the before and after tables instead.

## Questions

- **Q:** (On the quiz) How do you turn the table with `type` and `count` columns into the tidy one with `cases` and `population` columns?
  **A:** Pivot it wider. Each unique value of `type` becomes its own column, and the `count` values fill the body. It is literally an Excel pivot table: drag one variable to the columns and another to the body. Be careful if the same country and year can appear twice, for example two people taking measurements. The instructor wasn't sure what R does by default in that case. Add a column recording who took the measurement so each row is unique.
- **Q:** Why is there a diagnosis part in the WHO column names?
  **A:** The full `who2` dataset packs three things into each header: diagnosis method, sex, and age group (e.g., `sp_m_014`). There's a strategically placed underscore between them, so `names_sep = "_"` with `names_to = c("diagnosis", "gender", "age")` splits them into three columns, and the cell values go into `count`.
- **Q:** How much of the 2014 *Tidy Data* paper should we read? (A student suggested stopping around section 6.)
  **A:** Stop at the "tidy tools" section. The paper is from 2014 and from there on uses functions you won't be using. Reading up to section 4 covers all the concepts from class.
- **Q:** What's the difference between `%>%` and `|>`? Why would you use one over the other?
  **A:** `%>%` came from a package and was the only tidyverse pipe for a long time. `|>` is now built into base R in modern versions, and since around 2023 people have mostly switched to it. Using `%>%` on a new project is mostly habit. One reason to keep `%>%` is clinical trial work where the R version is fixed as part of a regulatory submission and is too old to have `|>`. There are differences, but for basic `filter()`, `mutate()`, and `select()` code, a find-and-replace from one to the other generally just works.
- **Q:** A student had used `geom_col()` rather than `geom_bar()`. Are they different?
  **A:** Both make bar charts. `geom_bar()` takes a single column and does the counting for you (`stat = "count"`). `geom_col()` uses `stat = "identity"`, so you give it two columns with the counts already calculated, e.g., `x = species, y = n` after a `count()`. Use `geom_col()` (or `geom_bar(stat = "identity")`) when you've already summarized the data. **Don't use plain `geom_bar()` on a table you've already summarized:** it recounts the rows, so each species gets a count of 1 and the bars are wrong.

## Also on the slides

- [Rules of thumb](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#rules-of-thumb): one question per plot, label axes with units, use colourblind-friendly palettes, avoid pie charts, 3D, and tables of numbers.
- [How many values are missing?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#how-many-values-are-missing): the second example, `count(species, island)`, which counts penguins for each species and island combination (skipped in class).
- [The tidyr toolkit](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#the-tidyr-toolkit): summary table of when to use `pivot_longer()`, `pivot_wider()`, and `separate_wider_delim()` / `names_sep`.
- [Read the coefficients](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#read-the-coefficients): `tidy(house_fit)` returns the coefficients as a table with standard errors and p-values.
- [See the line](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#see-the-line): adds the fitted line to the scatter plot with `geom_smooth(method = "lm", formula = y ~ x, se = FALSE)`.
- [More than one predictor](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#more-than-one-predictor): the idea was discussed, and the slide shows the code `recipe(price ~ sqft + beds + baths, data = Sacramento)`.
- [Coming up on Wednesday](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#coming-up-on-wednesday): a linear regression on periodontal treatment during pregnancy and birth weight, and a logistic regression (reported as odds ratios) on transfused blood storage age and prostate cancer recurrence.

## Assignments

- [ ] Before the lab on Wednesday, 2026-11-04 (no formal due date given): make a GitHub account, sign up for the GitHub Student Pack, then follow the [Codespaces](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/setup-codespaces.html) page. Click **Open in GitHub Codespaces**, trust the folder when VS Code opens, and open and render `example.qmd`. On Wednesday you'll fork the repository and work in your own copy.
- [ ] Optional: read Wickham (2014), *Tidy Data* (<https://doi.org/10.18637/jss.v059.i10>), up to section 4.

---

- prompt: prompt-notes.md @ uncommitted
- prompt-hash: ce286dee74ee
- model: claude-opus-5-5 (requested: opus)
- backend: claude
- inputs: transcript-plaud.md, materials.md
- generated: 2026-11-04
