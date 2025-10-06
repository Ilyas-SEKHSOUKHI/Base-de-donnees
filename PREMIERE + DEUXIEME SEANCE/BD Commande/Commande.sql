
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Ligne_Commande;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Magasin;
DROP TABLE IF EXISTS Client;


CREATE TABLE Client(
    id_client INTEGER PRIMARY KEY,
    nom_client VARCHAR(25),
    prenom_client VARCHAR(25),
    adresse_client VARCHAR(50),
    ville_client VARCHAR(25)
);


CREATE TABLE Produit(
    code_produit VARCHAR(25) PRIMARY KEY,
    libelle_produit VARCHAR(50),
    prix_unitaire INT
);


CREATE TABLE Commande(
    num_cmd INTEGER PRIMARY KEY,
    date_cmd DATE,
    id_client INTEGER REFERENCES Client(id_client) ON DELETE CASCADE
);


CREATE TABLE Ligne_Commande(
    id_ligne SERIAL PRIMARY KEY,
    num_cmd INTEGER REFERENCES Commande(num_cmd) ON DELETE CASCADE,
    code_produit VARCHAR(25) REFERENCES Produit(code_produit) ON DELETE CASCADE,
    quantite_commande INT
);


CREATE TABLE Magasin(
    id_mag INTEGER PRIMARY KEY,
    nom_mag VARCHAR(25),
    ville_mag VARCHAR(25)
);


CREATE TABLE Stock(
    id_mag INTEGER REFERENCES Magasin(id_mag) ON DELETE CASCADE,
    code_produit VARCHAR(25) REFERENCES Produit(code_produit) ON DELETE CASCADE,
    quantite_stock INT,
    PRIMARY KEY (id_mag, code_produit)
);
