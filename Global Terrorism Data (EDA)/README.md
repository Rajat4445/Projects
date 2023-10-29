# Exploratory Data Analysis Project - Global Terrorism Dataset

## Overview

This project focuses on conducting an Exploratory Data Analysis (EDA) on the Global Terrorism Database.The Global Terrorism Database™ (GTD) is a comprehensive open-source database containing detailed information on terrorist events worldwide, spanning from 1970 through 2020. The database is continuously updated, with additional annual updates planned for the future. Unlike many other event databases, the GTD provides systematic data not only on international terrorist incidents but also on domestic and transnational events. It encompasses a vast collection of over 200,000 cases, each offering valuable insights into acts of terrorism.

### Characteristics of the GTD

- Contains data on over 200,000 terrorist attacks.
- Represents the most comprehensive unclassified database on terrorist attacks globally.
- Encompasses information on more than 88,000 bombings, 19,000 assassinations, and 11,000 kidnappings since 1970.
- Provides details on at least 45 variables for each case, with recent incidents offering information on more than 120 variables.
- Utilizes a vast corpus of over 4,000,000 news articles and 25,000 news sources to collect incident data from 1998 to 2017 alone.

For more information and to request access to the dataset, visit the [Global Terrorism Database (GTD) page](https://www.start.umd.edu/gtd/about/).

## Goal

The goal of this project is to explore the dataset, identify patterns, trends, and insights related to terrorism activities, and visualize the data to provide a better understanding of global terrorism dynamics.

## Project Structure

The project is structured as follows:

```
- data/                          # Folder for storing the dataset
  - gtd.csv    # Global Terrorism Database (GTD) CSV file
  
- notebooks/                     # Jupyter Notebooks for data analysis and visualization
  - data_cleaning.ipynb          # data cleaning of gtd.csv dataset
  - exploratory_data_analysis.ipynb  # Main EDA notebook, takes gtd_cleaned.csv as an input
  
  
- images/                        # Folder for storing generated images and plots
  
- README.md                      # Project README file
```

## Libraries Used

- Python 3.10
- Pandas
- NumPy
- Matplotlib
- Seaborn
- ipywidgets
- Jupyter Notebook

## Getting Started

1. Clone this repository:

   ```bash
   git clone https://github.com/rajat4445/Global Terrorism Data (EDA).git
   cd global-terrorism-eda
   ```

2. Install the required libraries using pip or conda:

   ```bash
   pip install pandas numpy matplotlib seaborn jupyter
   ```

3. Open and run the Jupyter Notebook `exploratory_data_analysis.ipynb` to perform the exploratory data analysis.

## Data Cleaning

Apart from the database, we also received `Codebook.pdf` from the Global Terrorism Database maintaining team (University of Maryland), which contains the details of all the columns present in the database provided. We used this codebook to understand the database better and create a new file named `column_description.txt` containing the details of all the columns before data cleaning.

The notebook `data_cleaning.ipynb` contains the code and approach followed to clean `gtd.csv` (original dataset) as many columns of this dataset had missing values. Apart from treating missing values, we have also engineered new columns, renamed the existing columns (for better readability) and saved cleaned data into a new csv file named `gtd_cleaned.csv` as output. 

After performing data cleaning, we have created another file named `GTDcleaned_description.txt` which contains the description of all the columns alongwith the details on missing values. This would be helpful for understanding the columns during EDA.

To read the approach in detail, open `Data Cleaning Approach.pdf`

## Exploratory Data Analysis

The notebook `exploratory_data_analysis.ipynb` contains the code for exploring the Global Terrorism Database. We used the output dataset (`gtd_cleaned.csv`) from the previous step, i.e., data cleaning.  The analysis includes:

- Data loading and preprocessing
- Descriptive statistics
- Data visualization
- Exploration of terrorism trends, locations, attack types, targets, and more

## Results and Conclusions

### Univariate Analysis (Numerical)

- High correlation among numeric columns, but caution needed due to imputed missing values.
- Gradual increase in terrorist attacks until 2014, followed by a decline.
- Number of perpetrators captured peaked in 2012.
- Missing data in `Number of Perpetrators Captured` particularly until 1998.

### Univariate Analysis (Categorical)

- Most attacks are not extended incidents (lasting less than 24 hours).
- Iraq is the most targeted country (13%), followed by Afghanistan (9%), Pakistan (7.4%), and India (6.6%).
- Middle East & North Africa (28%) and South Asia (26%) are high-attack regions.
- No clear patterns in 'Province / Administrative Region / State' and 'City' columns.
- 77% undoubtedly classified as terrorist attacks, 17% doubted, and 6% lack data.
- 85% of attacks are not part of multiple incidents.
- Most attacks (88%) are successful.
- Common attack types include 'Bombing/Explosion' (47%), 'Armed Assault' (24%), and 'Assassination' (10%).
- 'Private Citizens & Property' (24.8%) are the most targeted, followed by 'Military' (16.3%), 'Police' (13.6%), 'Government' (11.4%), and 'Business' (10.6%).
- Active perpetrator groups like 'Taliban' (10.2%) and 'ISIL' (6.2%).

### Bivariate and Multivariate Analysis

- Increasing terrorism over the years, with the Middle East & North Africa and South Asia having the most attacks.
- Duration of attacks extending over 24 hours in South Asia, Sub-Saharan Africa, and Middle East & North Africa.
- Afghanistan, India, Nigeria, and Iraq had the most prolonged attacks.
- 'Hostage Taking' involved in the majority of attacks (around 85%).
- Common perpetrator groups, including 'Taliban' and 'ISIL.'
- Most common weapon types: 'Firearms' and 'Explosives.'
- High fatalities in the Middle East & North Africa, South Asia, and Sub-Saharan Africa.
- Different regions have different attack type patterns.
- 'Private Citizens & Property' most common target in various regions.
- Specific nationalities targeted in different regions.
- Active perpetrator groups vary by region.
- Common weapon types are 'Firearms' and 'Explosives.'
- High successful suicide attacks in specific regions.
- Majority of data collected by 'START Primary Collection' (50%).

####  🌟 Unveiling the Shadows: The Turbulence of Terrorist Incidents in India 🌟

- Peak in attacks around 2016.
- Dominance of 'Bombing/Explosion' (40%) and 'Armed Assault' (26%).
- High fatalities in cities like 'Srinagar,' 'Mumbai,' 'New Delhi,' and 'Amritsar.'
- 'CPI-Maoist' is the most active group.
- 'Explosives' and 'Firearms' are commonly used in India.

The analysis provides insights into various aspects of global terrorism, including trends over time, distribution of attacks by country and region, preferred attack types, common targets, and more. The conclusions drawn from this analysis can help in understanding the patterns of terrorism activities worldwide.

For detailed findings, visualizations, and interpretations, refer to the Jupyter Notebook: [exploratory_data_analysis.ipynb](notebooks/exploratory_data_analysis.ipynb).

For detailed report of the above findings, refer to `Detailed Report.pdf`

## Author

- Rajat Bahuguna
- Contact: Rajatbahuguna4445@gmail.com

Feel free to reach out for any inquiries, suggestions, or collaborations related to this project.

## License

This project is licensed under the [MIT License](LICENSE).
