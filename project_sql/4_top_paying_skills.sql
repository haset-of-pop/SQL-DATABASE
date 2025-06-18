/*
 What are the top skills based on salary for Data anlayst Jobs
    -Getting insight into average salary associated with each skill
    -Focusing on roles with specified salaries(IGNORE NULL),regardless of location
    -Why? It reveals how different skills impact on the salary of a Data analyst job profile
    and helps improve the most financially rewarding skill to acquire
*/
SELECT
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_per_skill
FROM
    job_postings_fact j
INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
INNER JOIN skills_dim s ON s.skill_id = sj.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    avg_per_skill DESC
LIMIT 25


/*
The highest paying skills for data analysts cluster into three main categories:

AI & ML Engineering: Deep learning frameworks and automated ML platforms.

Cloud Infrastructure & DevOps: Tools for automation, orchestration, and scalable infrastructure.

Modern Data & Backend Systems: High-performance databases, data pipelines, and blockchain-related tech.
*/