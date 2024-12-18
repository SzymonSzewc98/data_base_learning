BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "orders" (
	"orderID"	INTEGER NOT NULL,
	"bookID"	INTEGER,
	"clientID"	INTEGER,
	"date"	TEXT NOT NULL,
	"status"	TEXT NOT NULL,
	PRIMARY KEY("orderID" AUTOINCREMENT),
	FOREIGN KEY("clientID") REFERENCES "clients"("clientID"),
	FOREIGN KEY("bookID") REFERENCES "books"("bookID")
);
INSERT INTO "orders" VALUES (1,4,2,'2014-10-08','waiting');
INSERT INTO "orders" VALUES (3,1,9,'2014-10-11','sent');
INSERT INTO "orders" VALUES (4,2,2,'2014-10-15','sent');
INSERT INTO "orders" VALUES (5,5,6,'2014-08-12','sent');
INSERT INTO "orders" VALUES (6,2,3,'2014-10-20','sent');
INSERT INTO "orders" VALUES (7,3,4,'2014-08-14','sent');
INSERT INTO "orders" VALUES (8,1,8,'2014-08-19','sent');
INSERT INTO "orders" VALUES (9,5,3,'2014-11-19','sent');
INSERT INTO "orders" VALUES (10,2,9,'2014-12-28','waiting');
INSERT INTO "orders" VALUES (11,3,7,'2016-01-01','waiting');
COMMIT;
