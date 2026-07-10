# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an R project for creating interactive reports on antimicrobial resistance (AMR) surveillance data for JAMRAI (Joint Action on Antimicrobial Resistance and Healthcare-Associated Infections). The goal is to produce interactive dashboards/reports from EU AMR surveillance data published in EFSA-ECDC Union Summary Reports (EUSR).

## R Project Setup

- RStudio project (`.Rproj`) configured with 2-space indentation, UTF-8 encoding
- R is the primary language; reports will likely use R Markdown (`.Rmd`) or Quarto (`.qmd`)
- Interactive reports: use `shiny`, `flexdashboard`, or Quarto with `shinylive`/`shiny` runtime
- Key packages expected: `tidyverse`, `readr`, `readxl`, `DT`, `plotly`, `ggplot2`

## Data Sources

Data lives in `../` (the `Templates/` directory), **outside** this R project. Paths should use `here::here()` or relative paths from the project root.

### Raw Excel files (in `../`)
- `E.coli.xlsx`, `E. coli_2019.xlsx` — combined E. coli AMR datasets
- `MRSA.xlsx`, `MRSA_2019.xlsx` — MRSA datasets
- `Annex C.*.xlsm` — Indicator E. coli AMR by reporting year (2022-2023, 2023-2024)
- `Annex D.1*.xlsm` — ESBL/AmpC/CP-producers by reporting year
- PDF annexes for older years (2018-2021)

### Exported CSVs (in `../csv_export/`)
Pre-exported CSVs organised in numbered folders by report and year. The `Index.csv` at the root maps each CSV to its source Excel sheet.

Folder naming convention: `NN_CODE_Description_YEAR` — e.g. `01_C23_Annex_C_IndEC_2023-2024`

| Code prefix | Content |
|-------------|---------|
| `C` | Annex C — Indicator E. coli AMR |
| `D` | Annex D / D1 — ESBL/AmpC/CP-producers |
| `E` | Annex E — MRSA |
| `Y19` | 2019 E. coli dashboard export |
| `EX` | Full E. coli dashboard export |
| `PC`/`PD`/`PE` | PDF-sourced data (older years) |

### CSV column structure (Annex C / E. coli tables)
Each table has rows per EU/EEA country with:
- `Country`, `N` (isolates tested)
- `%` resistant for each antibiotic: `GEN`, `AMK`, `CHL`, `AMP`, `CTX`, `CAZ`, `MEM`, `TGC`, `NAL`, `CIP`, `AZM`, `COL`, `SMX`, `TMP`, `TET`, `CS`
- `MDR (%)` — multidrug resistance
- Combined resistance columns (e.g. `Resistance to both CIP/CTX, applying ECOFFs`)

### Animal categories / table numbers
Tables 1–4 = live animals (Pigs, Calves, Broilers, Turkey); Tables 5–8 = meat at border control posts (BCP) from same species.

## Development Commands

Run R scripts from the R console or terminal:
```r
# Install dependencies (run once)
install.packages(c("tidyverse", "readxl", "here", "DT", "plotly", "flexdashboard"))

# Render an R Markdown report
rmarkdown::render("report.Rmd")

# Run a Shiny app
shiny::runApp("app/")
```

From the terminal:
```powershell
# Render via Rscript
Rscript -e "rmarkdown::render('report.Rmd')"

# Run tests (if testthat is used)
Rscript -e "testthat::test_dir('tests/')"
```

## Key Conventions

- Use `here::here()` for all file paths to keep them portable
- The `../csv_export/Index.csv` file is the authoritative map of available data; read it first when loading data programmatically
- AMR percentages in the CSVs are already calculated (not raw counts); `N` gives the denominator
- ECOFFs = epidemiological cut-off values; CBPs = clinical breakpoints — both may be used for the same antibiotic in different columns
