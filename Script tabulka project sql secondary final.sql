Pomozte kolegům s daným úkolem. Výstupem by měly být 
dvě tabulky v databázi, ze kterých se požadovaná 
data dají získat. Tabulky pojmenujte t_{jmeno}_
{prijmeni}_project_SQL_primary_final (pro data mezd a 
cen potravin za Českou republiku sjednocených na 
totožné porovnatelné období – společné roky) a 
t_{jmeno}_{prijmeni}_project_SQL_secondary_final 
(pro dodatečná data o dalších evropských státech).

Nejprve si vytvořím VIEW, kde budou pouze evropské země.
Tvořím z tabulky countries.
CREATE VIEW v_eu_country as
SELECT *
FROM countries AS EU
WHERE continent = 'Europe';

SELECT *
FROM economies;

Následně vytvořím zadanou tabulku, DO spojím
vytvožení VIEW a vybrané sloupce z tabulky economies,
jen pro evropské země.

CREATE TABLE t_jana_sindelkova_project_sql_secondary_final AS 
(SELECT 
veu.*, 
eco.year,
eco.gdp,
eco.gini,
eco.taxes
FROM v_eu_country AS veu
JOIN economies AS eco
       ON veu.country = eco.country);

V tabulce secondary FINAL jsou makroekonomické ukazatele
jako koeficient gini, daňové zatížení, hrubý domácí produkt.








