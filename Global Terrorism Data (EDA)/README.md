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

### Univariate Analysis (Numerical)

- Observed that **several numeric columns have high correlation with other numeric columns** but **missing values** in numeric columns were **imputed with single value, i.e., "-99"**, which may have artificially **lead to high degree of correlation** between these columns.Thus, **Using correlation** as a method to understand the relationship **between these columns is not reliable**.
- `Number of terrorist attack` increased gradually till 2014, where there were maximum terrorist attacks and after 2014, number of attacks started to decrease.
- `Number of perpetrators` captured has **increased over the year maximising at 2012** and fluctuating after that.
- We made a lineplot to look at all unknown values in `Number of Perpetrators Captured` column and observed that **number of unknown values increases and lies between a range of 700-5000 till the year 1998** which indicates that `number of perpetrators` captured might not have been recorded for these years leading to "missing" or "unknown" values.

### Univariate Analysis (Categorical)

- Around `95%` of the attacks are not `Extended Incident`s, which means they did not exceed a duration of 24 hours.
- Around `13%` (majority) of the attacks have been in `Iraq` followed by `Afghanistan` (`9%`),`Pakistan` (`7.4%`) and `India` (`6.6%`).
- Around `28%` (majority) of the attacks have been in `Middle East & North Africa` followed by `South Asia` (`26%%`),`Sub-Saharan Africa` (`11.3%`) and `South America` (`9.5%%`).
- There is no such pattern in `Province / Administrative Region / State` as the distribution is very uniform, no pattern can be observed. Similar is true for `City` column.
- Around `77%` of the attacks are undoubtedly terrorist attack, rest `17%` are doubted and remaing `6%` have no data available.
- Around `85%` of the attacks are not a part of multiple incident, rest `15%` are part of a multiple incident.
- Majority of attacks, around `88%` of the attacks were successful, rest `12%` were not successful.
- Most number of attacks are `Bombing/Explosion` (`47%`) followed by `Armed Assault` (`24%`) and `Assassination` (`10%`)
- `Private Citizens & Property`(`24.8%`) have been targeted the most, followed by, `Military (16.3%)`), `Police (13.6%)`, `Government (11.4%)` and `Business (10.6%)`
- As the number of attacks were highest in `Iraq`, and the `Nationality of Target/Victim` in majority is `Iraqi` followed by `Afghanistan`, `Pakistan` and `India`, that is same order as that of `Country` with attacks in descending order.
- `Taliban (10.2%)` is the most active perpetrator group followed by `Islamic State of Iraq and the Levant (ISIL) (6.2%)`,`Shining Path (SL) (3.9%)` and `Al-Shabaab (3.8%)`.

### Bivariate and Multivariate Analysis

- Number of terrorist attacks have **increased** over the years and making `Middle East & North Africa` and `South Asia` as the regions with **Maximum attacks.**
  - `Region`s where attacks extended over 24 hours are `South Asia`, `Sub-Saharan Africa` and `Middle East & North Africa` (in descending order).
  - The countries where attacks extended 24 hours are `Afghanistan` with max attacks followed by `India`, `Nigeria`, `Iraq` etc.
  - Majority (around `85%`) of the attacks involved `Hostage Taking`, followed by `Armed Assault` (around `7%`)
  - Although majority of attacks have `Unknown` (`~26%`) group name, the most active Perpetrator Groups are `Taliban` followed by `ISIL`, `Ansar Allah`, `Boko Haram`, `Al-Shabaab` etc.
  - `Firearms` are very common `Weapon Type` followed by a category of `Unknown` weapon types.
  - `Explosives` and `Melee` weapons are also being used by in a comparatively small proportion.
 
- `Middle East & North Africa` has maximum number of fatalities followed by `South Asia` and `Sub-Saharan Africa`
- For `Middle East & North Africa` Region, `Iraq` has the highest Fatalities followed by `Syria` and `Yemen`
- For `South Asia` Region, `Afghanistan` has highest Fatalities followed by `Pakistan` and `India`
- For `Sub-Saharan Africa` Region, `Nigeria` has highest fatalities followed by `Somalia` and `Congo`

- For `Attack Type`:
    - `Armed Assault` followed by `Bombing/Explosion` and `Hostage Taking (Kidnapping)` is most common attack type in `Sub-Saharan Africa`n region.
    - `Bombing/Explosion` followed by `Armed Assault` and `Assassination` is most common attack type in `Middle East & North Africa`n region. Similar is true for `South Asia`n region.

#### Region Wise
- For `Target/Victim Type`:
    - `Private Citizens & Property` followed by `Millitary` and `Government (General)` are most common Target type in `Sub-Saharan Africa`n region. Similar is true for `South Asia`n region.
    - Similar is true for `Middle East & North Africa`n region except `Police` is the third highest target type.

- For `Nationality of Target/Victim`:
    - `Nigeria` followed by `Somalia` and `South Africa` is most common nationality of target in `Sub-Saharan Africa`n region.
    - `Iraq` followed by `Yemen` and `Turkey` is most common nationality of target in `Middle East & North Africa`n region.
    - `Afghanistan` followed by `Pakistan` and `India` is most common nationality of target in `South Asia`n region.
    
- For `Perpetrator Group Name`:
    - Although majority of attacks have been done by `Unknown` perpetrators, but `Al-Shabaab` followed by `Boko Haram` and `Fulani Extremists` are most active in `Sub-Saharan Africa`.
    - Similar to `Sub-Saharan Africa`, in named perpetrator groups, `ISIL` followed by `Ansar Allah` and `PKK` are most active groups in `Middle East & North Africa`
    - `Taliban`, `CPI-Maoists` and `Maoists` are most active named perpetrator groups in `South Asia`n region.
    
- For `Weapon Type`
    - `Firearms` and `Explosives` are most common weapon type in all three regions.

- `Middle East & North Africa`, `South Asia` and `Sub-Saharan Africa` have the highest Successful suicide attacks.
- Majority of Data has been colelction by `START Primary Collection` (50%) followed by `PGIS` (30%), `ISVG` (8.2%) and `CETIS` (7.7%)

####  🌟 Unveiling the Shadows: The Turbulence of Terrorist Incidents in India 🌟

- Attacks in `India` have peaked around `2016` which is a little different from the world
- Roughly 40% of attack are `Bombing/Explosion` followed by `Armed Assualt` (26%), `Hostage Taking (Kidnapping)` (10%) and `Assassination` (9%)
- Total Number of Fatalities have been highest in `Srinagar` followed by `Mumbai`, `New Delhi` and `Amritsar`
- `Private Citizen & Property` are most targeted followed by `Police` and `Government (General)`
- `CPI-Maoist` are the most active terrorist group followed by `Maoist` and `Sikh Extremists`
- `Explosives` and `Firearms` are most common weapon type used in terrorist attacks of India.

  

The analysis provides insights into various aspects of global terrorism, including trends over time, distribution of attacks by country and region, preferred attack types, common targets, and more. The conclusions drawn from this analysis can help in understanding the patterns of terrorism activities worldwide.

For detailed findings, visualizations, and interpretations, refer to the Jupyter Notebook: [exploratory_data_analysis.ipynb](notebooks/exploratory_data_analysis.ipynb).

## Author

- Rajat Bahuguna
- Contact: Rajatbahuguna4445@gmail.com

Feel free to reach out for any inquiries, suggestions, or collaborations related to this project.

## License

This project is licensed under the [MIT License](LICENSE).
