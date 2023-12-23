--? Exercice5
--* 1)creer les tables de la base de donnees
--table Emp
CREATE TABLE Emp(
    NumE INT(20) PRIMARY KEY AUTO_INCREMENT,
    NomE VARCHAR(30),
    Fonction VARCHAR(30),
    Embauche DATE,
    Salaire INT(20),
    Comm INT(20),
    NumD INT(20),
    FOREIGN KEY (NumD) REFERENCES Dept(NumD)
);

--table Dept
CREATE TABLE  Dept(
    NumD INT(20) PRIMARY KEY,
    NomD VARCHAR(30),
    Lieu VARCHAR(30)
);

--*2) insertion des donnees dans les tables
--table  Emp
INSERT INTO Emp
        (NomE,Fonction,Embauche,Salaire,Comm,NumD)
    VALUES
        ('Anas','President','1979-10-10',10000,NULL,NULL),
        ('Amine','Doyen','2006-01-01',5000,NULL,1),
        ('Saber','Stagiaire','2006-10-01',0,NULL,1),
        ('Med','Commercial','2006-10-01',5000,100,2);

--table dept
INSERT INTO dept
        (NumD,NomD,Lieu)
    VALUES
        (1,'Droit','Sousse'),
        (2,'Commerce','Tunis');

--*3) Ecrire les requêtes suivantes en langage SQL:
--a. Donnez la liste des employés ayant une commission (Comm) (non NULL) classé par commission décroissante
SELECT *
FROM Emp
WHERE Comm IS NOT NULL
ORDER BY Comm DESC;
--b. Donnez les noms des personnes embauchées depuis le 01-09-2006
SELECT NomE
FROM Emp
WHERE Embauche >= '2006-10-01';
--c. Donnez la liste des employés travaillant à Créteil
SELECT E.*
FROM Emp E,Dept D
WHERE E.NumD=D.NumD AND Lieu = 'Créteil';
--d. Donnez la liste des subordonnés de "Anas"
SELECT *
FROM Emp
WHERE Fonction != 'president';
--e. Donnez la moyenne des salaires.
SELECT AVG(Salaire) AS moyenne_salaires
FROM Emp;
--f. Donnez le nombre de commissions non NULL.
SELECT COUNT(*) AS nb_comm
FROM Emp
WHERE Comm IS NOT NULL;
--g. Donnez la liste des employés gagnant plus que la moyenne des salaires de l’entreprise
SELECT *
FROM Emp 
WHERE salaire > 
(SELECT AVG(salaire)
 FROM Emp
);




