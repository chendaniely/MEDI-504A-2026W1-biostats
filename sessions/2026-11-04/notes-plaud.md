> **Date and Time:** 2026-11-04 13:00:11 (one session dated 2026-11-04 13:00:11)
>
> **Location:** [Insert Location]
>
> **Instructor:** Daniel Chen

## Summary

Daniel Chen covered how to access course materials and complete homework through GitHub, Codespaces, or a local setup using RStudio or Positron. He demonstrated Quarto workflows and troubleshooting, explained how to preserve work in Codespaces, and discussed the course’s AI-generated notes and summaries.

The lectures also covered tidy data and database design, synthetic and standardized healthcare data, and linear and logistic regression. Students learned to prepare and inspect data, fit models, interpret coefficients, and distinguish predictions from coefficient interpretations. Demonstrations with AI coding agents emphasized incremental prompting, careful review of code and results, and protecting sensitive data.

## Knowledge Points

### 1. Accessing course materials and setting up a workspace

- **Course repository and Codespaces**
  - Students need a GitHub account to access the course repository. On its GitHub page, select **Code**, open the **Codespaces** tab, and choose the option to create or open a Codespace, typically on the main branch. Initial setup may take around ten minutes.
  - Codespaces may sleep or shut down after inactivity. Returning to the same Codespace preserves its work; restarting it may be faster after the first setup.
  - If GitHub reports that the maximum number of Codespaces has been reached, visit `github.com/codespaces`, delete unused instances, and try again. Check the source and name of each instance before deleting anything. A stopped instance can be restarted; do not delete the one containing work you want to keep.
  - A Codespace can be opened from a fork, but forking is not required for lectures or homework.
- **Accessing materials without Git or Codespaces**
  - The rendered course site contains lecture materials, with slides and related content in the left-hand navigation. The link to the GitHub repository is near the top-right of the site.
  - Students can select **Download ZIP** on GitHub to get the homework files and work locally. The instructor noted that Git is not required. Students can also copy and paste assignment materials as needed.
  - Repository files, including datasets and slides, are included in the downloaded folder, and the homework file is at the top level.
  - Local work requires R and an IDE such as RStudio or Positron. Quarto may need to be installed separately. Codespaces is already configured with the required tools and packages.
- **R, Quarto, and package setup**
  - Local setup instructions explain how to install Quarto and the packages used in the course. Tidyverse should already have been installed for an earlier week; the course introduces tidymodels and healthcare datasets from the `medicaldata` package.
  - Students can run the provided package-installation commands in the RStudio console. Reinstalling or updating tidyverse is fine; those who already have it may skip that step.
  - Quarto is used to create HTML and PDF homework outputs. It can be installed from the Quarto website for the relevant operating system. The instructor recommends installing it separately for a smoother local experience.
- **Positron, RStudio, and VS Code**
  - Positron is an optional IDE from the people behind RStudio. It is built on VS Code and incorporates familiar RStudio-style data science features, including a variable viewer, console, terminal, and plot viewer. It supports R and Python.
  - Codespaces is based on VS Code, so its interface differs from local RStudio or Positron. For example, Codespaces does not show the same variable viewer; students can inspect variables by printing them in a code chunk.
  - In VS Code, install the Quarto extension through the Extensions panel if it is not already present. It is already installed in the course Codespaces and included in Positron. In RStudio, use **Render** when Quarto is installed.

### 2. Quarto documents, rendering, and preserving work

- **Previewing and rendering**
  - Positron has a **Preview** button. In Codespaces, use the Command Palette if a Preview option is not visible. Open it with Control+Shift+P, Command+Shift+P, or Apple+Shift+P, or use the interface button; type `>` to enter command-finding mode.
  - Rendering a Quarto document runs its code, captures the output, and can produce HTML and PDF files. The intended homework deliverables include the Quarto source file and its rendered HTML and PDF versions. Grading alternatives may be available if rendering fails, but completing the setup is also a learning objective.
  - Quarto combines code, output, and explanatory prose in one reproducible document. Code can be run from top to bottom, with explanations alongside it. It supports reports, websites, and presentations, and works with multiple programming languages.
  - Quarto is the successor to R Markdown; R Markdown remains supported but is not expected to receive new features. Quarto’s code-cell syntax resembles R Markdown’s, while Quarto bundles capabilities that otherwise may require separate R Markdown packages.
  - To work in traditional R Markdown, students can copy the `.qmd` contents into an `.rmd` file and remove Quarto-specific formatting lines before rendering.
- **Saving Codespaces work**
  - Work is saved in the specific Codespace instance, not automatically back to Git, even if the student has forked the repository.
  - Closing the browser tab or allowing the Codespace to time out does not delete the work. Returning to the same named instance preserves it. Deleting the Codespace permanently deletes its work.
  - The simplest recommended way to preserve homework is to copy the QMD contents and save them in a local file. Students familiar with Git can use the VS Code Git interface to add, commit, and push changes to their fork.
  - Forking the course repository creates a personal copy that remains available if the instructor’s repository is deleted. If the instructor updates the original repository, **Sync from Upstream** can bring changes into the fork. Syncing takes additional steps; the instructor said they would try to avoid changing homework files.

### 3. AI-generated course notes and coding assistants

- **Course notes and model comparisons**
  - The course site has an **AI class notes** section containing lecture transcripts and AI-generated summaries. The current lecture’s notes were expected to be available by the end of November 4, 2026.
  - Students can use headings and summaries to check their understanding, then consult the corresponding transcript or detailed notes as needed.
  - The instructor records lectures and uses transcripts to generate summaries with an Anthropic model. Course materials also include outputs from local models, allowing students to compare different models’ summaries of the same material. The instructor’s notes may be particularly detailed because the generation prompt requests substantial detail; the prompt is included with the materials.
- **Using coding agents effectively**
  - Coding agents can inspect project files, write and run code, and suggest file edits. Their capabilities differ from those of a web-based chatbot, and their access to local files creates additional risks.
  - For learning, ask an agent to handle one small step or code chunk at a time—roughly five lines—rather than generating a large script all at once. Smaller changes are easier to review and understand.
  - Provide specific prompts with relevant context, technical terms, and directions. Students can name a course function they want the agent to use, ask why it chose another method, or ask it to explain unfamiliar code.
  - Models and settings differ in speed, cost, and level of explanation. CodeSpaces may use a smaller, less deliberative model, while a higher-thinking model may take longer and provide more detail. Review generated code particularly carefully, regardless of the model.
- **Reviewing agent output and visualizations**
  - An agent can make plausible but incorrect edits. In one demonstration, it placed code for the next problem where the requested data-cleaning code belonged. Human approval prompts provide a safeguard, but students must still check the changes.
  - Run generated code, inspect intermediate results, and confirm that they make sense. Fewer syntax errors do not prove that the code performed the right operation.
  - Model-generated descriptions of figures can also be wrong. In a demonstration using `mtcars`, a figure had been altered to show a positive relationship between horsepower and miles per gallon, but the model described the usual negative relationship instead. Check interpretations against the actual data and figure.
  - A useful workflow is to draft a rough figure caption or description yourself, then ask the model to improve or rephrase it.
- **Privacy and security**
  - Agents may write and run code that prints data frames or other file contents for inspection. That output can be transmitted to third-party model providers, potentially exposing sensitive information such as patient names or medical record numbers.
  - An agent with file access might encounter credentials or other sensitive files and could potentially take damaging actions, such as exposing information or deleting data. Review requests before approving changes.
  - Do not use personal AI subscriptions or unsanctioned agents with clinical or other sensitive data. Healthcare or enterprise use requires organization-approved deployments, secure hosting, and established data-sharing agreements.

### 4. Tidy data, database structure, and healthcare datasets

- **Tidy data and observational units**
  - Tidy-data principles include organizing each type of observational unit as a table; a commonly cited formulation also says each cell should contain one bit of information.
  - Identifying observational units helps with cleaning and storage. Analysis-ready data may already be combined, but analysts building datasets or saving data to databases may need to decide what belongs in separate tables and how those tables relate.
- **Analysis-ready data versus storage-efficient tables**
  - In the Billboard example, `pivot_longer()` reshapes week columns so each row represents a song’s ranking for a particular week.
  - A combined tidy table can repeat details such as artist, track, year, and time many times for the same song. This is useful for analysis and modeling, but inefficient for storage and prone to inconsistent corrections.
  - A storage-oriented design can put each song’s details in a song table with a unique song ID, and store its weekly date and rank in a separate rankings table. The original analysis table can be reconstructed by joining the tables on the ID.
  - Assigning a unique ID is similar to assigning a medical record number (MRN) to a patient. In hospital data, patient demographics can be kept in a patients table and events in an encounters table; the MRN links them. A demographic correction then needs to be made in one place.
  - Joining patient and encounter records can support analyses such as estimating the average age of patients receiving an X-ray. MRNs are highly private because they can connect a record to an individual’s demographics and events.
- **Synthetic and standardized healthcare data**
  - Synthea provides synthetic hospital-like datasets in CSV and healthcare-related formats such as HL7, FHIR, CDA, and CCDA. Dataset sizes range from small examples to hundreds of thousands or even a million patients. It is available for practice, but is not required for the homework.
  - The OHDSI community’s OMOP Common Data Model standardizes healthcare data structures. When institutions use the same model, analysts can share code for another hospital to run on its own data instead of transferring protected patient records.
  - OMOP can support standardized coding and mappings across systems, including mappings between ICD-10 and codes used in other countries. Multi-site analysis depends on participating institutions structuring their data according to the shared model.
  - Healthcare analyses may require joining multiple tables. For example, studying 30-day readmissions after a heart attack may require encounters to identify visits, patient data for demographics, and an appropriate heart-attack code. Analysts should not assume they will receive a preassembled dataset.

### 5. Data tidying and date handling

- **Ebola dataset tidying**
  - The homework uses data-tidying operations such as `pivot_longer()`, `pivot_wider()`, and `mutate()`.
  - In the Ebola dataset, cells contain combined information that must be separated. Repeated column patterns suggest using `pivot_longer()` on relevant columns while excluding `date` and `day`.
  - Inspect intermediate results: the first reshape may leave case and death information combined or otherwise unsuitable for analysis, requiring a `pivot_wider()` step to separate them.
  - The assignment asks students to produce a frequency table for each country showing the first and last report and the corresponding cases and deaths, and to create and describe a figure from a selected column.
- **Date parsing**
  - The demonstrated source `date` column was character text in month-day-year format. An MDY parsing function converts it into a date object.
  - A date object supports operations such as subtracting one date from another. It may display in year-month-day order because that is the ISO 8601 standard, even if the input was month-day-year.
  - Use the corresponding YMD parser for year-month-day input. The display format alone does not indicate that parsing was incorrect.

### 6. Regression: choosing and preparing a model

- **Linear and logistic regression as baselines**
  - Linear and logistic regression are useful first models: they are relatively simple, run quickly, and are generally easier to interpret than more complex approaches. “Best” is comparative, so these models can provide baselines.
  - Interpretability can matter in healthcare and finance, where people may need to explain treatment, policy, or financial decisions. These models are not universally superior, and the lectures focus on fitting and interpreting models rather than comprehensively evaluating them.
  - Linear regression is appropriate for a continuous numeric outcome, such as house price or albumin level. Logistic regression is used for a binary categorical outcome, such as sore throat after surgery coded yes/no or 1/0.
- **Identify the outcome and explore the data**
  - First identify the outcome being measured or predicted and locate it in a data column. If it is not represented appropriately, the data may need cleaning or restructuring.
  - The outcome type informs the model choice. Predictors can be continuous or categorical; their type alone does not determine whether the model is linear or logistic.
  - Examine frequencies and visualizations before modeling. Imbalanced categories can make accuracy misleading: a model that predicts only the majority class could achieve 99% accuracy if 99 of 100 cases belong to that class, while failing to identify the minority cases of interest.
  - In the sore-throat example, predicting “no” for everyone could still be 75% correct. Check class balance and prediction patterns rather than relying on accuracy alone.
  - Ordered categories, such as disease stages, are sometimes treated as numbers even though they are not necessarily true numeric quantities. Consider whether that coding is appropriate.
- **Categorical predictors and reference categories**
  - Categorical predictors need encoding because categories are not quantities with a meaningful one-unit increase. Dummy-variable encoding, also called one-hot encoding, is commonly used; tidy modeling tools can perform some of it automatically.
  - For a variable with (n) categories, the described approach creates (n-1) columns. Each column indicates membership in a category, and the all-zero pattern represents the omitted reference category.
  - In the housing example, condo is the reference for multifamily and residential. In the licorice-gargle example, sugar is the treatment reference; smoking categories are compared with never smokers.
  - Software may select a default reference, often the first factor level. Check the omitted category explicitly, especially when a variable has many levels, and change it when another comparison is more meaningful.
  - The reference choice changes the coefficients and their interpretation, not the underlying model fit. Data cleaning may be needed to set the intended labels and reference levels; consult the codebook when numeric codes or category names are unclear.
- **Choosing predictors**
  - Predictors should be selected according to the research question and study design. Adding covariates gives the model additional coefficients and can change existing estimates because the model accounts for other factors.
  - Including variables indiscriminately can cause problems. Confounders and, in epidemiology, collider variables affect which predictors should be included; this is a research-design decision, not simply a matter of trying every available variable.
  - Data preparation continues during modeling, including encoding categorical variables. Automatic tools can help, but analysts need to understand the transformations being applied.

### 7. Linear regression fitting and interpretation

- **Fitting and extracting results**
  - The Sacramento housing example predicts sale price from square footage and housing type. In base R, `lm` fits a linear model; the tidy-models approach provides an equivalent workflow.
  - Fitting produces a model object. The `tidy` function returns a data frame of model results, making coefficients easier to interpret, plot, or save as CSV or Excel.
  - A full statistical analysis may also consider p-values, confidence intervals, AIC, BIC, degrees of freedom, and other metadata; the coefficient examples focus on estimates.
- **Interpreting coefficients**
  - A continuous-variable coefficient describes the expected outcome change for a one-unit increase in that predictor, holding other modeled variables constant. Confirm the variable’s units and transformations: one unit could mean an original measurement unit or, for a standardized variable, one standard deviation.
  - In the Sacramento example, the square-footage estimate is 139. Because square footage is untransformed, the model estimates a $139 increase in sale price for each additional square foot, holding other modeled variables constant.
  - Categorical coefficients compare each category with its reference category. With condo as the reference, the multifamily estimate is approximately (-$66{,}000), and the residential estimate is $8,253. These estimates describe price differences relative to condos at the same square footage.
  - The precise meaning of “multifamily” requires checking the data codebook.
- **Predictions and the intercept**
  - Interpreting an individual coefficient is different from predicting an outcome. To predict, supply values for the case, multiply each predictor value by its coefficient, and add the terms and the intercept.
  - For example, a square-footage coefficient of 139 contributes 139,000 for a 1,000-square-foot house. A residential house also adds the residential coefficient of 8,253; the other terms and intercept are included in the prediction.
  - The intercept is the baseline prediction when all predictor values are zero. It is needed for prediction but may not have a useful real-world interpretation, such as for a zero-square-foot condo.

### 8. Logistic regression fitting and interpretation

- **Fitting binary-outcome models**
  - Logistic regression is used for a two-category outcome. A multi-category outcome can be recoded as a binary outcome to address a specific question, such as cancer versus no cancer.
  - The model formula follows the general pattern used for linear regression, with the outcome on one side of the tilde and predictors on the other. In base R, use `glm` with `family = binomial`; the lecture also demonstrates tidy-model syntax.
  - Linear and logistic regression belong to the generalized linear model family. GLMs use a transformation appropriate to the outcome; Poisson models are another example in this family.
- **Log odds and odds ratios**
  - A straight-line model can predict values below zero or above one, which are invalid probabilities for a binary outcome. Logistic regression uses a transformation to keep modeled values within the zero-to-one range.
  - Logistic-regression coefficients are on the log-odds scale, not direct probability changes. Odds are (P/(1-P)), so they are related to but distinct from probabilities.
  - Exponentiating a log-odds coefficient yields an odds ratio. For BMI in the sore-throat example, the coefficient is approximately (-0.0517); exponentiating it gives about 0.95. For each one-unit increase in BMI (one kilogram per meter squared), the odds of a sore throat are multiplied by 0.95, holding other variables constant.
  - In the treatment example, the odds of a sore throat for patients who gargled licorice are 0.38 times the odds for those who gargled sugar water. An example for sometimes or current smokers gives 4.38 times the odds compared with never smokers.
  - Describe these as odds, not probabilities. Odds ratios are commonly reported in epidemiology, including analyses based on two-by-two tables.
  - Categorical coefficients compare each level with the reference category. Changing the reference changes the comparison and coefficient values, but not the underlying model fit.

## Assignments

- [ ] Access the homework repository through Codespaces or download the repository as a ZIP for local work. Install R, an IDE, Quarto, and required packages if working locally; follow the setup instructions for packages such as tidymodels and `medicaldata`.
- [ ] Preserve your work by saving a local copy of the QMD contents or, if familiar with Git, committing and pushing changes to your fork. Do not delete the Codespace containing your work.
- [ ] Render the homework Quarto document as HTML and PDF and save the source file. If rendering fails, follow the instructor’s stated submission alternatives.
- [ ] Clean the Ebola dataset, inspect intermediate results, and confirm that case and death information is correctly separated. Produce a per-country frequency table showing the first and last report with the corresponding cases and deaths.
- [ ] Create a figure from a selected Ebola dataset column and describe what it shows, checking the description against the actual figure and data.
- [ ] Choose one of the three provided datasets, fit a linear or logistic regression model, use `tidy` to obtain its coefficient table, and write an interpretation of a coefficient.
- [ ] Check the codebook for the meaning of the “multifamily” housing category. Verify variable units, transformations, outcome type, category frequencies, and reference levels before interpreting or fitting models.
- [ ] When interpreting logistic-regression coefficients, exponentiate them to obtain odds ratios and describe the results as odds, not probabilities.
- [ ] Review the AI class notes, summaries, and transcripts to check understanding. Use AI coding tools incrementally, verify their code and results, and never submit sensitive or clinical data to an unapproved service.
- [ ] Optionally explore Synthea’s synthetic healthcare datasets for practice; Synthea is not required for the homework.
- [ ] Optionally fork the course repository to keep a personal copy and use **Sync from Upstream** to incorporate instructor updates.
