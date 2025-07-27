Průvodní zpráva k projektu č. 1
Výzkumné otázky:
1) Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2) Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3) Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4) Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5) Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
   
Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Připravila jsem :
•	č. 1  t_jana_sindelkova_project_SQL_primary_final (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) k otázkám 1 – 4,
•	tabulku č. 2  t_jana_sindelkova__project_SQL_secondary_final (pro dodatečná data o dalších evropských státech) k otázce č. 5,
•	průběžné tabulky: t_inflace, t_kupni_sila_chleb_mleko, t_vyvoj_cen
•	views: v_eu_country, v_lookup_table_null, v_mzdy_odvetvi, v_vyvoj_cen

Odpovědi:
1) Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
K této otázce jsem připravila kód, který jsem umístila do souboru Script k otázce č. 1. 
Bylo zjištěno, že ve vybraných odvětvích (s vyšší mzdou) průměrná mzda klesla meziročně v letech 2012/2013 v důsledku politických a ekonomických vlivů (pád vlády, předčasné volby). Oblasti citlivé na tyto vlivy byly informační a komunikační činnosti, nevíce oblast finančního trhu – peněžnictví a pojišťovnictví, dále výroba a rozvod elektřiny, plynu. Mírný pokles mezd byl zaznamenán v oblasti stavebnictví a nemovitostí, oblast těžkého průmyslu, oblast obchodu, stagnace potom ve vědě a kultuře. V ostatních odvětvích mzda postupně rostla. Nejlépe bude vidět v grafické vizualizaci trendu – ve spojnicovém grafu.

2) Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
Tato otázka směřuje na kupní sílu mezd. K této otázce jsem připravila kód, který jsem umístila do souboru Script k otázce č. 2. Připravila jsem výstupy za roky 2006 a 2018 za jednotlivá profesní odvětví zvlášť pro komodity mléko polotučné pasterované a chléb konzumní kmínový. Vycházela jsem z tabulky t_jana_sindelkova_projekt_sql_primary_final.  Výsledky analýzy jsem umístila do tabulky  t_kupni_sila_chleb_mleko, kde je vždy komodita, její průměrná cena, dále odvětví průmyslu a průměrná mzda, ve sloupci kupni_sila  přepočtená na kg chleba a litry mléka.

3) Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
Tato otázka směřuje na vývoj inflace napříč různými kategoriemi potravin. K této otázce jsem připravila několik kódů, které jsem umístila do souboru Script k otázce č. 3 a 4. Mezivýstupy jsou potom tabulky t_vyvoj_cen, v_vyvoj_cen, t_inflace. K otázce jsem přistoupila tak, že jsem vypočítala nárůst cen podílem (cena v roce t/ cena v roce t-1) * 100. Výsledek interpretujeme jako výše ceny dané komodity vyjádřená procenticky ve vztahu k ceně z předchozího roku. Výsledek nad 100 je vždy nárůst cen, výsledek pod 100 je vždy pokles cen.  Hledala jsem pokles pod 80, tj. více jak 20 % pokles ceny, tedy deflace. Tento cenový vývoj byl zaznamenán u následujících komodit v těchto letech:

Rajská jablka červená kulatá	2007	70
Konzumní brambory		2008	76
Pečivo pšeničné bílé		2009	71
Pšeničná mouka hladká	2009	77
Jablka konzumní		2009	78
Rajská jablka červená kulatá	2011	72
Konzumní brambory		2012	78
Eidamská cihla		2015	79
Cukr krystalový	2018	79

4) Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Tato otázka také směřuje na vývoj inflace, tentokrát k maximu. Příprava k této otázce je totožná s otázkou přechozí, tedy soubor Script k otázce č. 3 a 4. Využijeme tabulku t_inflace, ze které za pomocí podmínek case when rozdělíme mezirocní porovnání cen podle výšky do stupňů. Stupeň 2 je od 10 % do 20%, stupeň 3 od 20 do 30 %, atd. až po stupeň 9. 

V každém roce jsou potraviny, které zdražily o více než 10 %. Nejčastěji je zastoupeno zdražení ve stupni č. 2 a 3, tedy do 20 % a do 30 %. Ojediněle je stupeň č. 4 – 7. 

5) Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
Tento dotaz směřuje do zkoumání vývoje v dalších evropských státech, zejména vývoje HDP, giniho indexu a vlivu na mzdy a ceny potravin. Zde musíme zabrousit do makroekonomie.

Nižší Giniho index v rozmezí kolem 0,3 znamená, že ve společnosti je silná střední třída, která profituje z celospolečenského blahobytu, mzdy rostou napříč všemi odvětvími.  Státní politika sanuje výraznější rozdíly. Čím více ekonomika prosperuje, tím je společnost plošně bohatší. Nedochází k sociálním nerovnostem. Nárůst HDP je obvykle v důsledku jak investic, tak vládních výdajů, tak růstu spotřeby, která je v důsledku růstu mezd. Růst mezd vyvolá obvykle růst cen potravin, dokud nabídka nezareaguje svoji produktivitou. Když je růst HDP tažen produktivitou, tedy investicemi a vývozem, tak dochází k mírnému růstu cen. Naproti tomu, když je HDP tažen spotřebou, tedy růstem mezd, tak se ceny zvyšují.
K přípravě výstupů k jsem využila tabulku t_jana_sindelkova_projekt_SQL_secondary_final, ve které jsou data ze všech zemí. Připravila jsem si view v_eu_country, ve kterém jsou data ze zemí Evropy. Pro účely zodpovězení otázky č. 5 postačí data pro vybrané země Evropy  - Rakousko, Německo,  Slovensko a Řecko , Itálie, Albánie, Španělsko, Švédko, Norsko, Bulharsko, Srbsko, Slovinsko (populace, hdp, gini, výpočet hdp na člověka) na kterých si ukážeme, jak fungují makroekonomické principy.

Odpověď

Tam, kde je růst HDP při Giniho indexu do 0,3, ekonomika je tažená produktivitou, je rozumné zdanění, tak tam je nárůst mezd průběžný, celoplošný, růst cen potravin je mírný, inflace v normě. Reálné mzdy rostou, tzn. míra inflace je nižší než nárůst mezd. Poptávka je rozložená. Tento model je typický pro skandinávské země a země střední Evropy. 

V rozvinutých ekonomikách s vyšším Giniho indexem,cca 0,35 je rozdělení bohatství společnosti více nerovnoměrné. Tzn. mzdy rostou nerovnoměrně, vznikají rozdíly mezi obory i mezi regiony. Inflace je vyšší, rozdíly jsou větší. Bohatství je koncentrováno do větších měst, do průmyslových oblastí, do turisticky lákavých oblastí. Toto budou bohaté regiony. Naproti tomu oblasti venkova stojící na zemědělství budou chudší oblasti.  Typické pro jižní státy – Itálie, Španělsko. 

Naopak tam, kde je růst HDP při Giniho indexu výrazně nad 0,35, není žádná významná síla v ekonomice, mzdy rostou zcela nerovnoměrně, je velká polarizace společnosti, vysoké příjmy u bohatších zvyšují poptávku po luxusním zboží a nemovitostech, což může tlačit ceny nahoru. Inflace je vysoká. Spotřeba je koncentrovaná.  Reálné mzdy většiny obyvatel klesají. Tento model je typický pro chudé ekonomiky. Čím vyšší Ginniho index, tím rychlejší růst cenové hladiny. Typické pro Bulharsko, Srbsko.

Závěr
Pokud HDP vzroste vlivem produktivity či exportu, v zemích s nižším Giniho indexem, projeví se to rovnoměrným nárůstem mezd a následně mírnou, pomalou inflací. Reálné mzdy vzrostou. 

Pokud HDP vzroste v rozvojových zemích s vysokým Giniho indexem, projeví se to silnou, rychlou inflací. Byť nominální mzdy vzrostou, reálné mzdy poklesnou. Většina obyvatel chudne a rychle. 

Pokud HDP vzroste v rozvinutých zemích s vyšším Giniho indexem, projeví se to rozdílně, region od regionu, obor od oboru. Bohaté regiony bohatnou, chudé chudnou, stejně tak vysokopříjmové obory. 


