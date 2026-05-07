/* Question: What are the top skills based on salary for Data Analyst 
- Find the annual salary, hourly salary and skill skill_demand
- Focus on remote job postings with health insurance
- Why? It provieds insight into the top 5 highest paying skills and their demand
       It reveals how different skills impact salary levels for Data Analysts and helps identify the most financial rewarding skills to acquire or improves
*/

-- top 25 highest yearly-paying Data Analyst skills
SELECT
    skills AS skill_name,
    ROUND(AVG(salary_year_avg), 2) AS avg_annual_salary
FROM skills_job_dim AS SJD
INNER JOIN job_postings_fact AS JPC ON JPC.job_id = SJD.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = SJD.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home IS TRUE
    AND job_health_insurance IS TRUE
GROUP BY
    skill_name
ORDER BY
    avg_annual_salary DESC
LIMIT 25;


-- top 25 highest hourly-paying Data Analyst skills
SELECT
    skills AS skill_name,
    ROUND(AVG(salary_hour_avg), 2) AS avg_hourly_salary
FROM skills_job_dim AS SJD
INNER JOIN job_postings_fact AS JPC ON JPC.job_id = SJD.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = SJD.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_hour_avg IS NOT NULL
    AND job_work_from_home IS TRUE
    AND job_health_insurance IS TRUE
GROUP BY
    skill_name
ORDER BY
    avg_hourly_salary DESC
LIMIT 25;