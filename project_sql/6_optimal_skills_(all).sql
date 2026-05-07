/* Question: What are the most optimal skills to learn (high demand & high paying skills)
- Identify skills with high demand associated with high average salaries for Data Analyst roles
- Concentrate on remote positions with specified salaries
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analysis*/;

-- This query does not filter for health insurance (includes both with and without)

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
GROUP BY
    skills.skill_id
HAVING
    COUNT(*) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25; 
