Otázka č. 1
 Rostou v průběhu let mzdy ve všech odvětvích, 
nebo v některých klesají?

 - výpis z tabulky PRIMARY_final
 - seskupit dle odvětví a dle let
  - potřebuji jedno odvětví, a v průběhu let
 
 návod: 
 - co potřebuji vypsat,
 - z čeho,
 - seskupení, řazení;
 
VYtvořeno VIEW, vybráno - rok, odvětví, mzda

 CREATE VIEW v_mzdy_odvetvi AS 
 SELECT
 DISTINCT tprimary.payroll_year  AS rok,
 tprimary.industry AS odvetvi,
 tprimary.average_wages AS prumerna_mzda
 FROM t_jana_sindelkova_project_sql_primary_final AS tprimary
 GROUP BY industry, payroll_year, average_wages;

Z výše uvedené VIEW filtrujeme min, max, avg seskupíme, seřadíme a máme

SELECT 
 rok,
 odvetvi,
 min(prumerna_mzda),
 max(prumerna_mzda),
round (avg (prumerna_mzda))
FROM v_mzdy_odvetvi
GROUP BY odvetvi,rok
ORDER BY odvetvi ASC, rok asc;



 


 
 
 
 

 
 