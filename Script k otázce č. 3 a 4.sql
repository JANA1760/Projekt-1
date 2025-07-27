Otázka č. 3

Která kategorie potravin zdražuje nejpomaleji 
(je u ní nejnižší percentuální meziroční nárůst)? 

Postup:
Co se vlastně zobrazuje v selectu
- food_category, rok, cena
- agregační funkce - průměrná cena v roce
- výpočet inflace cena v roce T/cena v roce T-1 * 100, 
v procentech, toto bude na okýnkové funkce

Které tabulky jsou potřeba - primary_final
Kde najdu jaká DATA - všechno v primary_final
Co je třeba spojit -
Jaký výpočet je potřeba - výpočet podílu ceny v roce T a v roce T-1
Bude nebo nebude filtr na datum - 
Seskupení - kategorie, rok, / TO, co není ve funkci
Tvorba VIEW - ano, z toho budu dále počítat 


CREATE VIEW v_vyvoj_cen AS (
SELECT 
food_category,
round (avg(price):: NUMERIC, 2) AS average_price,
payroll_year AS rok
FROM t_jana_sindelkova_project_sql_primary_final tjspspf
GROUP BY food_category, payroll_year);

Nyní můžu WINDOW funktion a vytvořím tabulku, kde přibude
sloupec s cenou z předchozího roku.

CREATE TABLE t_vyvoj_cen AS (
SELECT 
food_category,
average_price,
LAG (average_price) OVER (PARTITION BY food_category ORDER BY rok)AS price_year_ago,
rok
FROM v_vyvoj_cen);

VYtvořím tabulku, kde bude výpočet vývoje cenové hladiny.

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
ORDER BY rok ASC, mezirocni_porovnani_cen asc ;

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
ORDER BY food_category,rok, stupen_inflace ;










