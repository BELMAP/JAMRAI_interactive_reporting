This directory includes scripts and data to develop a first interactive report on One Health reporting of AMR and AMC at a national level, 
as part of the EU JAMRAI 2 project WP8.4 (https://eu-jamrai.eu/), from the working group for interactive reporting .

Based on primary discussions, we prioritised data from European surveillance projects that are available open access:
1) AMR - EARS-Net and EFSA data
2) AMC - ESAC-Net, ESUAvet, ESVAC and JIACRA


Below you can find instructions to follow to download the data from your country - you can run the scripts attached (adapting for your country - e.g. 
depending on how you named your files etc.) to have a functional first interactive report

The goal is for this pilot to form a starting point for discussions and learning opportunities - we will develop it collectively over the next 18months, 
and countries can adapt it to meet their national needs.

If you are developing the scripts using github please create your own branch - you can then submit changes that are relevant to all countries to be merged with the master branch, while keeping changes relevant just for your country within your branch.

# Contents

1. Download data
2. Set up R environment
3. Tidy  data
4. Trend analysis
5. Make interactive element

# 1.Download data
## Human data - AMR:
Go to https://atlas.ecdc.europa.eu/public/index.aspx
→ Select “Antimicrobial Resistance” in Health topic, make a selection in subpopulation and indicator (NB selection isn’t important for data download - as later can select additional pathogens/indicators) - click load data and it will “build the atlas”  
→ Go to Export data   
→ Select options - all time periods, selected regions, select "All Indicators" - to download all AST results in one data set (note this also includes other pathogens) and select to download as csv file   
→ will then download as file “ECDC_surveillance_data_Antimicrobial_resistance.csv”   
→ can move this file to the Data/ folder in your R project folder  

## Zoonoses data - AMR:
Animal data - E. coli :
https://www.efsa.europa.eu/en/microstrategy/dashboard-antimicrobial-resistance

→ Click “Indicator commensal E. coli”   
→ click on “Temporal trends - country level” and select your country in drop down menu  
→ three dots in top right of each figure when mouse hovers on figure- export data per figure - edit sheet name to add 2 letter country code and species/production system e.g. “AMR - 2025 Interactive dashboard_BE_calves.csv”   
→Can also download  European data (tab “Temporal trends - EU”)  - but this is included in the github with most recent data as of 05/06/2026  

→ NB this only includes some of the indicators for E. coli discussed in the reports - can aim to supplement with additional indicators either by:
- Contacting EFSA or the data provider to EFSA for your country 
- Trying to extract the data yourself, year by year, from previous reports:

Data from zoonoses reports 
https://www.ecdc.europa.eu/en/food-and-waterborne-diseases-and-zoonoses/surveillance-and-disease-data#annual-eu-summary-reports
 
E.g. Download excel sheets/data appendices from:

2023-2024 data : https://zenodo.org/records/17950222  
2022–2023: https://zenodo.org/records/14645440  
2021–2022: https://zenodo.org/records/10528846  
2020–2021: https://zenodo.org/records/7544221  
2018–2019: https://zenodo.org/records/4557180  
2017: https://zenodo.org/records/2562858  

NB - frustrating - different format every 2 years and often data only in tables in pdfs → when scraped the pdf pages are poorly formed - would need manual manipulation
--> if you succeed in systematically extracting the data then please let us know how!

## Human data - AMC:
Go to esac-net dashboard, click on national overview, select unit as “tonnes per year” 
https://qap.ecdc.europa.eu/public/extensions/AMC2_Dashboard/AMC2_Dashboard.html#national-country-tab

Scroll down to time series - select desired time frame, click on data view - click 3 lines in corner and “export Data” → click on download data and download zip file

Get population data from Eurostat: https://ec.europa.eu/eurostat/web/population-demography/demography-population-stock-balance/database 
<a href="https://drive.google.com/uc?export=view&id=123e7WaiCywGKfPY2ZkBTUnOjVU4EBzgE"><img src="https://drive.google.com/uc?export=view&id=123e7WaiCywGKfPY2ZkBTUnOjVU4EBzgE" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture"/>

Click on table icon - first icon within red ring in picture above. In “customise your dataset” Select your country, years, all sexes and all age groups
Organise data set by using “display layout options” == the 4 arrows to match format below: 

<a href="https://drive.google.com/uc?export=view&id=1njLOOFJ2H_xT7TzM-vNzlv-Miz8yhJd9"><img src="https://drive.google.com/uc?export=view&id=1njLOOFJ2H_xT7TzM-vNzlv-Miz8yhJd9" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture"/>

And click “download” to download the data - select csv file.


## Animal data - AMC:

Veterinary database for all countries built from ESUAVet reports (2023, 2024) and JIACRA reports in mg/kg in the script “making_animal_mgkg_data.R” (see below) --> 
NB I also colected the data sets from ESVAC reports for annual consumption - but these are reported in mg/PCU -->  



# 2. Set up R environment for next steps
Run script “install_requirements.R” → install all packages needed for subsequent steps 

Make sure all downloaded data files are in the “Data” directory in the R project folder


# 3. Get data into format:
### AMR
Run script “collecting_cleaning_data.R” → get all data into standard format and filter irrelevant data (e.g. other countries/pathogens from EARS-Net data)

→ can include other data available for your country → just make sure fits this format (format in "combined_data_for_analysis.csv" file in Data/ directory)

Lines you need to adapt for your country - lines 43, 44, 129 → adapt “BE” or “Belgium” ; adapt file paths if you have used other names/directory structures


### AMC
Run scripts “making_animal_mgkg_data.R” and  “making_human_mgkg_data.R” → get all data into standard format and filter irrelevant data (e.g. other countries from animal data files)

→ can include other data available for your country → just make sure fits input formats

# 4. Run trend analyses:
Run script “run_trend_analyses.R”  – this runs generalised linear models on the AMR data set,and correlation analysis on the AMC data sets, based on the BELMAP methodology - see methodology chapter tab of report (https://bit.ly/BELMAP2025) for more details 

–can of course use other methodologies/other data - just format data in same format as output - ”AMR_data_and_GLM_predictions_revised_method.csv“, "AMC_human_results.csv" and "AMC_vet_results.csv" if you want the outputs to run in the app.R script without issues.


# 5. Make interactive report
Run script app.R   
Files/lines you need to adapt for your country :      
#Update the contributors logos in www file (“contributor_report_details.csv” in Data   who provides the data/link to their reports   
#src/text_content.R ---> change text relating to Belgium/Belgian data collection etc.   
#src/server.R --> change abbreviation table terms relevant for Belgium   
#src/data.R --> change Belgian filters/labels lines 66 and 81   
#src/ui.R --> change selection buttons "Belgium" e.g. lines 121,122,   
#src/amc_module --> change selection buttons "Belgium lines 17,18   
#src/amr_module --> change selection buttons "Belgium lines 27,28, 108    
- most of the formatting is described in the file “style2_2.css” in the www directory → adapt this to match your country/institute formatting as desired (e.g. fonts/colours). Logos etc. should also be placed in this “www” directory.  

→ click “Run App”    

 - this is completely adaptable and meant as a starting point for discussions - please work on it within your own branch on github and change for your country, or suggest overall changes (you can suggest to merge these with the master branch) 

# Adapting for your country

There are currently references to "Belgium" that need to be adapted for your country, as outlined below:

  app.R (comments only — a checklist for adapting to another country)
  - L32–40: comment block listing where to change "Belgium"/BE for a different country (points at src/text_content.R, src/server.R, src/ui.R
  lines 121–122, src/amc_module.R lines 17–18, src/amr_module.R lines 27–28, 108). ⚠️ Stale: src/ui.R no longer contains "Belgium" anywhere
  — the actual UI choices now live in the module files below.

  collecting_cleaning_data.R
  - L5–7: header comment — "here made for Belgium example... adapt lines 43-44 'Belgium' and 'BE', line 129 'Belgium'"
  - L41, 44: # make Belgium dataframe / filter(grepl("Belgium",Region), ...) — selects Belgium rows out of ECDC data
  - L82, 129, 141, 152: _BE_ in the "AMR - 2025 Interactive dashboard_BE_*.csv" doc-comment; Region =
  if_else(grepl("EU",region),"Europe","Belgium") — labels non-EU dashboard files as Belgium

  load_data.R
  - L108, 164: doc comments referencing the _BE_*.csv filename pattern
  - L125: str_extract("(?<=_BE_).+(?=\\.csv$)") — pulls the animal name out of ..._BE_<animal>.csv filenames

  making_human_mgkg_data.R
  - L8: read_csv("Data/Consumption_data/AMC_export_table_BE.CSV") — file path
  - L9: mutate(Country = "Belgium") — tags the human AMC data as Belgium
  - L22: read_csv("Data/Consumption_data/demo_pjan_Eurostat_pop_BE.csv") — file path
  - L77, 114, 151, 188: "Belgium" as a row value inside the hardcoded JIACRA tables (tibble::tribble(...))

  making_animal_mgkg_data.R
  - L15, 52, 89, 126: "Belgium" row values in the hardcoded JIACRA tables (same tables duplicated from the human script)

  run_trend_analyses.R
  - L74: comment giving an example category string containing Belgium
  - L437: filter(grepl("Belgium",Country)) — subsets vet AMC to Belgium
  - L443, 461–481: # for Belgium section header + variable names PcorBelgium, KcorBelgium, ScorBelgium (and _vet versions, L534–555) — just
  naming, not logic
  - L575, 580: AMC_vet_result_Belgium — Belgium-only veterinary AMC result, combined with EU data into AMC_vet_results

  src/data.R
  - L66, 81: Region = if_else(grepl("Belgium", Country), "Belgium", "Europe") (once for human AMC, once for vet AMC) — the actual
  Belgium/Europe split used by the app

  src/amc_module.R
  - L20–21: choices = c("Belgium", "Europe"), selected = c("Belgium", "Europe") — AMC tab region selector

  src/amr_module.R
  - L33–34: choices = c("Belgium", "Europe"), selected = c("Belgium", "Europe") — AMR tab region selector
  - L90: mutate(Sample_size = if_else(grepl("Belgium", Region), ...)) — Belgium-specific sample-size display logic

  src/compare_module.R
  - L24–25: choices = c("Belgium", "Europe"), selected = c("Belgium", "Europe") — compare tab region selector

  src/server.R
  - L118: abbreviation table entry "EARS-BE", "European Antimicrobial Resistance Surveillance Belgium"
  - L188: contributor table entry "NSIH-AMR/EARS-BE (Sciensano)", "Katrien Latour, ..."

  src/text_content.R (editorial HTML text — mentions Belgium throughout, not code logic)
  - L4, 10, 12, 15: welcome text
  - L54, 72, 74: human-data-collection methodology text (incl. EARS-BE surveillance link)
  - L81: food-producing-animal methodology text