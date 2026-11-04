# Lecture 1 slides (Monday, 2026-11-02)

The slides the instructor taught from, as published on the course website:
their text, the R code, and the output each piece of code printed.
Plots are not included; the code before each [Plot] marker draws it.
Each heading links to its section on the website.

## [Welcome](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html)
Daniel Chen, PhD, MPH

### [These two sessions](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html#these-two-sessions)

| Session                  | When                           | Where      |
|--------------------------|--------------------------------|------------|
| Lecture 1: Tidy data     | Monday, Nov 2, 1:00–3:00 PM    | ECC 100 LT |
| Lecture 2: Modelling lab | Wednesday, Nov 4, 1:00–3:00 PM | DHCC 4223  |

- Today we’ll go over tidy data, how to wrangle and visualize it, and
  fit a first model. I’ll be live coding, so feel free to follow along
  or just watch.
- On Wednesday we’ll have a hands-on lab with medical data, where you’ll
  clean data and fit linear and logistic regression models.

### [How these pages work](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html#how-these-pages-work)

- Each section of the course website has the slides at the top and the
  slide contents written out below, so you can scroll and copy code
  without clicking through the slides.
- Course website:
  <https://chendaniely.github.io/MEDI-504A-2026W1-biostats/>

### [Get your Codespace running](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html#get-your-codespace-running)

Start your Codespace now, since it takes about 4 minutes to start up the
first time.

1.  Go to the [Codespaces](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/setup-codespaces.html) page and click **Open
    in GitHub Codespaces**
2.  When VS Code opens, trust the folder
3.  Open `example.qmd` and render it

Today we’re only testing the Codespace. On Wednesday you’ll fork the
repository and work in your own copy.

### [Where we are](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html#where-we-are)

[Image: The data science workflow: import, tidy, then a cycle of transform, visualize and model, then communicate.]

This is the data science workflow from *R for Data Science*. Today we’ll
mostly be in the “tidy” and “transform” steps, and get a first look at
“visualize” and “model”.

Diagram from *R for Data Science* (2e), Wickham, Çetinkaya-Rundel and
Grolemund.

### [References](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/01-welcome.html#references)

- *Data Science: A First Introduction* (DSCI 100):
  <https://datasciencebook.ca/>
- *Data Science for the Biomedical Sciences* (ds4biomed):
  <https://ds4biomed.tech/>
- *R for Data Science* (2e): <https://r4ds.hadley.nz/>
- *Tidy Modeling with R*: <https://www.tmwr.org/>
- Wickham (2014), Tidy Data: <https://doi.org/10.18637/jss.v059.i10>

## [Tidy data](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html)

### [Packages](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#packages)

``` r
library(tidyverse)
```

### [What is tidy data?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#what-is-tidy-data)

[Image: Illustration of tidy data: each variable is a column, each observation is a row, each value is a cell.]

1.  Each **variable** is a column; each column is a variable
2.  Each **observation** is a row; each row is an observation
3.  Each **value** is a cell; each cell is a single value

Rules from [*R for Data Science* (2e), chapter
5](https://r4ds.hadley.nz/data-tidy.html). Illustration by Julia Lowndes
and Allison Horst, from the [Openscapes
blog](https://www.openscapes.org/blog/2020/10/12/tidy-data/) (CC BY
4.0).

### [The original definition (2014)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#the-original-definition-2014)

The original *Tidy Data* paper from 2014 defines it a little
differently:

1.  Each variable forms a column
2.  Each observation forms a row
3.  Each **type of observational unit** forms a table

The third rule is really about databases, where data is split into
separate tables and joined back together. The newer definition replaces
it with “each value is a cell”. We’ll come back to observational units
in Lecture 2, in the [Observational
units](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html) section.

### [Tidy or not? (1 of 4)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#tidy-or-not-1-of-4)

| country     | year | rate            |
|-------------|------|-----------------|
| Afghanistan | 1999 | 745/19987071    |
| Afghanistan | 2000 | 2666/20595360   |
| Brazil      | 1999 | 37737/172006362 |
| Brazil      | 2000 | 80488/174504898 |

Not tidy. The `rate` column has two values in each cell, the number of
cases and the population.

### [Tidy or not? (2 of 4)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#tidy-or-not-2-of-4)

| country     | 1999   | 2000   |
|-------------|--------|--------|
| Afghanistan | 745    | 2666   |
| Brazil      | 37737  | 80488  |
| China       | 212258 | 213766 |

Not tidy. The years are column headers, but they’re really values of a
`year` variable.

### [Tidy or not? (3 of 4)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#tidy-or-not-3-of-4)

| country     | year | type       | count    |
|-------------|------|------------|----------|
| Afghanistan | 1999 | cases      | 745      |
| Afghanistan | 1999 | population | 19987071 |
| Afghanistan | 2000 | cases      | 2666     |
| Afghanistan | 2000 | population | 20595360 |

Not tidy. The `count` column mixes two different variables, cases and
population.

### [Tidy or not? (4 of 4)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#tidy-or-not-4-of-4)

| country     | year | cases | population |
|-------------|------|-------|------------|
| Afghanistan | 1999 | 745   | 19987071   |
| Afghanistan | 2000 | 2666  | 20595360   |
| Brazil      | 1999 | 37737 | 172006362  |
| Brazil      | 2000 | 80488 | 174504898  |

Tidy! Each row is an observation, each column is a variable, and each
cell has a single value.

### [Why bother?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#why-bother)

[Image: Illustration: tidy datasets are all alike, but every messy dataset is messy in its own way.]

Once our data is tidy, we can use the same tools every time we
summarize, plot, or model it.

Illustration by Julia Lowndes and Allison Horst (CC BY 4.0).

### [Five ways data gets messy](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#five-ways-data-gets-messy)

The *Tidy Data* paper lists five common ways data gets messy:

1.  Column headers are values, not variable names
2.  Multiple variables are stored in one column
3.  Variables are stored in both rows and columns
4.  Multiple types of observational units are stored in the same table
5.  A single observational unit is stored in multiple tables

We’ll go through the first three using the datasets from the paper.
Problems 4 and 5 are about observational units, which we’ll cover in
Lecture 2’s [Observational
units](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html) section.

### [Problem 1: column headers are values](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-1-column-headers-are-values)

This is a Pew survey that counts people by religion and income. The
income brackets are column headers, but they’re really values of an
`income` variable.

``` r
pew <- read_csv("data/pew.csv")
```

    Rows: 18 Columns: 11
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: ","
    chr  (1): religion
    dbl (10): <$10k, $10-20k, $20-30k, $30-40k, $40-50k, $50-75k, $75-100k, $100...

    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
pew
```

    # A tibble: 18 × 11
       religion `<$10k` `$10-20k` `$20-30k` `$30-40k` `$40-50k` `$50-75k` `$75-100k`
       <chr>      <dbl>     <dbl>     <dbl>     <dbl>     <dbl>     <dbl>      <dbl>
     1 Agnostic      27        34        60        81        76       137        122
     2 Atheist       12        27        37        52        35        70         73
     3 Buddhist      27        21        30        34        33        58         62
     4 Catholic     418       617       732       670       638      1116        949
     5 Don’t k…      15        14        15        11        10        35         21
     6 Evangel…     575       869      1064       982       881      1486        949
     7 Hindu          1         9         7         9        11        34         47
     8 Histori…     228       244       236       238       197       223        131
     9 Jehovah…      20        27        24        24        21        30         15
    10 Jewish        19        19        25        25        30        95         69
    11 Mainlin…     289       495       619       655       651      1107        939
    12 Mormon        29        40        48        51        56       112         85
    13 Muslim         6         7         9        10         9        23         16
    14 Orthodox      13        17        23        32        32        47         38
    15 Other C…       9         7        11        13        13        14         18
    16 Other F…      20        33        40        46        49        63         46
    17 Other W…       5         2         3         4         2         7          3
    18 Unaffil…     217       299       374       365       341       528        407
    # ℹ 3 more variables: `$100-150k` <dbl>, `>150k` <dbl>,
    #   `Don't know/refused` <dbl>

### [`pivot_longer()`: wide to long](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#pivot_longer-wide-to-long)

``` r
pew_tidy <- pew |>
  pivot_longer(
    cols = -religion,
    names_to = "income",
    values_to = "frequency"
  )
pew_tidy
```

    # A tibble: 180 × 3
       religion income             frequency
       <chr>    <chr>                  <dbl>
     1 Agnostic <$10k                     27
     2 Agnostic $10-20k                   34
     3 Agnostic $20-30k                   60
     4 Agnostic $30-40k                   81
     5 Agnostic $40-50k                   76
     6 Agnostic $50-75k                  137
     7 Agnostic $75-100k                 122
     8 Agnostic $100-150k                109
     9 Agnostic >150k                     84
    10 Agnostic Don't know/refused        96
    # ℹ 170 more rows

### [Now we can summarize it](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#now-we-can-summarize-it)

``` r
pew_tidy |>
  group_by(religion) |>
  summarize(count = sum(frequency))
```

    # A tibble: 18 × 2
       religion                count
       <chr>                   <dbl>
     1 Agnostic                  826
     2 Atheist                   515
     3 Buddhist                  411
     4 Catholic                 8054
     5 Don’t know/refused        272
     6 Evangelical Prot         9472
     7 Hindu                     257
     8 Historically Black Prot  1995
     9 Jehovah's Witness         215
    10 Jewish                    682
    11 Mainline Prot            7470
    12 Mormon                    581
    13 Muslim                    116
    14 Orthodox                  363
    15 Other Christian           129
    16 Other Faiths              449
    17 Other World Religions      42
    18 Unaffiliated             3707

### [Problem 1 again: the Billboard chart](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-1-again-the-billboard-chart)

Each row is a song, and `wk1` to `wk76` hold its rank for each week it
was on the chart. The week number is a value hiding in the column
headers.

``` r
billboard <- read_csv("data/billboard.csv")
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
billboard
```

    # A tibble: 317 × 81
        year artist     track time  date.entered   wk1   wk2   wk3   wk4   wk5   wk6
       <dbl> <chr>      <chr> <tim> <date>       <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
     1  2000 2 Pac      Baby… 04:22 2000-02-26      87    82    72    77    87    94
     2  2000 2Ge+her    The … 03:15 2000-09-02      91    87    92    NA    NA    NA
     3  2000 3 Doors D… Kryp… 03:53 2000-04-08      81    70    68    67    66    57
     4  2000 3 Doors D… Loser 04:24 2000-10-21      76    76    72    69    67    65
     5  2000 504 Boyz   Wobb… 03:35 2000-04-15      57    34    25    17    17    31
     6  2000 98^0       Give… 03:24 2000-08-19      51    39    34    26    26    19
     7  2000 A*Teens    Danc… 03:44 2000-07-08      97    97    96    95   100    NA
     8  2000 Aaliyah    I Do… 04:15 2000-01-29      84    62    51    41    38    35
     9  2000 Aaliyah    Try … 04:03 2000-03-18      59    53    38    28    21    18
    10  2000 Adams, Yo… Open… 05:30 2000-08-26      76    76    74    69    68    67
    # ℹ 307 more rows
    # ℹ 70 more variables: wk7 <dbl>, wk8 <dbl>, wk9 <dbl>, wk10 <dbl>, wk11 <dbl>,
    #   wk12 <dbl>, wk13 <dbl>, wk14 <dbl>, wk15 <dbl>, wk16 <dbl>, wk17 <dbl>,
    #   wk18 <dbl>, wk19 <dbl>, wk20 <dbl>, wk21 <dbl>, wk22 <dbl>, wk23 <dbl>,
    #   wk24 <dbl>, wk25 <dbl>, wk26 <dbl>, wk27 <dbl>, wk28 <dbl>, wk29 <dbl>,
    #   wk30 <dbl>, wk31 <dbl>, wk32 <dbl>, wk33 <dbl>, wk34 <dbl>, wk35 <dbl>,
    #   wk36 <dbl>, wk37 <dbl>, wk38 <dbl>, wk39 <dbl>, wk40 <dbl>, wk41 <dbl>, …

### [Tidy the weeks](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#tidy-the-weeks)

``` r
billboard_tidy <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    names_transform = list(week = as.integer),
    values_to = "rank",
    values_drop_na = TRUE # drop weeks the song was not on the chart
  ) |>
  # the date at a rank = the date it entered + (week - 1) weeks
  mutate(date = date.entered + (week - 1) * 7) |>
  arrange(artist, track, week) |>
  select(year, artist, track, time, week, rank, date)
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

### [Problem 2: multiple variables in one column](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-2-multiple-variables-in-one-column)

These are the WHO tuberculosis counts from the paper (`who2` comes with
tidyr). A column name like `sp_m_014` has three variables in it, the
diagnosis method (`sp`), gender (`m`), and age group (`014`).

``` r
who2
```

    # A tibble: 7,240 × 58
       country      year sp_m_014 sp_m_1524 sp_m_2534 sp_m_3544 sp_m_4554 sp_m_5564
       <chr>       <dbl>    <dbl>     <dbl>     <dbl>     <dbl>     <dbl>     <dbl>
     1 Afghanistan  1980       NA        NA        NA        NA        NA        NA
     2 Afghanistan  1981       NA        NA        NA        NA        NA        NA
     3 Afghanistan  1982       NA        NA        NA        NA        NA        NA
     4 Afghanistan  1983       NA        NA        NA        NA        NA        NA
     5 Afghanistan  1984       NA        NA        NA        NA        NA        NA
     6 Afghanistan  1985       NA        NA        NA        NA        NA        NA
     7 Afghanistan  1986       NA        NA        NA        NA        NA        NA
     8 Afghanistan  1987       NA        NA        NA        NA        NA        NA
     9 Afghanistan  1988       NA        NA        NA        NA        NA        NA
    10 Afghanistan  1989       NA        NA        NA        NA        NA        NA
    # ℹ 7,230 more rows
    # ℹ 50 more variables: sp_m_65 <dbl>, sp_f_014 <dbl>, sp_f_1524 <dbl>,
    #   sp_f_2534 <dbl>, sp_f_3544 <dbl>, sp_f_4554 <dbl>, sp_f_5564 <dbl>,
    #   sp_f_65 <dbl>, sn_m_014 <dbl>, sn_m_1524 <dbl>, sn_m_2534 <dbl>,
    #   sn_m_3544 <dbl>, sn_m_4554 <dbl>, sn_m_5564 <dbl>, sn_m_65 <dbl>,
    #   sn_f_014 <dbl>, sn_f_1524 <dbl>, sn_f_2534 <dbl>, sn_f_3544 <dbl>,
    #   sn_f_4554 <dbl>, sn_f_5564 <dbl>, sn_f_65 <dbl>, ep_m_014 <dbl>, …

### [Split the header into three variables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#split-the-header-into-three-variables)

``` r
who2 |>
  pivot_longer(
    cols = !(country:year),
    names_to = c("diagnosis", "gender", "age"),
    names_sep = "_",
    values_to = "count",
    values_drop_na = TRUE
  )
```

    # A tibble: 76,046 × 6
       country      year diagnosis gender age   count
       <chr>       <dbl> <chr>     <chr>  <chr> <dbl>
     1 Afghanistan  1997 sp        m      014       0
     2 Afghanistan  1997 sp        m      1524     10
     3 Afghanistan  1997 sp        m      2534      6
     4 Afghanistan  1997 sp        m      3544      3
     5 Afghanistan  1997 sp        m      4554      5
     6 Afghanistan  1997 sp        m      5564      2
     7 Afghanistan  1997 sp        m      65        0
     8 Afghanistan  1997 sp        f      014       5
     9 Afghanistan  1997 sp        f      1524     38
    10 Afghanistan  1997 sp        f      2534     36
    # ℹ 76,036 more rows

### [Problem 3: variables in rows and columns](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#problem-3-variables-in-rows-and-columns)

These are daily temperatures from a weather station in Mexico. The days
of the month are spread across `d1` to `d31`, and the maximum and
minimum temperatures (`tmax`, `tmin`) are stuck in the rows of the
`element` column.

``` r
weather <- read_csv("data/weather.csv")
```

    Rows: 22 Columns: 35
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: ","
    chr  (2): id, element
    dbl (25): year, month, d1, d2, d3, d4, d5, d6, d7, d8, d10, d11, d13, d14, d...
    lgl  (8): d9, d12, d18, d19, d20, d21, d22, d24

    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
weather
```

    # A tibble: 22 × 35
       id       year month element    d1    d2    d3    d4    d5    d6    d7    d8
       <chr>   <dbl> <dbl> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
     1 MX17004  2010     1 tmax       NA  NA    NA      NA  NA      NA    NA    NA
     2 MX17004  2010     1 tmin       NA  NA    NA      NA  NA      NA    NA    NA
     3 MX17004  2010     2 tmax       NA  27.3  24.1    NA  NA      NA    NA    NA
     4 MX17004  2010     2 tmin       NA  14.4  14.4    NA  NA      NA    NA    NA
     5 MX17004  2010     3 tmax       NA  NA    NA      NA  32.1    NA    NA    NA
     6 MX17004  2010     3 tmin       NA  NA    NA      NA  14.2    NA    NA    NA
     7 MX17004  2010     4 tmax       NA  NA    NA      NA  NA      NA    NA    NA
     8 MX17004  2010     4 tmin       NA  NA    NA      NA  NA      NA    NA    NA
     9 MX17004  2010     5 tmax       NA  NA    NA      NA  NA      NA    NA    NA
    10 MX17004  2010     5 tmin       NA  NA    NA      NA  NA      NA    NA    NA
    # ℹ 12 more rows
    # ℹ 23 more variables: d9 <lgl>, d10 <dbl>, d11 <dbl>, d12 <lgl>, d13 <dbl>,
    #   d14 <dbl>, d15 <dbl>, d16 <dbl>, d17 <dbl>, d18 <lgl>, d19 <lgl>,
    #   d20 <lgl>, d21 <lgl>, d22 <lgl>, d23 <dbl>, d24 <lgl>, d25 <dbl>,
    #   d26 <dbl>, d27 <dbl>, d28 <dbl>, d29 <dbl>, d30 <dbl>, d31 <dbl>

### [Pivot longer, then wider](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#pivot-longer-then-wider)

``` r
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
    names_from = element, # tmax and tmin become their own columns
    values_from = temp
  ) |>
  select(id, date, tmax, tmin) |>
  arrange(id, date)
weather_tidy
```

    # A tibble: 33 × 4
       id      date        tmax  tmin
       <chr>   <date>     <dbl> <dbl>
     1 MX17004 2010-01-30  27.8  14.5
     2 MX17004 2010-02-02  27.3  14.4
     3 MX17004 2010-02-03  24.1  14.4
     4 MX17004 2010-02-11  29.7  13.4
     5 MX17004 2010-02-23  29.9  10.7
     6 MX17004 2010-03-05  32.1  14.2
     7 MX17004 2010-03-10  34.5  16.8
     8 MX17004 2010-03-16  31.1  17.6
     9 MX17004 2010-04-27  36.3  16.7
    10 MX17004 2010-05-27  33.2  18.2
    # ℹ 23 more rows

### [The tidyr toolkit](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#the-tidyr-toolkit)

| Function | Use it when |
|----|----|
| `pivot_longer()` | values are spread across column headers (wide to long) |
| `pivot_wider()` | variables are stuck in rows (long to wide) |
| `separate_wider_delim()`, or `names_sep` in `pivot_longer()` | one column or header holds several variables |

### [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/02-tidy-data.html#data-and-credits)

- `pew.csv`, `billboard.csv`, `weather.csv`: the tidy data paper’s
  examples, via
  [`chendaniely/pandas_for_everyone`](https://github.com/chendaniely/pandas_for_everyone)
  and [`hadley/tidy-data`](https://github.com/hadley/tidy-data).
- `who2`: from tidyr, loaded with the tidyverse.
- Wickham, H. (2014). Tidy Data. *Journal of Statistical Software*,
  59(10). <https://doi.org/10.18637/jss.v059.i10>
- The tidy-or-not quiz is adapted from [*Data Science: A First
  Introduction*](https://datasciencebook.ca/) (Timbers, Campbell and
  Lee; CC BY-NC-SA 4.0).

## [Wrangling and visualizing](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html)

### [Packages](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#packages)

``` r
library(tidyverse)
```

### [Data wrangling](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#data-wrangling)

[Image: Cartoon of fuzzy monsters wrangling data with dplyr.]

Data we get in the real world is usually messy. Once we have it in a
tidy shape, there are only a few dplyr functions we need for most of our
work.

Artwork by Allison Horst (CC BY 4.0).

### [The Palmer penguins](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#the-palmer-penguins)

This dataset has 344 penguins of 3 different species, collected from 3
islands near Palmer Station, Antarctica. It’s been built into R since
version 4.5. We’ll convert it into a tibble so it prints nicely.

``` r
penguins <- as_tibble(penguins)
penguins
```

    # A tibble: 344 × 8
       species island    bill_len bill_dep flipper_len body_mass sex     year
       <fct>   <fct>        <dbl>    <dbl>       <int>     <int> <fct>  <int>
     1 Adelie  Torgersen     39.1     18.7         181      3750 male    2007
     2 Adelie  Torgersen     39.5     17.4         186      3800 female  2007
     3 Adelie  Torgersen     40.3     18           195      3250 female  2007
     4 Adelie  Torgersen     NA       NA            NA        NA <NA>    2007
     5 Adelie  Torgersen     36.7     19.3         193      3450 female  2007
     6 Adelie  Torgersen     39.3     20.6         190      3650 male    2007
     7 Adelie  Torgersen     38.9     17.8         181      3625 female  2007
     8 Adelie  Torgersen     39.2     19.6         195      4675 male    2007
     9 Adelie  Torgersen     34.1     18.1         193      3475 <NA>    2007
    10 Adelie  Torgersen     42       20.2         190      4250 <NA>    2007
    # ℹ 334 more rows

### [`select()`: choose columns](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#select-choose-columns)

``` r
select(penguins, species, bill_len, body_mass)
```

    # A tibble: 344 × 3
       species bill_len body_mass
       <fct>      <dbl>     <int>
     1 Adelie      39.1      3750
     2 Adelie      39.5      3800
     3 Adelie      40.3      3250
     4 Adelie      NA          NA
     5 Adelie      36.7      3450
     6 Adelie      39.3      3650
     7 Adelie      38.9      3625
     8 Adelie      39.2      4675
     9 Adelie      34.1      3475
    10 Adelie      42        4250
    # ℹ 334 more rows

``` r
select(penguins, starts_with("bill"))
```

    # A tibble: 344 × 2
       bill_len bill_dep
          <dbl>    <dbl>
     1     39.1     18.7
     2     39.5     17.4
     3     40.3     18  
     4     NA       NA  
     5     36.7     19.3
     6     39.3     20.6
     7     38.9     17.8
     8     39.2     19.6
     9     34.1     18.1
    10     42       20.2
    # ℹ 334 more rows

### [`filter()`: choose rows](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#filter-choose-rows)

``` r
filter(penguins, flipper_len > 190)
```

    # A tibble: 243 × 8
       species island    bill_len bill_dep flipper_len body_mass sex     year
       <fct>   <fct>        <dbl>    <dbl>       <int>     <int> <fct>  <int>
     1 Adelie  Torgersen     40.3     18           195      3250 female  2007
     2 Adelie  Torgersen     36.7     19.3         193      3450 female  2007
     3 Adelie  Torgersen     39.2     19.6         195      4675 male    2007
     4 Adelie  Torgersen     34.1     18.1         193      3475 <NA>    2007
     5 Adelie  Torgersen     38.6     21.2         191      3800 male    2007
     6 Adelie  Torgersen     34.6     21.1         198      4400 male    2007
     7 Adelie  Torgersen     38.7     19           195      3450 female  2007
     8 Adelie  Torgersen     42.5     20.7         197      4500 male    2007
     9 Adelie  Torgersen     46       21.5         194      4200 male    2007
    10 Adelie  Dream         36.4     17           195      3325 female  2007
    # ℹ 233 more rows

``` r
filter(penguins, flipper_len > 190 & species == "Chinstrap")
```

    # A tibble: 53 × 8
       species   island bill_len bill_dep flipper_len body_mass sex     year
       <fct>     <fct>     <dbl>    <dbl>       <int>     <int> <fct>  <int>
     1 Chinstrap Dream      46.5     17.9         192      3500 female  2007
     2 Chinstrap Dream      50       19.5         196      3900 male    2007
     3 Chinstrap Dream      51.3     19.2         193      3650 male    2007
     4 Chinstrap Dream      52.7     19.8         197      3725 male    2007
     5 Chinstrap Dream      45.2     17.8         198      3950 female  2007
     6 Chinstrap Dream      51.3     18.2         197      3750 male    2007
     7 Chinstrap Dream      46       18.9         195      4150 female  2007
     8 Chinstrap Dream      51.3     19.9         198      3700 male    2007
     9 Chinstrap Dream      46.6     17.8         193      3800 female  2007
    10 Chinstrap Dream      51.7     20.3         194      3775 male    2007
    # ℹ 43 more rows

### [`mutate()`: add or change columns](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#mutate-add-or-change-columns)

Body mass is in grams, so let’s add a column with the mass in kilograms.

``` r
mutate(penguins, body_mass_kg = body_mass / 1000)
```

    # A tibble: 344 × 9
       species island    bill_len bill_dep flipper_len body_mass sex     year
       <fct>   <fct>        <dbl>    <dbl>       <int>     <int> <fct>  <int>
     1 Adelie  Torgersen     39.1     18.7         181      3750 male    2007
     2 Adelie  Torgersen     39.5     17.4         186      3800 female  2007
     3 Adelie  Torgersen     40.3     18           195      3250 female  2007
     4 Adelie  Torgersen     NA       NA            NA        NA <NA>    2007
     5 Adelie  Torgersen     36.7     19.3         193      3450 female  2007
     6 Adelie  Torgersen     39.3     20.6         190      3650 male    2007
     7 Adelie  Torgersen     38.9     17.8         181      3625 female  2007
     8 Adelie  Torgersen     39.2     19.6         195      4675 male    2007
     9 Adelie  Torgersen     34.1     18.1         193      3475 <NA>    2007
    10 Adelie  Torgersen     42       20.2         190      4250 <NA>    2007
    # ℹ 334 more rows
    # ℹ 1 more variable: body_mass_kg <dbl>

`mutate()` gives back a new data frame and doesn’t change `penguins`. If
we want to keep the result, we need to assign it (`<-`) to a variable.

### [Doing many steps at once](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#doing-many-steps-at-once)

We can save each step as its own object,

``` r
penguins_1 <- mutate(penguins, body_mass_kg = body_mass / 1000)
penguins_2 <- filter(penguins_1, flipper_len > 190)
penguins_3 <- select(penguins_2, species, flipper_len, body_mass_kg)
```

or we can nest the function calls, but then we have to read them from
the inside out.

``` r
penguins_nested <- select(
  filter(mutate(penguins, body_mass_kg = body_mass / 1000), flipper_len > 190),
  species, flipper_len, body_mass_kg
)
```

### [The pipe, `|>`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#the-pipe)

The pipe takes whatever is on its left and passes it in as the first
argument of the function on its right. When you read code with pipes,
you can say “and then” for each `|>`.

``` r
penguins |>
  mutate(body_mass_kg = body_mass / 1000) |>
  filter(flipper_len > 190) |>
  select(species, flipper_len, body_mass_kg)
```

    # A tibble: 243 × 3
       species flipper_len body_mass_kg
       <fct>         <int>        <dbl>
     1 Adelie          195         3.25
     2 Adelie          193         3.45
     3 Adelie          195         4.68
     4 Adelie          193         3.48
     5 Adelie          191         3.8 
     6 Adelie          198         4.4 
     7 Adelie          195         3.45
     8 Adelie          197         4.5 
     9 Adelie          194         4.2 
    10 Adelie          195         3.32
    # ℹ 233 more rows

### [`group_by()` and `summarize()`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#group_by-and-summarize)

`group_by()` splits the data into groups, and `summarize()` calculates a
single value for each group.

``` r
penguins |>
  group_by(species) |>
  summarize(avg_body_mass = mean(body_mass, na.rm = TRUE))
```

    # A tibble: 3 × 2
      species   avg_body_mass
      <fct>             <dbl>
    1 Adelie            3701.
    2 Chinstrap         3733.
    3 Gentoo            5076.

We need `na.rm = TRUE` to skip over the missing values, otherwise a
single `NA` makes the whole mean `NA`.

### [How many values are missing?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#how-many-values-are-missing)

``` r
penguins |>
  summarize(n = n(), missing_body_mass = sum(is.na(body_mass)))
```

    # A tibble: 1 × 2
          n missing_body_mass
      <int>             <int>
    1   344                 2

``` r
penguins |>
  count(species, island)
```

    # A tibble: 5 × 3
      species   island        n
      <fct>     <fct>     <int>
    1 Adelie    Biscoe       44
    2 Adelie    Dream        56
    3 Adelie    Torgersen    52
    4 Chinstrap Dream        68
    5 Gentoo    Biscoe      124

### [Visualization: ask a question, then answer it](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#visualization-ask-a-question-then-answer-it)

[Image: Cartoon of fuzzy monsters exploring data with ggplot2.]

When we make a plot, we’re trying to answer a question about our data. A
good plot answers that question clearly.

Artwork by Allison Horst (CC BY 4.0).

### [ggplot2: three parts](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#ggplot2-three-parts)

Every ggplot2 plot is built from the same parts:

1.  Aesthetic mappings, which map columns to visual properties (`x`,
    `y`, `colour`, `fill`)
2.  Geometric objects (geoms), which say how to draw them
    (`geom_point()`, `geom_histogram()`, `geom_bar()`)
3.  Scales and labels for the axes, colours, and titles

We add each layer, one at a time, with `+`.

### [Scatter plot: two quantitative variables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#scatter-plot-two-quantitative-variables)

Is a penguin’s body mass related to its flipper length?

``` r
ggplot(penguins, aes(x = flipper_len, y = body_mass)) +
  geom_point()
```

[Plot]

### [Add colour and labels](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#add-colour-and-labels)

``` r
ggplot(penguins, aes(x = flipper_len, y = body_mass, colour = species)) +
  geom_point() +
  labs(
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    colour = "Species"
  )
```

[Plot]

### [Histogram: one quantitative variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#histogram-one-quantitative-variable)

``` r
ggplot(penguins, aes(x = body_mass, fill = species)) +
  geom_histogram(binwidth = 250, alpha = 0.6, position = "identity") +
  labs(x = "Body mass (g)", y = "Number of penguins", fill = "Species")
```

[Plot]

### [Bar plot: counts of a categorical variable](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#bar-plot-counts-of-a-categorical-variable)

``` r
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar() +
  labs(x = "Island", y = "Number of penguins", fill = "Species")
```

[Plot]

### [Rules of thumb](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#rules-of-thumb)

- Answer one question per plot
- Label axes, with units
- Use colourblind-friendly palettes
- Avoid pie charts, 3D, and tables of numbers when a plot will do

### [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/03-wrangle-visualize.html#data-and-credits)

- `penguins`: R’s `datasets::penguins` (R 4.5 or newer), Horst, Hill and
  Gorman’s Palmer penguins.
- Adapted from chapters 3 and 4 of [*Data Science: A First
  Introduction*](https://datasciencebook.ca/) (Timbers, Campbell and
  Lee; CC BY-NC-SA 4.0).

## [From tidy data to models](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html)

### [Packages](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#packages)

``` r
library(tidyverse)
library(tidymodels)
```

### [Two kinds of questions](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#two-kinds-of-questions)

When we want to predict something, the type of outcome tells us what
kind of model to use.

- Regression, when the outcome is *quantitative*. What will this house
  sell for? How heavy will this baby be at birth?
- Classification, when the outcome is *categorical*. Will this patient’s
  cancer come back, yes or no?

Today we’ll fit a linear regression. On Wednesday we’ll fit linear and
logistic regressions on medical data.

### [Models need tidy data](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#models-need-tidy-data)

A model formula like `price ~ sqft` expects the data to have one row per
observation (each house sale) and one column per variable (the price and
the size), which is exactly what tidy data gives us.

### [Sacramento house sales](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#sacramento-house-sales)

This is a dataset of house sales in Sacramento, California. It comes
with tidymodels, in the modeldata package.

``` r
Sacramento
```

    # A tibble: 932 × 9
       city           zip     beds baths  sqft type        price latitude longitude
       <fct>          <fct>  <int> <dbl> <int> <fct>       <int>    <dbl>     <dbl>
     1 SACRAMENTO     z95838     2     1   836 Residential 59222     38.6     -121.
     2 SACRAMENTO     z95823     3     1  1167 Residential 68212     38.5     -121.
     3 SACRAMENTO     z95815     2     1   796 Residential 68880     38.6     -121.
     4 SACRAMENTO     z95815     2     1   852 Residential 69307     38.6     -121.
     5 SACRAMENTO     z95824     2     1   797 Residential 81900     38.5     -121.
     6 SACRAMENTO     z95841     3     1  1122 Condo       89921     38.7     -121.
     7 SACRAMENTO     z95842     3     2  1104 Residential 90895     38.7     -121.
     8 SACRAMENTO     z95820     3     1  1177 Residential 91002     38.5     -121.
     9 RANCHO_CORDOVA z95670     2     2   941 Condo       94905     38.6     -121.
    10 RIO_LINDA      z95673     3     2  1146 Residential 98937     38.7     -121.
    # ℹ 922 more rows

### [Is size related to price?](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#is-size-related-to-price)

``` r
ggplot(Sacramento, aes(x = sqft, y = price)) +
  geom_point(alpha = 0.4) +
  labs(x = "House size (square feet)", y = "Sale price (USD)")
```

[Plot]

### [Linear regression: the line of best fit](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#linear-regression-the-line-of-best-fit)

$$
\text{price} = \beta_0 + \beta_1 \times \text{sqft}
$$

- $\beta_0$ is the intercept, where the line crosses the y axis
- $\beta_1$ is the slope, how much the price changes for each extra
  square foot

The “best” line is the one with the smallest squared vertical distances
between the line and the data points.

### [Fit it with tidymodels](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#fit-it-with-tidymodels)

``` r
house_recipe <- recipe(price ~ sqft, data = Sacramento)

house_spec <- linear_reg() |>
  set_engine("lm") |>
  set_mode("regression")

house_fit <- workflow() |>
  add_recipe(house_recipe) |>
  add_model(house_spec) |>
  fit(data = Sacramento)
house_fit
```

    ══ Workflow [trained] ══════════════════════════════════════════════════════════
    Preprocessor: Recipe
    Model: linear_reg()

    ── Preprocessor ────────────────────────────────────────────────────────────────
    0 Recipe Steps

    ── Model ───────────────────────────────────────────────────────────────────────

    Call:
    stats::lm(formula = ..y ~ ., data = data)

    Coefficients:
    (Intercept)         sqft  
        13859.4        138.5  

### [Read the coefficients](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#read-the-coefficients)

``` r
tidy(house_fit)
```

    # A tibble: 2 × 5
      term        estimate std.error statistic   p.value
      <chr>          <dbl>     <dbl>     <dbl>     <dbl>
    1 (Intercept)   13859.   6949.        1.99 4.64e-  2
    2 sqft            139.      3.80     36.5  1.11e-181

For every extra square foot, the predicted price goes up by about 139
USD.

### [See the line](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#see-the-line)

``` r
ggplot(Sacramento, aes(x = sqft, y = price)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(x = "House size (square feet)", y = "Sale price (USD)")
```

[Plot]

### [More than one predictor](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#more-than-one-predictor)

$$
Y = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_m X_m
$$

To use more predictors, we add them to the formula.

``` r
recipe(price ~ sqft + beds + baths, data = Sacramento)
```

    ── Recipe ──────────────────────────────────────────────────────────────────────

    ── Inputs 

    Number of variables by role

    outcome:   1
    predictor: 3

Now each slope is how much the outcome changes for one predictor, when
the other predictors stay the same.

### [Coming up on Wednesday](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#coming-up-on-wednesday)

- A linear regression on a clinical trial, to see if treating
  periodontal disease during pregnancy changed the baby’s birth weight
- A logistic regression for a yes/no outcome, to see if the storage age
  of transfused blood is associated with prostate cancer coming back

For the logistic regression we’ll report odds ratios.

### [Data and credits](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-01/04-tidy-to-models.html#data-and-credits)

- `Sacramento`: from modeldata, loaded with tidymodels.
- Adapted from chapter 8 of [*Data Science: A First
  Introduction*](https://datasciencebook.ca/) (Timbers, Campbell and
  Lee; CC BY-NC-SA 4.0).
