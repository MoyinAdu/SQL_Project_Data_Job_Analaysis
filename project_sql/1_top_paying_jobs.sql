/* 
Question: What are the top-paying Data Analysts job roles
- Identify the 10 highest-paying Data Analysts job roles that are available remotely
- Focus on job postings with specified salaries (no nulls)
- Why? Highlight the top-paying oppurtunities for Data Analysts, offering insights into employment applications
*/;

SELECT
    job_title,
    salary_year_avg AS annual_salary,
    name AS company,
    job_posted_date,
    job_schedule_type,
    job_country,
    job_location,
    job_health_insurance,
    job_via
FROM
    job_postings_fact AS JPC
LEFT JOIN
    company_dim AS companies ON companies.company_id = JPC.company_id
WHERE
    job_work_from_home IS TRUE
    AND job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;


