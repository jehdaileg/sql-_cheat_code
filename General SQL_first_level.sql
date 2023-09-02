 CREATE DATABASE eloabdd  /* CREATION DE BASE DE DONNEES */

alter database eloabdd modify name = eloadbb  /* MODIFIER LE NOM DE LA BASE DES DONNEES */ 

drop database eloabd /* SUPPRESSION DE LA BASE DES DONNEES */ 

Use eloabd /*UTILISATION DE LA BASE DES DONNEES */

--CREATION D'UNE TABLE 

create table Clients(idClient INTEGER, nomClient varchar(50));

/* RENOMMER UNE TABLE */ 
/* UTILISATION D'UNE TRANSACTION SQL*/

sp_rename 'Produits', 'table8'

/* SUPPRIMER LA TABLE */
drop table Clients;

/* INSERTION DES DONNEES AVEC INSERT */ 
create table Noms (Nom varchar(200), prenom varchar(200))
--Insertion 
INSERT INTO Noms values('Jehdai', 'Great') /*Insertion dans toutes les colonnes */

INSERT INTO Noms(Nom) values('Jonathan') /* Insertion des données dans les colonnes spécifiées */ 

/*Insertion de 5 lignes  */

INSERT INTO Noms values 
('Hamel', 'Grant'),
('Hemi', 'Russel'),
('Selena', 'Romez'),
('Hugo', 'Lorris'),
('Kylian', 'Mbappe')

/* AFFICHAGE DE TOUTES LES DONNEES DE LA TABLE */ 

select * from Noms;

/* Selectionner juste la colonne prenom */ 

select prenom from Noms;

/* specifier les colonnes par leur noms  */

select nom, prenom from Noms;

/* UTILISATION DE WHERE, condition de selection/filtrer  */ 

select * from Noms where nom = 'Jehdai'

/* UPDATE, METTRE LA TABLE Noms à jour  */ 
update Noms set prenom = 'Le grand' where nom = 'Jehdai'

update Noms set prenom = 'Biama' where nom = 'Hamel'

/* SUPPRESSION DES DONNEES  */ 
delete from Noms  --Suppresssion de toutes les données de la table Noms
delete from Noms where prenom is null; --supprimer toutes les lignes dont le prenom est NULL ou absent

--Exercice
create table Contacts (Nom varchar(200), prenom varchar(200), age int, sexe char(1), date_naissance date)
--Before insert data in DATE Type column, be sure that the format is 'YYYY-MM-DD' (In English Program)
--Before insert data in DATE Type column, be sure that the format is 'DD-MM-YYYY'

insert into Contacts values 

--('Marchand', 'Elisabeth', 18, 'F', '1976-08-04')

('Truchon', 'Melanie', 16, 'F', '1978-08-04'),
('Teslu', 'Sandrine', 17, 'F', '1987-05-02'),
('Portail', 'Bruno', 23, 'M', '1970-05-06'),
('Virenque', 'Michel', 22, 'F', '1983-08-02'),
('Dutruel', 'Pascal', 22, 'M', '1983-08-02'),
('Fournillet', 'Pascal', 48, 'M', '1960-06-12'),
('Boutin', 'Ludivine', 47, 'F', '1965-01-22'),
('Delors', 'Valerie', 28, 'M', '1978-09-24'),
('Thuiller', 'Olivier', 41,'M', '1976-08-24'),
('Chuillier', 'Olivier', 41, 'M', '1976-08-12'),
('Meliac', 'Amelie', 34, 'F', '1983-05-08'),
('Boutin', 'Ludivine', 47, 'F', '1965-01-22')


select * from Contacts;
/* ALIAS DES COLONNES */

/* LIKE POUR Conditionner/Filtrer une selection des données */ 

select prenom from Contacts where age like '2%' --âge commence par 2 

select prenom from Contacts where age like '%2' --âge fini par 2 

select prenom from Contacts where nom like '%v%' -- prenom contient v 

select * from Contacts where date_naissance like '%08%' -- contient HUIT et donc les mois d'aout 

/* UTILISATION DES CROCHETS POUR AUTORISER LA NOMENCLATURE AVEC DES ESPACES */ 
--les crochets nous permettent d'utiliser les colonnes avec des Noms contenant des espaces

create table test_table ([Nom du repondant] varchar(50))

insert into test_table ([Nom du repondant]) values ('Charlotte'), ('Magie')


select [Nom du repondant] from test_table

--Mettre à jours plusieurs colonnes  

update NOM_TABLE set col1 = 'New Value', col2 = 'New Value', col3 = 'New Value' where id=12

/* Le TRI AVEC ORDER BY */
/* Trier l'age du plus petit au plus grand */ 

select * from Contacts order by age asc 
/* Trier l'âge du plus grand au plus petit */ 

select * from Contacts order by age desc

/* Trier par nom */

select * from Contacts order by Nom 

/*trier juste par anneee decroissant  */ 

select * from Contacts order by YEAR(date_naissance) desc --la fonction YEAR extrait l'année dans une donnée de type date 

/* par mois ascendant */ 

select * from Contacts order by MONTH(date_naissance) asc  --la fonction MONTH extrait le mois dans une donnée de type date 


/* utilisation de TOP --Pour extraire les top premières lignes d'une table définie*/ 

select  top(1) * from Contacts --la premiere ligne

select top(5) * from Contacts   -- les 5 premieres lignes 
select top(10) * from Contacts

/* METTRE A JOUR ET SUPPRIMMER LES 5 PREMIERES LIGNES */ 
delete top(5) from name_table

update top(5) table_name set nom='NamesX5'--On n'a pas besoin de ID ici car toutes les 5 premières lignes sont mises à jour

 /* LES CHAR ET VARCHAR  */

 --Le char prend un caractère 
 --Le varchar prend une chaîne des caractères

 /*   int, tinyint, smallint, bigint   */
 --TINYINT
 /* prend des valeurs de 0 a 255 */ 
 --SMALLINT 
 /* Prend des valeurs de -32 768 a 32767 et prend donc en charge des valeurs negatives */

 --Les virgules ne marchent pas 
 /* Utiliser le type DECIMAL pour des colonnes prennant des valeurs à virgule */ 

 /* QUELQUES PRATIQUES SUR SQL SERVER */ 

 --1. Comment créer un groupe des serveurs  pour differentes BDD ? 
	--*************************************************************
	/*

	CFR carnet 
	*/

	/* COPIER TOUTE UNE TABLE  */

	Select * into nouvelle_table from ancienne_table

/* Copier Juste une seule colonne d'une table selon une condition bien définie */ 

select colonne_nom into new_table from ancienne_table where nom in ('A', 'B')
/* Commande PRINT */ 

select * from Contacts;

print 'Selection des contacts success' --c'est juste un message qui Accompagne une requête
/* copier une table dans une BDD */ 

create database bdd_copie;

/* cfr carnet */

/* UTILISATION DE IN et NOT IN POUR FILTRER SELON LES VALEURS EN IN (qui sont présentes) et en NOT IN(Qui ne sont pas dans la liste)*/ 

/* IN correspondance prends les datas avec les prenoms Melanie et Bruno seulement*/ 
select * from Contacts Where prenom in ('Melanie', 'Bruno')

/* NOT in prend seulement les Hommes  */ 
select * from Contacts where sexe not in ('F')

/* IS et IS NOT */
insert into Contacts values ('Samuel', 'Grant', 43, 'F', NULL)
/* prends moi les datas dont la date de naissance n'est pas nulle, donc est renseignée */ 

select * from Contacts where date_naissance is not null 

/*prend les datas dont la date naissance n'est pas renseignee */
select * from Contacts where date_naissance is NUll

/* Opérateurs de comparaison */ 
/* <> is not ou different */ 
select * from Contacts where prenom <> ('Melanie') 
select * from Contacts where age <> 41
/* <  ou > */ 
select * from Contacts where age <= 22

/* BETWEEN entre 16 et 33 et les trier d'une manière ascendante  */ 

select * from Contacts where age between 16 and 33 order by age asc  

select * from Contacts where year(date_naissance) between 1970 and 1980  order by date_naissance 

/* not between, valeurs ne sont pas comprises */ 
select * from Contacts where YEAR(date_naissance) not between 1970 and 1980 order by date_naissance

/* COUNT POUR COMPTER LES LIGNES  */ 
select COUNT(*) from Contacts; --compte toutes les lignes dans notre table 

select count(nom) from Contacts
--compter sans les valeurs nulles aux dates 
select count(*) from Contacts where date_naissance is not null 

/* DISTINCT COUNT POUR IGNORER/ENLEVER LES DOUBLONS FIGURANT DANS LA COLONNE PRENOM */ 
select count(distinct prenom) from Contacts

/*
QUELQUES FONCTIONS D'AGGREGATION
SUM POUR LA SOMME, MAX POUR LA VALEUR MAX, MIN POUR LA VALEUR MIN , AVG POUR LA MOYENNE */ 
-- S'effectuent seulement sur les colonnes de type numérique 

select sum(age) from Contacts where date_naissance is not null  --somme de tous les âges 

select max(age) from Contacts where sexe='M' -- âge max des hommes 

select avg(age) from Contacts where sexe not in ('M') --âge moyen des femmes 

/*UTILISATION DES VUES */
/* Les Vues sont utilisées pour stocker une requête et elle est considérée comme une table temporaire */ 
/* GROUP BY pour regrouper les données selon une colonne/variable spécifiée */ 
/*UTILISATION DE 'AS' pour renommer une colonne lors d'une requête */ 
select count(*) as Total, avg(age) as Average_Age, sexe from Contacts
where year(date_naissance) between 1970 and 1980 group by sexe 
/*stocker cette requête dans une vue appellee vue_sexe_cat */ 

create view vue_sexe_cat 
AS
select count(*) as Total, avg(age) as Average_Age, sexe from Contacts
where year(date_naissance) between 1970 and 1980 group by sexe 

--print('View created successfully')
/* EXPLOITER LA VUE ou REQUÊTER SUR LA VUE */ 
select * from vue_sexe_cat  -- voir la vue et son contenu (toutes ses colonnes)

/* voir seulement la colonne Average_Age de la vue */ 

select Average_Age from vue_sexe_cat
/*creer des vues pour des users */ 

/* Creer une vue pour sebastien qui verra seulement les personnes qui ont moins de  30 ans */ 

create view sebastian_view
as 
select * from Contacts where age  < 30 


/* Créer une vue pour Jackson qui verra seulement les personnes qui ont plus de 30 ans */ 

create view jackson_view 
as 
select * from Contacts where age > 30 
--tester les vues 
select * from sebastian_view
select * from jackson_view

/* PROCEDURES STOCKEES sur SQL et SQL Server
Nous permettent de stocker dedans des requetes par exemple des requêtes d'insertion de 3 lignes que je n'aimerais pas 
taper tous les jours la même syntaxe
*/ 
create procedure ps_insert_3_datas
as
insert into Contacts values 
('Bouchon', 'damien', 25, 'M', '1983-05-06'),
('Berchet', 'Alain', 83, 'M', '1940-01-06'),
('Auteil', 'laurence', 47, 'F', '1970-12-28')

/* L'éxécuter en temps voulu */ 
exec ps_insert_3_datas
--vérification de l'insertion de ces   3 lignes 
select * from Contacts
--procédure pour la mise à jour 

create procedure update_cont
as
update Contacts set nom ='auteil2' where nom = 'Auteil'

exec update_cont

--procédure pour la suppression

create procedure delete_data
as 
delete from Contacts where nom = 'auteil2'

exec delete_data

/* Table avec unique Identifier
une colonne en chaine des caractere qui doit etre unique 
*/

create table clients(idClient uniqueidentifier, nom varchar(200))
 --utilisation de la fonction newid() pour generer une valeur dans la colonne de type uniqueidentifier 

 insert into clients values 
 (newid(), 'Jean'),
 (newid(), 'Marc'),
 (newid(), 'Luc'),
 (newid(), 'Paul')

 
 
 /* newsequentialid; la meilleure manière de créer une clé primaire/unique */ 

 create table parterners(idPartenaire uniqueidentifier Default newsequentialid(), nom varchar(50))

 insert into parterners values
 (default, 'Alain'),
 (default, 'Marina'),
 (default, 'Isabelle'),
 (default, 'Rihana')

 select * from parterners
 select top(5) * from clients

 /* Les colonnes de type DATE */ 

 create table mydates(colonne_date DATE, colonne_smalldatetime SMALLDATETIME, colonne_datetime DATETIME, colonne_datetime2 DATETIME2)

 /* date du jour */ 
 select GETDATE()
 /*Date d'hier -1 et/ou de deux derniers joiurs ou 7 jours, selon le nombre  */
 select getdate() -2


 /* AJOUTER une colonne et la renommer */ 

 create table mycolonnes(colonne_1 varchar(200))

 alter table mycolonnes add colonne_2 int --ajouter une colonne colonne_2 de type int 
 /*MODIFIER LE TYPE D'UNE COLONNE colonne_1 */ 

 alter table mycolonnes alter column colonne_1 varchar(10)

 alter table mycolonnes add colonne_3 uniqueidentifier default newsequentialid()
 /* SUPPRIMER UNE COLONNE */ 
 alter table mycolonnes drop column colonne_2

 /* Les synonymes --- ressemblent a des alias */ 
 --cfr video 41
 
 /* QUELQUES FONCTIONS DE SQL de xp et sp */ 

 --voir la liste ou le journal des erreurs du moteur SQL 
 xp_readerrorlog

 --naviguer à travers les repertoires 
 --xp_cmdshell 'dir D:'
 
 --taille des disques 
 xp_fixeddrives

 --version SQL 
 xp_msver
 

 sp_configure --configurations sql 

/* appliquer des configurations */ 
exec sp_configure 'show advanced options', 1;

--rename a bdd 
sp_renamedb 'bdd_copie', 'bdd_2'

--place d'une table dans la bdd 
sp_spaceused 'Contacts'

--le user 
sp_who2 active 

/* commandes en @@ */ 

select @@servername --nom du serveur 

select @@LANGUAGE  --langue du serveur 


select @@version   --version 


select @@SPID --numero d'une requete SQL vont de 50 à x , et moins de 50 ce sont des spid systèmes 


select @@TRANCOUNT --voir le service sur lequel le moteur SQL tourne danas le système, if we stop the service in the system, then sql server will turn down 

/* Utilisation de Group by */ 
select count(*) as Total, avg(age) as Average_Age, sexe from Contacts
where year(date_naissance) between 1970 and 1980 group by sexe 

/* Utilisation de Having , recupere moi le total superieur à 2 ou le prix, la moyenne est supérieure à 50 pourcent */ 
select count(*) as Total, sexe, age from Contacts where sexe = 'M' and age between 20 and 25 group by sexe, age having count(*) > 2

select count(*) as Total, sexe, age from Contacts where sexe = 'M' and age between 20 and 25 group by sexe, age having sum(1) > 2

/*  Utilisation de CHECK - permet d'ajouter une contrainte à une colonne pour les valeurs qu'elle recevra */

--ajoute une contrainte que l'âge saisi doit être supérieur à 5 sinon, le sexe doit etre soit M ou F , sinon les valeurs ne seront pas enregistrée
create table Personne(id uniqueidentifier Default newsequentialid(), nom varchar(50), sexe char(1), age int, CHECK(age > 5), CHECK(sexe in ('M', 'F')))

insert into Personne values 
(default, 'First', 'M',10)

/* l'attribut DEFAULT, pour mettre une valeur par défaut à une colonne */ 
create table Agents(nom varchar(20), adresse varchar default 'DRC', email varchar)
/* Ajout de la contrainte sur une table qui existe  */
alter table Agents add constraint Default_constraint default 'entrprise@gmail.com' for email

/* UNIQUE, faire d'une colonne à recevoir des valeurs uniques seulement */ 
create table Sales(ProduitId int UNIQUE, nom varchar(250))
--L'id sera unique, une valeur en double ne sera pas tenue en compte

/* FOREIGN KEY; pour les clés étrangères */
--Permet d'ajouter des relations entre tables 
-- cfr fichier SQL foreign keys notions explained -- foreign key cheat
--La meilleure chose à faire c'est de créer d'abord les tables sans clés étrangères et ajouter ces clés étrangères après
alter table products add foreign key(id) references TypeProduct(id) on delete cascade
--primary key -- 

create table Sales(id int primary key, nom varchar(250)) 

/* Les séquences  / */
/*Tables temporaires */ 
--Permettent de stocker de grandes quantités des données

create table #table_session(id int, nom varchar(250))


select * from #table_session;

--preceded by # 
/* tables variables, souvent du system preced by @ */ 
declare @employtee table(id int)

/* création d'un SCHEMAS */ 
--les tables sql sont stockées dans des schemas 
--la syntaxe est dbo.table 

--créer son propre schemas 
create schema [custom_schema]

--y associer une table 
create table custom_schema.Test (col1 varchar(250))

/* TRIGGER; déclencheurs; c'est une fonction qui se lance après chaque éxécution programmee  */ 

create table test_triggers(nom varchar(250))

create trigger monInsertTrigger on test_triggers 
after 
insert 
as begin 
print ('Data inserted successfully')
end 

insert into test_triggers values ('Heritier 10 fois')
go 10 --insertion 10 fois

/* modifier un trigger */

alter trigger monInsertTrigger on test_triggers
after
delete
as 
begin 
print('Delete completed successfully')
end

/* activer ou désactiver le trigger sur la table */

alter table test_triggers disable trigger monInsertTrigger 

alter table test_triggers enable trigger monInsertTrigger 
/* trigger et table virtuel */

create trigger monTrig on test_triggers 
after 
delete
as 
begin
select * from deleted --ce qui se fera après suppression des données dans la table test_triggers, les données supprimées seront affichées dans la table deleted
end --me selectionne dans une table tout ce qui deleted 


create trigger monTrigIns on test_triggers 
after
insert 
as 
begin 
select * from inserted--ce qui se fera après insertion des données dans la table test_triggers, les données insérées seront affichées dans la table inserted
end --me selectionne dans une table tout ce qui inserted

/* fetch (Datas a extraire) and offset (Datas to ignore) */
select * from Contacts order by prenom offset 10 rows /* sautte les 10 first rows */

select * from Contacts order by prenom offset 10 rows fetch next 2 rows only --saute les 10 first rows et prend les deux suivantes apres 10 

/* substring */

select nom, substring(prenom,1,1) as Initiales_prenom from Contacts order by nom  --découpe une chaîne des caractères 

/* AND et OR, LE ET et le OU pour des selections logiques*/ 
select * from Contacts where month(date_naissance) = 08 and age > 23

select * from Contacts where month(date_naissance) = 08 or age > 23

/* les MODES D'ISOLATIONS SQL ----- */

--la fonction format pour formater les dates 

--la fonction format peut aussi formater les devises money 

/*la structure CASE ... WHEN */

select *, 

case 

when sexe = 'M' then 'Monsieur'
when sexe = 'F' then 'Madame'

end 
from Contacts

select *,

case 
when age between 10 and 25 then 'Jeune' ELSE 'ON ne sait pas trop'

end 

from Contacts

/* reécriture en IIF    */

select *, IIF(sexe = 'M', 'Monsieur', 'Madame') from Contacts order by sexe 

/*LEFT et RIGHT */ --découpe ausi les chaînes de caractères allant de gauche et/ou de droite 

select nom, prenom, left(nom,2), right(prenom,2) from Contacts

/* Fonction CHOOSE */

select *, case datepart(month, date_naissance)

when 1 THEN 'Janvier'
when 2 then 'February'
when 3 then 'March'
when 4 then 'April'
when 5 then 'May'
end
as Month

from Contacts

/* REPLACE et LEN */ 
select prenom, REPLACE(prenom, 'Elisabeth', 'Tata Elie') from Contacts

/* évite les valeurs nulles dans des lignes dans une requête */

select * from Contacts

select nom, prenom, coalesce(date_naissance) as DateT from Contacts

/* UNE VARIABLE DANS SQL   */
DECLARE @var varchar(20)

set @var = 'Example'

print @var

/*UNION ET UNION ALL */
create table client1(nom varchar(250), age int)

create table client2(nom varchar(250), age int)

insert into client1 values ('rOY', 25)
insert into client1 values ('Arsene', 45)


insert into client2 values ('rachel', 25)
insert into client2 values ('Christine', 45)
insert into client2 values ('rOY', 25)
--Union ne prend pas les doublons mais union all prend même les doublons et les affiche dans le résultat de la requête 

select * from client1 
UNION 
select * from client2


select * from client1 

UNION ALL 

select * from client2 

/* EXCEPT et INTERSECT */ 


/* try parse  , try cast et try convert */

/* INNER JOIN, fait ressortir les correspondances dans les deux tables */ 

create table commands(numeroCommande int, IDClient int)

create table clientss(nom varchar(250), adresse varchar(250), ville varchar(250), IDClient int)

insert into commands values 
(001, 1),
(002, 1),
(003, 1),
(004, 2),
(005, 2),
(006, 3)

insert into clientss values
('Rachel', 'RDC', 'Goma', 1),
('Elizee', 'South Africa', 'Johaness', 2),
('Rasheed', 'Egypt', 'Caire', 3),
('Raphael', 'Bresil', 'Sao Polo', 4),
('Moustapha', 'Tunisie', 'Cartage', 5)

select * from commands
select * from clientss


--inner join, voir les noms des clients et leurs adresses qui ont passé des commands , inner join ramène seulement les datas de A en relation avec B 

select Com.numeroCommande, Cl.nom, Cl.adresse from clientss as Cl inner join commands as Com on Com.IDClient = Cl.IDClient order by Com.numeroCommande

--utilisation de group by pour grouper en une fois les catégories 
select Cl.IDClient, Cl.nom, Cl.adresse from clientss as Cl inner join commands as Com on Com.IDClient = Cl.IDClient order by Cl.IDClient
--inner joiun juste voir les numéros des commandes et idClient 
select Com.numeroCommande, Com.IDClient from commands as Com inner join clientss on Com.IDClient = clientss.IDClient

--
/* Left join ramène les valeurs de la table de gauche avec et sans correspondance d'avec la table de droite */ 
--table de gauche la premiere avant le from et celle de droite c'est après le from 
--savoir ce qu'on veut et où chercher et trouver

--utilisation de IS NULL pour voir les datas sans correspondance 
--voir les clients qui n'ont pas de commands 

select Cl.nom, Cl.adresse from clientss as Cl left join commands as Com on Cl.IDClient = Com.IDClient WHERE Com.IDClient is NULL 
/* le right Join c'est exactement la même chose que le left join mais on inverse juste les tables , la table de left join est celle qui commence */ 

select Cl.nom, Cl.adresse from commands as Com right join clientss as Cl   on Cl.IDClient = Com.IDClient where Com.IDClient is NULL 

--utiliser un NOT IN pour voir les clients qui n'ont pas commande, qui implique l'utilisation des sous requetes 

select nom, adresse from clientss WHERE 
IDClient not in 
(select IDClient from commands)

--utilisation de not exists 


/* Le cross join, multiplicaiton croisee, associer les lignes de la premiere a la deuxime table */

/*/ Jointure sur plusieurs tables */ 

--ajout de la table Fidelite 
create table carte_fidelites(Fidelite char(3), IDClient int)

insert into carte_fidelites values 
('OUI', 1),
('NON', 2),
('OUI', 3),
('NON', 4),
('OUI', 5)

select * from carte_fidelites

--Jointures sur 3 tables, notant que l'idclient est dans toutes les 3 tables 
select * from clientss
select * from commands
select * from carte_fidelites

--recupérer les clients qui ont commandé et ont une carte de fidelité
--Afficher juste l'id des clients qui ont commands et ont une carte fidelite 
select Com.IDClient from commands as Com 
inner join clientss as Cl on Com.IDClient = Cl.IDClient 
inner join carte_fidelites as CartF on CartF.IDClient = Cl.IDClient
where CartF.Fidelite = 'OUI'


select Com.IDClient, Cl.nom from commands as Com 
inner join clientss Cl on Com.IDClient = Cl.IDClient
inner join carte_fidelites CartF on CartF.IDClient = Cl.IDClient
where CartF.Fidelite = 'OUI'


select Com.IDClient, Cl.nom, Cl.adresse from commands as Com
inner join clientss Cl on Com.IDClient = Cl.IDClient
inner join carte_fidelites CartF on CartF.IDClient = Cl.IDClient
where CartF.Fidelite = 'OUI'


/* Update avec la jointure Inner join */ 
--Mettre a jour la table T2 a partir des colonnes de la T1 

UPDATE T2 
SET t2.colonne2 = t1.Colonne2
FROM T1 t1 
INNER JOIN T2 t2 ON t1.ID = t2.ID 
WHERE t2.ID  in (3, 4)

/*  fonctions de partition avec Over Partition , c'est une fontion de fenetrage  */
--utilisation de la fonction row_number() qui cree des index sur base d'une colonne 
--creation d'une colonne indexRow en fonction de l'id 

select nom, adresse, row_number() over(order by IDClient) as IndexRow from clientss

/* fonction de Ranking  ou classement */
--row_number() over(order by IDClient)

--utilisation de rank 
select nom, adresse, rank() over (order by IDClient) as IndexRow from clientss
--utilisation des fonctions d'aggregation dans les ranking 
--utilisation de count(*) over() -- avg(var) over() pour les prendre separement
--utilisation de Partition by pour prendre la category le nombre correspondand 
--Exemple: cherchons les produits, la moyenne des prix,  les compter sur base des ventes et cela par la partition de la category 


  
--UTILISATION DE PARTITION POUR DES REQUÊTES AVANCEES 
select P.productID, P.name as ProductName,
C.name as CategoryName, ListPrice, 
count(*) over(PARTITION BY C.ProductCategoryID) countOfpRODUCT,
AVG(ListePrice) OVER(PARTITION BY C.productCategotyID) as AVGPriceList 
FROM Production.product as P 
JOIN Production.ProductSubCategory AS S 
	ON S.ProductSubCategory = P.ProductSubCategoryID 
JOIN Production.ProductCategoryid AS C 
	ON C.productCategoryID = S.ProductCategotyID 
WHERE FinishedGoodsflag = 1   

/*  LAG/LEAD en TSQL */ 

/* CDC change data capture pour garder une historique sur les modifications (insert, update, delete) permettant d'arriver 
aux données d'une table à un instant T */ 

--creation de la BDD 
create database  Test_CDC
use Test_CDC 
--création d'une table 
create table dbo.cdc(nom varchar(250), prenom varchar(250), age int)
--insertion des datas dans dbo.cdc 
insert into cdc values
('Ring', 'Flamengo', 56),
('Elon', 'Musk', 59),
('Eliot', 'Martineli', 26)

--Activer le mode CDC sur sqlserver

EXEC sys.sp_cdc_enable_db

--Savoir que cette option est accessible dans la version Developper, Enterprise et pas dans la versio Express de SQL Server 
--check if c'est changed 
--activation du cdc mode  sur la base des données concernée (ici c'est Test_CDC)
SELECT [name], database_id, is_cdc_enabled 
FROM sys.databases
WHERE name = 'Test_CDC'

--activer le mode cdc sur la table 
EXEC sys.sp_cdc_enable_table 

@source_schema = N'dbo',
@source_name = N'cdc',
@role_name = NULL 

/* Deux jobs sont activated, launched */
--faire un update 
update dbo.cdc set nom = 'Bobo' where nom = 'Torrent'

--puis un insert 
insert into cdc values ('jc', 'vandame', 51)

--puis un delete 
delete from cdc where nom = 'John'

--faire un select de la table historique pour voir what happened 
select [__ $start_lsn]
,[__$end_lsn]
, [__$seqval],[__$operation], [__$update_mask], [nom], [prenom], [age], [__$command_id]
FROM [Test_CDC].[cdc].[dbo_Ccdc_CD]

/* l'operation correspondant a chaque chiffre est donc */ 
/* 1 = Delete, 2 = INsert, 3 = Valeur ligne avant un update , 4 = Valeur ligne apres un Update */ 

--voir la valuer deleted 
select  [nom], [prenom], [age]
FROM [Test_CDC].[cdc].[dbo_Ccdc_CD]
where [__$operation] == '1' --DELETE car 1 correspond au deleted 

--voir la valuer inserted 
select  [nom], [prenom], [age]
FROM [Test_CDC].[cdc].[dbo_Ccdc_CD]
where [__$operation] == '2' --Inserted car 2 correspond au inserted 


--voir la situation updated 
select  [nom], [prenom], [age]
FROM [Test_CDC].[cdc].[dbo_Ccdc_CD]
where [__$operation] == '3' --update car 1 correspond au updated

--DATA MASKING, qui masque les datas 
/* c'est une meilleure manière simple  de protéger et sécuriser les datas dans une BDD*/ --DDM Dynamiq Data Masking

--ces définitions sont mises au niveau des colonnes ou variables sensibles qu'on veut protéger
--partial(2, "", 2) //affiche les deux premiers et les deux derniers caractères d'une colonne 
--random(1, 12) //insérer une valeur aleatoire entre 1 et 12 
--default() //on masque toute la colonne 
--email() // masquage email 

create database Test_DDM

use Test_DDM

create table Membres(
MembreId int IDENTITY PRIMARY KEY,
Nom varchar(250) MASKED WITH(FUNCTION = 'partial(2, "...", 2)') NULL,
prenom varchar(250) not null,
Telephone varchar(10) MASKED WITH(FUNCTION = 'default()') NULL,
Email varchar(100) MASKED WITH(FUNCTION = 'email()') null 

)

--insertion des datas dans la table Membres 

insert into Membres(Nom, prenom, Telephone, Email) values 
('Jackson', 'Wafomba', '7895859874', 'jacki@gmail.com'),
('Charline', 'Agantho', '7856987452', 'charli@gmail.com'),
('Elon', 'Aramba', '0125897456', 'elon@gmail.com'),
('Gaston', 'Suzuki', '5952301471', 'gastonm@gmail.com')

select * from Membres

--création d'un user TestMask + autorisation de sélection 
create user TestMaskUser without login 

grant select on Membres to TestMaskUser

--se connecter en tant que TestMaskUser 
execute as user = 'TestMaskUser'
--se déconnecter du user TestMaskUser 
revert
--Tester maintenant la selection ou bien l'acces aux datas 
select * from Membres

--enlever la protection au user 
grant unmask to TestMaskUser 
--annuler 
Revert

/*TEMPORAL DATA , pour voir l'historique des modifications  et pouvoir récupérer les datas en cas des requêtes accidentelles*/ 
--ajout de la syntaxe period for system_time , et aussi créer la table historique avec history_table, avec obligation pour une table d'avoir une PK (Primary Key)
--Cette pratique crée le versioning 
--La meilleure manière c'est créer une table de manière classique et la modifier apès

create table Employee(
EmployeeID int IDENTITY PRIMARY KEY, 
FirstName varchar(250) not null,
LastName varchar(250) not null,
DepartmentName varchar(250) null
)

insert into Employee (FirstName, LastName, DepartmentName) values 
('Ken', 'Micka', 'IT'),
('Aristote', 'Shaba', 'Ads'),
('Nelly', 'Sotari', 'Brand Prom'),
('Alliance', 'Neema', 'Sales Dep'),
('Nadege', 'Kivu', 'Data Management')

select * from Employee

--modifier cette table tout en créeant le systeme de versioning pour l'historique 
  --ajout de deux colonnes pour le time 

ALTER TABLE Employee ADD 

	StartDate datetime2 GENERATED ALWAYS AS ROW START NOT NULL DEFAULT CAST('1900-01-01 00:00:00.0000000' AS datetime2),
	EndDate datetime2 GENERATED ALWAYS AS ROW END NOT NULL DEFAULT CAST('9999-12-31 23:59:59.9999999' AS datetime2),
	PERIOD FOR SYSTEM_TIME (StartDate, EndDate)

--Activation du versioning 

ALTER TABLE Employee 
	SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeeHistory))
--ici, nous avons dja deux tables, Employee pour les datas et  EmployeeHistory pour l'historique des datas dans la table Employee 

select * from Employee where EmployeeID = 3

--update 
UPDATE Employee set FirstName = 'Gaby' where EmployeeID = 1 

--Delete 
DELETE Employee where EmployeeID = 4

select * from Employee
--après toutes ces modifs, qu'en est-il de la table EmployeeHistory 

select * from EmployeeHistory
--on trouve ainsi les différentes modifications effectuées sur mes deux lignes 1 et 4 

--voir les datas y a un ou 2 ou plusieurs jours 

DECLARE @FifteenAgo datetime2 = DATEADD (d, -15, SYSDATETIME())

select * from Employee --maintenant 

--avant 
select * from Employee for system_time as of @FifteenAgo order by EmployeeID

/*    le RLS    Row Level Security  permet de restreindre des droits sur certaines colonnes sur base de certaines conditions*/
use eloabd
create table sales(IdSaler int identity primary key, sales varchar(250), product varchar(250))

insert into sales values 
('Saler1', 'Renaul'),
('Saler2', 'Peugeto'),
('Saler1', 'MBM'),
('Saler2', 'MBenz'),
('Saler1', 'Toyota')

select * from sales 

--les Vendeurs ou Salers auront seulement accès à leur datas correspondantes, donc Saler1 verra Saler1, Saler2 verra Saler2 */
--création des users pour tester 

create user Manager without login 
create user Saler1 without login 
create user Saler2 without login 
create user Saler3 without login 

--Accordons des droits plus elargis au manager et le sselect aux salers 
alter role [db_owner] add member [Manager]  --ajoute l'utilisateur Manager parmi les db_owner 

grant select on sales to Saler1

grant select on sales to Saler2 

grant select on sales to Saler3 


--créer une fonction qui mappe les rôles 

create FUNCTION fn_Saler(@saler AS varchar(50))

	RETURNS TABLE 
	WITH SCHEMABINDING
AS 
	RETURN 
		SELECT 
		1 AS fn_Saler 
		WHERE 
		@saler = User_name()
		or IS_MEMBER ('db_owner') = 1 

--select pour bien comprendre 
select sales from Sales

--création d'une security policy pour affirmer le RLS qui s'active sur la colonne sales 
create security policy dbo.sale --la policy a pour nom sale 
	add filter predicate dbo.fn_Saler(sales) 
	on dbo.sales 
	with (state = ON)
--test 
select * from sales --en tnat que sys admin je vois tout 

--connexion avec Saler1, ne verra que les sales Saler1 
execute as user = 'Saler1'

select * from sales 

revert --se deconnecter 

execute as user = 'Saler2'

select * from sales 

revert 
--en tant que Saler 3, il ne verra aucune data vu qu'il n'as pas vendu 
execute as user = 'Saler3'

select * from sales

revert 

--FULL OUTER JOIN sans is null, renvoie toutes les lignes de deux tables avec et sans concordance , mais avec is null ramene les non concordantes

select Com.IDClient from commands as Com full outer join clientss as Cl on Cl.IDClient = Com.IDClient

--avec is null 
select Com.IDClient from commands as Com full outer join clientss as Cl on Cl.IDClient = Com.IDClient where Com.IDClient is null 
--poir en rajouter les noms 

select Cl.nom, Cl.adresse, Com.IDClient from commands as Com full outer join clientss as Cl on Cl.IDClient = Com.IDClient

--avec is null 
select Cl.nom, Cl.adresse, Com.IDClient from commands as Com full outer join clientss as Cl on Cl.IDClient = Com.IDClient where Com.IDClient is null 


--nouveates SQL server 2022 
select @@VERSION

--Greatest, least 
--unpivot
--Datebucket 
--utilisation de over et partition pour le regroupement des datas selon une colonne bien définie 
--ressortir la moyenne, la somme, le nombre de la quantité des marchandises vendues uniques / avec le SaleOrderId 
select salesOrderId, ProductId, OrderQty,

SUM(OrderQty) over (PARTITION BY SaleOrderId) AS Total,
AVG(OrderQty) over(PARTITION BY SaleOrderId) AS "AVG",
MIN(OrderQty) OVER (PARTITION BY SaleOrderID) AS "MIN",
MAX(OrderQty) OVER (PARTITION BY SaleOrderID) AS "MAX"

from salesTable where SaleOrderID in (100, 150)

--Se rassurer que votre base de données est à la version 160 pour pouvoir utiliser cette feature 
--Faire avant de requêter 

ALTER DATABASE SalesDatabaseHQ SET Compatibility_level = 160 