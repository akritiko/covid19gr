[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5651141.svg)](https://doi.org/10.5281/zenodo.5651141)

_[(κάντε κλικ εδώ για να δείτε την εκδοχή της σελίδας στα ελληνικά 🇬🇷)](https://github.com/akritiko/covid19gr/)_

# COVID19gr - Open Data aggregation and Knowledge Base repository for COVID-19 in Greece. 

Open Data aggregation repository for the evolution of the SARS-COV-2 pandemic in Greece. The repository is being updated as the pandemic evolves.

## 1. Repository structure.

In this repository you will find:

### 1.1. Datasets

Available in machine readable format and frequently updated:
- [32 in .CSV format](https://github.com/akritiko/covid19gr/tree/master/data/csv)
- [32 in .JSON format](https://github.com/akritiko/covid19gr/tree/master/data/json)

_**NOTES:**_ 

- _The aforementioned datasets were created and are being maintained mainly by wither *** fellow citizens' initiatives *** who publish them under open data licenses and, of course, gratis free, or by organizations (research centres, private companies, etc.). Following you will find a detailed analysis of the data sources._
- _Daily data (i.e. cases, deaths, etc.) correspond to the time of announcement by the Greek Government and not to the time of the events. For more information we urge you to check the details of the creator of the datasets (see below)._

### 1.2. Reports

Indexing reports on the evolution of the coronavirus pandemic in Greece. More specifically, the collection consists of:

1. The daily report of the National Organization of Public Health (EODY) in .PDF format.
2. The information from the Ministry of Health and the Ministry of Civil Protection in video format on Youtube.
3. The periodic reporting of the measures compliance checks by the National Transparency Agency of Greece in .html format.
4. The periodic indexing of the news about the evolution of the pandemic from the blog of Clipnews S.A.

The above sources are aggregated, as hyperlinks, in a spreadsheet and are freely and openly available for use and editing in [.CSV] format (https://github.com/akritiko/covid19gr/blob/master/data/csv/covid19_reports.csv), [.JSON](https://github.com/akritiko/covid19gr/blob/master/data/json/covid19_reports.json) and [Google Spreadsheet](https://docs.google.com/spreadsheets/d/11A17Sb8pk9NyXz2FvRzaZIkxxNfiZcxUDBjjVkbXNQk/edit?usp=sharing) (read only)

_**NOTES:**_

- _Many data sets are a product of a combination of different primary data sources. We suggest for the best possible use that the intended user refer to the data sources provided below, in terms of how each dataset was created._
- _References in .pdf format from 17/12/2020 are no longer available to keep the size of the repository low._

### 1.3. Open Data Framework / Policy (Greece) _( archived )_

You can find the latest available version of the framework [here](https://docs.google.com/document/d/1eHWmtEIcy_K4UN8Op9jRtPGpNkoiw1e3b2Hr0qfjkdk/edit?usp=sharing) (available in Greek language only).

### 1.4. Resources

A catalogue of resources & tools that help monitor the situation of COVID-19 pandemic. Not necessarily related to the datasets of this repository. More specifically you can find the following categories.

1. [Data related](https://github.com/akritiko/covid19gr/blob/master/resources/data.md)
1. [Guides](https://github.com/akritiko/covid19gr/blob/master/resources/guides.md)
1. [Applications](https://github.com/akritiko/covid19gr/blob/master/resources/apps.md)


### 1.5. References

A catalogue of scientific publications and studies of official international bodies for the COVID-19 pandemic. The collection includes reports on health sciences, epidemiology, sociology, technology and will be updated frequently.

[All references available here.](https://github.com/akritiko/covid19gr/tree/master/references)

### 1.6. Unified Open Data Schema

One of the main purposes of this repository is the aggregation of open data from various sources and volunteers. For a combined and effective study it is necessary to create a data schema that can clarify the data of each dataset and help the user to better understand these data. Following you will find the unified data schema and a free online tool that will allow you to access it in a simpler, visual format.

- [Open Data Schema covid19gr](https://github.com/akritiko/covid19gr/blob/master/data/covid19gr_schema.json)
- [Open Data Schema Visualization with Data Package Creator](https://create.frictionlessdata.io/)

__GUIDE:__ [How to use the Data Package Creator to access the covid19gr Open Data Schema](https://docs.google.com/document/d/1I9N3DLCEO_fgJ9OlsRzY4Xk7nbPt3ZaqkA22rkK_CU0/edit?usp=sharing).

## 2. Datasets available on the COVID19gr repository

You can find detailed information about the datasets of this repository in this [Google Document (read only)](https://docs.google.com/spreadsheets/d/1SJL4T1y4itcwcfkmBjbhE-iekZspj3pvrdCvl2sl6XY/edit?usp=sharing). It provides the following metadata:

- ID (iterator)
- Title of the dataset
- Filename
- Data Source Type
- Format 
- Data Category
- Reference Area
- Dataset Curator
- Dataset Curator's Website
- Dataset Curator's Affiliation
- Raw Data URL
- Data Visualization URL
- License
- Latest update date
- 5 Star Open Data Score

### 2.1. Epidemiological Data

- Various metrics (daily) - Greece (nationwide) 
- Men cases (total), per age and severity
- Men cases (daily), per age and severity 
- General population cases (total), per age and severity
- General population cases (daily), per age and severity
- Women cases (total), per age and severity 
- Women cases (daily), per age and severity
- Projections
- Various metrics (daily) - Per prefecture
- Various metrics (daily) - Per region
- Various metrics (daily) - Greece (nationwide) 
- Infections (daily) - Per prefecture 
- Deaths (daily) - Per prefecture 
- Schools information        
- Information for COVID-19 cases per region and status of case
- Rapid Tests Data


### 2.2. Mobility Data

- Irregular mobility metrics* per decentralized administration and various activities by Google (2020)
- Irregular mobility metrics* per decentralized administration and various activities by Google (2021)
- Daily mobility metrics (nationwide) by Apple
- Daily mobility metrics for Athens and Thessaloniki cities by TomTom

**Notes on the dataset**

- \*Mobility data by Google are irregularly published (every other day on average). Yet it is the only dataset which provides separate metrics for specific activities (retail, parks, workplaces, etc.). Google's reports will be available for use in order to help addressing the pandemic for as long as they are considered helpful by the health professionals and / or policy makers. They are not published under an open data license but they are publicly available during the pandemic.
- Apple's data are nationwide and we are aggregating them from the Github repository COVID19_mobility by ActiveConclusion. It is published under the [MIT license](https://github.com/Sandbird/covid19-gr/blob/main/LICENSE) license.
- TomTom data are about the cities Athens and Thessaloniki and we are aggregating them from the Github repository COVID19_mobility by ActiveConclusion. It is published under the [MIT license](https://github.com/Sandbird/covid19-gr/blob/main/LICENSE) license.

### 2.3. Social Distancing Measures and governmental checks

- Covid-19 checks (National Transparency Agency)
- Covid-19 Risk of openess
- Covid-19 Government measures strictness

**Notes on the dataset**

- The data from the National Transparency Agency were extracted by the reports you can find [here (in Greek)](https://aead.gr/press/covid19). I am personally curating the dataset so in case you find any errors, I would be obliged if you could inform me to proceed in the appropriate corrections. You will find more information on how to contact us, at the end of this document. 
- Oxford Covid-19 Government Response Tracker datasets are the product of the respective research of this research group. In this repository you will find the latest measures on .CSV format but, before you use them we would propose that you refer to the respective literature of the research team available at their official website. License: [Creative Commons Attribution 4.0 International](https://github.com/OxCGRT/covid-policy-tracker/blob/master/LICENSE.txt).

### 2.4. Vaccination data

- Vaccinations (Greece) 
- Vaccinations (Per prefecture - Greece) 
- Vaccinations - ECDC data

**Notes on the dataset**

- All the data available to Our World In Data are published under [Creative Commons Attribution (CC-BY) 4.0 International](https://creativecommons.org/licenses/by/4.0/).


### 2.5. Official reports archive (urls)

- Official Reports

**Notes on the dataset**

- This dataset includes reports from: ΕΟΔΥ (daily reports), COVID-19 Observatory (frequent reports), National Transparency Agency - Checks for compliance with measures (frequent reports), Clipnews Top Level Report - COVID-19 timeliness overview (frequent reports).
- For the extraction of the data we used [DEiXTo](https://deixto.com/) tool / single parse per website.

_**NOTE:** In case one of the URLs leads to a page without content or to a page with error 404, we recommend that you search for the content through the Interet Archive Wayback Machine. The steps are as follows:_

1. _Select the report link that is not available (i.e. https://eody.gov.gr/wp-content/uploads/2020/03/covid-gr-daily-report-20200320.pdf corresponding to the daily report of EODY for the date 20-03-2020)._
1. _Visit the [Internet Archive's Wayback Machine](https://web.archive.org/) (click on the link)._
1. _Paste the address of step one in the search box._
1. _In the calendar that will be displayed, select one of the circles and click on the date and time to upload your report._

### 2.6. Dataset helpers for data analysis

- Greek Prefectures
- Lockdown Periods Data

### 2.7. Legislation Datasets

- COVID-19 Legislation
- COVID-19 Legislation - PANDEKTIS

### 2.8. Economic Datasets

- Unemployment Data	|

**Notes on the dataset**

- Data originally available at the [National Unemployment Agency (OAED)](http://www.oaed.gr/statistika-stoicheia-ana-mena).

## 3. License of the COVID19gr repository

Data is power. Especially in times of crises, should they be used right the can make the difference by protecting our fellow citizen and ourselves. Having that in mind, we are making the contents of this repository, unless explicitly stated otherwise, under the license: [Public Domain: CC0-1.0](https://github.com/akritiko/covid19gr/blob/master/LICENSE).

## 4. Reporting issues and request for information

In case you came across an issue, you have some idea or you want a clarification you can share it with us using the [issues mechanism](https://github.com/akritiko/covid19gr/issues) of this repository. We will try to get back to you, as soon as possible.

## 6. Acknowledgements 

This repository is nothing more that a collection of datasets. For those datasets the following people / organizations have contributed: 

- [Sandbird](https://github.com/Sandbird/)
- [Covid-19-Response-Greece](https://github.com/Covid-19-Response-Greece/covid19-data-greece/blob/master/data/greece/Measures/greece_social_distancing_measures_timeline.json)
- [@Nyrros](https://twitter.com/Nyrros)
- [iMEdD-Lab](https://github.com/iMEdD-Lab/open-data/tree/master/COVID-19) 
- [covid19.gov.gr](http://covid19.gov.gr/)
- [CovidDEXP](https://covid19.csd.auth.gr/)
- [covid19-projections.com](https://covid19-projections.com/greece)
- [covid19.healthdata.org](https://covid19.healthdata.org/greece?view=daily-deaths&tab=trend)
- [Oxford Covid-19 Government Response Tracker](https://github.com/OxCGRT/covid-policy-scratchpad)
- [ActiveConclusion](https://github.com/ActiveConclusion)
- [Our World in Data](https://github.com/owid)
- Google
- Apple
- TomTom

## 7. How to refer to this repository (optional)

Since this repository is published under the Public Domain CC0-1.0, there is absolutely no requirement to refer to it in any way. However, if you would like to do so, you can use the following citation:

_Apostolos Kritikos. (2021). akritiko/covid19gr: Diogenes (4.0.0). Zenodo. https://doi.org/10.5281/zenodo.5651141_

or in bibtex format [BibTEX version](https://zenodo.org/record/5651141/export/hx).
