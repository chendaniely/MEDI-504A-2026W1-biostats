# MEDI 504A — Biostatistics with Tidyverse

UBC MEDI 504A (Emerging Topics in Experimental Medicine), 2026 Winter 1 term.
These are the two lectures for week 2 of the course,
on basic biostatistics.
We start with tidy data,
then fit linear and logistic regression models on medical data.

Course website: <https://chendaniely.github.io/MEDI-504A-2026W1-biostats/>

Official course description, on UBC's Data Science and Health site:
<https://datascienceandhealth.ubc.ca/collaborative-projects/medi-504a-emerging-topics-experimental-medicine>

## Sessions

- **Lecture 1: Tidy data.**
  Monday, Nov 2, 2026, 1:00–3:00 PM PST, ECC 100 LT.
  Start at [Welcome](lecture-01/01-welcome.qmd).
- **Lecture 2: Modelling lab.**
  Wednesday, Nov 4, 2026, 1:00–3:00 PM PST, DHCC 4223.
  Start at [Clone the repository](lecture-02/01-clone-the-repo.qmd).

Work in a [Codespace](setup-codespaces.qmd), with nothing to install,
or on your own computer ([local setup](setup-local.qmd)).

## References

- Timbers, T., Campbell, T., & Lee, M.
  *Data Science: A First Introduction*.
  <https://datasciencebook.ca/>
- Chen, D.
  *Data Science for the Biomedical Sciences*.
  <https://ds4biomed.tech/>
- Wickham, H., Çetinkaya-Rundel, M., & Grolemund, G. (2023).
  *R for Data Science* (2nd ed.).
  <https://r4ds.hadley.nz/>
- Kuhn, M., & Silge, J.
  *Tidy Modeling with R*.
  <https://www.tmwr.org/>
- Wickham, H. (2014).
  Tidy Data.
  *Journal of Statistical Software*, *59*(10), 1–23.
  <https://doi.org/10.18637/jss.v059.i10>

## Building the website

This repository is a Quarto website.
`.github/workflows/publish.yml` renders it on every push to `main`
and publishes it to GitHub Pages from the `gh-pages` branch.

To work on it locally, with R 4.5+ and Quarto 1.10+ installed
(the UBC brand extension needs 1.10),
run `make setup` once, then `make preview`.
`make help` lists the other targets.

Quarto extensions, committed in `_extensions/`
and installed or updated by `make extensions`:

- [`coatless-quarto/embedio`](https://github.com/coatless-quarto/embedio):
  embeds each slide deck at the top of its page.
- [`mcanouil/quarto-revealjs-a11y`](https://github.com/mcanouil/quarto-revealjs-a11y)
  (0.1.1): accessibility for the slides.
  `+` and `-` change the font size, and `0` resets it.
- [`quarto-ext/pointer`](https://github.com/quarto-ext/pointer):
  a laser pointer on the slides (press `q`).
- [`mcanouil/quarto-revealjs-cascade`](https://github.com/mcanouil/quarto-revealjs-cascade)
  (0.3.2): a slide started with `---` repeats the previous slide's heading.
  It's on for the slides only,
  since on a normal page it deletes every `---` horizontal rule.
- [`coatless-quarto/custom-callout`](https://github.com/coatless-quarto/custom-callout):
  new callout types, defined under `custom-callout:` in `_quarto.yml`.
- [`quarto-ext/include-code-files`](https://github.com/quarto-ext/include-code-files):
  shows a code file in a page.
- [`UBC-MDS/ubc-quarto-brand`](https://github.com/UBC-MDS/ubc-quarto-brand)
  (`main` at `903cdaa`, before its first release):
  the UBC colours, fonts, and light and dark modes, through `format: ubc-html`.
  We delete the MDS logo it ships, since this is a different course,
  and `make extensions` deletes it again after each update.

## Licence

The prose (lecture text, slides, exercises, and the website)
is licensed under [CC BY-NC-SA 4.0](https://github.com/chendaniely/MEDI-504A-2026W1-biostats/blob/main/LICENSE-CONTENT.md),
and the code under the [MIT licence](https://github.com/chendaniely/MEDI-504A-2026W1-biostats/blob/main/LICENSE),
matching *Data Science: A First Introduction*,
which some of the material is adapted from.
