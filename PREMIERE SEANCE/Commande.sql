DROP TABLE IF EXISTS Client;
CREATE TABLE Client(
	Id_Client INTEGER PRIMARY KEY,
	nom_client VARCHAR(25),
	prenom_client VARCHAR(25),
	adress_client VARCHAR(25),
	ville_client VARCHAR(25)
);

DROP TABLE IF EXISTS Produit;
CREATE TABLE Produit(
	code_produit VARCHAR(25) PRIMARY KEY,
	libelle_produit VARCHAR(25),
	prix_unitaire INT
);

DROP TABLE IF EXISTS Commande;
CREATE TABLE Commande(
	num_cmd INTEGER PRIMARY KEY,
	date_cmd DATE,
	id_client INT
);

DROP TABLE IF EXISTS Ligne_Commande;
CREATE TABLE Ligne_Commande(
	num_commande INTEGER PRIMARY KEY,
	code_produit INTEGER REFERENCES Produit(code_produit),
	quantite_commande INT
);

DROP TABLE IF EXISTS Magasin;
CREATE TABLE Magasin(
	id_mag INTEGER PRIMARY KEY,
	nom_mag VARCHAR(25),
	ville_mag VARCHAR(25)
);

DROP TABLE IF EXISTS Stock;
CREATE TABLE Stock(
	id_mag INTEGER REFERENCES Magasin(id_mag),
	code_produit INTEGER REFERENCES Produit(code_produit),
	PRIMARY KEY (id_mag, code_produit),
	quantite_stock INT
);