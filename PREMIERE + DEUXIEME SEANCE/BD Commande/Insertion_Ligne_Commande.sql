INSERT INTO Ligne_Commande (num_cmd,code_produit,quantite_commande)  VALUES
(1,'A0002',10),
(1,'A0002',10),
(1,'A0003',10),
(1,'A0004',20),
(2,'A0001',30),
(2,'A0003',40),
(3,'A0002',50);

--Insertion dans la colone Ligne_Commande
/*
CREATE TABLE Ligne_Commande(
    id_ligne SERIAL PRIMARY KEY,
    num_cmd INTEGER REFERENCES Commande(num_cmd) ON DELETE CASCADE,
    code_produit VARCHAR(25) REFERENCES Produit(code_produit) ON DELETE CASCADE,
    quantite_commande INT
);
*/