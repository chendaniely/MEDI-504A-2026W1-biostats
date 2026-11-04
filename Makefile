# MEDI 504A: Biostatistics with Tidyverse.
#
#   make          same as `make help`
#   make setup    check R, install the R packages and the Quarto extensions
#   make preview  preview the website locally, re-rendering as you edit
#   make render   render the whole website into _site/
#
# R and Quarto themselves must already be installed (see setup-local.qmd).
# Use another CRAN mirror with `make packages CRAN=<url>`.

CRAN ?= https://cloud.r-project.org
R_PACKAGES = tidyverse tidymodels medicaldata knitr rmarkdown

.PHONY: help setup check-r packages extensions preview render clean

help:  ## List the targets
	@grep -E '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "  %-18s %s\n", $$1, $$2}'

setup: check-r packages extensions  ## Check R, install R packages and Quarto extensions

check-r:  ## Check that R is 4.5 or newer (Lecture 1 uses base R's penguins)
	@Rscript -e 'if (getRversion() < "4.5.0") stop("R 4.5 or newer is needed; this is R ", getRversion(), call. = FALSE)' -e 'cat("R", format(getRversion()), "is new enough\n")'

packages:  ## Install the R packages that are missing
	Rscript -e 'pkgs <- strsplit("$(R_PACKAGES)", " ")[[1]]' \
	        -e 'need <- setdiff(pkgs, rownames(installed.packages()))' \
	        -e 'if (length(need)) install.packages(need, repos = "$(CRAN)") else cat("All R packages are installed\n")'

extensions:  ## Install or update the Quarto extensions in _extensions/
	quarto add coatless-quarto/embedio --no-prompt
	quarto add coatless-quarto/custom-callout --no-prompt
	quarto add quarto-ext/pointer --no-prompt
	quarto add quarto-ext/include-code-files --no-prompt
	quarto add mcanouil/quarto-revealjs-a11y@0.1.1 --no-prompt
	quarto add mcanouil/quarto-revealjs-cascade@0.3.2 --no-prompt
	quarto add UBC-MDS/ubc-quarto-brand --no-prompt
	# a different course: never ship the MDS logo the brand includes
	rm -f _extensions/UBC-MDS/ubc/MDSlogo.png

preview:  ## Preview the website locally, re-rendering as you edit
	quarto preview

render:  ## Render the whole website into _site/
	quarto render

clean:  ## Remove the rendered website (_site/) and Quarto's cache (.quarto/)
	rm -rf _site .quarto
