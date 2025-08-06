Otázka č. 3
Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 

návod:
- které tabulky jsou potřeba - primary_final,
- kde najdu jaká data - všechno v primary_final,
- co je třeba spojit - nic,
- jaký výpočet je potřeba - výpočet podílu ceny v roce T a v roce T-1,
- bude nebo nebude filtr na datum,
- seskupení - kategorie, rok, / tO, co není ve funkci,
- tvorba VIEW - ano, z toho budu dále počítat. 

komentář:
Co se vlastně zobrazuje v selectu
- food_category, rok, cena
- agregační funkce - průměrná cena v roce
- výpočet inflace cena v roce T/cena v roce T-1 * 100, v procentech, toto bude na okýnkové funkce,
- vytvořím tabulku, kde bude výpočet vývoje cenové hladiny.


kód:
CREATE VIEW v_vyvoj_cen AS (
SELECT 
food_category,
round (avg(price):: NUMERIC, 2) AS average_price,
payroll_year AS rok
FROM t_jana_sindelkova_project_sql_primary_final
GROUP BY food_category, payroll_year);

CREATE TABLE t_vyvoj_cen AS (
SELECT 
food_category,
average_price,
LAG (average_price) OVER (PARTITION BY food_category ORDER BY rok)AS price_year_ago,
rok
FROM v_vyvoj_cen);

CREATE TABLE t_inflace AS (
SELECT 
food_category,
average_price,
round (average_price/price_year_ago*100) AS mezirocni_porovnani_cen,
rok
FROM t_vyvoj_cen
WHERE price_year_ago IS NOT NULL);

SELECT 
food_category,
rok,
mezirocni_porovnani_cen
FROM t_inflace 
WHERE mezirocni_porovnani_cen < 80
OR mezirocni_porovnani_cen > 110
ORDER BY rok ASC, mezirocni_porovnani_cen ASC;

Otázka č. 4
Existuje rok, ve kterém byl meziroční nárůst cen potravin 
výrazně vyšší než růst mezd (větší než 10 %)?

SELECT 
food_category,
rok,
mezirocni_porovnani_cen,
CASE 
	WHEN mezirocni_porovnani_cen >= 110 AND mezirocni_porovnani_cen < 120 THEN '2'
	WHEN mezirocni_porovnani_cen >= 120 AND mezirocni_porovnani_cen < 130 THEN '3'
	WHEN mezirocni_porovnani_cen >= 130 AND mezirocni_porovnani_cen <140 THEN '4'
	WHEN mezirocni_porovnani_cen >= 140 AND mezirocni_porovnani_cen <150 THEN '5'
	WHEN mezirocni_porovnani_cen >= 150 AND mezirocni_porovnani_cen <160 THEN '6'
	WHEN mezirocni_porovnani_cen >= 160 AND mezirocni_porovnani_cen <170 THEN '7'
	WHEN mezirocni_porovnani_cen >= 170 AND mezirocni_porovnani_cen <180 THEN '8'
	WHEN mezirocni_porovnani_cen >= 180 AND mezirocni_porovnani_cen <190 THEN '9'
	ELSE 'mimo interval'
END AS stupen_inflace
FROM t_inflace
ORDER BY food_category,rok, stupen_inflace;