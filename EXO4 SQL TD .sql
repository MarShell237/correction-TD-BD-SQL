/*erxercice 4*/
/*1)creer les tables de la base de donnees*/

--table Client
CREATE TABLE Client(
    codeclt VARCHAR(30) PRIMARY KEY,
    nomclt VARCHAR(30),
    prenomclt VARCHAR(30),
    villeclt VARCHAR(30)
    ); 

--table Representant
CREATE TABLE Representant(
    coderep VARCHAR(30) PRIMARY KEY,
    nomrep VARCHAR(30),
    prenomrep VARCHAR(30)
    ); 

--table Appartement
CREATE TABLE Appartement (
    ref VARCHAR(30) PRIMARY KEY,
    superficie INT(20),
    prix INT(20),
    coderep VARCHAR(30),
    codeclt VARCHAR(30),
    FOREIGN KEY (coderep) REFERENCES Representant(coderep),
    FOREIGN KEY (codeclt) REFERENCES Client(codeclt)
);

/* 2)client insersion les enregistrement des tables */
--insertion des enregistrements de la table client
INSERT INTO Client 
        (codeclt,nomclt,prenomclt,villeclt)
VALUES 
        ('C1','jerbi','Ali','Tunis'),
        ('C2','ayadi','Sami','Sfax'),
        ('C3','zaydi','Hela','Sousse');

--insertion des enregistrements de la table Representant
INSERT INTO Representant 
        (coderep,nomrep,prenomrep)
VALUES 
        ('R1','Tounsi','Ala'),
        ('R2','Sfaxi','hebi'),
        ('R3','Gabsi','amine');

--insertion des enregistrements de la table Appartement 
INSERT INTO Appartement
        (ref,superficie,prix,coderep,codeclt)
VALUES
        ('A1',500,100,'R2','C1'),
        ('A2',700,50,'R1','C1'),
        ('A3',900,150,'R2','C3');

/* 3)Les requetes SQL */
/* a. listes des Representants */
SELECT *
FROM Representant;

/* b.Les differentes villes des clients */
SELECT villeclt
FROM Client;

/* c.Le nombre de client */
SELECT COUNT(*) AS nb_client
FROM Client;

/* d.Les information du client de code c2 */
SELECT *
FROM Client
WHERE codeclt = 'C2';

/* e. Le maximum des prix des appartements */
SELECT MAX(prix) as max_prix_appartement
FROM Appartement;

/* f. Le minimum des prix des appartements */
SELECT MIN(prix) as max_prix_appartement
FROM Appartement;

/* g. La liste des clients classés par ordre alphabétique de leurs prénoms */
SELECT *
FROM Client ORDER BY prenomclt;

/* h. La liste des appartements situés à France et gérés par Sfaxi hedi */
SELECT * 
FROM Appartement A, Representant R 
WHERE A.coderep = R.coderep and nomrep = 'Sfaxi' and prenomrep = 'Hedi' ;

/* i. La moyenne des prix des appartements */
SELECT AVG(prix) AS moyenne_de_prix
FROM Appartement;

/* j. Le nombre d’appartements dont la superficie est supérieur à 700 */
SELECT *
FROM Appartement
WHERE superficie > 700;

-