# Observational Units, Linear Regression, and Logistic Regression

Date Time: 2026-11-04

Instructor: Daniel Chen

## Summary

This second session began with setup. Students opened the course repository in a GitHub Codespace, learned how to fork it, and learned how to render a Quarto document to HTML and PDF. The instructor also showed the "AI class notes" section of the course website, where each lecture's transcript and AI-generated summaries are posted. He introduced Positron, an IDE from the RStudio team that is built on VS Code, as an alternative to RStudio. Several Codespaces problems, including the instructor's own, came up and were worked through.

The content picked up the third rule of the original tidy data paper: each type of observational unit forms a table. Using the tidy Billboard data from Lecture 1, the instructor split the song information and the weekly rankings into two tables linked by an `id` column, then joined them back together. He compared this to how hospitals store data, with a `patients` table keyed by a medical record number and an `encounters` table that refers to it. He pointed to Synthea for synthetic hospital data and to HL7, FHIR, and the OMOP Common Data Model as real-world standards.

Most of the session covered the two baseline models: linear regression for a numeric outcome and logistic regression for a binary outcome. The class fit `price ~ sqft + type` on the `Sacramento` house sales with `linear_reg()`. They learned how a categorical predictor becomes dummy variables with a reference level, and practised turning coefficients from `tidy()` into fill-in-the-blank interpretation sentences. They then fit a logistic regression on the `licorice_gargle` trial from `medicaldata`. They saw that its raw estimates are log odds, used `tidy(exponentiate = TRUE)` to convert them to odds ratios, and interpreted those ratios against the reference levels. The instructor stressed that odds are not probabilities.

After the break, the instructor walked through the homework and demonstrated agentic coding on the Ebola question. He warned strongly about what coding agents can see and do. They print your data and files back to the model provider, they can read password files, and they can delete things. For that reason, patient data must never go through a personal AI subscription. The session ended with practical advice on saving work in a Codespace and an explanation of why a date parsed with `mdy()` prints in year-month-day order.

## Knowledge Points

### 1. Course setup and tooling

- **GitHub Codespace**: a cloud copy of the course repository, already set up with R, Quarto, the Quarto extension, and the packages. You open it from the green **Code** button, then the **Codespaces** tab, then "Create codespace on main". The first start takes around ten minutes, and later starts are faster.
  - Keep your Codespace tab open. An idle Codespace goes to sleep and shuts down after about 20 minutes of inactivity, and you then have to wait for it to start again.
  - Each Codespace gets a random name, such as "organic barnacle" or "fuzzy fiesta". You only need one.
  - A free account limits how many Codespaces you can have at once. If you see a "maximum codespaces reached" error, go to `github.com/codespaces` and delete the extra ones.
- **Saving work in a Codespace (warning)**: saving a file saves it inside that Codespace instance, *not* back to Git.
  - Closing the tab does not delete the Codespace. It is like turning off a laptop: as long as you return to the same named Codespace, your work is still there.
  - **Deleting the Codespace deletes your work.** That is like throwing the laptop away.
  - The easiest way to keep your homework is to copy the whole `homework.qmd` (Ctrl+A, Ctrl+C) and paste it into a file on your own computer. If you know Git, you can add, commit, and push to your fork from VS Code's Git panel, but that is out of scope for this course.
- **Fork**: makes a copy of the repository under your own GitHub account, so you keep it even if the original is removed. When the instructor makes changes, a **Sync fork** button pulls his updates into your copy. You do not need a fork for class.
- **Download ZIP**: if Git makes no sense to you, use the green **Code** button and choose **Download ZIP**. The ZIP contains the homework and all the data. There is no Git requirement in this course.
- **Local setup**: if you work on your own computer, you need R, RStudio (or Positron), and Quarto. Quarto is a separate install from the Quarto website: go to the current release and pick your operating system. The course site's "local setup" page has a block of package installs (tidyverse, tidymodels, medicaldata, and a few others) to copy into your R console.
- **Positron**: a newer IDE from the people who make RStudio. It is essentially VS Code, the editor you see in a Codespace, with RStudio features added, such as a variable viewer and a plot viewer. It works with both R and Python, and it comes with Quarto support built in.
  - VS Code and Codespaces have no environment or variable viewer. To see an object there, you print it from a code chunk.
- **Rendering a Quarto document**: render the homework to both HTML and PDF, using the "render all formats" option.
  - In Positron there is a **Preview** button at the top.
  - In a Codespace or VS Code, open the Command Palette (Ctrl+Shift+P, or Cmd+Shift+P on a Mac) and run the Quarto render command. If you open the palette by clicking instead, type `>` first so it searches commands.
  - In plain VS Code (not in a Codespace), install the Quarto extension from the **Extensions** panel on the left.
  - In RStudio, click the **Render** button.
  - Rendering runs all the code, captures the output, and writes the HTML and PDF next to the `.qmd`. You submit all three files.
- **Quarto vs R Markdown**: Quarto is the successor to R Markdown. R Markdown is still supported but will not get new features.
  - The syntax is very similar: code cells use three backticks and curly braces.
  - In R Markdown, websites, blogs, and documents each need a separate package. Quarto bundles all of them, is a little faster, and works better with languages other than R.
  - The course slides themselves are made with Quarto.
- **AI class notes**: the course site has a section with each lecture's transcript, an AI summary from Anthropic's model, and summaries from local models for comparison, along with the prompt that was used. One suggested way to use them is to skim the main headings and check whether you understand each concept.

### 2. Observational units: tidy for analysis vs tidy for storage

- **The original third rule**: the 2014 *Tidy Data* paper's third rule is "each type of observational unit forms a table". The newer, commonly taught version says each cell holds one value.
  - An observational unit is the kind of thing you observe, such as a song, a patient, or a hospital visit.
- **Duplication in the tidy Billboard data**: in `billboard_tidy`, the song information (`year`, `artist`, `track`, `time`) repeats on every row for every week the song charted, up to dozens of times per song. This causes two problems:
  - It is inefficient storage.
  - It makes edits risky. Fixing one spelling means changing it on every repeated row, and a blanket rename could hit two different artists' songs that share a title.
- **The analysis table vs the storage tables**: the long table with everything repeated is what you need for analysis, for example to group by `artist` or `track`. For storage, you split it into a `song` table (one row per song, with a new `id`) and a `rank` table (`id`, `week`, `date`, `rank`). When an analysis needs both, you join them back on `id`.
- **The hospital parallel**: a `patients` table holds each patient's demographics once, keyed by a medical record number (MRN), which usually just increments by one for each new patient. An `encounters` table holds visits with only the MRN, for example a radiology X-ray. If a birthday is corrected in `patients`, every encounter sees the correction.
  - To answer something like "the average age of people coming into radiology for an X-ray", you join `patients` and `encounters`.
  - **MRNs are private**: an MRN lets someone look up a person's demographics and everything else that happened to them.
- **Why this matters**: the analysis-ready datasets you are given were usually assembled by someone else. When you build your own, you need to know where the pieces come from. If you write data back to a database, you write it in the split form.
- **Synthea**: synthetic but realistic hospital records stored this way, available as CSV and also in HL7 FHIR and C-CDA formats. It comes in sizes from 100 patients up to very large populations. It is a safe way to practise.
  - The instructor's dissertation materials include a walkthrough using Synthea's `encounters` and `patients` data. It finds patients admitted with a myocardial infarction and checks whether they return to the emergency department within 30 days.
- **Health data standards**: HL7 is the family of standards hospital systems use to exchange clinical data. FHIR is HL7's newer standard.
- **OMOP Common Data Model (from the OHDSI community)**: a shared database layout. If hospitals follow it, you can send your *code* rather than the protected patient data, and each site runs the same analysis on its own data. This is how multi-site and international studies work.
  - OMOP includes vocabulary mappings between coding systems, such as SNOMED, ICD-9, ICD-10, and national codes.

### 3. Choosing a model starts with the outcome

- **Baseline models**: linear and logistic regression are the first models to try. They are fast, and they give simple sentences that are easy to interpret.
  - "Best model" in machine learning is always relative to something, so these models serve as the baseline you compare other models against.
- **Interpretability matters in health**: in health care, and in regulated areas like finance, you may have to explain why a treatment or policy changes. "The computer made a guess" is not an acceptable rationale when a patient's care is at stake.
- **The single most important question**: what are you trying to measure or predict, and can you point to that column?
  - If you cannot point to it, your data is not tidy yet and needs cleaning.
- **The outcome's type decides the model**:
  - A numeric outcome (for example `price`, or a blood value like albumin) calls for linear regression.
  - A binary categorical outcome calls for logistic regression.
  - Predictors can be continuous or categorical in either model. Only the left side of the `~` decides which model you use.
- **Treating ordered stages as numbers**: some studies treat disease stages as numbers even though they are not really numbers. When you see that, ask why they did it.
- **Any categorical outcome can be made binary**: for example "cancer yes or no", "stage 1 to 2 vs stage 3 to 4", or "is this house a condo, yes or no?".
- **Class imbalance (common pitfall)**: always check the frequency counts during exploratory data analysis.
  - In `Sacramento`, the `type` counts are very uneven: 53 condos, 13 multi-family homes, and 866 residential homes.
  - If 99 of 100 emails are not spam, a model that never flags spam is 99% accurate and completely useless at its one job.
  - The same problem affects rare diseases.
  - In `licorice_gargle`, 169 patients had no sore throat and 64 did. A model that always says "no" would be right about three quarters of the time.
  - Better metrics for this are covered in a machine learning course, not here.

### 4. Categorical predictors and dummy variables

- **Dummy variables (also called indicator variables)**: a regression needs numbers, so R turns a factor with *n* levels into *n − 1* 0/1 columns.
  - The level without its own column is the **reference level**, and every other level is compared with it.
  - Tidymodels and R do this for you automatically.
- **One-hot encoding**: the computer science and machine learning name for the same idea. One-hot encoding usually keeps a column for every level. A regression with an intercept drops one level, the reference.
- **Encoding `type`**: `type` has 3 levels, so it becomes `typeMulti_Family` and `typeResidential`. A condo is 0 in both columns, which is how its value can be inferred without a column of its own.
- **How R picks the reference level**: R uses the first level of the factor. You can change it, and doing so is part of the data cleaning you do for modelling.
  - When a categorical variable has many levels, check which one is missing from the output. That missing level is your reference, and it is easy to overlook.
- **Data cleaning never ends**: you clean once for exploratory data analysis and again for modelling. The model itself is only about two lines of code.

### 5. Linear regression: fitting and interpreting

- **Fitting**: `linear_reg() |> fit(price ~ sqft + type, data = Sacramento)`. The outcome goes to the left of the `~` and the predictors go to the right.
- **`tidy()`**: turns a fitted model into a data frame of coefficients, called the coefficient table. You can plot it or save it as a CSV.
  - The `estimate` column is what you use to build interpretation sentences.
  - p-values, AIC/BIC, and degrees of freedom matter in statistics and causal inference courses, which are beyond this class.
- **Interpreting a continuous variable**: "For every 1 [unit] increase in [variable], we expect [outcome] to increase (or decrease) by [estimate] [units], all else remaining the same."
  - Example: "For every 1 square foot increase in size, we expect the sale price to increase by $139, all else remaining the same."
  - **Know your units**: if a variable has been standardized (z-scored), "one unit" means one standard deviation, not one unit of the original measurement.
  - **All else remaining the same**: you interpret one number at a time, holding the other predictors fixed. Here, that means a house of the same `type`.
- **Interpreting a categorical variable**: "We expect [outcome] for [level] to be [estimate] [units] higher (or lower) than for [reference level], all else remaining the same." The "one unit increase" is the move from the reference level (0) to this level (1).
  - Example for `typeMulti_Family`: "We expect multi-family homes to sell for $66,224 less than condos, all else remaining the same."
  - Example for `typeResidential`: "We expect residential homes to sell for $8,253 more than condos of the same square footage."
  - Each dummy variable gets its own coefficient and its own sentence. You do not interpret `type` as a whole.
- **Choosing the reference level**: the math does not care which level is the reference, but the human-readable sentence does.
  - For disease stages, use stage 1 (or no disease) as the reference, not a middle stage.
  - Changing the reference changes the estimates and possibly their signs.
- **The intercept**: the expected outcome when every continuous variable is 0 and every categorical variable is at its reference level. Here, that is a 0-square-foot condo, which does not exist, so we don't interpret it.
  - You still need the intercept to compute predictions.
  - Do not read it as "the cost of the land". That would need a separate model.
- **Interpreting vs predicting**: these are two different uses of the same model.
  - To interpret, you read one coefficient at a time.
  - To predict, you need all of the inputs for the case at hand, then multiply each coefficient by its value, add them up, and add the intercept. For example, a 1,000 square foot residential home gets 1,000 × 139 = $139,000 from `sqft`, plus $8,253 for being residential, plus the intercept.
- **The formula**: with one predictor, the model is the statistics version of *y = mx + b*: the outcome equals the intercept plus a coefficient times the predictor. With more predictors, each one adds its own *β·x* term, and a categorical predictor adds one term per dummy variable. The β values are the estimates in the coefficient table.
- **Adding covariates**: more covariates do not make interpretation harder. The table gets longer, and the numbers change because each estimate now accounts for the other variables.
  - Which variables belong in the model is a research and experimental design question, involving confounders and colliders from epidemiology. It is not a coding question.
- **Base R equivalent**: `lm(price ~ sqft + type, data = Sacramento)` piped into `tidy()` gives the same table. The class uses tidymodels because every kind of model goes through the same steps.

### 6. Logistic regression

- **The data**: `licorice_gargle` (from `medicaldata`) is a randomized trial of 235 adults having thoracic surgery. Before intubation, patients gargled licorice or sugar water. The outcome is any sore throat 30 minutes after surgery.
- **Recoding before modelling**:
  - `sore_throat` becomes a factor with levels `no` then `yes`.
  - `treatment` comes from `treat`: 0 = `sugar` (the reference), 1 = `licorice`.
  - `smoking` comes from `preOp_smoking`: 3 = `never` (the reference), 2 = `past`, 1 = `current`.
  - `bmi` comes from `preOp_calcBMI` and is continuous, in kg/m².
  - Raw numeric codes like these mean you have to look up the codebook to know what each number stands for.
- **Which level is modelled**: `logistic_reg()` models the odds of the outcome's *second* level. Since the levels of `sore_throat` are `no` then `yes`, every result is about the odds of a sore throat.
- **Fitting**: same as linear regression, swapping `linear_reg()` for `logistic_reg()`. The formula, `fit()`, and `tidy()` are unchanged.
  - The running joke is that machine learning is not that hard; it's all the other work around it.
- **Why a transformation is needed**: a straight line would predict values below 0 and above 1, and a prediction of 0.5 makes no sense for a category. Logistic regression applies the log-odds transformation, log(p / (1 − p)), to bound the line between 0 and 1.
- **Generalized linear models (GLMs)**: logistic regression belongs to the GLM family, as do Poisson models. They all transform a straight line to fit the data, and you undo the transformation to write an interpretable sentence.
- **Raw estimates are log odds**: the sentence structure still works ("For every 1 unit increase in BMI, we expect the log odds to decrease by 0.0517"), but log odds mean nothing to a human reader.
- **Odds ratios**: exponentiating undoes the log. Use `tidy(exponentiate = TRUE, conf.int = TRUE)`, or exponentiate the column yourself with `mutate()`.
  - An odds ratio of 1 means no difference, below 1 means lower odds, and above 1 means higher odds.
  - `std.error`, `statistic`, and `p.value` stay on the log-odds scale.
  - Odds ratios are everywhere in epidemiology, with its 2×2 tables, because so many outcomes there are binary.
- **Interpreting a continuous variable**: "For every 1 [unit] increase in [variable], we expect the odds of [outcome] to be multiplied by [odds ratio], all else remaining the same."
  - Example: "For every 1 kg/m² increase in BMI, we expect the odds of a sore throat to be multiplied by 0.95, all else remaining the same."
- **Interpreting a categorical variable**: "We expect the odds of [outcome] for [level] to be [odds ratio] times the odds for [reference level], all else remaining the same."
  - Example: licorice vs sugar water gives 0.38 times the odds.
  - With more levels, each dummy variable compares one level with the reference. Past smokers have 4.38 times the odds of people who never smoked. `smokingcurrent` compares current smokers with never-smokers, not with past smokers.
- **Odds, not probability (common mistake)**: odds are p / (1 − p), which is not the same as probability.
  - Thinking "probability" in your head may help you make sense of the sentence, but never write it down that way.
  - Say "0.38 times the odds", not "0.38 times as likely".
- **Describing the reference group**: you don't interpret the reference group on its own. It is the baseline everything else is compared with. If you care about a particular group, make a different level the reference, for example "compared with frequent smokers, never-smokers' odds are…".
- **Base R equivalent**: `glm(..., family = binomial)` piped into `tidy(exponentiate = TRUE, conf.int = TRUE)` gives the same table. `family = binomial` is what makes `glm()` a logistic regression.

### 7. Working with coding agents (warnings)

- **Work in small steps**: when learning, have the agent write only a few lines at a time.
  - "Go clean this data set" gives you a hundred lines you can't follow. Even "tidy the Ebola data" is four steps.
  - Ask for the next step, run it, and look at the output.
- **How an agent sees your data**: an agent does not see R's environment the way RStudio does. To look at your data, it writes code that prints the files and data, and that output goes to the model provider, such as Anthropic.
  - **Never use your own AI subscription on hospital or patient data.** Identifiable data like patient names and MRNs leak exactly this way, and this is where data breaches happen.
  - Use only an agent your hospital has sanctioned, which normally means one with an agreement and a privately deployed model. Otherwise, practise on synthetic data such as Synthea.
- **Agents can read passwords and delete things**: an agent lists the files on your computer. If you have a passwords file, it can read it, and it can write and run code that deletes data.
  - The approve or allow button in Copilot is the human review step, and it is essentially the only thing stopping the agent from doing something you didn't expect.
  - A web chatbot like ChatGPT cannot read your files unless you paste them in. An agent can.
- **Agents make mistakes**: in the live demo, the agent put the solution for the wrong problem at the line it was given. Free tiers, such as the Codespaces Copilot, use smaller models, so review even more carefully there.
  - You can steer the agent: "we learned this function in class, can you use it?"
- **Your job shifts to checking**: agents make fewer typos, so you see less red error text. The harder question becomes whether the code did the right thing.
  - Run the code yourself and check that the output looks right.
  - Ask the agent to explain any part you don't understand, such as a `pivot_longer()` step.
  - In health settings, code can put a patient's life on the line. Using these tools does not remove your responsibility.
- **Models misread figures**: in a study the instructor described, researchers flipped the horsepower vs miles-per-gallon trend in the `mtcars` data. The model still described the trend as negative, because that is what it expected.
  - Have your own sense of a figure before asking a model about it.
  - A better approach is to write your own rough caption and ask the model to improve it.
- **Prompting is about context**: give the model the specific technical vocabulary from class. The homework is long precisely because it holds that context.

### 8. Dates

- **`mdy()`**: names the format of the *input* string. The Ebola `Date` column is read as character text in month/day/year order, so you parse it with `mdy()`. Functions exist for the other orders too, such as `ymd()`.
- **Why the date prints as year-month-day**: after parsing, the column is a real date object, and dates print in the ISO 8601 standard order, year-month-day.
  - Once it is a date, date arithmetic works (one date minus another). Date arithmetic does not work on a character string, even one that looks like year-month-day; you would convert it with `ymd()` first.

## Code from class

### [Load the packages](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#packages)

```r
library(tidyverse)
library(tidymodels)    # linear_reg(), logistic_reg(), tidy(); also loads Sacramento
library(medicaldata)   # licorice_gargle
```

### [Rebuild the tidy Billboard data](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#the-tidy-billboard-data-again)

```r
billboard_tidy <- read_csv("data/billboard.csv") |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",                          # "wk1" -> "1"
    names_transform = list(week = as.integer),
    values_to = "rank",
    values_drop_na = TRUE                         # drop weeks a song wasn't charting
  ) |>
  mutate(date = date.entered + (week - 1) * 7) |> # date of each chart week
  arrange(artist, track, week) |>
  select(year, artist, track, time, week, rank, date)
billboard_tidy
```

The song information repeats on every week's row:

```
# A tibble: 5,307 × 7
    year artist  track                   time    week  rank date
 1  2000 2 Pac   Baby Don't Cry (Keep... 04:22      1    87 2000-02-26
 2  2000 2 Pac   Baby Don't Cry (Keep... 04:22      2    82 2000-03-04
 3  2000 2 Pac   Baby Don't Cry (Keep... 04:22      3    72 2000-03-11
```

### [Split songs and rankings into two tables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#problem-4-multiple-observational-units)

```r
song <- billboard_tidy |>
  distinct(artist, track, year, time) |>       # one row per unique song
  mutate(id = row_number(), .before = 1)       # new ID, like a hospital MRN
song

rank <- billboard_tidy |>
  left_join(song, by = c("artist", "track", "year", "time")) |>  # attach the id
  select(id, week, date, rank)                 # drop the repeated song info
rank
```

The result is 317 songs, each stored once, and 5,307 ranking rows that carry only the `id`:

```
# A tibble: 317 × 5
      id artist         track                    year time
 1     1 2 Pac          Baby Don't Cry (Keep...  2000 04:22
 2     2 2Ge+her        The Hardest Part Of ...  2000 03:15

# A tibble: 5,307 × 4
      id  week date        rank
 1     1     1 2000-02-26    87
 2     1     2 2000-03-04    82
```

### [Join them back together](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#join-them-back-together)

```r
rank |>
  left_join(song, by = "id")   # rebuilds the analysis table (5,307 × 8)
```

### [Check the categories of `type`](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#back-to-sacramento)

```r
Sacramento |>
  count(type)
```

```
  type             n
1 Condo           53
2 Multi_Family    13
3 Residential    866
```

The counts are badly imbalanced. `Condo` comes first, so it becomes the reference level.

### [Fit and tidy the linear regression](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#fit-the-model)

```r
house_fit <- linear_reg() |>
  fit(price ~ sqft + type, data = Sacramento)   # outcome ~ predictors

house_tidy <- tidy(house_fit, conf.int = TRUE)  # coefficient table as a data frame
house_tidy
```

```
  term             estimate std.error statistic   p.value conf.low conf.high
1 (Intercept)         6885.  12169.       0.566 5.72e-  1  -16996.    30766.
2 sqft                 139.      3.88    35.7   1.64e-176     131.      146.
3 typeMulti_Family  -66224.  26222.      -2.53  1.17e-  2 -117686.   -14762.
4 typeResidential     8253.  12151.       0.679 4.97e-  1  -15594.    32100.
```

The table has one row per dummy variable and no row for `Condo`, the reference. The 139, −66,224, and 8,253 estimates are the numbers interpreted in Knowledge Points 5.

### [The same model in base R](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#the-same-model-in-base-r)

```r
lm(price ~ sqft + type, data = Sacramento) |>
  tidy(conf.int = TRUE)                         # identical table
```

### [Recode the licorice gargle variables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#recode-the-variables)

```r
sore <- licorice_gargle |>
  mutate(
    sore_throat = factor(pacu30min_throatPain > 0,          # any pain at 30 min
                         levels = c(FALSE, TRUE),
                         labels = c("no", "yes")),          # "yes" is 2nd level, so it's modelled
    treatment = factor(treat, levels = c(0, 1),
                       labels = c("sugar", "licorice")),    # sugar = reference
    smoking = factor(preOp_smoking, levels = c(3, 2, 1),    # codebook: 3 = never
                     labels = c("never", "past",
                                "current"))                 # never = reference
  ) |>
  select(sore_throat, treatment,
         bmi = preOp_calcBMI, smoking) |>                   # rename while selecting
  drop_na()
```

### [Check the outcome's balance](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#which-level-are-we-modelling)

```r
count(sore, sore_throat)
```

```
  sore_throat   n
1          no 169
2         yes  64
```

### [Fit and tidy the logistic regression](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#fit-the-model)

```r
sore_fit <- logistic_reg() |>
  fit(sore_throat ~ treatment + bmi + smoking,
      data = sore)

tidy(sore_fit, conf.int = TRUE)   # estimates are log odds
```

```
  term              estimate std.error statistic  p.value conf.low conf.high
2 treatmentlicorice  -0.956     0.316    -3.02   0.00252    -1.59    -0.346
3 bmi                -0.0517    0.0385   -1.34   0.179      -0.129    0.0229
4 smokingpast         1.48      0.428     3.45   0.000551    0.664    2.35
```

### [Exponentiate to get odds ratios](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#exponentiate-to-get-odds-ratios)

```r
sore_or <- sore_fit |>
  tidy(exponentiate = TRUE, conf.int = TRUE)   # estimate and CI become odds ratios
sore_or
```

```
  term              estimate std.error statistic  p.value conf.low conf.high
2 treatmentlicorice    0.384    0.316    -3.02   0.00252     0.204     0.707
3 bmi                  0.950    0.0385   -1.34   0.179       0.879     1.02
4 smokingpast          4.38     0.428     3.45   0.000551    1.94     10.5
5 smokingcurrent       1.89     0.410     1.55   0.121       0.859     4.33
```

These give "0.38 times the odds" for licorice vs sugar, "multiplied by 0.95" per kg/m² of BMI, and "4.38 times the odds" for past vs never smokers.

### [The same model in base R](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#the-same-model-in-base-r)

```r
glm(sore_throat ~ treatment + bmi + smoking,
    family = binomial, data = sore) |>          # family = binomial makes it logistic
  tidy(exponentiate = TRUE, conf.int = TRUE)
```

### What went wrong live

- **The instructor's Codespace kept dying**: his Codespace had gone to sleep and had to restart, which takes several minutes. He had also hit the free-account limit on Codespaces, and the room's internet was slow. He worked around it by demoing in Positron on his own machine. The fixes for students: keep your Codespace tab open, and delete extra Codespaces at `github.com/codespaces`.
- **A student's render failed and the Codespace stopped**: this was the "maximum codespaces reached" limit. The fix was to delete the other Codespaces, keep a single one, and wait for it to restart. If problems persist, delete the Codespace and let it rebuild, or do the homework locally instead.
- **The render didn't produce the expected files**: during the break, rendering the homework showed "error encountered" for some students before eventually working. On the instructor's machine, rendering also failed to produce the other output files, and a rendered view later reported something "not found". He did not debug it in class. If you cannot get the HTML and PDF to render, submit the `.qmd`; the grading will be adjusted.
- **The agent edited the wrong problem**: asked to put its solution at line 279, the agent inserted code for the *next* problem. The instructor fixed it with a more specific instruction: put the data cleaning code at line 279 and the `group_by()` code in the next problem's cell. This is why you review every agent edit.

## Questions

- **Q:** A student had forked the repository and opened a Codespace from their fork. Is that right?
  **A:** Either works for class. Open the Codespace from your fork only if you want to work in your own copy.
- **Q:** Do we have to download the Quarto extension first?
  **A:** Not in a Codespace, where it is already installed, and not in Positron, which comes with it. In plain VS Code, search "Quarto" in the Extensions panel and click Install. In RStudio, with Quarto installed, use the Render button.
- **Q:** When I press the Quarto render button it says there was an error, and then my Codespace stops. Is there a maximum number of running Codespaces?
  **A:** Yes. A free account can only have a limited number. Go to `github.com/codespaces` and delete the extra ones, and that frees up space.
- **Q:** Is the one we're using today the one called "organic barnacle"?
  **A:** Codespace names are random; his was "fuzzy fiesta". The repository it comes from is shown at the top. You should only have one, so delete the others.
- **Q:** My only Codespace now says "stopping" instead of "setting up".
  **A:** Wait for it to restart.
- **Q:** How do you install Quarto?
  **A:** It is already in the Codespace. On your own computer, go to the Quarto website, choose the current release for your operating system, and install it like a normal program. RStudio may bundle Quarto, but installing it separately is cleaner.
- **Q:** Why Quarto instead of R Markdown?
  **A:** Quarto is the successor to R Markdown. R Markdown is still supported but won't get new features. The syntax is nearly identical. Quarto bundles documents, websites, and slides in one tool, is faster, and handles languages other than R better. These slides come straight out of Quarto.
- **Q:** Does it matter what your reference value is?
  **A:** Not to the math. It matters for the sentence you write. With disease stages, compare against stage 1 or no disease, not a middle stage, or the result is hard for a person to understand.
- **Q:** Does it get more complicated to interpret if you have more covariates?
  **A:** No. You still interpret one number at a time, assuming everything else stays the same. The numbers themselves change as you add variables, because each estimate accounts for the others. Which variables to include, such as confounders and colliders, is an experimental design question.
- **Q:** If you add more variables, such as the number of bedrooms and bathrooms, can you interpret each one on its own?
  **A:** Yes. The table just gets longer, with a separate estimate for each variable.
- **Q:** If you add more variables, how do you get the price?
  **A:** Decide whether you are interpreting a variable or predicting the outcome. To predict, you need all of the inputs for that house. Multiply each by its coefficient (1,000 square feet × 139 gives $139,000), add $8,253 if it is residential, add the intercept, and sum everything.
- **Q:** Can you make a sentence about the reference value, for example the odds for someone who doesn't smoke?
  **A:** You don't interpret the reference on its own; it is the baseline everything is compared to. If that group is what you care about, make a different level the reference, such as frequent smokers. Then you can say "compared with frequent smokers, never-smokers' odds are…".
- **Q:** Do you have to fork in order to do the work?
  **A:** No. It only matters if you want to save your work in GitHub, and even then you can copy and paste the text out. You can also do the whole assignment in RStudio.
- **Q:** Can we do the homework as R Markdown?
  **A:** Yes. Copy the `.qmd`, delete the Quarto `format` line, and save it as `.Rmd`, because RStudio will treat a `.qmd` as Quarto.
- **Q:** If we do it in R on our own computer, how do we get the CSV? Is it part of a package?
  **A:** The data is in the repository's folder. Click the green Code button and either clone or download the ZIP. That includes all the data and the website. The only file you need to edit is `homework.qmd`.
- **Q:** The tidymodels code doesn't run locally. Is there no interpreter?
  **A:** On your own computer you have to install the packages yourself, using the install code on the local setup page.
- **Q:** Are we really writing code in the homework?
  **A:** Barely. Much of it is fill-in-the-blank, with very detailed instructions.
- **Q:** I used `mutate()` with `mdy()`, but the dates still print as year-month-day. Why?
  **A:** `mdy()` describes the *input*. The original column is character text in month/day/year order. After `mutate()`, it is a real date object, and dates print in ISO 8601 order, year-month-day. Now date arithmetic works. A character column already in year-month-day order would still need `ymd()` before you could do date math.
- **Q:** Is there an environment section in Codespaces where you can see the variables?
  **A:** No. Codespaces is built on VS Code, which has no variable viewer, so you print objects from a code chunk. Positron run locally has one.
- **Q:** If I didn't fork and I work in this Codespace, is my work saved?
  **A:** It is saved inside that Codespace, fork or not, but not back to Git. The easiest safeguard is to copy the whole homework file and save it on your computer.
- **Q:** If I close my Codespaces tab, does that delete it?
  **A:** No. It shuts down after about 20 minutes of inactivity and you can start it again, and as long as you reopen the same named Codespace your work is there. **Deleting it loses everything.**
- **Q:** What if I just get it done in one go?
  **A:** That's totally valid. Doing it step by step or through the agent teaches you different things.

## Also on the slides

- [Problem 5: one unit in many tables](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#problem-5-one-unit-in-many-tables): the opposite problem, one kind of observation split across many files (one per year or site), stacked with `bind_rows()` or by giving `read_csv()` all the file names.
- [How hospitals store data](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/03-observational-units.html#how-hospitals-store-data): lists `patients`, `encounters`, and the `conditions`, `medications`, and `observations` tables, and links to Synthea's downloads page.
- [When the interval includes 0](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#when-the-interval-includes-0): the residential estimate's 95% CI (−$15,594 to $32,100) includes 0, so the data don't show a clear difference from condos. You still report the estimate and say the difference is unclear.
- [Interpreting a continuous variable (linear)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#interpreting-a-continuous-variable): adds the 95% CI ($131 to $146) to the `sqft` sentence.
- [Interpreting a categorical variable (logistic)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#interpreting-a-categorical-variable): licorice gives 62% lower odds (95% CI 0.20 to 0.71), and the interval doesn't include 1.
- [Interpreting a continuous variable (logistic)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#interpreting-a-continuous-variable): multiplying by 0.95 means 5% lower odds, and BMI's interval (0.88 to 1.02) includes 1, so there is no clear effect.
- [A categorical variable with more levels](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#a-categorical-variable-with-more-levels): `smokingcurrent`'s interval (0.86 to 4.33) includes 1, so that comparison isn't clear.
- [Odds, not probability](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#odds-not-probability): odds and probability are close only when the outcome is rare, and here 27% of patients had a sore throat.
- [Data and credits (linear regression)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/04-linear-regression.html#data-and-credits): `Sacramento` comes from modeldata, and the interpretation follows *Data Science: A First Introduction* chapter 8 and *Data Science for the Biomedical Sciences*.
- [Data and credits (logistic regression)](https://chendaniely.github.io/MEDI-504A-2026W1-biostats/lecture-02/05-logistic-regression.html#data-and-credits): sources for `licorice_gargle` and the ds4biomed chapters on odds ratios with tidymodels.

## Assignments

No due date was stated in class.

- [ ] Get the homework: open it in a Codespace, or download the ZIP and use `homework.qmd`.
- [ ] Tidy the Ebola dataset with `pivot_longer()`, `pivot_wider()`, and `mutate()`. Make sure the date column is a real date, using `mdy()`.
- [ ] Make the frequency table: for each country, the first and last report with the cases and deaths in each.
- [ ] Pick a column, make a figure of it, and write what you see. Check any AI interpretation against your own reading.
- [ ] Pick one of the three datasets given at the bottom of the homework. Fit a linear or logistic regression, get the coefficient table with `tidy()`, and write the interpretation sentence using the skeleton provided.
- [ ] Render to HTML and PDF ("render all formats") and submit the `.qmd`, `.html`, and `.pdf`. If rendering fails, submit the `.qmd`.
- [ ] Work through the checklist at the bottom of the homework.
- [ ] If you use an AI agent, have it write small pieces at a time, review and run its code yourself, and never give it passwords or identifiable patient data.

---

- prompt: prompt-notes.md @ fcb3cf5
- prompt-hash: ce286dee74ee
- model: claude-opus-5-5 (requested: opus)
- backend: claude
- inputs: transcript-plaud.md, materials.md
- generated: 2026-11-05
