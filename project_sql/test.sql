
SELECT
    skills AS skill_name,
    COUNT(*) AS skill_demand,
    AVG(salary_year_avg) AS avg_annual_salary
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


SELECT
    skills AS skill_name,
    COUNT(*) AS skill_demand,
    AVG(salary_hour_avg) AS avg_hourly_salary
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
