Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli,
pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách 
ve stejném nebo následujícím roce výraznějším růstem?

SELECT
country,
population,
year,
gdp,
gini,
round (gdp/population)AS gdp_head,
taxes,
median_age_2018
FROM t_jana_sindelkova_project_sql_secondary_final tjspssf
WHERE country IN ('Albania','Greece','Germany','Spain','Austria',
'Slovakia', 'Italy', 'Norway', 'Bulgaria','Serbia', 'Slovenia')
AND YEAR IN ('2011','2012','2013','2014', '2015','2016','2017','2018', '2019', '2020');