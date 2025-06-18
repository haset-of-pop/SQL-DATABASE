/*
Question: What are the top-paying data analyst jobs?
- Identify the top 100 highest-paying Data Analyst roles that are available remotely or in India.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment trends.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    name AS company_name,
    salary_year_avg,
    job_posted_date::DATE
FROM
    job_postings_fact j
LEFT JOIN company_dim c ON c.company_id = j.company_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    (job_location = 'Anywhere' OR 
    job_location LIKE '%India%')
ORDER BY salary_year_avg DESC
LIMIT 10