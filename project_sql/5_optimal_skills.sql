/*
 What are the most optimal skills to learn for Data Analyst roles?
    -Optimal = HIGH paying AND HIGH demand
    -Identifying skills in high-demand and associate them skills with high avg salary for Data Analyst roles
    -Why? Finding skill that offers job security(High-Demand) and Financially beneficial(High paying),
     offering strategic insights in career development in Data Analysis
*/

-- Query 3: High demand skills
WITH skills_demand AS (
    SELECT 
        s.skill_id,
        s.skills,
        COUNT(j.job_id) AS demand_count
    FROM
        job_postings_fact j
    INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
    INNER JOIN skills_dim s ON s.skill_id = sj.skill_id
    WHERE
        job_title_short = 'Data Analyst'
    GROUP BY 
        s.skill_id,s.skills
),
-- Query 4: High salary skills
skills_avg_salary AS (
    SELECT
        s.skill_id,
        s.skills,
        ROUND(AVG(salary_year_avg),2) AS avg_salary
    FROM
        job_postings_fact j
    INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
    INNER JOIN skills_dim s ON s.skill_id = sj.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY 
        s.skill_id,s.skills
)


SELECT
    sas.skill_id,
    sas.skills,
    demand_count,
    avg_salary,
    ROUND(sd.demand_count * 1.0 / MAX(sd.demand_count) OVER () * 
    sas.avg_salary * 1.0 / MAX(sas.avg_salary) OVER (),4) AS normalization
FROM skills_demand sd
INNER JOIN skills_avg_salary sas ON sd.skill_id = sas.skill_id
WHERE demand_count > 4500
ORDER BY
    normalization DESC