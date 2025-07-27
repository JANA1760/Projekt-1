Spojte informace z tabulek cen a mezd 
 (pouze informace o průměrných mzdách). 
 Vypište z každé z nich základní informace, 
 celé názvy odvětví a kategorií potravin a 
 datumy měření, které vhodně naformátujete.
 
 CREATE TABLE t_jana_sindelkova_project_sql_primary_final AS  
 SELECT
    cpc.name AS food_category,
    cp.value AS price,
    cpib.name AS industry,
    cpay.value AS average_wages,
    TO_CHAR(cp.date_from, 'DD. Month YYYY') AS price_measured_from,
    TO_CHAR(cp.date_to, 'DD.MM.YYYY') AS price_measured_to,
    cpay.payroll_year
FROM
    czechia_price AS cp
JOIN czechia_payroll AS cpay
    ON date_part('year', cp.date_from) = cpay.payroll_year
    AND cpay.value_type_code = 5958    
    AND cp.region_code IS NULL
JOIN czechia_price_category AS cpc
    ON cp.category_code = cpc.code
JOIN czechia_payroll_industry_branch AS cpib    
    ON cpay.industry_branch_code = cpib.code;
 