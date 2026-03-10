-- query to determine the size range of companies by their no of job postings
--using subquery
SELECT
    companies.company_id,
    companies.name AS company_name,
    temp_table.job_count,
    CASE
    WHEN job_count < 10 THEN 'Small'
    WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
    WHEN job_count >50 THEN 'Large'
    ELSE 'No job post'
    END AS company_size
FROM 
    company_dim AS companies
LEFT JOIN (
    SELECT
        company_id,
        COUNT(job_id) AS job_count
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
    ) AS temp_table ON temp_table.company_id = companies.company_id
ORDER BY job_count
LIMIT 100000;

--using CTE to display the result in group function
WITH temp_table_1 AS (
    SELECT
        companies.company_id,
        companies.name AS company_name,
        temp_table.job_count,
        CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        WHEN job_count >50 THEN 'Large'
        ELSE 'No job post'
        END AS company_size
    FROM 
        company_dim AS companies
    LEFT JOIN (
        SELECT
            company_id,
            COUNT(job_id) AS job_count
        FROM 
            job_postings_fact
        GROUP BY 
            company_id
        ) AS temp_table ON temp_table.company_id = companies.company_id
    )   

SELECT
    company_size,
    COUNT(company_name) AS company_count,
    COUNT(job_count) AS jobs_count
FROM
    temp_table_1
GROUP BY
    company_size
ORDER BY
    jobs_count DESC;