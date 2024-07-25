# HR Workforce Data Analysis

### Dashboard

![dashboard](https://github.com/user-attachments/assets/bcc3effc-c6f3-4652-a4f4-b9e0f1d75c1b)

### Project Overview

This project entails analyzing an HR dataset using MySQL to clean data, perform exploratory data analysis, and derive workforce insights. The dataset includes employee details like IDs, birthdates, hire dates, termination dates, gender, race, and job information. Key tasks included standardizing dates, calculating ages, and running EDA queries to explore gender and race distributions, age groups, employment locations, job title distribution, departmental turnover rates, and changes in employee count over time. The analysis helps HR departments in making informed hiring, retention, and workforce management decisions.

### Data and Tools Used

 #### Data 
 HR Data with over 22000 rows from the year 2000 to 2020.

#### Tools
- MySQL: The relational database management system used for data storage and manipulation.
- Power BI: The business analytics tool used for data visualization and reporting.

### Data Cleaning

1. Column Renaming - The column ï»¿id was renamed to emp_id for better readability.
2. Date Formatting - The birthdate, hire_date, and termdate columns were standardized to YYYY-MM-DD format.
3. Adding Age Column - An age column was added to calculate the age of employees based on their birthdate.
4. Verification - Verified that the dates and age calculations were correct.
5. Removing Underage Employees - Ensured that no employees under the age of 18 were included in the dataset.

### Exploratory Data Analysis 

1. Gender Breakdown - Analyzed the gender distribution of employees who are currently employed and over 18 years old.
2. Race/Ethnicity Breakdown - Evaluated the race and ethnicity distribution of the current employees.
3. Age Distribution - Investigated the age distribution of current employees.
4. Location Analysis - Compared the number of employees working at headquarters versus remote locations.
5. Average Length of Employment - Calculated the average tenure of employees who have been terminated.
6. Gender Distribution Across Departments - Assessed the gender distribution across various departments.
7. Job Titles Distribution - Analyzed the distribution of different job titles within the company.
8. Department Turnover Rates - Identified which departments had the highest turnover rates.
9. Location Distribution - Examined the distribution of employees across various cities and states.
10. Employee Count Over Time - Analyzed how the employee count has changed over time based on hire and term dates.
11. Tenure Distribution by Department - Calculated the average tenure for each department.

### Results

- Data Cleaning - Standardized date formats and updated columns.
- Exploratory Analysis - Balanced gender distribution.
- Dominant age groups and turnover rates identified.
- Job titles and employee count trends analyzed.
- Insights - Hiring, termination trends over time and average tenure by department.

### Conclusion

The HR dataset analysis provided insights into employee demographics, turnover trends, and job distributions. Key findings include balanced gender representation, dominant age groups, and department-specific tenure averages. These insights can guide HR management in improving retention strategies and understanding turnover patterns.

### Recommendations

- Enhance Employee Retention - Implement targeted retention strategies in departments with high turnover rates.
- Optimize Hiring Practices - Focus on hiring practices that attract candidates with high tenure potential.
- Monitor Demographic Trends - Regularly review employee demographics to ensure diversity and address any imbalances.
- Improve Data Collection - Standardize and clean employee data collection processes to ensure accuracy and consistency for future analyses.
- Utilize Insights for Strategy - Leverage findings to refine HR policies and strategies, enhancing overall employee satisfaction and performance.
