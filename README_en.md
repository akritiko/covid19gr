# COVID19gr - Open Data aggregation repository for COVID-19 in Greece. 

[(κάντε κλικ εδώ για να δείτε την εκδοχή της σελίδας στα ελληνικά)](#)

Open Data aggregation repository for the evolution of the SARS-COV-2 pandemic in Greece. The repository is being updated as the pandemic evolves.

## 1. Repository structure.

In this repository you will find:

### 1.1. Datasets

Available in machine readable format and frequently updated:
- [16 in .CSV format](https://github.com/akritiko/covid19gr/tree/master/data/csv)
- [14 in .JSON format](https://github.com/akritiko/covid19gr/tree/master/data/json)

**NOTE:** The aforementioned datasets were created and are being maintained mainly by wither *** fellow citizens' initiatives *** who publish them under open data licenses and, of course, gratis free, or by organizations (research centres, private companies, etc.). Following you will find a detailed analysis of the data sources.

### 1.2. Reports

[Greek Government's reports](https://github.com/akritiko/covid19gr/tree/master/reports) as they are published through the official websites of COVID19.gov.gr, the National Organization of Public Health (EODY), the National Transparency Agency, etc. The reason behind recording those reports is for the intended audience to be able to cross check the extracted data for validity reasons.

**NOTE:** Many of the available datasets are product of the combination of various sources of raw data. For the best possible validation please refer to the data sources catalogue that will follow, to get informed on how each dataset was created. 

### 1.3. Analysis

[Data Analysis](https://github.com/akritiko/covid19gr/tree/master/analysis): After aggregating the data analysing them is the next logical step. Here you will find a series of attempts to extract valuable knowledge from data analysis. 

### 1.4. Open Data Framework / Policy (Greece)

[Review of the Open Data Framework / Policy in Greece - currently available in Greek language only -](https://github.com/akritiko/covid19gr/wiki). 

## 2. Datasets available on the COVID19gr repository

### 2.1. Epidemiological Data

| Dataset                                                | Author                                    | Data Source                                           | Data Visualization                                |
|--------------------------------------------------------|-------------------------------------------|-------------------------------------------------------|---------------------------------------------------|
| Various metrics (daily) - Greece (nationwide)          | [Sandbird](https://github.com/Sandbird/)  | [Github](https://github.com/Sandbird/covid19-Greece)  | [covid19-greece.tk/](https://covid19-greece.tk/)  |
| Men cases (total), per age and severity                | [Sandbird](https://github.com/Sandbird/)  | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |
| Men cases (daily), per age and severity                | [Sandbird](https://github.com/Sandbird/)  | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |
| General population cases (total), per age and severity | [Sandbird](https://github.com/Sandbird/)  | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |
| General population cases (daily), per age and severity | [Sandbird]( https://github.com/Sandbird/) | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |
| Women cases (total), per age and severity              | [Sandbird]( https://github.com/Sandbird/) | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |
| Women cases (daily), per age and severity              | [Sandbird]( https://github.com/Sandbird/) | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |
| Projections                                            | [Sandbird]( https://github.com/Sandbird/) | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |
| Various metrics (daily) - Per prefecture               | [Sandbird]( https://github.com/Sandbird/) | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |
| Various metrics (daily) - Per region                   | [Sandbird]( https://github.com/Sandbird/) | [Github]( https://github.com/Sandbird/covid19-Greece) | [covid19-greece.tk/]( https://covid19-greece.tk/) |

**Notes on the dataset:**
1. Notes: Moving averages are 7-day backward. The number is based on the daily value. It is assumed to be the same as the previous day if not updated. On the days with no continuity from the previous day due to change of standards, "New" number is treated as 0 and the bar color is changed. Data may be corrected by the developer when it is considered as an obvious misstatement, such as minus value of Tested Positive.
2. Resources: [EODY](https://eody.gov.gr/epidimiologika-statistika-dedomena/ektheseis-covid-19/). Measures by [Covid-19-Response-Greece](https://github.com/Covid-19-Response-Greece/covid19-data-greece/blob/master/data/greece/Measures/greece_social_distancing_measures_timeline.json). Data on prefectures was taken from [@Nyrros](https://twitter.com/Nyrros), [iMEdD-Lab](https://github.com/iMEdD-Lab/open-data/blob/master/COVID-19/regions_greece_cases.csv) and [covid19.gov.gr](http://covid19.gov.gr/). Predictions were taken from c[covid19-projections.com](https://covid19-projections.com/greece), [covid19.healthdata.org](https://covid19.healthdata.org/greece?view=daily-deaths&tab=trend). Used introductory text for IIFR from [WHO](https://www.who.int/news-room/commentaries/detail/estimating-mortality-from-covid-19) and prediction model from ([link1](https://covid19-projections.com/estimating-true-infections/), [link2](https://covid19-projections.com/about/#infection-fatality-rate-ifr), [link3](https://github.com/youyanggu/covid19_projections/tree/master/implied_ifr)).
3. Data updated: It will be updated on an irregular basis according to the announcement by the Ministry of Health.
1. License: [MIT license](https://github.com/Sandbird/covid19-gr/blob/main/LICENSE). 

### 2.2. Mobility Data

| Dataset                                                                             | Author | Data source                                                                      | Data visualization                                                                                                                                                |
|-------------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Irregular mobility metrics* per decentralized administration and various activities | Google | [Community Mobility Reports](https://www.google.com/covid19/mobility/)           | [Community Mobility Reports](https://ourworldindata.org/grapher/changes-visitors-covid?tab=chart&stackMode=absolute&time=earliest..latest&country=~GRC®ion=World) |
| Daily mobility metrics (nationwide)                                                 | Apple  | [Mobility Trends Reports](https://github.com/ActiveConclusion/COVID19_mobility/) | [Mobility Trends Reports](https://covid19.apple.com/mobility)                                                                                                     |
| Daily mobility metrics for Athens and Thessaloniki cities                           | TomTom | [Traffic Index](https://github.com/ActiveConclusion/COVID19_mobility/)           | -                                                                                                                                                                 |

**Notes on the dataset**
1. \*Mobility data by Google are irregularly published (every other day on average). Yet it is the only dataset which provides separate metrics for specific activities (retail, parks, workplaces, etc.). Google's reports will be available for use in order to help addressing the pandemic for as long as they are considered helpful by the health professionals and / or policy makers. They are not published under an open data license but they are publicly available during the pandemic.
2. Apple's data are nationwide and we are aggregating them from the Github repository COVID19_mobility by ActiveConclusion. It is published under the [MIT license](https://github.com/Sandbird/covid19-gr/blob/main/LICENSE) license.
3. TomTom data are about the cities Athens and Thessaloniki and we are aggregating them from the Github repository COVID19_mobility by ActiveConclusion. It is published under the [MIT license](https://github.com/Sandbird/covid19-gr/blob/main/LICENSE) license.

### 2.3. Social Distancing Measures and governmental checks

| Dataset                                                                             | Author | Data source                                                                      | Data visualization                                                                                                                                                |
|-------------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Irregular mobility metrics* per decentralized administration and various activities | Google | [Community Mobility Reports](https://www.google.com/covid19/mobility/)           | [Community Mobility Reports](https://ourworldindata.org/grapher/changes-visitors-covid?tab=chart&stackMode=absolute&time=earliest..latest&country=~GRC®ion=World) |
| Daily mobility metrics (nationwide)                                                 | Apple  | [Mobility Trends Reports](https://github.com/ActiveConclusion/COVID19_mobility/) | [Mobility Trends Reports](https://covid19.apple.com/mobility)                                                                                                     |
| Daily mobility metrics for Athens and Thessaloniki cities                           | TomTom | [Traffic Index](https://github.com/ActiveConclusion/COVID19_mobility/)           | -                                                                                                                                                                 |

**Notes on the dataset**

1. The data from the National Transparency Agency were extracted by the reports you can find here (in Greek): https://github.com/akritiko/covid19gr/tree/master/reports/National%20Transparency%20Authority. I am personally curating the dataset so in case you find any errors, I would be obliged if you could inform me to proceed in the appropriate corrections. You will find more information on how to contact us, at the end of this document. 
1. Oxford Covid-19 Government Response Tracker datasets are the product of the respective research of this research group. In this repository you will find the latest measures on .CSV format but, before you use them we would propose that you refer to the respective literature of the research team available at their official website. License: [Creative Commons Attribution 4.0 International](https://github.com/OxCGRT/covid-policy-tracker/blob/master/LICENSE.txt).

## 3. License of the COVID19gr repository

Data is power. Especially in times of crises, should they be used right the can make the difference by protecting our fellow citizen and ourselves. Having that in mind, we are making the contents of this repository, unless explicitly stated otherwise, under the license: [Public Domain: CC0-1.0](https://github.com/akritiko/covid19gr/blob/master/LICENSE).

## 4. Reporting issues and request for information

In case you came across an issue, you have some idea or you want a clarification you can share it with us using the [issues mechanism](https://github.com/akritiko/covid19gr/issues) of this repository. We will try to get back to you, as soon as possible.

## 6. Acknowledgements 

This repository is nothing more that a collection of datasets. For those datasets the following people / organizations have contributed: [Sandbird](https://github.com/Sandbird/), [Covid-19-Response-Greece](https://github.com/Covid-19-Response-Greece/covid19-data-greece/blob/master/data/greece/Measures/greece_social_distancing_measures_timeline.json), [@Nyrros](https://twitter.com/Nyrros), [iMEdD-Lab](https://github.com/iMEdD-Lab/open-data/blob/master/COVID-19/regions_greece_cases.csv), [covid19.gov.gr](http://covid19.gov.gr/), [CovidDEXP](https://covid19.csd.auth.gr/), [covid19-projections.com](https://covid19-projections.com/greece), [covid19.healthdata.org](https://covid19.healthdata.org/greece?view=daily-deaths&tab=trend), [Oxford Covid-19 Government Response Tracker](https://github.com/OxCGRT/covid-policy-scratchpad), [ActiveConclusion](https://github.com/ActiveConclusion), Google, Apple, TomTom.

## 7. How to refer to this repository (optional)

Since this repository is published under the Public Domain CC0-1.0, there is absolutely no requirement to refer to it in any way. However, if you would like to do so, you can use the following citation:

_Apostolos Kritikos. COVID-19 Aggregated data repository for Greece (covid19gr). https://github.com/akritiko/covid19gr [online]._
