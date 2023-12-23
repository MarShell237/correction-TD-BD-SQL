--*1 - Donner la liste des titres des représentations.
SELECT titre_representation 
FROM REPRESENTATIONS;
--*2 - Donner la liste des titres des représentations ayant lieu à l'opéra Bastille.
SELECT titre_representation
FROM REPRESENTATIONS
WHERE lieu='opera Bastille';
--*3 - Donner la liste des noms des musiciens et des titres des représentations auxquelles ils participent.
SELECT M.nom,R.titre_representation
FROM MUSICIEN M,REPRESENTATIONS
WHERE M.num_representation = R.num_representation;
--*4 - Donner la liste des titres des représentations, les lieux et les tarifs pour la journée du 14/09/96.
SELECT R.titre_representation,R.Lieu,P.tarifs
FROM REPRESENTATIONS R,PROGRAMMER R
WHERE P.date = '1996-09-14';