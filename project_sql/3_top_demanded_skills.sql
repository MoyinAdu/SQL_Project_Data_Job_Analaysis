/*
Question: What are the most in-demand skills for Data Analysts
- Join job_postings_fact to inner join similar to query 2
- Identify the top 5 in-demand skills for a data analyst
- 
- Focus on remote job postings with health insurance
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers
*/

SELECT
    skills,
    COUNT(*) AS skill_demand
FROM job_postings_fact AS JPC
INNER JOIN skills_job_dim AS SJD ON SJD.job_id = JPC.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = SJD.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home IS TRUE
    AND job_health_insurance IS TRUE
GROUP BY
    skills
ORDER BY
    skill_demand DESC
LIMIT 5;

-- COUNT(SJD.job_id) and COUNT(JPC.job_id) also work perfectly when used in place of COUNT(*)

