-- ROLE
-- A partir de la base Gescom :
-- Créez un groupe marketing qui peut ajouter, modifier et supprimer des produits et des catégories, consulter des commandes, 
-- leur détails et les clients. Ce groupe ne peut rien faire sur les autres tables.

--création des utilisateurs

CREATE USER 'chakib'@'%' IDENTIFIED BY 'mdp1';
CREATE USER 'marion'@'%' IDENTIFIED BY 'mdp2';
CREATE USER 'fode'@'%' IDENTIFIED BY 'mdp3';


-- création du role marketing

DROP ROLE 'marketing';
CREATE ROLE 'marketing';

GRANT select,Insert,update,delete
On cas_gescom.products
To marketing;

GRANT select,Insert,update,delete
On cas_gescom.categories
To marketing;

GRANT select
On cas_gescom.orders
To marketing;

GRANT select
On cas_gescom.orders_details
To marketing;


--------------------------------------------------------------------------------------------------------------------------------------------------
-- Sauvegarde

-- Présentez la commande de backup de la base Gescom et assurez-vous que la restauration fonctionne.

-- <br<

