# Alcohol Consumption Analysis App

**Live Demo**: Explore the Alcohol Consumption Analysis App [here](https://brandonliu2.shinyapps.io/assignment-b3-brandonliu2/).

## Overview

The Alcohol Consumption Analysis App provides an insightful exploration into the historical alcohol consumption data in the United States. This interactive application is designed for researchers, educators, students, and anyone interested in understanding trends and patterns in alcohol consumption over the years. With easy-to-use features and dynamic data visualizations, the app offers a unique way to engage with this historical dataset.

## Key Features

1. **Year Range Selection**: Investigate alcohol consumption trends over time. Select a specific range of years to focus your analysis.
2. **Interactive Data Table**: The content of data table is the range of years being selected.
3. **Sort by Any Column**:View detailed data with the ability to sort by various columns such as year, beer, wine, spirits, and total alcohol consumption.
4. **Customizable Visualizations**: Generate custom plots by selecting range of years. Visualize the change of total alcohol consumption across the selected years.
5. **Data Download Functionality**: Download the data for the selected year range. Export your custom-filtered dataset as a .csv file for further analysis or reporting.


## Dataset Source

This app utilizes a historical dataset on alcohol consumption in the USA since 1850. The data includes consumption rates for beer, wine, spirits, and total beverages.

[Link](https://github.com/owid/owid-datasets/blob/976140919ba6c3cebfe17ca504e3dd01b1e7ef3c/datasets/Alcohol%20consumption%20in%20USA%20since%201850%20%E2%80%94%20NIAAA/Alcohol%20consumption%20in%20USA%20since%201850%20%E2%80%94%20NIAAA.csv) to the dataset.

## Getting Started

Run the Alcohol Consumption Analysis App in your local R environment:

1. **Clone the Repository**: Obtain the application code by cloning the app's repository to your local machine.
2. **Install Required Packages**: Set up your environment by installing necessary R packages. Run the following commands in your R console:

   ``` r
   install.packages(c("shiny", "DT", "ggplot2", "dplyr", "tidyverse"))
   ```
3. **Launch the App**: Open app.R in RStudio and click the "Run App" button to start your journey through the history of alcohol consumption in the USA.

