# MEDI 504A: Biostatistics with Tidyverse.
#
#   make          same as `make help`
#   make setup    check R, install the R packages and the Quarto extensions
#   make preview  preview the website locally, re-rendering as you edit
#   make render   render the whole website into _site/
#   make homework render homework.qmd on its own, as students do (make solution: the TA copy)
#   make notes    generate class notes from session recordings (see README-prompt.md)
#
# R and Quarto themselves must already be installed (see setup-local.qmd).
# Use another CRAN mirror with `make packages CRAN=<url>`.

CRAN ?= https://cloud.r-project.org
R_PACKAGES = tidyverse tidymodels medicaldata knitr rmarkdown

.PHONY: help setup check-r packages extensions preview render homework solution clean

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

# The homework and its solution are not website pages:
# each renders on its own, the way students render the homework,
# into an HTML file and a PDF next to it.
homework:  ## Render homework.qmd on its own, as students do (HTML and PDF)
	quarto render homework.qmd

solution:  ## Render the TA solution on its own; it stops if an answer no longer checks out
	@test -f homework_solution.qmd || { echo "homework_solution.qmd is instructor-only and is not in this repository"; exit 1; }
	quarto render homework_solution.qmd

clean:  ## Remove the rendered website (_site/) and Quarto's cache (.quarto/)
	rm -rf _site .quarto

# Class notes: generate notes from session transcripts with the course prompt
# (prompt-notes.md). The generator is class-notes/scripts/class_notes.py in the public
# chendaniely/skills repository; README-prompt.md explains the whole setup.
#
#   make notes         generate notes for sessions that don't have them yet
#   make notes-force   rebuild every session from the current prompt (after editing it)
#   make payload ONLY=<session folder>   print the exact message sent for one session
#   make fetch URL=<plaud share link>    add a session from a recording (instructor only)
#
# Extra flags pass through ARGS, e.g. `make notes ARGS="--dry-run"` or
# `make notes-force ARGS="--only <session folder> --model sonnet"`.
# If you cloned the skills repo somewhere else, add CLASS_NOTES=<path to class_notes.py>.

CLASS_NOTES ?= $(HOME)/.claude/skills/class-notes/scripts/class_notes.py
PYTHON ?= python3
ARGS ?=

.PHONY: notes notes-force payload fetch

notes:  ## Generate class notes for sessions with no notes yet
	$(PYTHON) $(CLASS_NOTES) generate $(ARGS)

notes-force:  ## Rebuild every session's class notes from the current prompt
	$(PYTHON) $(CLASS_NOTES) generate --force $(ARGS)

payload:  ## Print the message sent for one session (ONLY=<folder>)
	$(PYTHON) $(CLASS_NOTES) payload --only $(ONLY) $(ARGS)

fetch:  ## Add a session from a Plaud share link (URL=<link>)
	$(PYTHON) $(CLASS_NOTES) fetch $(URL) $(ARGS)
