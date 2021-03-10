-- Base de donnée gescom
-- fonctionnement:
-- le client choisi sa commande avec son mode de livraison, la commande contient un nombre de produits avec sa remise, ils sont proposé par le fournisseur.
-- le produit ou les produits peuvent être bloqué si rupture de stock, deplus ils appartiennent à une catégorie qui sont classé dans une sous-catégorie.
-- les employes travail dans un magasin, occupe des postes et sont managé par d'autres employés.
-- Cependant lors de l'écriture de la base de donnée sur sql, on met en 1er les tables qui ne contiennent pas de clé étrangère pour que le logiciel 
-- lise toutes les données et ensuite on indique les autres tables avec les clés étrangère.


DROP DATABASE if EXISTS gescom;             -- supprimer la base de données si elle existe
CREATE DATABASE gescom;                     -- créer la base de données
CREATE TABLE IF NOT EXISTS customers(       -- créer la table si elle n'existe pas
   Id_cust DECIMAL(15,2),
   cust_name VARCHAR(50),
   cust_adress VARCHAR(250),
   cus_creation_date DATE,
   cus_modification_date TIME,
   cus_password VARCHAR(50),
   PRIMARY KEY(Id_cust)                     -- Clé primaire
);

CREATE TABLE IF NOT EXISTS Livraison(
   Id_Livraison DECIMAL(15,2),
   liv_name VARCHAR(50),
   PRIMARY KEY(Id_Livraison)
);

CREATE TABLE IF NOT EXISTS Provider(
   Id_prov DECIMAL(15,2),
   prov_name VARCHAR(50),
   PRIMARY KEY(Id_prov)
);

CREATE TABLE IF NOT EXISTS stores(
   Id_stores DECIMAL(15,2),
   store_name VARCHAR(50),
   PRIMARY KEY(Id_stores)
);

CREATE TABLE IF NOT EXISTS posts(
   Id_posts DECIMAL(15,2),
   post_name VARCHAR(50),
   PRIMARY KEY(Id_posts)
);

CREATE TABLE IF NOT EXISTS Ordered(
   Id_Ordered DECIMAL(15,2),
   ord_paid_amount DECIMAL(15,2),
   ord_pay BOOLEAN,
   ord_adress VARCHAR(50),
   ord_number_phone CHAR(10),
   Id_cust DECIMAL(15,2) NOT NULL,
   PRIMARY KEY(Id_Ordered),
   FOREIGN KEY(Id_cust) REFERENCES customer(Id_cust) -- Clé étrangère
);

CREATE TABLE IF NOT EXISTS pick(
   Id_Ordered DECIMAL(15,2),
   Id_Livraison DECIMAL(15,2),
   PRIMARY KEY(Id_Ordered, Id_Livraison),
   FOREIGN KEY(Id_Ordered) REFERENCES Ordered(Id_Ordered),
   FOREIGN KEY(Id_Livraison) REFERENCES Livraison(Id_Livraison)
);

CREATE TABLE IF NOT EXISTS contain(
   Id_Product DECIMAL(15,2),
   Id_Ordered DECIMAL(15,2),
   nbr_de_produit VARCHAR(50),
   remise VARCHAR(50),
   PRIMARY KEY(Id_Product, Id_Ordered),
   FOREIGN KEY(Id_Product) REFERENCES Product(Id_Product),
   FOREIGN KEY(Id_Ordered) REFERENCES Ordered(Id_Ordered)
);

CREATE TABLE IF NOT EXISTS Product(
   Id_Product DECIMAL(15,2),
   pro_name VARCHAR(50),
   pro_reference VARCHAR(50),
   pro_coded VARCHAR(50),
   pro_physical_stocks VARCHAR(50),
   pro_alert_stocks VARCHAR(50),
   pro_color VARCHAR(50),
   pro_price_without_tax VARCHAR(50),
   pro_tva VARCHAR(50),
   pro_description VARCHAR(50),
   pro_date_Added VARCHAR(50),
   pro_modification_date VARCHAR(50),
   pro_photo VARCHAR(50),
   pro_blocked VARCHAR(50),
   Id_Category DECIMAL(15,2) NOT NULL,
   Id_prov DECIMAL(15,2) NOT NULL,
   PRIMARY KEY(Id_Product),
   FOREIGN KEY(Id_Category) REFERENCES Category(Id_Category),
   FOREIGN KEY(Id_prov) REFERENCES Provider(Id_prov)
);

