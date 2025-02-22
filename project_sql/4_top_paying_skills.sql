/*
Answer: What are the top based on salary?
    - Look at average salary associated with each skill for Data Analyst positions
    - Focuses on roles specified salaries, regardless of location
    - Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financialy rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_sallary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_sallary DESC
LIMIT 25