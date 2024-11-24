-- Les procédure doivent être crées par le propriétaire de la bdd, car l'admin n'a pas les droits CREATE sur le schéma.

CREATE OR REPLACE FUNCTION lister_objet(nom_de_salle salle.nom_salle%TYPE)
 RETURNS SETOF objet
 LANGUAGE sql
 AS $$
    SELECT o.id_objet, o.nom_objet, o.id_salle
    FROM objet o
    INNER JOIN salle s ON s.id_salle = o.id_salle
    WHERE s.nom_salle = nom_de_salle;
 $$;

-- Utilisation :
-- SELECT * FROM lister_objet('Nom de la salle');