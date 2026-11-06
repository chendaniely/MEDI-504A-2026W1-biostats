# Lecture 2: Observational units and interpreting regression models

Date Time: 2026-11-04

Instructor: Daniel Chen

## Summary

This session continued the biostatistics-with-`tidyverse` material by returning to the tidy-data paper’s idea of **observational units**. Using the Billboard example from Lecture 1, the instructor showed that a table that is tidy for analysis can still be inefficient for storage because song-level information such as `year`, `artist`, `track`, and `time` is repeated for every week a song appears on the chart. The remedy was to split the data into separate tables: one `song` table containing one row per unique song and an `id` column, and one `rank` table containing `id`, `week`, `date`, and `rank`. The two tables can later be recombined with `left_join()`. The instructor connected this pattern to hospital databases, where one table might contain patient demographics linked to patients by a medical record number, and another table might contain encounters, tests, or imaging results.

The second major part of the session was reading and interpreting regression models. The instructor introduced linear regression with the `Sacramento` house-sales data and `price ~ sqft + type`, and logistic regression with the `licorice_gargle` data from the `medicaldata` package. The emphasis was not on statistical theory but on practical interpretation: how categorical predictors become dummy variables, which level is the reference level, how to interpret continuous coefficients, how to interpret categorical coefficients as comparisons to the reference level, and how logistic-regression coefficients are reported on the log-odds scale before being exponentiated into odds ratios. The instructor also showed the equivalent base-R functions `lm()` and `glm()`.

The session also included substantial practical material about working in GitHub Codespaces, RStudio, Positron, and Quarto, including how to render `.qmd` files to HTML and PDF, how Codespaces start, stop, sleep, and get deleted, and how to use agentic coding tools such as GitHub Copilot or Claude to help with the assignment. The instructor repeatedly stressed that coding agents can be useful but must be reviewed carefully, especially because they may write code that reads local files, prints data, or accidentally accesses sensitive information. The homework assignment involved tidying the Ebola dataset, making tables and figures, and fitting either a linear or logistic regression model.

## Knowledge Points

### 1. Tidy data and observational units

- **Original third rule of tidy data**:
  - Each variable forms a column.
  - Each observation forms a row.
  - Each **type of observational unit** forms a table.
- **Observational unit**:
  - The kind of thing being observed.
  - Examples from class: a song, a patient, a hospital visit, a hospital encounter.
- **Tidy for analysis vs tidy for storage**:
  - A single analysis table is often convenient for modeling and plotting.
  - But it may store the same information many times.
  - In the Billboard example, each song’s `artist`, `track`, `year`, and `time` was repeated for every week that song was on the chart.
  - For storage, it is better to separate repeated song information into its own table and link it by an ID.
- **Billboard split**:
  - The analysis table contained one row per song-week ranking.
  - The storage-style design separated it into:
    - `song`: one row per unique song, with `id`, `artist`, `track`, `year`, and `time`.
    - `rank`: one row per ranking, with `id`, `week`, `date`, and `rank`.
  - `distinct(artist, track, year, time)` removed the repeated song rows.
  - `mutate(id = row_number(), .before = 1)` created a new integer `id` column and placed it at the front of the table.
  - `left_join()` was used to attach the song `id` back to the weekly ranking data.
- **Hospital database analogy**:
  - Hospitals often store data in separate tables by observational unit.
  - Examples:
    - `patients`: one row per patient, with demographic information.
    - `encounters`: one row per visit, with the patient’s ID.
    - `conditions`, `medications`, and `observations`: one row per record, linked to patients and encounters by IDs.
  - To analyze the data, you join the tables you need into one tidy analysis table.
- **Why this matters for analysis**:
  - If a patient’s birthday or demographic value is wrong, you only need to fix it in the `patients` table.
  - You do not need to fix it across every encounter, lab, imaging, or medication row.
  - Later analyses can join the cleaned patient table back to encounter or encounter-derived tables.
- **Synthea**:
  - A project that creates synthetic, realistic hospital datasets.
  - Useful for practicing data structures without real patient data.
  - Available in smaller and larger sizes, including examples around 100 patients up to very large simulated hospitals.
  - Available in CSV format, which is friendly to introductory R work, as well as HL7 FHIR and C-CDA formats.
- **Health data standards**:
  - **HL7**: family of standards used by hospital systems to exchange clinical data.
  - **FHIR**: HL7’s newer standard; sends a patient, encounter, or observation as a “resource” through web APIs.
  - **OMOP Common Data Model**, from the OHDSI community:
    - A shared database layout for observational health data.
    - Allows the same analysis code to run on many different hospital databases.
    - Supports multi-site analyses without emailing protected patient data between institutions.
    - Helps standardize coding systems, for example mapping different country-specific ICD codes into a common structure.
- **Instructor’s dissertation example**:
  - The instructor mentioned a walkthrough for 30-day hospital readmissions.
  - It used Synthea-style data to find patients with a heart attack or myocardial infarction and check whether they returned to the emergency department within 30 days.
  - The example required combining patient-level data with encounter-level data.

### 2. Course setup: R, Quarto, Codespaces, Positron, and saving work

- **GitHub Codespaces**:
  - Students were directed to the course GitHub repository, click **Code**, then the **Codespaces** tab, and open the Codespace on `main`.
  - Opening a Codespace can take several minutes.
  - The Codespace environment is preconfigured for the course.
- **Forking the repository**:
  - Forking makes a copy of the repository under the student’s GitHub account.
  - It is not required for the session.
  - It is mainly a backup option so the student has their own copy.
  - If the instructor later changes the original repository, a fork can be updated with **Sync from Upstream**.
- **If Git does not make sense**:
  - Students could use the **Download ZIP** button to get the homework assignment and course files.
  - The important file for the assignment is the `.qmd` homework file.
- **Quarto**:
  - Quarto is used to make reproducible reports by capturing code, output, and prose in one document.
  - It is the successor to R Markdown.
  - R Markdown is still supported, but new features are focused on Quarto.
  - Quarto bundles more functionality into one system and works better with multiple programming languages.
  - For the homework, students needed to render the document to HTML and PDF.
  - In RStudio or Positron, a render or preview button can be used.
  - In VS Code or Codespaces, the Quarto extension may be needed; in Positron it comes with the tool.
  - In Codespaces, if the button is not visible, open the Command Palette with `Control+Shift+P` / `Command+Shift+P` / `Apple+Shift+P`, or click the button that starts with `>`.
  - When using the Command Palette this way, type `>` first so it knows it is in command mode.
  - The render workflow should produce the Quarto file plus rendered HTML and PDF files.
- **Positron**:
  - An IDE made by the same people behind RStudio.
  - It is essentially VS Code with many RStudio-like data-science features added.
  - It has a variable viewer and plot viewer on the right side.
  - It is not the same as the Codespace environment.
  - It can be useful for local work, especially if you also use Python and R.
- **Saving work in Codespaces**:
  - Work is stored inside the Codespace instance.
  - Closing the browser tab does **not** delete the Codespace.
  - The Codespace can go to sleep or shut down after inactivity, but it can be restarted.
  - **Deleting** a Codespace removes its contents.
  - If you have not committed work to Git, deleting the Codespace can lose the work.
  - A simple safety measure is to copy and paste the `.qmd` file to your own computer.
  - If you know Git, you can also add, commit, and push changes to your fork.
- **Maximum Codespaces error**:
  - Free GitHub accounts have a limit on how many Codespaces can be open.
  - If a new Codespace fails to start, go to `github.com/codespaces` and delete unused Codespaces.
  - Deleting an old, unused Codespace frees up a slot.
  - Do not delete the active Codespace containing your current work.

### 3. Choosing between linear and logistic regression

- **First question: what is the outcome?**
  - The outcome is the thing you are trying to measure or predict.
  - It must be a column you can point to in the data.
  - If it is not a column, the data are not tidy enough for that model.
- **Continuous outcome**:
  - Use linear regression.
  - Example: house `price`, blood values such as albumin, or other numeric quantities.
  - Linear regression estimates an expected value on the outcome’s original scale.
- **Categorical outcome**:
  - Use logistic regression when the outcome is binary or can be collapsed into a binary question.
  - Example: sore throat `yes` / `no`.
  - A multi-level categorical variable can sometimes be collapsed into a binary one, for example “has cancer: yes/no” or “stage 1–2 vs stage 3–4.”
- **Predictors can be continuous or categorical**:
  - The predictor variables do **not** determine whether you use linear or logistic regression.
  - The outcome variable determines the model family.
  - Predictors may be continuous, such as `sqft` or `bmi`, or categorical, such as `type` or `treatment`.
- **Why start with linear and logistic regression**:
  - They are simple, fast, and interpretable.
  - They are good baseline models.
  - In healthcare and financial markets, interpretability can matter because you may need to explain why a treatment, policy, or decision changed.
  - More complex machine-learning models can be compared against these simpler baselines.
- **Class imbalance**:
  - If one outcome category is much more common than another, a model can achieve high accuracy by always predicting the majority class.
  - Example: if almost no one gets a rare disease, a model that always says “no disease” can still have very high accuracy but may be useless for detecting the rare cases.
  - This matters for rare diseases, spam filters, and other imbalanced outcomes.
  - The class did not go deep into imbalance solutions; that is more advanced machine-learning or evaluation content.

### 4. Linear regression with `tidymodels`

- **Data used in class**:
  - `Sacramento` house-sales data.
  - Outcome: `price`.
  - Predictors: `sqft` and `type`.
- **`type` as a categorical variable**:
  - The observed levels were:
    - `Condo`
    - `Multi_Family`
    - `Residential`
  - Counts were imbalanced:
    - `Condo`: 53
    - `Multi_Family`: 13
    - `Residential`: 866
- **Dummy variables**:
  - A regression needs numeric input, so R converts a categorical variable into dummy variables.
  - Statistics often calls this **dummy variable encoding**.
  - Computer science and machine learning often call the same idea **one-hot encoding**.
  - For a factor with `n` levels, a regression with an intercept uses `n - 1` dummy variables.
  - The missing level is the **reference level**.
  - In the house example, `Condo` was the reference level because it was the first level.
- **House `type` dummy encoding**:
  - `typeMulti_Family`:
    - `1` if the house is `Multi_Family`.
    - `0` otherwise.
  - `typeResidential`:
    - `1` if the house is `Residential`.
    - `0` otherwise.
  - `Condo`:
    - Represented by both dummy variables being `0`.
- **Fitting the model**:
  - The tidymodels workflow was:
    - Specify the model with `linear_reg()`.
    - Fit it with `fit(price ~ sqft + type, data = Sacramento)`.
    - Get a tidy coefficient table with `tidy(house_fit, conf.int = TRUE)`.
  - `tidy()` returns a data frame/tibble of model results, which can be plotted or saved.
- **Interpreting a continuous variable**:
  - General sentence:
    > For every 1 [unit] increase in [variable], we expect [outcome] to increase or decrease by [estimate] [units], all else remaining the same.
  - For `sqft`:
    > For every 1 square foot increase in size, we expect the sale price to increase by $139, all else remaining the same.
  - “All else remaining the same” means the other predictors in the model, here `type`, are held fixed.
  - Units matter:
    - If a variable is standardized, one unit may mean one standard deviation.
    - If a variable is raw, one unit may be one square foot, one mg/dL, one kg/m², etc.
- **Interpreting a categorical variable**:
  - General sentence:
    > We expect [outcome] for [level] to be [estimate] [units] higher or lower than for [reference level], all else remaining the same.
  - For `typeMulti_Family`:
    > We expect multi-family homes to sell for $66,224 less than condos, all else remaining the same.
  - For `typeResidential`:
    > We expect residential homes to sell for $8,253 more than condos, all else remaining the same.
- **Confidence interval includes 0**:
  - For `typeResidential`, the 95% confidence interval went from about -$15,594 to $32,100.
  - Because the interval included 0, the data did not show a clear difference between residential homes and condos of the same size.
  - You still report the estimate and interval, but say the difference is unclear.
- **The intercept**:
  - The intercept is the expected outcome when all continuous variables are 0 and all categorical variables are at their reference level.
  - In the house model, that would correspond to a condo with 0 square feet, which does not exist.
  - The instructor advised not to over-interpret the intercept in that setting.
  - It is still necessary for making predictions.
- **Prediction vs interpretation**:
  - **Interpretation** asks: how does one predictor relate to the outcome while holding others fixed?
  - **Prediction** asks: given a specific house, what price does the model predict?
  - To predict, you use the intercept plus each predictor value multiplied by its coefficient.
  - Adding more predictors changes the coefficient values, but the interpretation skeleton for each individual coefficient remains the same.
- **Base R equivalent**:
  - `lm(price ~ sqft + type, data = Sacramento)` fits the same model.
  - Piping into `tidy()` gives the same coefficient table.
  - The instructor used `tidymodels` because the same workflow pattern can be used across many model types.

### 5. Logistic regression with `tidymodels`

- **Data used in class**:
  - `licorice_gargle` from the `medicaldata` package.
  - Trial of 235 adults having thoracic surgery with a large breathing tube.
  - Before the tube was inserted, patients were randomized to gargle licorice or sugar water.
  - Outcome: any sore throat 30 minutes after surgery.
- **Recoding variables**:
  - `sore_throat`:
    - Created from `pacu30min_throatPain > 0`.
    - Levels were `no` and `yes`.
  - `treatment`:
    - `0` became `sugar`.
    - `1` became `licorice`.
  - `smoking`:
    - `3` became `never`.
    - `2` became `past`.
    - `1` became `current`.
  - `bmi`:
    - Selected from `preOp_calcBMI`.
  - `drop_na()` removed incomplete rows.
- **Which outcome level is modeled?**
  - `logistic_reg()` models the odds of the outcome’s **second** factor level.
  - `sore_throat` had levels `no` then `yes`.
  - Therefore the model estimated the odds of `yes`, meaning having a sore throat.
- **Predictor structure**:
  - `treatment`:
    - 2 levels.
    - Produces 1 dummy variable.
    - Reference level: `sugar`.
  - `bmi`:
    - Continuous.
    - Units: kg/m².
  - `smoking`:
    - 3 levels.
    - Produces 2 dummy variables.
    - Reference level: `never`.
- **Fitting the model**:
  - The tidymodels workflow was:
    - Specify with `logistic_reg()`.
    - Fit with `fit(sore_throat ~ treatment + bmi + smoking, data = sore)`.
    - Get coefficients with `tidy(sore_fit, conf.int = TRUE)`.
- **Log-odds scale**:
  - Logistic-regression coefficients are initially reported on the log-odds scale.
  - The log-odds transformation is:
    - `log(p / (1 - p))`
  - These values are hard to read directly.
- **Exponentiating coefficients**:
  - Use `tidy(exponentiate = TRUE, conf.int = TRUE)` to convert estimates and confidence intervals to odds ratios.
  - `std.error`, `statistic`, and `p.value` remain on the log-odds scale.
  - An odds ratio of 1 means no difference.
  - Below 1 means lower odds.
  - Above 1 means higher odds.
- **Interpreting a continuous variable in logistic regression**:
  - General sentence:
    > For every 1 [unit] increase in [variable], we expect the odds of [outcome] to be multiplied by [odds ratio], all else remaining the same.
  - For `bmi`:
    > For every 1 kg/m² increase in BMI, we expect the odds of a sore throat to be multiplied by 0.95, all else remaining the same.
  - The interval included 1, so the data did not show a clear effect of BMI.
- **Interpreting categorical variables in logistic regression**:
  - General sentence:
    > We expect the odds of [outcome] for [level] to be [odds ratio] times the odds for [reference level], all else remaining the same.
  - For `treatmentlicorice`:
    > We expect the odds of a sore throat for patients who gargled licorice to be 0.384 times the odds for patients who gargled sugar water, all else remaining the same.
  - For `smokingpast`:
    > We expect the odds of a sore throat for past smokers to be 4.38 times the odds for people who never smoked, all else remaining the same.
  - `smokingcurrent` compares current smokers with people who never smoked, not with past smokers.
- **Odds are not probability**:
  - An odds ratio compares odds, not probabilities.
  - Say “0.38 times the odds,” not “0.38 times as likely” or “62% less likely.”
  - Odds and probability are close only when the outcome is rare.
  - In this dataset, about 27% of patients had a sore throat, so the distinction matters.
- **Reference levels**:
  - The model can mathematically use any level as the reference.
  - The choice changes the sentences you write, even though the fitted model represents the same relationships.
  - If you care about a particular group, make that group the reference level by changing the factor levels.
- **Base R equivalent**:
  - `glm(sore_throat ~ treatment + bmi + smoking, family = binomial, data = sore)` fits the same logistic regression.
  - `family = binomial` is what makes `glm()` a logistic regression.
  - Piping into `tidy(exponentiate = TRUE, conf.int = TRUE)` gives the same odds ratios.

### 6. Using coding agents for the assignment

- **Agentic coding**:
  - The instructor demonstrated using an AI coding agent, similar to GitHub Copilot in Codespaces or Claude, to help with the assignment.
  - The agent can read files, write code, run code, edit the `.qmd` file, and suggest changes.
- **Recommended workflow**:
  - Ask it to answer one question or one small chunk at a time.
  - Do not ask it to do the entire assignment blindly.
  - Review the code it writes.
  - Run the code yourself and check the output.
  - If you do not understand a line, ask the agent to explain it.
  - You can guide it with class terminology, for example: “We learned `pivot_longer()` in class; can you use that?”
- **Privacy and safety**:
  - Do not put passwords, API keys, or identifiable patient data into prompts or local files that an agent can read.
  - Coding agents may need to write code to print or inspect data.
  - If it prints patient data, that data may be sent to the model provider.
  - For hospital data, use only a hospital-sanctioned model or secure environment, not a personal subscription.
  - Agents can make mistakes, choose the wrong line to edit, or write code in a way you would not have written.
  - The human still has to review and understand the code.
- **Codespace agent safety**:
  - An agent in a Codespace can access files in that environment.
  - It can read file contents, run code, and edit files.
  - The instructor emphasized that this is different from simply pasting text into a web chat.
  - The main protection is careful human review and not exposing sensitive files to the environment.

### 7. Homework assignment and Ebola dataset

- **Assignment file**:
  - The homework is in a Quarto file, referred to as `homework.qmd`.
  - The assignment is intended to be completed in R and Quarto.
  - It can be done in Codespaces, Positron, or RStudio.
- **Ebola dataset task**:
  - Use `pivot_longer()` to tidy columns that follow a pattern.
  - Use `pivot_wider()` to separate combined values such as cases and deaths.
  - Use `mutate()` to clean or transform variables.
  - Ensure the `date` column is a proper date object.
- **Date handling**:
  - The raw Ebola dates may be stored as character strings in month-day-year order.
  - Use `mdy()` to interpret month-day-year strings as dates.
  - Use `ymd()` for year-month-day strings.
  - Once a column is a proper `Date` object, it prints in ISO 8601 format: year-month-day.
  - Date arithmetic then works, for example subtracting one date from another.
- **Tables and figures**:
  - The assignment asked for a frequency table, including for each country the first and last report and the cases and deaths for those reports.
  - It also asked for a figure based on a chosen column and a description of what is visible.
- **Regression task**:
  - Choose from provided datasets.
  - Fit either a linear regression or a logistic regression model.
  - Use `tidy()` to get the coefficient table.
  - Write an interpretation sentence for one or more coefficients.
- **Submission**:
  - The goal was to render the Quarto document to HTML and PDF.
  - If rendering failed, there was a fallback checklist, and the instructor indicated that grading could be adjusted.
  - The exact due date was not stated in the provided transcript or slides.

## Code from class

### [Load the `tidyverse` for the tidy-data part](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#packages)

```r
library(tidyverse)
```

This loaded the packages used for the tidy-data reshaping and dplyr work.

### [Rebuild the tidy Billboard table](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#the-tidy-billboard-data-again)

```r
billboard_tidy <- read_csv("data/billboard.csv") |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    names_transform = list(week = as.integer),
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  mutate(date = date.entered + (week - 1) * 7) |>
  arrange(artist, track, week) |>
  select(year, artist, track, time, week, rank, date)
```

This recreated the analysis-oriented tidy Billboard table from Lecture 1. Each row represents one song’s rank for one week. `pivot_longer()` collapsed the weekly ranking columns, and `mutate()` calculated the chart date.

The result was a tibble with 5,307 rows and 7 columns:

```text
# A tibble: 5,307 × 7
    year artist  track                   time    week  rank date      
   <dbl> <chr>   <chr>                   <time> <int> <dbl> <date>    
 1  2000 2 Pac   Baby Don't Cry (Keep... 04:22      1    87 2000-02-26
 2  2000 2 Pac   Baby Don't Cry (Keep... 04:22      2    82 2000-03-04
 3  2000 2 Pac   Baby Don't Cry (Keep... 04:22      3    72 2000-03-11
```

### [Split the Billboard table into `song` and `rank` tables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#problem-4-multiple-observational-units)

```r
song <- billboard_tidy |>
  distinct(artist, track, year, time) |>
  mutate(id = row_number(), .before = 1)
song
```

This created the song-level table. `distinct()` kept one row per unique song, and `row_number()` created an `id` column for each song.

```text
# A tibble: 317 × 5
      id artist         track                    year time  
   <int> <chr>          <chr>                   <dbl> <time>
 1     1 2 Pac          Baby Don't Cry (Keep...  2000 04:22 
 2     2 2Ge+her        The Hardest Part Of ...  2000 03:15 
 3     3 3 Doors Down   Kryptonite               2000 03:53 
```

```r
rank <- billboard_tidy |>
  left_join(song, by = c("artist", "track", "year", "time")) |>
  select(id, week, date, rank)
rank
```

This created the ranking-level table. It joined the song `id` back to the weekly rows and kept only the columns needed for the ranking table.

```text
# A tibble: 5,307 × 4
      id  week date        rank
   <int> <int> <date>     <dbl>
 1     1     1 2000-02-26    87
 2     1     2 2000-03-04    82
 3     1     3 2000-03-11    72
 4     1     4 2000-03-18    77
 5     1     5 2000-03-25    87
```

### [Join the `song` and `rank` tables back together](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#join-them-back-together)

```r
rank |>
  left_join(song, by = "id")
```

This reproduced the original tidy analysis table by joining the ranking table back to the song information using the shared `id` column.

### [Load packages for the linear regression example](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#packages)

```r
library(tidyverse)
library(tidymodels)
```

`tidymodels` was used for the model specification, fitting, and `tidy()` workflow.

### [Inspect the house `type` counts](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#back-to-sacramento)

```r
Sacramento |>
  count(type)
```

This checked the categorical variable before modeling. The output showed the three housing types and their counts:

```text
# A tibble: 3 × 2
  type             n
  <fct>        <int>
1 Condo           53
2 Multi_Family    13
3 Residential    866
```

The first level, `Condo`, became the reference level for the categorical dummy variables.

### [Fit and tidy a linear regression model](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#fit-the-model)

```r
house_fit <- linear_reg() |>
  fit(price ~ sqft + type, data = Sacramento)

house_tidy <- tidy(house_fit, conf.int = TRUE)
house_tidy
```

This fitted a linear regression predicting `price` from `sqft` and `type`. `tidy()` returned the coefficient table with confidence intervals.

```text
# A tibble: 4 × 7
  term             estimate std.error statistic   p.value conf.low conf.high
  <chr>               <dbl>     <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
1 (Intercept)         6885.  12169.       0.566 5.72e-  1  -16996.    30766.
2 sqft                 139.      3.88    35.7   1.64e-176     131.      146.
3 typeMulti_Family  -66224.  26222.      -2.53  1.17e-  2 -117686.   -14762.
4 typeResidential     8253.  12151.       0.679 4.97e-  1  -15594.    32100.
```

The key interpretation points were:

- `sqft`: for each additional square foot, price is estimated to increase by about $139, holding `type` fixed.
- `typeMulti_Family`: multi-family homes are estimated to sell for about $66,224 less than condos, holding square footage fixed.
- `typeResidential`: residential homes are estimated to sell for about $8,253 more than condos, but the confidence interval includes 0, so the difference is not clear.

### [Fit the same linear model in base R](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#the-same-model-in-base-r)

```r
lm(price ~ sqft + type, data = Sacramento) |>
  tidy(conf.int = TRUE)
```

Base R’s `lm()` produced the same estimates and confidence intervals as the `tidymodels` version.

### [Load packages for the logistic regression example](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#packages)

```r
library(tidyverse)
library(tidymodels)
library(medicaldata)
```

`medicaldata` provided the `licorice_gargle` dataset.

### [Recode the licorice-gargle variables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#recode-the-variables)

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

This created a smaller modeling dataset. The outcome `sore_throat` was `yes` if `pacu30min_throatPain > 0`. The treatment labels were `sugar` and `licorice`, and smoking labels were `never`, `past`, and `current`.

### [Check the sore-throat counts](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#which-level-are-we-modelling?)

```r
count(sore, sore_throat)
```

This checked the outcome distribution:

```text
      sore_throat   n
    1          no 169
    2         yes  64
```

Because `sore_throat` had levels `no` then `yes`, `logistic_reg()` modeled the odds of the second level, `yes`.

### [Fit and tidy a logistic regression model](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#fit-the-model)

```r
sore_fit <- logistic_reg() |>
  fit(sore_throat ~ treatment + bmi + smoking,
      data = sore)

tidy(sore_fit, conf.int = TRUE)
```

This fitted the logistic regression and printed the coefficients on the log-odds scale.

```text
# A tibble: 5 × 7
  term              estimate std.error statistic  p.value conf.low conf.high
  <chr>                <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
1 (Intercept)         0.0240    0.979     0.0245 0.980      -1.91     1.95  
2 treatmentlicorice  -0.956     0.316    -3.02   0.00252    -1.59    -0.346 
3 bmi                -0.0517    0.0385   -1.34   0.179      -0.129    0.0229
4 smokingpast         1.48      0.428     3.45   0.000551    0.664    2.35  
5 smokingcurrent      0.635     0.410     1.55   0.121      -0.152    1.46  
```

These estimates are log-odds and are not directly easy to interpret.

### [Exponentiate the logistic coefficients to get odds ratios](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#exponentiate-to-get-odds-ratios)

```r
sore_or <- sore_fit |>
  tidy(exponentiate = TRUE, conf.int = TRUE)
sore_or
```

`exponentiate = TRUE` converted the estimates and confidence intervals to odds ratios.

```text
# A tibble: 5 × 7
  term              estimate std.error statistic  p.value conf.low conf.high
  <chr>                <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
1 (Intercept)          1.02     0.979     0.0245 0.980       0.149     7.02 
2 treatmentlicorice    0.384    0.316    -3.02   0.00252     0.204     0.707
3 bmi                  0.950    0.0385   -1.34   0.179       0.879     1.02 
4 smokingpast          4.38     0.428     3.45   0.000551    1.94     10.5  
5 smokingcurrent       1.89     0.410     1.55   0.121       0.859     4.33 
```

Key interpretation points:

- `bmi`: for each 1 kg/m² increase in BMI, the odds of a sore throat are multiplied by about 0.95.
- `treatmentlicorice`: the odds of a sore throat for licorice are about 0.384 times the odds for sugar water.
- `smokingpast`: the odds of a sore throat for past smokers are about 4.38 times the odds for people who never smoked.
- `smokingcurrent`: the odds for current smokers are compared to never smokers, and that interval includes 1.

### [Fit the same logistic model in base R](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#the-same-model-in-base-r)

```r
glm(sore_throat ~ treatment + bmi + smoking,
    family = binomial, data = sore) |>
  tidy(exponentiate = TRUE, conf.int = TRUE)
```

Base R’s `glm()` with `family = binomial` produced the same odds ratios and confidence intervals as the `tidymodels` version.

### What went wrong live

- **Codespaces would not start or appeared to die**:
  - Some students’ Codespaces stopped, went to sleep, or showed “Stop” instead of setting up.
  - The instructor said to leave the Codespace open and wait for it to restart when possible.
  - A common cause was reaching the free account’s maximum number of open Codespaces.
  - Fix: go to `github.com/codespaces`, delete unused Codespaces, and then restart the needed one.
- **Quarto render button produced an error in Codespaces**:
  - A student pressed the Quarto render button and received an error, and the Codespace stopped.
  - The instructor linked this to the Codespace being overloaded or stopped, including the maximum Codespaces issue.
  - Fix: free up Codespace slots, restart the active Codespace, and render again.
- **Agent edited the wrong line**:
  - The instructor asked the coding agent to put a solution in a specific line of `homework.qmd`.
  - The agent initially inserted the wrong chunk or the next problem’s code in that location.
  - The instructor gave a more specific instruction: put the data-cleaning code in line 279 and the `group_by()` code in the next problem cell.
- **Dates printed as year-month-day after using `mdy()`**:
  - A student asked why dates printed as year, month, day even though `mdy()` was used.
  - This was not an error. `mdy()` interpreted the original character strings as month-day-year and converted them into Date objects.
  - Date objects display in ISO 8601 order, year-month-day.
  - If the original strings are year-month-day, use `ymd()` instead.
- **Saving work in Codespaces was unclear**:
  - Students were worried that work might disappear if they did not fork the repository.
  - The instructor explained that closing the tab does not delete the Codespace, but deleting the Codespace does delete the files.
  - Safe approaches: copy and paste the `.qmd` file locally, or use Git to commit and push the work.

## Questions

- **Q:** Do we have to download the Quarto extension first?
  **A:** If you are using Positron, it comes with the Quarto functionality. If you are using VS Code or a plain Codespace, you may need to install the Quarto extension through the Extensions panel. In the course Codespace, the instructor had already installed it. In RStudio, you can also render Quarto documents if Quarto is installed.

- **Q:** When I press the Quarto render button, it says there was an error, and then my Codespace stops.
  **A:** The instructor suspected the Codespace was overloaded or shut down, possibly because the free GitHub account had reached the maximum number of open Codespaces. The fix was to go to `github.com/codespaces`, delete other unused Codespaces, and restart the active one.

- **Q:** Was the Codespace we are using today “organic barnacle”?
  **A:** The Codespace names are randomly assigned. Each student may see a different name. The important thing is to identify the correct Codespace from the repository and not to have multiple active Codespaces from the same course unnecessarily.

- **Q:** Do we have to fork the repository in order to do the work?
  **A:** No. Forking is optional for the session. It mainly gives you a copy in your own GitHub account. You can also work directly in the instructor’s Codespace or download the ZIP file if Git does not make sense yet.

- **Q:** Does it matter what the reference value is?
  **A:** The model’s math still works no matter which level is chosen as the reference, but the interpretation sentence changes. It is usually better to choose a meaningful reference group, such as “never smoked” rather than an intermediate category. If you care about a particular group, you can change the factor levels so that group becomes the reference.

- **Q:** Does it get more complicated to interpret if you have more covariates?
  **A:** No, not in the interpretation structure. You still interpret one coefficient at a time, holding all other variables in the model fixed. Adding more variables changes the numerical estimates, but the same sentence skeleton is used for each individual coefficient.

- **Q:** If we add more variables after `type`, how do we look at price?
  **A:** There are two different tasks. If you are interpreting one variable, you isolate that coefficient and hold the others fixed. If you are predicting the price of a specific house, you use all the inputs: the intercept plus each predictor value multiplied by its coefficient, then add those pieces together.

- **Q:** Is it possible to make a sentence about the reference value, such as the odds for someone who does not smoke?
  **A:** Usually the reference level is the baseline, and the other levels are interpreted relative to it. You generally do not interpret the reference level by itself in the same way. If you specifically want to compare everything to a particular group, make that group the reference level instead.

- **Q:** If we end up doing the homework in R, how do we get the CSV? Is it part of a package?
  **A:** The dataset is provided in the course assignment folder or website. You can clone the repository or download the ZIP file. The main file to work from is the homework `.qmd` file.

- **Q:** Are dates always printed as year, month, and day even though I wrote `mdy()`?
  **A:** Yes, that is expected if the input was a character string in month-day-year format. `mdy()` converts it into a Date object, and Date objects print in year-month-day order. If your input strings are already year-month-day, use `ymd()` instead.

- **Q:** Is there an environment section in Codespaces where you can see variables like in RStudio?
  **A:** Codespaces is based on VS Code, which does not have the same variable viewer as RStudio. Positron does have a variable viewer. In Codespaces, you can print objects in a code chunk if you need to inspect them.

- **Q:** Does closing the Codespace tab delete it?
  **A:** No. Closing the tab does not delete the Codespace. It may sleep or shut down after inactivity, but it can be restarted. Deleting the Codespace, however, removes the files inside it. To be safe, copy the `.qmd` file to your computer or commit and push the work to Git.

## Also on the slides

- [Problem 5: one unit in many tables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#problem-5-one-unit-in-many-tables): covers the opposite tidy-data problem, where one kind of observation is split across many files with the same columns and can be stacked with `bind_rows()` or by passing multiple file names to `read_csv()`.
- [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#data-and-credits): lists sources for the Billboard example, the tidy-data paper, Synthea, and the health data standards mentioned in the session.
- [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#data-and-credits): lists the source of the `Sacramento` data and references used for interpreting regression coefficients.
- [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#data-and-credits): lists the source of `licorice_gargle` from `medicaldata` and references used for odds ratios and `tidymodels` interpretation.

## Assignments

- [ ] Complete the `homework.qmd` assignment: tidy the Ebola dataset with `pivot_longer()` and `pivot_wider()`, ensure the `date` column is a proper date, create the requested frequency table, create a figure and describe it, and fit either a linear regression or a logistic regression model with an interpretation of the coefficient table; due date not stated in the provided materials.
- [ ] Render the `homework.qmd` assignment to HTML and PDF, or follow the assignment checklist if rendering fails; due date not stated in the provided materials.

---

- prompt: prompt-notes.md @ fcb3cf5
- prompt-hash: ce286dee74ee
- model: qwen3.8-27b-sglang (requested: qwen3.8-27b-sglang)
- backend: local (SGLang)
- inputs: transcript-plaud.md, materials.md
- generated: 2026-11-05
