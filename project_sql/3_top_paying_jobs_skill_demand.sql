What are the most in-demand Data Analysts skills
- to get this i need to know the skills with the most rows on job_postings_fact
- condition: job_title_short is Data Analyst, location = 'Anywhere'
- I want only the top 5 skills
;

WITH job_skills AS (
SELECT
    skill_id,
    COUNT(*) AS job_count,
    AVG(salary_year_avg) AS average_annual_salary,
    AVG(salary_hour_avg) AS average_hourly_salary
FROM
    skills_job_dim
INNER JOIN
    job_postings_fact AS JPC ON JPC.job_id = skills_job_dim.job_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY
    skill_id
HAVING
    AVG(salary_year_avg) IS NOT NULL
    OR AVG(salary_hour_avg) IS NOT NULL
ORDER BY
    job_count DESC
)

SELECT
    job_skills.skill_id,
    skills AS skill_name,
    type AS skill_type,
    job_count,
    average_annual_salary,
    average_hourly_salary
FROM
    job_skills
INNER JOIN
    skills_dim ON skills_dim.skill_id = job_skills.skill_id
ORDER BY
    job_count DESC
LIMIT 5;
