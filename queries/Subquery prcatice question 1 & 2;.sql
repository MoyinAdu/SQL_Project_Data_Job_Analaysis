Subquery prcatice question 1 & 2;

SELECT -- start of practice question 1 (subquery)
    temu.skill_id,
    ski.skills,
    temu.job_count
FROM 
    skills_dim AS ski
LEFT JOIN 
    (
        SELECT 
            skill_id,
            COUNT(job_id) AS job_count
        FROM 
            skills_job_dim
        GROUP BY 
            skill_id
        ORDER BY 
            job_count DESC
    ) AS temu ON temu.skill_id = ski.skill_id
ORDER BY 
    temu.job_count DESC
 LIMIT 5 -- end of practice question 1
;


SELECT -- start of practice question 2 (subquery)
    temp_table.company_id,
    companies.name AS company_name,
    temp_table.job_count,
    CASE
            WHEN temp_table.job_count < 10 THEN 'Small'
            WHEN temp_table.job_count BETWEEN 10 AND 50 THEN 'Medium'
            WHEN temp_table.job_count > 50 THEN 'Large'
    END AS company_size
FROM 
    company_dim AS companies
LEFT JOIN 
    (
        SELECT 
            company_id,
            COUNT(job_id) AS job_count
        FROM 
            job_postings_fact 
        GROUP BY
            company_id
    ) AS temp_table ON temp_table.company_id = companies.company_id
ORDER BY 
    temp_table.job_count
LIMIT 100000 -- end of practice question 2
;

WITH temp_table2 AS ( -- CTE for displaying practice question2
    SELECT 
    temp_table.company_id AS company_id,
    companies.name AS company_name,
    temp_table.job_count AS job_count,
    CASE
            WHEN temp_table.job_count < 10 THEN 'Small'
            WHEN temp_table.job_count BETWEEN 10 AND 50 THEN 'Medium'
            WHEN temp_table.job_count > 50 THEN 'Large'
    END AS company_size
FROM 
    company_dim AS companies
LEFT JOIN 
    (
        SELECT 
            company_id,
            COUNT(job_id) AS job_count
        FROM 
            job_postings_fact 
        GROUP BY
            company_id
    ) AS temp_table ON temp_table.company_id = companies.company_id
ORDER BY 
    temp_table.job_count
)

SELECT
    company_size,
    COUNT(job_count) AS job_count,
    COUNT(company_name)
FROM 
    temp_table2
GROUP BY
    company_size;