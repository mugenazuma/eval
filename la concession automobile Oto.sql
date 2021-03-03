CREATE TABLE IF NOT EXISTS Client(
id_cli int,
cli_nom varchar(50),
cli_num int UNIQUE,
cli_prenom varchar(50),
cli_particuliers varchar(50),
cli_pro varchar(50)
,CONSTRAINT client_PK PRIMARY KEY (id_cli)
);

CREATE table IF NOT EXISTS employes (
id_empl int,
empl_nom varchar(50),
empl_prenom varchar(50),
empl_poste varchar(50)
,CONSTRAINT TABLE_PK PRIMARY KEY (id_empl)
);

CREATE TABLE IF NOT EXISTS vehicule (
id_veh int,
veh_immat int,
veh_neuf varchar(50),
veh_occasion varchar(50),
veh_prix int,
veh_particuliers varchar(50),
veh_utilitaire varchar(50)
,CONSTRAINT vehicule_PK PRIMARY KEY (id_veh)
);

CREATE TABLE IF NOT EXISTS affaire (
id_aff int,
aff_reparation varchar(50),
aff_entretien varchar(50),
aff_vente varchar(50),
aff_pose varchar(50)
,CONSTRAINT affaire_PK PRIMARY KEY (id_aff)
);

CREATE table IF NOT EXISTS paiement (
id_pai int,
pai_credit varchar(50),
pai_comptant varchar(50)
,CONSTRAINT TABLE_PK PRIMARY KEY (id_pai)
);

Create table IF NOT EXISTS contrat (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_empl INT(6) NOT NULL,
id_cli INT(6) NOT NULL,
veh_prix int(5),
dateContrat date,
CONSTRAINT `id_cli` FOREIGN KEY (`id_cli`) REFERENCES `client` (`id`),
CONSTRAINT `id_empl` FOREIGN KEY (`id_empl`) REFERENCES `employes` (`id`)
);

