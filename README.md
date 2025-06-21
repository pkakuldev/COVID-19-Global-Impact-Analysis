# COVID-19-Global-Impact-Analysis

1.COVID-19 Global Impact Analysis Using SQL :
A comprehensive SQL-based analysis of global COVID-19 data to explore infection rates, death trends, and vaccination progress across countries and continents.

2.  Description/Purpose :
This SQL query analyzes global COVID-19 data to uncover key insights such as infection rates, death percentages, and vaccination progress by country and continent. It helps understand the pandemic's impact through data-driven metrics for further visualization and decision-making.

3.Tech Stack :
SQL – Core language used for data exploration and transformation

4.Data Source :
The data used in this project was sourced from Our World in Data, a reputable open-source platform that compiles global COVID-19 statistics from organizations like the World Health Organization (WHO) and Johns Hopkins University.
• Contains daily time-series data on COVID-19 cases, deaths, population, and vaccinations.
• Structured by country and date for easy aggregation, filtering, and trend analysis.
Source: ourworldindata.org 

5. Feature and Highlights
• Goal :
To analyze global COVID-19 data using SQL in order to uncover meaningful insights about infection trends, death rates, and vaccination progress across countries and continents.
• Walkthrough on Key Visuals :
The dashboard begins with high-level summary cards showing total cases, deaths, vaccinations, and global death rate. A bar chart highlights the countries with the highest infection rates relative to their population, while a line chart tracks the death rate trend over time. Vaccination progress is visualized through a cumulative line chart, showing how different countries rolled out vaccines. Continent-wise comparisons are displayed using grouped bar charts, and interactive drill-through features allow users to explore detailed statistics for specific countries or regions.

6. How to Run the Project
• Download the dataset from [Our World in Data](https://ourworldindata.org/covid-deaths).
• Import the CSV files (`CovidDeaths.csv`, `CovidVaccinations.csv`) into your SQL Server / MySQL.
• Run the SQL scripts in the provided `.sql` file.

7.Lessons Learned 
Working on this project gave me hands-on experience in exploring and analyzing real-world data using SQL. I deepened my understanding of SQL fundamentals such as filtering, grouping, and joining multiple datasets, and advanced my skills by using concepts like Common Table Expressions (CTEs), window functions (SUM() OVER()), and temporary tables to handle complex analytical tasks. I also learned how to calculate key performance metrics such as infection rates, case fatality rates, and vaccination progress across countries and continents. Structuring queries to produce clean, analysis-ready data helped me see the importance of data preparation for visualization and reporting purposes. This project taught me not just how to write SQL code, but how to think like a data analyst—focusing on trends, patterns, and extracting meaningful insights from data that can support real-world decision-making.
