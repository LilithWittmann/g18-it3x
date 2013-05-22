drop database Moebelgeschaeft;
create database Moebelgeschaeft;
use Moebelgeschaeft;


CREATE TABLE Bestellung (
	BestNr int auto_increment primary key,
	KNr int,
	Datum date,
	status bool

	) ;


create table Produkt(
	ProNr int auto_increment primary key,
	Bezeichnung varchar(70),
	Bestand int

) ; 

create table Bestellposten
(
	ProNr int,
	BestNr int,
	Anzahl int
	primary key(ProNr, BestNr),
	foreign key(ProNr) references Produk(ProNr),
	foreign key(BestNr) references Bestellung(BestNR)
);



update table Produkt add column price double(10,2);

update table Produkt price = price * 1.05;

