use hr_data;

select *
from hr;

alter table hr
change column ï»¿id emp_id varchar(20) null;

describe hr;

select hire_date
from hr;

set sql_safe_updates = 0;

update hr
set birthdate = case
   when birthdate like "%/%" then  date_format(str_to_date(birthdate, "%m/%d/%Y"), "%Y-%m-%d")
   when birthdate like "%-%" then  date_format(str_to_date(birthdate, "%m-%d-%Y"), "%Y-%m-%d")
   else null
end;

alter table hr
modify column birthdate date;


update hr
set hire_date = case
   when hire_date like "%/%" then  date_format(str_to_date(hire_date, "%m/%d/%Y"), "%Y-%m-%d")
   when hire_date like "%-%" then  date_format(str_to_date(hire_date, "%m-%d-%Y"), "%Y-%m-%d")
   else null
end;

alter table hr
modify column hire_date date;

select termdate
from hr;


update hr
set termdate = date(str_to_date(termdate, "%Y-%m-%d %H:%i:%s UTC"))
where termdate is not null and termdate != '';

SET sql_mode = 'ALLOW_INVALID_DATES';

alter table hr
modify column termdate DATE;


alter table hr
add column age int;

update hr
set age = timestampdiff(year, birthdate, curdate());

select birthdate, age from hr;

select 
min(age) as youngest,
max(age) as oldest
from hr;

select count(*)
from hr where age < 18;

-- questions for Exploratory Data analysis

-- 1. what is the gender breakdown of employees in the company
select gender, count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by gender; 

-- 2. What is the race/ethnicity breakdown of employees in company
select race, count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by race
order by count desc;

-- 3. What is the age distribution of employees in company
select min(age) as youngest, max(age) as oldest
from hr
where age >= 18 and termdate = "0000-00-00";

select 
 case
  when age >=18 and age <= 24 then "18 - 24"
  when age >= 25 and age <= 34 then "25 - 34"
  when age >= 35 and age <= 44 then "35 - 44"
  when age >= 45 and age <= 54 then "45 - 54"
  when age >= 55 and age <= 64 then "55 - 64"
  else "65+"
 end as age_group,
 count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by age_group
order by age_group;


select 
 case
  when age >=18 and age <= 24 then "18 - 24"
  when age >= 25 and age <= 34 then "25 - 34"
  when age >= 35 and age <= 44 then "35 - 44"
  when age >= 45 and age <= 54 then "45 - 54"
  when age >= 55 and age <= 64 then "55 - 64"
  else "65+"
 end as age_group, gender,
 count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by age_group, gender
order by age_group, gender;

-- 4. how many employees work at HQ vs remote location?

select location, count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by location;

-- 5. what is the average length of employment of employees who have been terminated
select 
round(avg(datediff(termdate, hire_date))/365,0) as avg_length_employment
from hr
where termdate <= curdate() and termdate <> "0000-00-00" and age >= 18;

-- 6. how does gender distribution vary accross departments and job titles
select department, gender, count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by department, gender
order by department;

-- 7. what is the diftribution of job titles accross the company
select jobtitle, count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by jobtitle
order by jobtitle desc;

-- 8. which department has highest turnover rate
select department, 
total_count,
terminated_count,
terminated_count/total_count as termination_rate
from
(
select department,
count(*) as total_count,
sum(case when termdate <> "0000-00-00" and termdate <= curdate() then 1 else 0 end) as terminated_count
from hr
where age >= 18
group by department
) as subquery
order by termination_rate desc;

-- 9. what is the distribution of employees across location by city and state
select location_state, count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by location_state
order by count desc;

select location_city, count(*) as count
from hr
where age >= 18 and termdate = "0000-00-00"
group by location_city
order by count desc;

-- 10. How has the company's employee count changed over time based on hire and term dates?
SELECT
	year,
    hires,
    terminations,
    hires - terminations AS net_change,
    ROUND((hires - terminations)/hires*100,2) AS net_change_percent
FROM(
	SELECT
    YEAR(hire_date) AS year,
    COUNT(*) as hires,
    SUM(CASE WHEN termdate <= curdate() AND termdate <> '0000-00-00' THEN 1 ELSE 0 END) AS terminations
    FROM hr
    WHERE age >= 18
    GROUP BY year(hire_date)
    ) AS subquery
ORDER BY year ASC;

-- 11. What is the tenure distribution for each department?
SELECT department, round(avg(datediff(termdate, hire_date)/365),0) AS avg_tenure
FROM hr
WHERE termdate <= curdate() AND termdate <> '0000-00-00' AND age >= 18
GROUP BY department;
