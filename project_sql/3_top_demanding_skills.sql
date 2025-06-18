 /*
  What are the most in-demand skills for Data analyst remote jobs
    -Join job postings to inner join table similar to query 2
    -Identify the top 5 in-demand skills for data analyst 
    -Focus on all job postings
    -Why? Retrives the top 5 skills with highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
 */

SELECT 
    skills,
    COUNT(j.job_id) AS demand_count
FROM
    job_postings_fact j
INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
INNER JOIN skills_dim s ON s.skill_id = sj.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    s.skills
ORDER BY 
    demand_count DESC
LIMIT 5
