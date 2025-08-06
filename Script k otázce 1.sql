Otázka č. 1
Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

návod: 
- co potřebuji vypsat,
- z čeho,
- seskupení, řazení.

komentář:
- vytvořeno VIEW, vybráno - rok, odvětví, mzda,
- z uvedeného VIEW filtrujeme min, max, avg seskupíme, seřadíme a máme.

kód:
CREATE VIEW v_mzdy_odvetvi AS 
SELECT
DISTINCT tprimary.payroll_year  AS rok,
tprimary.industry AS odvetvi,
tprimary.average_wages AS prumerna_mzda
FROM t_jana_sindelkova_project_sql_primary_final AS tprimary
GROUP BY industry, payroll_year, average_wages;

SELECT 
rok,
odvetvi,
min(prumerna_mzda) AS min_mzda,
max(prumerna_mzda) AS max_mzda,
round (avg (prumerna_mzda)) AS prumerna_mzda
FROM v_mzdy_odvetvi
GROUP BY odvetvi,rok
ORDER BY odvetvi ASC, rok ASC;