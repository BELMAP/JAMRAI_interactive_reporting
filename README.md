This directory includes scripts and data to develop a first interactive report on One Health reporting of AMR and AMC at a national level, 
as part of the EU JAMRAI 2 project WP8.4 (https://eu-jamrai.eu/), from the working group for interactive reporting .

Based on primary discussions, we prioritised:
1) data from European surveillance projects that are available open access
2) first focussing on AMR data - later on AMC data


Below you can find instructions to follow to download the data from your country - you can run the scripts attached (adapting for your country - e.g. 
depending on how you named your files etc.) to have a functional first interactive report

The goal is for this pilot to form a starting point for discussions and learning opportunities - we will develop it collectively over the next 18months, 
and countries can adapt it to meet their national needs.

# Contents

1. Download data
2. Tidy  data
3. Trend analysis
4. Make interactive element

# 1.Download data
Human data - E. coli and MRSA invasive infections:
Go to https://atlas.ecdc.europa.eu/public/index.aspx
Select “Antimicrobial Resistance” in Health topic, select your region
Go to Export data - 
Select options - all time periods, selected regions, selected indicator and csv file


Zoonoses data:

https://www.efsa.europa.eu/en/microstrategy/dashboard-antimicrobial-resistance
→ trends, country temporal per pathogen → three dots to right - export data per figure - edit sheet name to add 2 letter country code and species/production system. Can also do this for European data - this is included in the github

Can supplement with:

Data from zoonoses reports 
https://www.ecdc.europa.eu/en/food-and-waterborne-diseases-and-zoonoses/surveillance-and-disease-data#annual-eu-summary-reports
 
E.g. Download excel sheets from:
2023-2024 data : https://zenodo.org/records/17950222 
2022–2023: https://zenodo.org/records/14645440
2021–2022: https://zenodo.org/records/10528846
2020–2021: https://zenodo.org/records/7544221
2018–2019: https://zenodo.org/records/4557180
2017: https://zenodo.org/records/2562858
NB - frustrating - different format every 2 years and often data only in tables in pdfs → when scraped the pdf pages are poorly formed - would need manual manipulation


# 2. Get data into format:

Script “collecting_cleaning_data.R” → get all data into standard format and filter irrelevant data (e.g. other countries/pathogens from EARS-Net data)

# 3. Run trend analyses:
Script “run_trend_analyses.R”  – this runs generalised linear models on the data set based on the BELMAP 
–can of course use other methodologies/other data - just format data in same format as output - AMR_data_and_GLM_predictions_revised_method.csv 


# 4. Make interactive report
Script app.R → when click “Run App” it generates the first draft for an interactive report pilot - this is completely adaptable and meant as a starting point for discussions - please work on it within your own branch and change for your country, or suggest overall changes! 
