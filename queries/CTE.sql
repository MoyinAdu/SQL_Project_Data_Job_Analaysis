/* CTE's
Scanario: Find the companies with the most job openings 
    - Get the total number of job postings per company id (job_postings_fact)
    - Return the total number of jobs with company name (company_dim) */
;

WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
    )

SELECT
    companies.name AS company_name,
    CJC.total_jobs
FROM company_dim AS companies
LEFT JOIN company_job_count AS CJC ON CJC.company_id = companies.company_id
ORDER BY total_jobs DESC
LIMIT 1000;
