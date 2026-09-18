# Insurance Data Analysis using Python & SQL

## Project Overview

This project analyzes an insurance customer dataset to understand patterns and relationships in insurance charges based on customer demographics, health-related attributes, smoking status, family characteristics, and region.

The project uses Python for data cleaning, exploratory data analysis, statistical analysis, and visualization, and MySQL for business-oriented SQL analysis.

## Objectives

- Perform data cleaning and quality checks.
- Analyze insurance charges across different customer segments.
- Identify relationships between age, BMI, smoking status, and charges.
- Perform exploratory data analysis using Python.
- Answer business questions using SQL.
- Identify high-cost customers and regional customer patterns.

## Dataset

The dataset initially contained **1,338 records and 7 columns**. After duplicate removal, the final dataset contained **1,337 records**.

### Main Columns

- `age` – Customer age
- `sex` – Customer gender
- `bmi` – Body Mass Index
- `children` – Number of children
- `smoker` – Smoking status
- `region` – Customer region
- `charges` – Insurance charges

## Tools & Technologies

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- MySQL
- Jupyter Notebook

## Data Cleaning

The following data-quality checks were performed using Pandas:

- Checked dataset structure and data types.
- Checked missing values.
- Checked duplicate records.
- Reviewed unique categorical values.
- Generated descriptive statistics.
- Examined numerical variables for unusual values.
- Removed duplicate records.
- Created additional analytical features.

After cleaning:

- **Rows:** 1,337
- **Columns:** 7
- **Missing Values:** 0
- **Duplicate Rows:** 0

## Exploratory Data Analysis

The analysis explored insurance charges across:

- Age
- BMI
- Smoking status
- Gender
- Region
- Number of children
- Age groups
- Family size

Visualizations were created using Matplotlib and Seaborn to understand distributions, comparisons, and relationships between variables.

## Feature Engineering

Additional features were created to support deeper analysis:

- `age_group`
- `family_size`
- `smoker_flag`

## Statistical Analysis

Correlation analysis was performed to understand relationships between numerical variables.

The project also included analysis of high-cost customers using the 75th percentile of insurance charges as a threshold.

## SQL Analysis

The cleaned data was analyzed in MySQL using business-oriented queries.

SQL concepts used:

- `SELECT`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- `CASE`
- Subqueries
- CTE
- Window Functions
- `RANK()`
- `ROW_NUMBER()`
- `PARTITION BY`

### SQL Business Analysis

The project includes analysis for:

- Total customer count
- Average insurance charges
- Total insurance charges
- Top 10 customers by charges
- Customer distribution by region
- Average charges by region
- Smoker vs non-smoker charge comparison
- Gender-wise charge comparison
- Customers with charges above the overall average
- Charge categorization
- Age-group analysis
- Children-wise charge analysis
- Region and smoking-status analysis
- Customer ranking by charges
- Top 3 high-charge customers from each region

## Key Insights

- Insurance charges were analyzed across multiple customer characteristics.
- Smoking status was compared with average insurance charges.
- Age and BMI were analyzed in relation to insurance charges.
- Customer groups were compared across different regions.
- High-cost customers were identified using a percentile-based threshold.
- SQL window functions were used to rank customers globally and within regions.

## Project Structure

```text
Insurance-Analysis-Python-SQL/
│
├── cleaned_data.csv
├── insurance.csv
├── insurance_analysis.ipynb
├── insurance_analysis.sql
└── README.md
