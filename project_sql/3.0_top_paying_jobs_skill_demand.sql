What are the most in-demand Data Analysts skills
- to get this i need to know the skills with the most rows on job_postings_fact
- condition: job_title_short is Data Analyst, location = 'Anywhere', salary is not null
;

-- the query explains a decison in the comment below


SELECT
    skills AS skill_name,
    COUNT(*) AS job_count,
    AVG(salary_year_avg) AS avg_yearly_salary,
    AVG(salary_hour_avg) AS avg_hourly_salary
FROM skills_job_dim AS SJD
INNER JOIN 
    skills_dim AS skills ON skills.skill_id = SJD.skill_id
INNER JOIN 
    job_postings_fact AS JPC ON JPC.job_id = SJD.job_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY
    skill_name
HAVING
    (AVG(salary_year_avg) IS NOT NULL
    OR AVG(salary_hour_avg) IS NOT NULL)
ORDER BY
    job_count DESC;

SELECT
    skills AS skill_name,
    COUNT(*) AS job_count,
    AVG(salary_year_avg) AS avg_yearly_salary,
    AVG(salary_hour_avg) AS avg_hourly_salary
FROM skills_job_dim AS SJD
INNER JOIN 
    skills_dim AS skills ON skills.skill_id = SJD.skill_id
INNER JOIN 
    job_postings_fact AS JPC ON JPC.job_id = SJD.job_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY
    skill_name
HAVING
    (AVG(salary_year_avg) IS NOT NULL
    OR AVG(salary_hour_avg) IS NOT NULL)
ORDER BY
    job_count DESC
LIMIT 100000;

SELECT
    skills AS skill_name,
    COUNT(*) AS job_count,
    AVG(salary_year_avg) AS avg_yearly_salary,
    AVG(salary_hour_avg) AS avg_hourly_salary
FROM skills_job_dim AS SJD
INNER JOIN 
    skills_dim AS skills ON skills.skill_id = SJD.skill_id
INNER JOIN 
    job_postings_fact AS JPC ON JPC.job_id = SJD.job_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY
    skill_name
HAVING
    (AVG(salary_year_avg) IS NOT NULL
    OR AVG(salary_hour_avg) IS NOT NULL)
ORDER BY
    avg_hourly_salary DESC;

/* These queries work but with some limitations. 
Because the query is done in one go with CTES or subqueries,
skill_name(the GROUP BY) is the only non-aggregate we can show */

