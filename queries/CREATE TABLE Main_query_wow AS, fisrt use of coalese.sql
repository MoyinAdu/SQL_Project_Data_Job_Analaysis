CREATE TABLE Main_query_wow AS
    SELECT 
    job_id,
    job_title_short,
    COALESCE(salary_hour_avg, 0) AS salary_hour_avg,
    COALESCE(salary_year_avg, 0) AS salary_year_avg,
    ((COALESCE(salary_hour_avg, 0)) * 1920) + COALESCE(salary_year_avg, 0) AS total_salary,
    CASE
        WHEN salary_hour_avg = NULL AND salary_year_avg = NULL THEN 'No pay'
        WHEN salary_hour_avg BETWEEN 1 AND 20.8334  THEN  'Extremely low'
        WHEN salary_hour_avg BETWEEN 20.83341 AND 28.64584 THEN 'Very low'
        WHEN salary_hour_avg BETWEEN 28.64584 AND 39.0625 THEN 'low'
        WHEN salary_hour_avg BETWEEN 39.06251 AND 49.47917 THEN 'Manageable'
        WHEN salary_hour_avg BETWEEN 49.479171 AND 62.5000 THEN 'Okay'
        WHEN salary_hour_avg BETWEEN 62.50001 AND 83.3334 THEN 'Standard'
        WHEN salary_hour_avg BETWEEN 83.3334 AND 114.5834 THEN 'High'
        WHEN salary_hour_avg BETWEEN 114.5834 AND 182.2917 THEN 'Very high'
        WHEN salary_hour_avg BETWEEN 182.2917 AND 500 THEN 'Sensational'
        WHEN salary_year_avg BETWEEN 1 AND 40000.128 THEN 'Extremely low'
        WHEN salary_year_avg BETWEEN 40000.1281 AND 55000.0128 THEN 'Very low'
        WHEN salary_year_avg BETWEEN 55001.01281 AND 75000 THEN ' Low'
        WHEN salary_year_avg BETWEEN 75000.1 AND 95000.0064 THEN 'Manageable'
        WHEN salary_year_avg BETWEEN 95000.00641 AND 120000 THEN 'Okay'
        WHEN salary_year_avg BETWEEN 120001 AND 160000.128 THEN 'Standard'
        WHEN salary_year_avg BETWEEN 160000.1281 AND 220000.128 THEN 'High'
        WHEN salary_year_avg BETWEEN 220000.128 AND 350000.064 THEN 'Very High'
        WHEN salary_year_avg BETWEEN 350000.064 AND 650000 THEN 'Sensational'
        ELSE 'No pay'
    END AS Salary_description,
    job_posted_date,
    job_country,
    job_location,
    job_schedule_type,
    job_health_insurance,
    job_via
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' 
ORDER BY ((COALESCE(salary_hour_avg, 0) * 1920) + COALESCE(salary_year_avg, 0))
;


DROP TABLE main_query_wow;

SELECT *
FROM main_query_wow
LIMIT 10000;

SELECT
    salary_description,
    COUNT(job_id) AS job_count,
    AVG(total_salary) AS avg_salary,
    MAX(salary_hour_avg) AS max_salary_per_hour,
    MIN(salary_hour_avg) AS min_salary_per_hour,
    MAX(salary_year_avg) AS max_salary_per_year,
    MIN(salary_year_avg) AS min_salary_per_year
FROM main_query_wow
GROUP BY salary_description
ORDER BY avg_salary
