/* Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill id, name, and count Of postings requring that skill
*/;

SELECT 
    skills_dim.skill_id AS skill_id,
    skills_dim.skills AS skill_name,
    sjc.job_count AS job_count
FROM skills_dim
INNER JOIN (
    SELECT 
        sjd.skill_id AS skill_id,
        COUNT(sjd.job_id) AS job_count
    FROM 
        skills_job_dim AS sjd
    LEFT JOIN 
        job_postings_fact AS jpf ON jpf.job_id = sjd.job_id
    WHERE 
        job_work_from_home IS TRUE AND job_title_short = 'Data Analyst'
    GROUP BY 
        skill_id
) AS sjc ON sjc.skill_id = skills_dim.skill_id
ORDER BY job_count DESC
LIMIT 5;
