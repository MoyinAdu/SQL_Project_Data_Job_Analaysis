UNION ALL Practice Question 1 BETTER VERSION
Get the corresponding skill and skill type for each job posting in q1
    - Include those without skills
    - Why? Look at the skill and type for each job in..
      ...the first quarter that has a salary > $75,000;

SELECT
    first_quarter.job_id,
    job_title_short,
    skill_name,
    skill_type,
    job_posted_date::DATE,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS first_quarter
LEFT JOIN (
    SELECT
        job_id,
        skills AS skill_name,
        type AS skill_type
    FROM skills_job_dim AS skills_to_job
    LEFT JOIN skills_dim AS skills ON skills.skill_id = skills_to_job.skill_id
) AS tabless ON tabless.job_id = first_quarter.job_id
WHERE
    salary_year_avg > 70000 AND job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DEsc
;


