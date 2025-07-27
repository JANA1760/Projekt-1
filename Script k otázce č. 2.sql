Otázka č. 2

Kolik je možné si koupit litrů mléka a kilogramů     
chleba za první a poslední srovnatelné období 
v dostupných datech cen a mezd?
 - za první srovnatelné odbobí - první rok
 - za poslední srovnatelné období - poslední rok
 - komodity - Mléko polotučné pasterované, 
 Chléb konzumní kmínový

Postup:
Co se vlastně zobrazuje v selectu
- food_category, payroll_year, industry,
- průměrná cena, průměrný plat, vypočítaná kupní síla

Které tabulky jsou potřeba - primary_final
Kde najdu jaká DATA - všechno v primary_final
Co je třeba spojit - nic
Jaký výpočet je potřeba - kupní síla = plat/cena komodity
Bude nebo nebude filtr na datum - ne
Seskupení - kategorie, rok, odvětví / TO, co není ve funkci
Seřazení - dle roku

CREATE TABLE t_kupni_sila_chleb_mleko as
SELECT
food_category,
round (avg (price)) AS average_price, 
payroll_year AS "year",
industry,
round (avg (average_wages))AS average_payroll,
round (avg (average_wages)/ avg (price)) AS kupni_sila
FROM t_jana_sindelkova_project_sql_primary_final tjspspf
WHERE payroll_year IN ('2006','2018')
AND food_category IN('Chléb konzumní kmínový','Mléko polotučné pasterované')
GROUP BY food_category, payroll_year, industry
ORDER BY payroll_year;

