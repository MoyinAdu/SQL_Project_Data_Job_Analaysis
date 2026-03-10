Subqueries and CTEs Class 1
This are ways to create temporary tables(result sets) and use them to solve queries.
- Subqueries for simply queries. In SELECT, FROM and WHERE clauses;
- CTEs for complex queries. can be done using 'WITH' statement in SELECT, INSERT and DELETE statements; 

-- Subqueries
SELECT *
FROM ( -- subquery starts here 
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS the_january_jobs -- subquery ends here
LIMIT 1000;


-- CTEs
WITH the_january_jobs AS ( -- CTE definition starts here
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here

SELECT *
FROM the_january_jobs
LIMIT 1000;

