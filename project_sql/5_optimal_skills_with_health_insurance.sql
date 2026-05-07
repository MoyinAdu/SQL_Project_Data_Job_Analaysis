Question: What are the most optimal skills to learn (high demand & high paying skills)
- Identify skills with high demand associated with high average salaries for Data Analyst roles
- Concentrate on remote positions with specified salaries and health insuarance
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analysis;

-- Long version of the query. The short version below
WITH skills_demand AS ( 
    SELECT
        skills.skill_id,  -- we can combine the two CTEs with the main query using 'skills' but that's not best practice. usinf the keys(primary and foreign keys e.gkill_id, job_id etc) is much better
        skills.skills,
        COUNT(*) AS demand_count
    FROM job_postings_fact AS JPC
    INNER JOIN skills_job_dim AS SJD ON SJD.job_id = JPC.job_id
    INNER JOIN skills_dim AS skills ON skills.skill_id = SJD.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_work_from_home IS TRUE
        AND salary_year_avg IS NOT NULL
        AND job_health_insurance IS TRUE
    GROUP BY
        skills.skill_id
), average_salary AS ( -- anytime you use two CTEs you group them by using a comma ',' i.e WITH cte_1 AS (query_1),  cte_2 AS (query_2)
    SELECT
        SJD.skill_id,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM skills_job_dim AS SJD
    INNER JOIN job_postings_fact AS JPC ON JPC.job_id = SJD.job_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home IS TRUE
        AND job_health_insurance IS TRUE
    GROUP BY
        SJD.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
INNER JOIN average_salary ON average_salary.skill_id = skills_demand.skill_id
WHERE
    demand_count > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC -- you can order by two things. in case the two different skills have the demand_count it will order them by which of the two has the highest average_salary. Depending on the order of the order by
LIMIT
    25;


-- Short version of the query. Long version above
SELECT
    skills.skill_id,
    skills.skills,
    COUNT(*) AS demand_count, -- COUNT(SJD.job_id) and COUNT(JPC.job_id) also work perfectly when used in place of COUNT(*)
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact AS JPC
INNER JOIN skills_job_dim AS SJD ON SJD.job_id = JPC.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = SJD.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home IS TRUE
    AND job_health_insurance IS TRUE
GROUP BY
    skills.skill_id
HAVING
    COUNT(*) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25; 