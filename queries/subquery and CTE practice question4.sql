-- query for the top 5 skills in terms of jobs demand (subquery)
SELECT
    skills_dim.skill_id AS skill_id,
    skills_dim.skills AS skill_name,
    jctb.job_count AS job_count
FROM 
    skills_dim
LEFT JOIN 
    (
        SELECT 
            skill_id,
            COUNT(job_id) AS job_count
        FROM 
            skills_job_dim
        GROUP BY 
            skill_id
    ) AS jctb ON jctb.skill_id = skills_dim.skill_id
WHERE jctb.skill_id IS NULL OR jctb.job_count IS NULL
ORDER BY job_count DESC
LIMIT 1000;


WITH jctb AS ( -- query for the top 5 skills in terms of jobs demand (CTE)
    SELECT 
        skill_id,
        COUNT(job_id) AS job_count
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
)

SELECT
    jctb.skill_id,
    skills_dim.skills AS skill_name,
    jctb.job_count
FROM 
    skills_dim
LEFT JOIN jctb ON jctb.skill_id = skills_dim.skill_id
ORDER BY job_count DESC
LIMIT 5;

