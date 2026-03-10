SELECT *
FROM skills_dim
limit 10;

SELECT *
FROM skills_job_dim
limit 10;



SELECT 
    skill_id,
    COUNT(job_id) AS job_count
FROM skills_job_dim
GROUP BY skill_id
ORDER BY job_count DESC
LIMIT 5;

SELECT
    skill_id,
    skills,
    job_count
FROM skills_dim AS ski
LEFT JOIN temu AS (
    SELECT 
        skill_id,
        COUNT(job_id) AS job_count
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
    ORDER BY 
        job_count DESC
) ON temu.skill_id = ski.skill_id;
--





SELECT
    temu.skill_id,
    ski.skills,
    temu.job_count
FROM temu AS (--subquery starts
    SELECT 
        skill_id,
        COUNT(job_id) AS job_count
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
    ORDER BY 
        job_count DESC
    ) --subquery ends
LEFT JOIN skills_dim AS ski ON  ski.skill_id = temu.skill_id
-- FAILED

SELECT
    skill_id,
    skills,
    job_count
FROM (--subquery starts
    SELECT 
        skill_id,
        COUNT(job_id) AS job_count
    FROM 
        skills_job_dim AS skj
    LEFT JOIN 
        skills_dim AS ski ON  ski.skill_id = skj.skill_id
    GROUP BY 
        skill_id
    ORDER BY 
        job_count DESC
    ) --subquery ends