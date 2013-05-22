DROP DATABASE Moebelgeschaeft;
CREATE database Moebelgeschaeft;
USE Moebelgeschaeft;


CREATE TABLE Bestellung (
	BestNr INT auto_increment PRIMARY KEY,
	KNr INT,
	Datum DATE,
	status BOOL
)  ENGINE = INNODB;


create table Produkt(
	ProNr int auto_increment PRIMARY KEY,
	Bezeichnung VARCHAR(70),
	Bestand INT

) ENGINE = INNODB; 

CREATE TABLE Bestellposten(
	ProNr INT NOT NULL,
	BestNr INT NOT NULL,
	Anzahl INT,
	PRIMARY KEY (ProNr,BestNr),
	FOREIGN KEY (ProNr) REFERENCES Produkt(ProNr),
	FOREIGN KEY (BestNr) REFERENCES Bestellung(BestNr)
) ENGINE=InnoDB;

ALTER TABLE Produkt ADD COLUMN Preis DOUBLE(10,2);
INSERT INTO Bestellung  (KNr,DATUM, Status) VALUES (1,DATE(NOW()),0);
INSERT INTO Produkt (Bezeichnung, Bestand,Preis) VALUES ("Foo", 21, 9000);
INSERT INTO Bestellposten (ProNr, BestNr, Anzahl) VALUES (1,1,42);
UPDATE Produkt SET Preis = Preis * 1.05;
DELETE FROM Bestellposten WHERE ProNr = 1;
DELETE FROM Produkt WHERE ProNr = 1;
