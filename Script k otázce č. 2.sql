Otázka č. 2
Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období 
v dostupných datech cen a mezd?

návod:
- které tabulky jsou potřeba - primary_final,
- Kde najdu jaká DATA - všechno v primary_final,
- co je třeba spojit - nic,
- jaký výpočet je potřeba - kupní síla = plat/cena komodity,
- bude nebo nebude filtr na datum - ne,
- seskupení - kategorie, rok, odvětví / zO, co není ve funkci,
- seřazení - dle roku.

kometář:
- do selectu půjde food_category, payroll_year, industry,
- průměrná cena, průměrný plat, vypočítaná kupní síla,
- původní tabulku t_kupni_sila_chleb_mleko jsem odstranila a nahradila, 
- vytvořila jsem novou tabulku t_kupni_sila_chleb_mleko_bez_rozliseni.

kód:

CREATE TABLE t_kupni_sila_chleb_mleko AS
SELECT
food_category,
round (avg (price)) AS average_price, 
payroll_year AS "year",
industry,
round (avg (average_wages))AS average_payroll,
round (avg (average_wages)/ avg (price)) AS kupni_sila
FROM t_jana_sindelkova_project_sql_primary_final
WHERE payroll_year IN ('2006','2018')
AND food_category IN('Chléb konzumní kmínový','Mléko polotučné pasterované')
GROUP BY food_category, payroll_year, industry
ORDER BY payroll_year;

DROP TABLE IF exists t_kupni_sila_chleb_mleko;

upravený kód - bez dělení na odvětví :

CREATE TABLE t_kupni_sila_chleb_mleko_bez_rozliseni AS
SELECT
food_category,
round (avg (price)) AS average_price, 
payroll_year AS "year",
round (avg (average_wages))AS average_payroll,
round (avg (average_wages)/ avg (price)) AS kupni_sila
FROM t_jana_sindelkova_project_sql_primary_final
WHERE payroll_year IN ('2006','2018')
AND food_category IN('Chléb konzumní kmínový','Mléko polotučné pasterované')
GROUP BY food_category, payroll_year
ORDER BY payroll_year;
