BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "clients" (
	"clientID"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"Surname"	TEXT NOT NULL,
	"city"	TEXT NOT NULL,
	PRIMARY KEY("clientID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "orders" (
	"orderID"	INTEGER NOT NULL,
	"bookID"	INTEGER,
	"clientID"	INTEGER,
	"date"	TEXT NOT NULL,
	"status"	TEXT NOT NULL,
	FOREIGN KEY("bookID") REFERENCES "books"("bookID"),
	PRIMARY KEY("orderID" AUTOINCREMENT),
	FOREIGN KEY("clientID") REFERENCES "clients"("clientID")
);
CREATE TABLE IF NOT EXISTS "books" (
	"bookID"	INTEGER NOT NULL,
	"AuthorName"	TEXT,
	"AuthorSurname"	TEXT,
	"Title"	TEXT,
	"price"	REAL,
	PRIMARY KEY("bookID" AUTOINCREMENT)
);
INSERT INTO "clients" VALUES (1,'Lukasz','Lewandowski','Poznan');
INSERT INTO "clients" VALUES (2,'Jan','Nowak','Katowice');
INSERT INTO "clients" VALUES (3,'Maciej','Wojcik','Bydgoszcz');
INSERT INTO "clients" VALUES (4,'Tomasz ','Mazur','Jelenia Gora');
INSERT INTO "clients" VALUES (5,'Michal','Zielinski','Krakow');
INSERT INTO "clients" VALUES (6,'Artur','Rutkowski','Kielce');
INSERT INTO "clients" VALUES (7,'Mateusz','Skorupa','Gdansk');
INSERT INTO "clients" VALUES (8,'Agnieszka','Psikuta','Lublin');
INSERT INTO "clients" VALUES (9,'Jerzy','Rutkowski','Rybnik');
INSERT INTO "clients" VALUES (10,'Anna','Dostojewska','Pułtusk');
INSERT INTO "clients" VALUES (11,'Franciszek','Jankowski','Chorzow');
INSERT INTO "clients" VALUES (12,'Marilin','Monroe','Los Angeles');
INSERT INTO "clients" VALUES (13,'John','Wayne','Los Angeles');
INSERT INTO "clients" VALUES (15,'Jerzy','Dudek','Warszawa');
INSERT INTO "orders" VALUES (1,4,2,'2014-10-08','waiting');
INSERT INTO "orders" VALUES (2,1,7,'2014-09-05','sent');
INSERT INTO "orders" VALUES (3,1,9,'2014-10-11','sent');
INSERT INTO "orders" VALUES (4,2,2,'2014-10-15','sent');
INSERT INTO "orders" VALUES (5,5,6,'2014-08-12','sent');
INSERT INTO "orders" VALUES (6,2,3,'2014-10-20','sent');
INSERT INTO "orders" VALUES (7,3,4,'2014-08-14','sent');
INSERT INTO "orders" VALUES (8,1,8,'2014-08-19','sent');
INSERT INTO "orders" VALUES (9,5,3,'2014-11-19','sent');
INSERT INTO "orders" VALUES (10,2,9,'2014-12-28','waiting');
INSERT INTO "orders" VALUES (11,3,7,'2016-01-01','waiting');
INSERT INTO "books" VALUES (1,'Jan','Michalak','Zaawansowane programowanie w PHP',52.02);
INSERT INTO "books" VALUES (2,'Andrzej','Krawczyk','Windows 8 PL. Zaawansowana administracja systemem',54.99);
INSERT INTO "books" VALUES (3,'Pawel','Jakubowski','HTML5. Tworzenie witryn',49.02);
INSERT INTO "books" VALUES (4,'Tomasz','Kowalski','Urzadzenia techniki komputerowej',37.57);
INSERT INTO "books" VALUES (5,'Lukasz','Pasternak','PHP. Tworzenie nowoczesnych stron WWW',32.99);
INSERT INTO "books" VALUES (6,NULL,'Grebosz','Symfonia C++',NULL);
COMMIT;
