/*
 What are the skills required for this top-paying Data Analyst jobs?
 -Why? It provides a detailed look at skills that hig-paying companies demand,
 Helps job seekers understand which skills to develop that align with top salaries in their domain
 */


WITH jobs_with_skills AS (
    SELECT job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM job_postings_fact j
        LEFT JOIN company_dim c ON c.company_id = j.company_id
    WHERE salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
        AND (
            job_location = 'Anywhere'
            OR j.job_location LIKE '%India%'
        )
        AND j.job_id IN (
            SELECT DISTINCT job_id
            FROM skills_job_dim
        )
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT jws.*,
    s.skills
FROM jobs_with_skills jws
INNER JOIN skills_job_dim sj ON jws.job_id = sj.job_id
INNER JOIN skills_dim s ON s.skill_id = sj.skill_id
ORDER BY jws.salary_year_avg DESC;
/*
 Key Insights
 Core Skills:
 SQL (9/10) and Python (8/10) are nearly universal — they are the foundational skills for top-paying roles.
 Tableau (6/10) confirms the importance of strong data visualization skills.
 R and Excel are solid supporting skills — not as mandatory as SQL/Python, but still valuable.
 
 Cloud & Big Data:
 Snowflake, Azure, AWS show cloud-based data engineering is common.
 Databricks, Hadoop, Pyspark — though less frequent — 
 suggest that knowledge of big data platforms adds value.
 
 Programming Variety:
 Interesting to see Go (3) and Java (1) — 
 indicates that in some advanced roles, general-purpose programming can complement analytics.
 
 Collaboration & DevOps:
 Tools like GitLab, Bitbucket, Jira, Confluence, Jenkins appear —
 employers want analysts to collaborate well and be comfortable with version control & agile workflows.
 
 
 
 Resluts:
 
 [
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "sql"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "python"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "r"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "azure"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "databricks"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "aws"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "pandas"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "pyspark"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "jupyter"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "excel"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "tableau"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "power bi"
 },
 {
 "job_id": 552322,
 "job_title": "Associate Director- Data Insights",
 "company_name": "AT&T",
 "salary_year_avg": "255829.5",
 "skills": "powerpoint"
 },
 {
 "job_id": 99305,
 "job_title": "Data Analyst, Marketing",
 "company_name": "Pinterest Job Advertisements",
 "salary_year_avg": "232423.0",
 "skills": "sql"
 },
 {
 "job_id": 99305,
 "job_title": "Data Analyst, Marketing",
 "company_name": "Pinterest Job Advertisements",
 "salary_year_avg": "232423.0",
 "skills": "python"
 },
 {
 "job_id": 99305,
 "job_title": "Data Analyst, Marketing",
 "company_name": "Pinterest Job Advertisements",
 "salary_year_avg": "232423.0",
 "skills": "r"
 },
 {
 "job_id": 99305,
 "job_title": "Data Analyst, Marketing",
 "company_name": "Pinterest Job Advertisements",
 "salary_year_avg": "232423.0",
 "skills": "hadoop"
 },
 {
 "job_id": 99305,
 "job_title": "Data Analyst, Marketing",
 "company_name": "Pinterest Job Advertisements",
 "salary_year_avg": "232423.0",
 "skills": "tableau"
 },
 {
 "job_id": 1021647,
 "job_title": "Data Analyst (Hybrid/Remote)",
 "company_name": "Uclahealthcareers",
 "salary_year_avg": "217000.0",
 "skills": "sql"
 },
 {
 "job_id": 1021647,
 "job_title": "Data Analyst (Hybrid/Remote)",
 "company_name": "Uclahealthcareers",
 "salary_year_avg": "217000.0",
 "skills": "crystal"
 },
 {
 "job_id": 1021647,
 "job_title": "Data Analyst (Hybrid/Remote)",
 "company_name": "Uclahealthcareers",
 "salary_year_avg": "217000.0",
 "skills": "oracle"
 },
 {
 "job_id": 1021647,
 "job_title": "Data Analyst (Hybrid/Remote)",
 "company_name": "Uclahealthcareers",
 "salary_year_avg": "217000.0",
 "skills": "tableau"
 },
 {
 "job_id": 1021647,
 "job_title": "Data Analyst (Hybrid/Remote)",
 "company_name": "Uclahealthcareers",
 "salary_year_avg": "217000.0",
 "skills": "flow"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "sql"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "python"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "go"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "snowflake"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "pandas"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "numpy"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "excel"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "tableau"
 },
 {
 "job_id": 168310,
 "job_title": "Principal Data Analyst (Remote)",
 "company_name": "SmartAsset",
 "salary_year_avg": "205000.0",
 "skills": "gitlab"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "sql"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "python"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "azure"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "aws"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "oracle"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "snowflake"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "tableau"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "power bi"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "sap"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "jenkins"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "bitbucket"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "atlassian"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "jira"
 },
 {
 "job_id": 731368,
 "job_title": "Director, Data Analyst - HYBRID",
 "company_name": "Inclusively",
 "salary_year_avg": "189309.0",
 "skills": "confluence"
 },
 {
 "job_id": 310660,
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "company_name": "Motional",
 "salary_year_avg": "189000.0",
 "skills": "sql"
 },
 {
 "job_id": 310660,
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "company_name": "Motional",
 "salary_year_avg": "189000.0",
 "skills": "python"
 },
 {
 "job_id": 310660,
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "company_name": "Motional",
 "salary_year_avg": "189000.0",
 "skills": "r"
 },
 {
 "job_id": 310660,
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "company_name": "Motional",
 "salary_year_avg": "189000.0",
 "skills": "git"
 },
 {
 "job_id": 310660,
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "company_name": "Motional",
 "salary_year_avg": "189000.0",
 "skills": "bitbucket"
 },
 {
 "job_id": 310660,
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "company_name": "Motional",
 "salary_year_avg": "189000.0",
 "skills": "atlassian"
 },
 {
 "job_id": 310660,
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "company_name": "Motional",
 "salary_year_avg": "189000.0",
 "skills": "jira"
 },
 {
 "job_id": 310660,
 "job_title": "Principal Data Analyst, AV Performance Analysis",
 "company_name": "Motional",
 "salary_year_avg": "189000.0",
 "skills": "confluence"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "sql"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "python"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "go"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "snowflake"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "pandas"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "numpy"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "excel"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "tableau"
 },
 {
 "job_id": 1749593,
 "job_title": "Principal Data Analyst",
 "company_name": "SmartAsset",
 "salary_year_avg": "186000.0",
 "skills": "gitlab"
 },
 {
 "job_id": 387860,
 "job_title": "ERM Data Analyst",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "184000.0",
 "skills": "sql"
 },
 {
 "job_id": 387860,
 "job_title": "ERM Data Analyst",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "184000.0",
 "skills": "python"
 },
 {
 "job_id": 387860,
 "job_title": "ERM Data Analyst",
 "company_name": "Get It Recruit - Information Technology",
 "salary_year_avg": "184000.0",
 "skills": "r"
 },
 {
 "job_id": 1781684,
 "job_title": "DTCC Data Analyst",
 "company_name": "Robert Half",
 "salary_year_avg": "170000.0",
 "skills": "java"
 },
 {
 "job_id": 1781684,
 "job_title": "DTCC Data Analyst",
 "company_name": "Robert Half",
 "salary_year_avg": "170000.0",
 "skills": "go"
 },
 {
 "job_id": 1781684,
 "job_title": "DTCC Data Analyst",
 "company_name": "Robert Half",
 "salary_year_avg": "170000.0",
 "skills": "excel"
 },
 {
 "job_id": 987523,
 "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
 "company_name": "Kelly Science, Engineering, Technology & Telecom",
 "salary_year_avg": "170000.0",
 "skills": "sql"
 },
 {
 "job_id": 987523,
 "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
 "company_name": "Kelly Science, Engineering, Technology & Telecom",
 "salary_year_avg": "170000.0",
 "skills": "python"
 },
 {
 "job_id": 987523,
 "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
 "company_name": "Kelly Science, Engineering, Technology & Telecom",
 "salary_year_avg": "170000.0",
 "skills": "azure"
 },
 {
 "job_id": 987523,
 "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
 "company_name": "Kelly Science, Engineering, Technology & Telecom",
 "salary_year_avg": "170000.0",
 "skills": "databricks"
 },
 {
 "job_id": 987523,
 "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
 "company_name": "Kelly Science, Engineering, Technology & Telecom",
 "salary_year_avg": "170000.0",
 "skills": "power bi"
 }
 ]
 */