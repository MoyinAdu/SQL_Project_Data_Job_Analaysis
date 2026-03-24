/*
Question: What are the skills required for these top-paying roles?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Find the specific skill names and types for the top ten paying jobs
- requires LEFT JOIN
- Why? It provides a detailed look at which high-paying jobs demand certain skills
*/
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg AS annual_salary,
        name AS company
    FROM
        job_postings_fact AS JPC
    LEFT JOIN
        company_dim AS companies ON companies.company_id = JPC.company_id
    WHERE
        job_work_from_home IS TRUE
        AND job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*, -- for all the columns in the table before the '.'
    skills AS skills_name,
    type AS skills_type
FROM top_paying_jobs
INNER JOIN skills_job_dim AS SJD ON SJD.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = SJD.skill_id
ORDER BY
    annual_salary DESC;


/* RESULT FOR LATER
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "sql",
    "skills_type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "python",
    "skills_type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "r",
    "skills_type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "azure",
    "skills_type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "databricks",
    "skills_type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "aws",
    "skills_type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "pandas",
    "skills_type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "pyspark",
    "skills_type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "jupyter",
    "skills_type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "excel",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "tableau",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "power bi",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "company": "AT&T",
    "skills_name": "powerpoint",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "company": "Pinterest Job Advertisements",
    "skills_name": "sql",
    "skills_type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "company": "Pinterest Job Advertisements",
    "skills_name": "python",
    "skills_type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "company": "Pinterest Job Advertisements",
    "skills_name": "r",
    "skills_type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "company": "Pinterest Job Advertisements",
    "skills_name": "hadoop",
    "skills_type": "libraries"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "company": "Pinterest Job Advertisements",
    "skills_name": "tableau",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "company": "Uclahealthcareers",
    "skills_name": "sql",
    "skills_type": "programming"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "company": "Uclahealthcareers",
    "skills_name": "crystal",
    "skills_type": "programming"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "company": "Uclahealthcareers",
    "skills_name": "oracle",
    "skills_type": "cloud"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "company": "Uclahealthcareers",
    "skills_name": "tableau",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "company": "Uclahealthcareers",
    "skills_name": "flow",
    "skills_type": "other"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "sql",
    "skills_type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "python",
    "skills_type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "go",
    "skills_type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "snowflake",
    "skills_type": "cloud"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "pandas",
    "skills_type": "libraries"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "numpy",
    "skills_type": "libraries"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "excel",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "tableau",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "company": "SmartAsset",
    "skills_name": "gitlab",
    "skills_type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "sql",
    "skills_type": "programming"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "python",
    "skills_type": "programming"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "azure",
    "skills_type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "aws",
    "skills_type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "oracle",
    "skills_type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "snowflake",
    "skills_type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "tableau",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "power bi",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "sap",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "jenkins",
    "skills_type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "bitbucket",
    "skills_type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "atlassian",
    "skills_type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "jira",
    "skills_type": "async"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "company": "Inclusively",
    "skills_name": "confluence",
    "skills_type": "async"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "company": "Motional",
    "skills_name": "sql",
    "skills_type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "company": "Motional",
    "skills_name": "python",
    "skills_type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "company": "Motional",
    "skills_name": "r",
    "skills_type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "company": "Motional",
    "skills_name": "git",
    "skills_type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "company": "Motional",
    "skills_name": "bitbucket",
    "skills_type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "company": "Motional",
    "skills_name": "atlassian",
    "skills_type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "company": "Motional",
    "skills_name": "jira",
    "skills_type": "async"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "company": "Motional",
    "skills_name": "confluence",
    "skills_type": "async"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "sql",
    "skills_type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "python",
    "skills_type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "go",
    "skills_type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "snowflake",
    "skills_type": "cloud"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "pandas",
    "skills_type": "libraries"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "numpy",
    "skills_type": "libraries"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "excel",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "tableau",
    "skills_type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "company": "SmartAsset",
    "skills_name": "gitlab",
    "skills_type": "other"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "annual_salary": "184000.0",
    "company": "Get It Recruit - Information Technology",
    "skills_name": "sql",
    "skills_type": "programming"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "annual_salary": "184000.0",
    "company": "Get It Recruit - Information Technology",
    "skills_name": "python",
    "skills_type": "programming"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "annual_salary": "184000.0",
    "company": "Get It Recruit - Information Technology",
    "skills_name": "r",
    "skills_type": "programming"
  }
]
*/