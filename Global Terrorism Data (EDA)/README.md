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

## Exploratory Data Analysis

The notebook `exploratory_data_analysis.ipynb` contains the code for exploring the Global Terrorism Database. We used the output dataset (`gtd_cleaned.csv`) from the previous step, i.e., data cleaning.  The analysis includes:

- Data loading and preprocessing
- Descriptive statistics
- Data visualization
- Exploration of terrorism trends, locations, attack types, targets, and more

## Results and Conclusions

Yet to be authored!!!!

The analysis provides insights into various aspects of global terrorism, including trends over time, distribution of attacks by country and region, preferred attack types, common targets, and more. The conclusions drawn from this analysis can help in understanding the patterns of terrorism activities worldwide.

For detailed findings, visualizations, and interpretations, refer to the Jupyter Notebook: [exploratory_data_analysis.ipynb](notebooks/exploratory_data_analysis.ipynb).

## Author

- Rajat Bahuguna
- Contact: Rajatbahuguna4445@gmail.com

Feel free to reach out for any inquiries, suggestions, or collaborations related to this project.

## License

This project is licensed under the [MIT License](LICENSE).
