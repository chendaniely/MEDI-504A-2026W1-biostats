# Lecture 2 slides (Wednesday, 2026-11-04)

The slides the instructor taught from, as published on the course website:
their text, the R code, and the output each piece of code printed.
Plots are not included; the code before each [Plot] marker draws it.
Each heading links to its section on the website.

## [Observational units](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html)

### [Packages](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#packages)

``` r
library(tidyverse)
```

### [The original third rule](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#the-original-third-rule)

The original definition from the 2014 [*Tidy Data*
paper](https://vita.had.co.nz/papers/tidy-data.pdf) is:

1.  Each variable forms a column
2.  Each observation forms a row
3.  Each **type of observational unit** forms a table

An observational unit is the kind of thing you’re observing, for example
a song, a patient, or a hospital visit. The third rule says different
kinds of things belong in different tables.

### [The tidy Billboard data, again](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#the-tidy-billboard-data-again)

Here’s the tidy Billboard data from Lecture 1’s [Tidy
data](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html) section.

``` r
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

    Rows: 317 Columns: 81
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: ","
    chr   (2): artist, track
    dbl  (66): year, wk1, wk2, wk3, wk4, wk5, wk6, wk7, wk8, wk9, wk10, wk11, wk...
    lgl  (11): wk66, wk67, wk68, wk69, wk70, wk71, wk72, wk73, wk74, wk75, wk76
    date  (1): date.entered
    time  (1): time

    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
billboard_tidy
```

    # A tibble: 5,307 × 7
        year artist  track                   time    week  rank date      
       <dbl> <chr>   <chr>                   <time> <int> <dbl> <date>    
     1  2000 2 Pac   Baby Don't Cry (Keep... 04:22      1    87 2000-02-26
     2  2000 2 Pac   Baby Don't Cry (Keep... 04:22      2    82 2000-03-04
     3  2000 2 Pac   Baby Don't Cry (Keep... 04:22      3    72 2000-03-11
     4  2000 2 Pac   Baby Don't Cry (Keep... 04:22      4    77 2000-03-18
     5  2000 2 Pac   Baby Don't Cry (Keep... 04:22      5    87 2000-03-25
     6  2000 2 Pac   Baby Don't Cry (Keep... 04:22      6    94 2000-04-01
     7  2000 2 Pac   Baby Don't Cry (Keep... 04:22      7    99 2000-04-08
     8  2000 2Ge+her The Hardest Part Of ... 03:15      1    91 2000-09-02
     9  2000 2Ge+her The Hardest Part Of ... 03:15      2    87 2000-09-09
    10  2000 2Ge+her The Hardest Part Of ... 03:15      3    92 2000-09-16
    # ℹ 5,297 more rows

### [Problem 4: multiple observational units](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#problem-4-multiple-observational-units)

Our tidy Billboard table still mixes two kinds of things. The song
information (year, artist, track, time) is repeated on every row, for
every week the song was on the chart. We can split it into two tables
that share an `id` column.

``` r
song <- billboard_tidy |>
  distinct(artist, track, year, time) |>
  mutate(id = row_number(), .before = 1)
song
```

    # A tibble: 317 × 5
          id artist         track                    year time  
       <int> <chr>          <chr>                   <dbl> <time>
     1     1 2 Pac          Baby Don't Cry (Keep...  2000 04:22 
     2     2 2Ge+her        The Hardest Part Of ...  2000 03:15 
     3     3 3 Doors Down   Kryptonite               2000 03:53 
     4     4 3 Doors Down   Loser                    2000 04:24 
     5     5 504 Boyz       Wobble Wobble            2000 03:35 
     6     6 98^0           Give Me Just One Nig...  2000 03:24 
     7     7 A*Teens        Dancing Queen            2000 03:44 
     8     8 Aaliyah        I Don't Wanna            2000 04:15 
     9     9 Aaliyah        Try Again                2000 04:03 
    10    10 Adams, Yolanda Open My Heart            2000 05:30 
    # ℹ 307 more rows

``` r
rank <- billboard_tidy |>
  left_join(song, by = c("artist", "track", "year", "time")) |>
  select(id, week, date, rank)
rank
```

    # A tibble: 5,307 × 4
          id  week date        rank
       <int> <int> <date>     <dbl>
     1     1     1 2000-02-26    87
     2     1     2 2000-03-04    82
     3     1     3 2000-03-11    72
     4     1     4 2000-03-18    77
     5     1     5 2000-03-25    87
     6     1     6 2000-04-01    94
     7     1     7 2000-04-08    99
     8     2     1 2000-09-02    91
     9     2     2 2000-09-09    87
    10     2     3 2000-09-16    92
    # ℹ 5,297 more rows

### [Join them back together](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#join-them-back-together)

The `id` column links the two tables, so we can join them back together
when an analysis needs both.

``` r
rank |>
  left_join(song, by = "id")
```

    # A tibble: 5,307 × 8
          id  week date        rank artist  track                    year time  
       <int> <int> <date>     <dbl> <chr>   <chr>                   <dbl> <time>
     1     1     1 2000-02-26    87 2 Pac   Baby Don't Cry (Keep...  2000 04:22 
     2     1     2 2000-03-04    82 2 Pac   Baby Don't Cry (Keep...  2000 04:22 
     3     1     3 2000-03-11    72 2 Pac   Baby Don't Cry (Keep...  2000 04:22 
     4     1     4 2000-03-18    77 2 Pac   Baby Don't Cry (Keep...  2000 04:22 
     5     1     5 2000-03-25    87 2 Pac   Baby Don't Cry (Keep...  2000 04:22 
     6     1     6 2000-04-01    94 2 Pac   Baby Don't Cry (Keep...  2000 04:22 
     7     1     7 2000-04-08    99 2 Pac   Baby Don't Cry (Keep...  2000 04:22 
     8     2     1 2000-09-02    91 2Ge+her The Hardest Part Of ...  2000 03:15 
     9     2     2 2000-09-09    87 2Ge+her The Hardest Part Of ...  2000 03:15 
    10     2     3 2000-09-16    92 2Ge+her The Hardest Part Of ...  2000 03:15 
    # ℹ 5,297 more rows

### [Problem 5: one unit in many tables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#problem-5-one-unit-in-many-tables)

The opposite problem is one kind of observation split across many files,
such as one file per year or one per hospital site. If the files have
the same columns, we can stack them with `bind_rows()` or give
`read_csv()` all the file names at once.

### [How hospitals store data](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#how-hospitals-store-data)

Hospital databases follow the paper’s third rule, with one table per
kind of observational unit, linked by ID columns.

- `patients` has one row per patient
- `encounters` has one row per visit, with the patient’s ID
- `conditions`, `medications`, and `observations` have one row per
  record, with the patient and encounter IDs

To analyze the data, we join the tables we need into one tidy table.

[Synthea](https://synthetichealth.github.io/synthea/) creates fake but
realistic patient records stored this way. Its [downloads
page](https://synthetichealth.github.io/downloads.html) has samples of
100 patients in CSV, HL7 FHIR, and C-CDA formats.

### [Beyond CSVs: health data standards](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#beyond-csvs-health-data-standards)

In practice, health data is usually stored and shared using data
standards, not as a folder of CSV files.

- [HL7](https://www.hl7.org/) is the family of standards hospital
  systems use to exchange clinical data
- [FHIR](https://hl7.org/fhir/) (Fast Healthcare Interoperability
  Resources) is HL7’s newer standard, which sends a patient, an
  encounter, or an observation as a “resource” through web APIs
- The [OMOP Common Data
  Model](https://ohdsi.github.io/CommonDataModel/), from the
  [OHDSI](https://www.ohdsi.org/) community, is a shared database layout
  for observational health data, so the same analysis code can run on
  many hospitals’ databases

All of these follow the third rule, with one table (or resource) per
kind of observational unit, linked by IDs.

### [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#data-and-credits)

- `billboard.csv`: the tidy data paper’s Billboard example, via
  [`chendaniely/pandas_for_everyone`](https://github.com/chendaniely/pandas_for_everyone)
  and [`hadley/tidy-data`](https://github.com/hadley/tidy-data)
- Wickham, H. (2014). Tidy Data. *Journal of Statistical Software*,
  59(10). <https://doi.org/10.18637/jss.v059.i10> (PDF:
  <https://vita.had.co.nz/papers/tidy-data.pdf>)
- Synthea synthetic patient records:
  <https://synthetichealth.github.io/synthea/>
- Standards: [HL7](https://www.hl7.org/), [FHIR](https://hl7.org/fhir/),
  [OHDSI](https://www.ohdsi.org/) and its [OMOP Common Data
  Model](https://ohdsi.github.io/CommonDataModel/).

## [Interpreting a linear regression](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html)

### [Packages](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#packages)

``` r
library(tidyverse)
library(tidymodels)
```

### [Back to Sacramento](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#back-to-sacramento)

On Monday we fit `price ~ sqft` on the Sacramento house sales. Let’s add
`type`, a categorical variable, so we can see how to read both kinds of
variables.

``` r
Sacramento |>
  count(type)
```

    # A tibble: 3 × 2
      type             n
      <fct>        <int>
    1 Condo           53
    2 Multi_Family    13
    3 Residential    866

### [Dummy variables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#dummy-variables)

- A regression needs numbers, so R turns a categorical variable (a
  factor) into **dummy variables**, also called indicator variables
- Each dummy variable is a 0/1 column for one level, and there’s one for
  every level except the first
- The level without a column is the **reference level**, and every other
  level gets compared with it

### [Two names for the same idea](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#two-names-for-the-same-idea)

- Statistics calls this **dummy variable encoding**
- Computer science and machine learning call it **one-hot encoding**
- Both turn each level of a categorical variable into a 0/1 column
- One-hot encoding usually keeps a column for every level, while a
  regression with an intercept drops one, the reference level (R does
  this for us)

### [`type` as dummy variables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#type-as-dummy-variables)

`type` has 3 levels, so it becomes 2 dummy variables, with `Condo` as
the reference:

| `type`         | `typeMulti_Family` | `typeResidential` |
|----------------|:------------------:|:-----------------:|
| `Condo`        |         0          |         0         |
| `Multi_Family` |         1          |         0         |
| `Residential`  |         0          |         1         |

### [Fit the model](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#fit-the-model)

``` r
house_fit <- linear_reg() |>
  fit(price ~ sqft + type, data = Sacramento)

house_tidy <- tidy(house_fit, conf.int = TRUE)
house_tidy
```

    # A tibble: 4 × 7
      term             estimate std.error statistic   p.value conf.low conf.high
      <chr>               <dbl>     <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
    1 (Intercept)         6885.  12169.       0.566 5.72e-  1  -16996.    30766.
    2 sqft                 139.      3.88    35.7   1.64e-176     131.      146.
    3 typeMulti_Family  -66224.  26222.      -2.53  1.17e-  2 -117686.   -14762.
    4 typeResidential     8253.  12151.       0.679 4.97e-  1  -15594.    32100.

- One row for `sqft`
- One row for each dummy variable, and no row for `Condo`, the reference
  level

### [Interpreting a continuous variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#interpreting-a-continuous-variable)

> For every 1 \[unit\] increase in \[variable\], we expect \[outcome\]
> to increase (or decrease) by \[estimate\] \[units\], all else
> remaining the same.

For `sqft`:

> For every 1 square foot increase in size, we expect the sale price to
> increase by \$139, all else remaining the same (95% CI: \$131 to
> \$146).

- “All else remaining the same” means the other variables in the model,
  so here, a house of the same `type`

### [Interpreting a categorical variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#interpreting-a-categorical-variable)

> We expect \[outcome\] for \[level\] to be \[estimate\] \[units\]
> higher (or lower) than for \[reference level\], all else remaining the
> same.

For `typeMulti_Family`:

> We expect multi-family homes to sell for \$66,224 less than condos,
> all else remaining the same (95% CI: \$14,762 to \$117,686 less).

- Here “all else” is the size: a multi-family home and a condo with the
  same square footage
- The comparison is always with the reference level, `Condo`

### [When the interval includes 0](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#when-the-interval-includes-0)

For `typeResidential`:

> We expect residential homes to sell for \$8,253 more than condos, all
> else remaining the same (95% CI: -\$15,594 to \$32,100).

- The interval includes 0, so the data don’t show a clear difference
  between residential homes and condos of the same size
- We still report the estimate and its interval, and say that it’s
  unclear

### [The intercept](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#the-intercept)

- The intercept is the expected outcome when every continuous variable
  is 0 and every categorical variable is at its reference level
- Here that’s a condo with 0 square feet, which doesn’t exist, so we
  don’t interpret it

### [The same model in base R](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#the-same-model-in-base-r)

Base R’s `lm()` fits the same model with less code:

``` r
lm(price ~ sqft + type, data = Sacramento) |>
  tidy(conf.int = TRUE)
```

    # A tibble: 4 × 7
      term             estimate std.error statistic   p.value conf.low conf.high
      <chr>               <dbl>     <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
    1 (Intercept)         6885.  12169.       0.566 5.72e-  1  -16996.    30766.
    2 sqft                 139.      3.88    35.7   1.64e-176     131.      146.
    3 typeMulti_Family  -66224.  26222.      -2.53  1.17e-  2 -117686.   -14762.
    4 typeResidential     8253.  12151.       0.679 4.97e-  1  -15594.    32100.

- The same estimates and intervals as `linear_reg()`
- We use tidymodels because every kind of model goes through the same
  steps

### [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#data-and-credits)

- `Sacramento`: from modeldata, loaded with tidymodels
- Interpreting coefficients follows chapter 8 of [*Data Science: A First
  Introduction*](https://datasciencebook.ca/) and the [analysis
  chapter](https://ds4biomed.tech/analysis-intro.html) of *Data Science
  for the Biomedical Sciences*

## [Interpreting a logistic regression](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html)

### [Packages](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#packages)

``` r
library(tidyverse)
library(tidymodels)
library(medicaldata)
```

### [A sore throat after surgery](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#a-sore-throat-after-surgery)

`licorice_gargle` (from `medicaldata`) is a trial of 235 adults having
thoracic surgery with a large breathing tube. Before the tube went in,
they were randomized to gargle licorice or sugar water. Our outcome is
any sore throat 30 minutes after surgery.

### [Recode the variables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#recode-the-variables)

``` r
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

### [Which level are we modelling?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#which-level-are-we-modelling)

- `logistic_reg()` models the odds of the outcome’s **second** level
- `sore_throat` has the levels `no`, then `yes`, so every result is
  about the odds of a sore throat
- The predictors are a mix of both kinds:
  - `treatment`: 2 levels, so 1 dummy variable (reference `sugar`)
  - `bmi`: continuous, in kg/m²
  - `smoking`: 3 levels, so 2 dummy variables (reference `never`)

``` r
count(sore, sore_throat)
```

      sore_throat   n
    1          no 169
    2         yes  64

### [Fit the model](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#fit-the-model)

``` r
sore_fit <- logistic_reg() |>
  fit(sore_throat ~ treatment + bmi + smoking,
      data = sore)

tidy(sore_fit, conf.int = TRUE)
```

    # A tibble: 5 × 7
      term              estimate std.error statistic  p.value conf.low conf.high
      <chr>                <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
    1 (Intercept)         0.0240    0.979     0.0245 0.980      -1.91     1.95  
    2 treatmentlicorice  -0.956     0.316    -3.02   0.00252    -1.59    -0.346 
    3 bmi                -0.0517    0.0385   -1.34   0.179      -0.129    0.0229
    4 smokingpast         1.48      0.428     3.45   0.000551    0.664    2.35  
    5 smokingcurrent      0.635     0.410     1.55   0.121      -0.152    1.46  

- These estimates are on the **log-odds** scale,
  $\log\left(\frac{p}{1 - p}\right)$, which is hard to read

### [Exponentiate to get odds ratios](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#exponentiate-to-get-odds-ratios)

``` r
sore_or <- sore_fit |>
  tidy(exponentiate = TRUE, conf.int = TRUE)
sore_or
```

    # A tibble: 5 × 7
      term              estimate std.error statistic  p.value conf.low conf.high
      <chr>                <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
    1 (Intercept)          1.02     0.979     0.0245 0.980       0.149     7.02 
    2 treatmentlicorice    0.384    0.316    -3.02   0.00252     0.204     0.707
    3 bmi                  0.950    0.0385   -1.34   0.179       0.879     1.02 
    4 smokingpast          4.38     0.428     3.45   0.000551    1.94     10.5  
    5 smokingcurrent       1.89     0.410     1.55   0.121       0.859     4.33 

- `exponentiate = TRUE` turns each estimate and its interval into an
  **odds ratio** (`std.error`, `statistic`, and `p.value` stay on the
  log-odds scale)
- An odds ratio of 1 means no difference, below 1 means lower odds, and
  above 1 means higher odds

### [Interpreting a continuous variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#interpreting-a-continuous-variable)

> For every 1 \[unit\] increase in \[variable\], we expect the odds of
> \[outcome\] to be multiplied by \[odds ratio\], all else remaining the
> same.

For `bmi`:

> For every 1 kg/m² increase in BMI, we expect the odds of a sore throat
> to be multiplied by 0.95, all else remaining the same (95% CI: 0.88 to
> 1.02).

- Multiplied by 0.95 is the same as 5% lower odds
- The interval includes 1, so the data don’t show a clear effect of BMI

### [Interpreting a categorical variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#interpreting-a-categorical-variable)

> We expect the odds of \[outcome\] for \[level\] to be \[odds ratio\]
> times the odds for \[reference level\], all else remaining the same.

For `treatmentlicorice`:

> We expect the odds of a sore throat for patients who gargled licorice
> to be 0.38 times the odds for patients who gargled sugar water, all
> else remaining the same (95% CI: 0.20 to 0.71).

- That’s 62% lower odds, and the interval doesn’t include 1

### [A categorical variable with more levels](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#a-categorical-variable-with-more-levels)

Each dummy variable compares one level with the reference, `never`. For
`smokingpast`:

> We expect the odds of a sore throat for past smokers to be 4.38 times
> the odds for people who never smoked, all else remaining the same (95%
> CI: 1.94 to 10.48).

- `smokingcurrent` compares current smokers with people who never
  smoked, not with past smokers
- Its interval (0.86 to 4.33) includes 1, so that comparison isn’t clear

### [Odds, not probability](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#odds-not-probability)

- An odds ratio compares odds, not probabilities
- Say “0.38 times the odds”, not “0.38 times as likely” or “62% less
  likely”
- The two are close only when the outcome is rare, and here 27% of
  patients had a sore throat

### [The same model in base R](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#the-same-model-in-base-r)

Base R’s `glm()` fits the same model with less code:

``` r
glm(sore_throat ~ treatment + bmi + smoking,
    family = binomial, data = sore) |>
  tidy(exponentiate = TRUE, conf.int = TRUE)
```

    # A tibble: 5 × 7
      term              estimate std.error statistic  p.value conf.low conf.high
      <chr>                <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
    1 (Intercept)          1.02     0.979     0.0245 0.980       0.149     7.02 
    2 treatmentlicorice    0.384    0.316    -3.02   0.00252     0.204     0.707
    3 bmi                  0.950    0.0385   -1.34   0.179       0.879     1.02 
    4 smokingpast          4.38     0.428     3.45   0.000551    1.94     10.5  
    5 smokingcurrent       1.89     0.410     1.55   0.121       0.859     4.33 

- `family = binomial` is what makes `glm()` a logistic regression
- The same odds ratios and intervals as `logistic_reg()`
- We use tidymodels because every kind of model goes through the same
  steps

### [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#data-and-credits)

- `licorice_gargle` from
  [`medicaldata`](https://higgi13425.github.io/medicaldata/reference/licorice_gargle.html),
  contributed by Amy Nowacki ([TSHS Resources
  Portal](https://www.causeweb.org/tshs/licorice-gargle/))
- Odds ratios with tidymodels follow the
  [analysis](https://ds4biomed.tech/analysis-intro.html) and
  [tidymodels](https://ds4biomed.tech/machine-learning-tidymodels.html)
  chapters of *Data Science for the Biomedical Sciences*
