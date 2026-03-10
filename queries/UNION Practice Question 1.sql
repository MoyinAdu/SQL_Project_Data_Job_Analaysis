UNION Practice Question 1
Get the corresponding skill and skill type for each job posting in q1
    - Include those without skills
    - Why? Look at the skill and type for each job in..
      ...the first quarter that has a salary > $75,000;

-- Get the job postings of january
SELECT
    JJ.job_id,
    job_title_short,
    skill_name,
    skill_type,
    job_posted_date,
    job_work_from_home,
    job_location,
    salary_year_avg
FROM january_jobs AS JJ 
LEFT JOIN (
    SELECT
        job_id,
        skills AS skill_name,
        type AS skill_type
    FROM
        skills_job_dim AS skills_to_job
    LEFT JOIN
        skills_dim  AS skills ON skills.skill_id = skills_to_job.skill_id
    ) AS job_skills ON job_skills.job_id = JJ.job_id
WHERE 
    salary_year_avg > 75000

UNION -- combines tables above and below, doesn't allows duplicate

-- Get the job postings of february
SELECT
    FJ.job_id,
    job_title_short,
    skill_name,
    skill_type,
    job_posted_date,
    job_work_from_home,
    job_location,
    salary_year_avg
FROM february_jobs AS FJ 
LEFT JOIN (
    SELECT
        job_id,
        skills AS skill_name,
        type AS skill_type
    FROM
        skills_job_dim AS skills_to_job
    LEFT JOIN
        skills_dim  AS skills ON skills.skill_id = skills_to_job.skill_id
    ) AS job_skills ON job_skills.job_id = FJ.job_id
WHERE 
    salary_year_avg > 75000

UNION -- combines tables above and below, doesn't allows duplicate

-- Get the job postings of march
SELECT
    MJ.job_id,
    job_title_short,
    skill_name,
    skill_type,
    job_posted_date,
    job_work_from_home,
    job_location,
    salary_year_avg
FROM march_jobs AS MJ 
LEFT JOIN (
    SELECT
        job_id,
        skills AS skill_name,
        type AS skill_type
    FROM
        skills_job_dim AS skills_to_job
    LEFT JOIN
        skills_dim  AS skills ON skills.skill_id = skills_to_job.skill_id
    ) AS job_skills ON job_skills.job_id = MJ.job_id
WHERE 
    salary_year_avg > 75000
ORDER BY skill_name ASC
