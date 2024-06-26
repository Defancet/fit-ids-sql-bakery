DROP TABLE Objednavka_Pecivo_MN;
DROP TABLE NakupSurovin_Surovina_MN;
DROP TABLE Surovina_Pecivo_MN;
DROP TABLE NakupSurovin;
DROP TABLE RozvozPekarnouSPEC;
DROP TABLE OdberZakaznikemSPEC;
DROP TABLE Zamestnanec;
DROP TABLE Pecivo;
DROP TABLE Surovina;
DROP TABLE Vozidlo;
DROP TABLE Objednavka;
DROP TABLE Zakaznik;
DROP TABLE Adresa;

CREATE TABLE Adresa
(
    ID_Adresy INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    PSC INT CHECK ( PSC like '_____' ),
    Mesto VARCHAR(20),
    Ulice VARCHAR(20),
    Cislo_Popisne INT
);

INSERT INTO Adresa (PSC, Mesto, Ulice, Cislo_Popisne) VALUES (12345, 'Brno', 'Bozetechova', 5);
INSERT INTO Adresa (PSC, Mesto, Ulice, Cislo_Popisne) VALUES (45678, 'Ostrava', 'Ulicni', 456);
INSERT INTO Adresa (PSC, Mesto, Ulice, Cislo_Popisne) VALUES (14785, 'Vsetin', 'Cesta', 789);
INSERT INTO Adresa (PSC, Mesto, Ulice, Cislo_Popisne) VALUES (96352, 'Zlin', 'Path', 21);
INSERT INTO Adresa (PSC, Mesto, Ulice, Cislo_Popisne) VALUES (15935, 'Kromeriz', 'Silnice', 999);

CREATE TABLE Zamestnanec
(
    IČO INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Jmeno VARCHAR(20),
    Prijmeni VARCHAR(20),
    ID_Adresy INT REFERENCES Adresa (ID_Adresy),
    Email VARCHAR(50) CHECK ( Email like '%@%.%' ),
    Telefon INT CHECK ( Telefon like '_________' ),
    Pozice VARCHAR(20),
    Datum_Nastupu DATE
);

INSERT INTO Zamestnanec (Jmeno, Prijmeni, ID_Adresy, Email, Telefon, Pozice, Datum_Nastupu) VALUES ( 'Pepa', 'Voprsalek', 5, 'pepa@seznam.cz', 123456789, 'Ridic', TO_DATE('2003/05/03 21:59:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Zamestnanec (Jmeno, Prijmeni, ID_Adresy, Email, Telefon, Pozice, Datum_Nastupu) VALUES ( 'Franta', 'Surname', 4, 'franta@gmail.com', 987654321, 'Ridic', TO_DATE('2004/05/03 12:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Zamestnanec (Jmeno, Prijmeni, ID_Adresy, Email, Telefon, Pozice, Datum_Nastupu) VALUES ( 'Miroslav', 'Sekyra', 3, 'mira@centrum.cz', 456789123, 'Pekar', TO_DATE('2006/05/03 23:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Zamestnanec (Jmeno, Prijmeni, ID_Adresy, Email, Telefon, Pozice, Datum_Nastupu) VALUES ( 'Aneta', 'Prijmeni', 2, 'ani@fit.vutbr.cz', 456938271, 'Vedouci', TO_DATE('2023/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Zamestnanec (Jmeno, Prijmeni, ID_Adresy, Email, Telefon, Pozice, Datum_Nastupu) VALUES ( 'Petra', 'Novakova', 1, 'peta@outlook.com', 145236789, 'Pekar', TO_DATE('2093/08/03 21:02:59', 'yyyy/mm/dd hh24:mi:ss'));


CREATE TABLE Zakaznik
(
    ID_Zakaznika INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Jmeno VARCHAR(20),
    Prijmeni VARCHAR(20),
    ID_Adresy INT REFERENCES Adresa (ID_Adresy),
    Email VARCHAR(50) CHECK ( Email like '%@%.%' ),
    Telefon INT CHECK ( Telefon like '_________' )
);

INSERT INTO Zakaznik (Jmeno, Prijmeni, ID_Adresy, Email, Telefon) VALUES ('David', 'Jiri', 3, 'david@gmail.com', 123456789);
INSERT INTO Zakaznik (Jmeno, Prijmeni, ID_Adresy, Email, Telefon) VALUES ('Bara', 'Prijmeni', 3, 'bara@gmail.com', 456852369);
INSERT INTO Zakaznik (Jmeno, Prijmeni, ID_Adresy, Email, Telefon) VALUES ('Emily', 'Dochazi', 2, 'lily@gmail.com', 745896321);
INSERT INTO Zakaznik (Jmeno, Prijmeni, ID_Adresy, Email, Telefon) VALUES ('Emil', 'Nevim', 4, 'em@gmail.com', 256987413);
INSERT INTO Zakaznik (Jmeno, Prijmeni, ID_Adresy, Email, Telefon) VALUES ('Vilem', 'Novak', 5, 'vilda@gmail.com', 561423789);
INSERT INTO Zakaznik (Jmeno, Prijmeni, ID_Adresy, Email, Telefon) VALUES ('Nekdo', 'Neuricty', 5, 'nidko@gmail.com', 658932147);
INSERT INTO Zakaznik (Jmeno, Prijmeni, ID_Adresy, Email, Telefon) VALUES ('Bob', 'Bobovic', 5, 'bob@gmail.com', 125639874);


CREATE TABLE NakupSurovin
(
    ID_Nakladu INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Datum DATE,
    Cena FLOAT,
    ICO_Zamestnance INT NOT NULL REFERENCES Zamestnanec(IČO)
);

INSERT INTO NakupSurovin (Datum, Cena, ICO_Zamestnance) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), 300000, 4);
INSERT INTO NakupSurovin (Datum, Cena, ICO_Zamestnance) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), 5000, 4);
INSERT INTO NakupSurovin (Datum, Cena, ICO_Zamestnance) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), 15000, 4);
INSERT INTO NakupSurovin (Datum, Cena, ICO_Zamestnance) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), 8000, 4);
INSERT INTO NakupSurovin (Datum, Cena, ICO_Zamestnance) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), 16000, 4);


CREATE TABLE Pecivo
(
    ID_Peciva INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nazev VARCHAR(20),
    Popis VARCHAR(100),
    Cena_Za_Kus FLOAT,
    Postup_pečení VARCHAR(200),
    Mnozstvi_Na_Sklade INT
);

INSERT INTO Pecivo (Nazev, Popis, Cena_Za_Kus, Postup_pečení, Mnozstvi_Na_Sklade) VALUES ('Rohlik', 'klasicke pecivo', 2.50, 'recept', 500);
INSERT INTO Pecivo (Nazev, Popis, Cena_Za_Kus, Postup_pečení, Mnozstvi_Na_Sklade) VALUES ('Chleba', 'chleba jo', 30.99, 'recept', 100);
INSERT INTO Pecivo (Nazev, Popis, Cena_Za_Kus, Postup_pečení, Mnozstvi_Na_Sklade) VALUES ('Kaiserka', 'kaiserka', 5.40, 'recept', 250);
INSERT INTO Pecivo (Nazev, Popis, Cena_Za_Kus, Postup_pečení, Mnozstvi_Na_Sklade) VALUES ('Kaiserka Cerealni', 'kaiserka ktera je cerealni', 6.90, 'recept', 250);
INSERT INTO Pecivo (Nazev, Popis, Cena_Za_Kus, Postup_pečení, Mnozstvi_Na_Sklade) VALUES ('Bageta', 'prerostly rohlik', 8.50, 'recept', 200);


CREATE TABLE Surovina
(
    ID_Suroviny INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nazev VARCHAR(20),
    Popis VARCHAR(500),
    Jednotka VARCHAR(10),
    Cena_Za_Jednotku INT,
    Jednotek_Na_Sklade INT
);

INSERT INTO Surovina (Nazev, Popis, Jednotka, Cena_Za_Jednotku, Jednotek_Na_Sklade) VALUES ('Polohruba mouka', 'mouka ktera neni ani hruba ani hladka', 'KG', 25, 500);
INSERT INTO Surovina (Nazev, Popis, Jednotka, Cena_Za_Jednotku, Jednotek_Na_Sklade) VALUES ('Mleko', 'polotucne', 'L', 30, 100);
INSERT INTO Surovina (Nazev, Popis, Jednotka, Cena_Za_Jednotku, Jednotek_Na_Sklade) VALUES ('Vejce', 'slepici', 'ks', 4, 700);
INSERT INTO Surovina (Nazev, Popis, Jednotka, Cena_Za_Jednotku, Jednotek_Na_Sklade) VALUES ('Olej', 'slunecnicovy', 'L', 40, 50);
INSERT INTO Surovina (Nazev, Popis, Jednotka, Cena_Za_Jednotku, Jednotek_Na_Sklade) VALUES ('Drozdi', 'kvasnice', 'ks', 10, 75);


CREATE TABLE Vozidlo
(
    StatniPoznavaciZnacka VARCHAR(8) NOT NULL PRIMARY KEY CHECK ( StatniPoznavaciZnacka like '___:____' ),
    Znacka VARCHAR(20),
    Kapacita INT,
    Stav VARCHAR(100)
);

INSERT INTO Vozidlo VALUES ('3O5:7894', 'Tatra', 30, 'Pripraveno');
INSERT INTO Vozidlo VALUES ('3U5:7893', 'Man', 25, 'Pripraveno');
INSERT INTO Vozidlo VALUES ('3A5:7892', 'Tatra', 20, 'Pripraveno');
INSERT INTO Vozidlo VALUES ('3B5:7891', 'Man', 35, 'Zaneprazdneno');
INSERT INTO Vozidlo VALUES ('3Z8:7899', 'Man', 40, 'Servis');
INSERT INTO Vozidlo VALUES ('4B5:7899', 'Skoda', 40, 'Pripraveno');
INSERT INTO Vozidlo VALUES ('6B5:7899', 'Skoda', 40, 'Pripraveno');



CREATE TABLE Objednavka
(
    ID_Objednavky INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Datum_Objednani DATE,
    Datum_Dodani DATE,
    Cena FLOAT,
    Stav VARCHAR(50),
    ID_Zakaznika INT NOT NULL REFERENCES Zakaznik(ID_Zakaznika)
);

INSERT INTO Objednavka (Datum_Objednani, Datum_Dodani, Cena, Stav, ID_Zakaznika) VALUES (TO_DATE('2023/05/25 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2023/05/30 21:02:59', 'yyyy/mm/dd hh24:mi:ss'), 20000, 'Zadána', 1);
INSERT INTO Objednavka (Datum_Objednani, Datum_Dodani, Cena, Stav, ID_Zakaznika) VALUES (TO_DATE('2023/04/16 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2023/05/30 21:02:59', 'yyyy/mm/dd hh24:mi:ss'), 150000, 'Peceni', 2);
INSERT INTO Objednavka (Datum_Objednani, Datum_Dodani, Cena, Stav, ID_Zakaznika) VALUES (TO_DATE('2023/04/08 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2023/04/12 21:02:59', 'yyyy/mm/dd hh24:mi:ss'), 5000, 'Rozvoz', 3);
INSERT INTO Objednavka (Datum_Objednani, Datum_Dodani, Cena, Stav, ID_Zakaznika) VALUES (TO_DATE('2023/03/26 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2023/03/30 21:02:59', 'yyyy/mm/dd hh24:mi:ss'), 30000, 'Vyzvednuti', 4);
INSERT INTO Objednavka (Datum_Objednani, Datum_Dodani, Cena, Stav, ID_Zakaznika) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2023/04/05 21:02:59', 'yyyy/mm/dd hh24:mi:ss'), 11111, 'Dokoncena', 4);
INSERT INTO Objednavka (Datum_Objednani, Datum_Dodani, Cena, Stav, ID_Zakaznika) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2023/04/05 21:02:59', 'yyyy/mm/dd hh24:mi:ss'), 15000, 'Dokoncena', 2);
INSERT INTO Objednavka (Datum_Objednani, Datum_Dodani, Cena, Stav, ID_Zakaznika) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2023/04/05 21:02:59', 'yyyy/mm/dd hh24:mi:ss'), 20000, 'Dokoncena', 2);
INSERT INTO Objednavka (Datum_Objednani, Datum_Dodani, Cena, Stav, ID_Zakaznika) VALUES (TO_DATE('2023/03/30 08:30:59', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2023/04/05 21:02:59', 'yyyy/mm/dd hh24:mi:ss'), 20000, 'Dokoncena', 2);


/*
 Pro modelování vztahu generalizace / specializace jsme se rozhodli použít způsob jedné hlavní tabulky,
 a dvou separátních pro každou specializaci, s primárními klíči odkazujicímí na primární klíč původní tabulky.
 Rozhodli jsme se tak protože nám to přišlo jako nejlogičtejší a nejpřehlednější způsob.
 Skládat všechno do jedné tabulky nám nepřišlo vhodné, protože u vyzvednutí zákazníkem by tabulka obsahovala zbytečně prázdné atributy.
 Stejná problém nastává při použití jedné tabulky pro nadtyp a druhé pro oba podtypy.
 */

CREATE TABLE RozvozPekarnouSPEC
(
    ID_Objednavky INT NOT NULL PRIMARY KEY REFERENCES Objednavka(ID_Objednavky),
    ID_Adresy INT REFERENCES Adresa(ID_Adresy),
    ID_Zamestnance INT REFERENCES Zamestnanec(IČO),
    ID_Vozidla VARCHAR(8) REFERENCES Vozidlo(StatniPoznavaciZnacka)
);

INSERT INTO RozvozPekarnouSPEC VALUES (1, 1, 2, '3B5:7891');
INSERT INTO RozvozPekarnouSPEC VALUES (2, 2, 2, '3O5:7894');
INSERT INTO RozvozPekarnouSPEC VALUES (3, 3, 2, '3B5:7891');
INSERT INTO RozvozPekarnouSPEC VALUES (5, 3, 2, '3U5:7893');
INSERT INTO RozvozPekarnouSPEC VALUES (6, 3, 2, '3U5:7893');
INSERT INTO RozvozPekarnouSPEC VALUES (7, 3, 1, '4B5:7899');
INSERT INTO RozvozPekarnouSPEC VALUES (8, 3, 1, '6B5:7899');

CREATE TABLE OdberZakaznikemSPEC
(
    ID_Objednavky INT NOT NULL PRIMARY KEY REFERENCES Objednavka(ID_Objednavky),
    CasVyzvednuti DATE
);

INSERT INTO OdberZakaznikemSPEC VALUES (4 , TO_DATE('2023/03/26 08:31:59', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO OdberZakaznikemSPEC VALUES (5 , TO_DATE('2023/03/28 08:30:59', 'yyyy/mm/dd hh24:mi:ss'));


CREATE TABLE Objednavka_Pecivo_MN
(
    ID_Objednavky INT NOT NULL REFERENCES Objednavka(ID_Objednavky),
    ID_Peciva INT NOT NULL REFERENCES Pecivo(ID_Peciva),
    Mnozstvi INT,
    PRIMARY KEY (ID_Objednavky, ID_Peciva)
);

INSERT INTO Objednavka_Pecivo_MN VALUES (1, 1, 30);
INSERT INTO Objednavka_Pecivo_MN VALUES (1, 4, 45);
INSERT INTO Objednavka_Pecivo_MN VALUES (1, 5, 100);
INSERT INTO Objednavka_Pecivo_MN VALUES (2, 1, 65);
INSERT INTO Objednavka_Pecivo_MN VALUES (3, 3, 60);
INSERT INTO Objednavka_Pecivo_MN VALUES (3, 1, 50);
INSERT INTO Objednavka_Pecivo_MN VALUES (4, 3, 90);
INSERT INTO Objednavka_Pecivo_MN VALUES (5, 4, 35);
INSERT INTO Objednavka_Pecivo_MN VALUES (5, 5, 30);


CREATE TABLE NakupSurovin_Surovina_MN
(
    ID_Nakupu INT NOT NULL REFERENCES NakupSurovin(ID_Nakladu),
    ID_Suroviny INT NOT NULL REFERENCES Surovina(ID_Suroviny),
    Mnozstvi INT,
    PRIMARY KEY (ID_Nakupu, ID_Suroviny)
);

INSERT INTO NakupSurovin_Surovina_MN VALUES (1, 2, 200);
INSERT INTO NakupSurovin_Surovina_MN VALUES (2, 3, 200);
INSERT INTO NakupSurovin_Surovina_MN VALUES (2, 5, 200);
INSERT INTO NakupSurovin_Surovina_MN VALUES (3, 4, 200);
INSERT INTO NakupSurovin_Surovina_MN VALUES (3, 1, 200);
INSERT INTO NakupSurovin_Surovina_MN VALUES (4, 1, 200);
INSERT INTO NakupSurovin_Surovina_MN VALUES (4, 2, 200);
INSERT INTO NakupSurovin_Surovina_MN VALUES (5, 4, 200);


CREATE TABLE Surovina_Pecivo_MN
(
    ID_Suroviny INT NOT NULL REFERENCES Surovina(ID_Suroviny),
    ID_Peciva INT NOT NULL REFERENCES Pecivo(ID_Peciva),
    PRIMARY KEY (ID_Suroviny, ID_Peciva)
);

INSERT INTO Surovina_Pecivo_MN VALUES (1, 1);
INSERT INTO Surovina_Pecivo_MN VALUES (1, 2);
INSERT INTO Surovina_Pecivo_MN VALUES (1, 4);
INSERT INTO Surovina_Pecivo_MN VALUES (2, 3);
INSERT INTO Surovina_Pecivo_MN VALUES (2, 2);
INSERT INTO Surovina_Pecivo_MN VALUES (3, 1);
INSERT INTO Surovina_Pecivo_MN VALUES (3, 2);
INSERT INTO Surovina_Pecivo_MN VALUES (3, 4);
INSERT INTO Surovina_Pecivo_MN VALUES (4, 5);
INSERT INTO Surovina_Pecivo_MN VALUES (4, 1);
INSERT INTO Surovina_Pecivo_MN VALUES (5, 1);
INSERT INTO Surovina_Pecivo_MN VALUES (5, 3);




-- PART 3 SELECTS ------------------------------------------------------------------------------------------------------

-- alespoň dva dotazy využívající spojení dvou tabulek
-- v jakem meste s jakym psc bydli zamestnanci
-- funkce v aplikaci - informacni
SELECT Jmeno, Prijmeni, Mesto, PSC FROM ZAMESTNANEC NATURAL JOIN Adresa;

-- který zamestnanec udělal nakup surovin (kdy a za jakou cenu)
-- funkce v aplikaci - hlidani vydaju, pro ucetni
SELECT Zamestnanec.Jmeno, Zamestnanec.Prijmeni, NakupSurovin.Cena, NakupSurovin.Datum FROM NakupSurovin JOIN Zamestnanec ON NakupSurovin.ICO_Zamestnance = Zamestnanec.IČO;

-- jeden využívající spojení tří (a více) tabulek
-- jake suroviny jsou potreba na pecivo
-- funkce v aplikaci - pro pekaře (recept)
SELECT Pecivo.Nazev, Pecivo.Popis, Surovina.Nazev, Surovina.Popis
FROM PECIVO JOIN Surovina_Pecivo_MN ON Pecivo.ID_Peciva = Surovina_Pecivo_MN.ID_Peciva JOIN SUROVINA on Surovina_Pecivo_MN.ID_Suroviny = Surovina.ID_Suroviny
ORDER BY Pecivo.Nazev;

-- který zamestnacec rozvazi objednavku a jakym vozidlem
-- funkce v aplikaci - pro rozvozovy kalendar
SELECT Zamestnanec.Jmeno, Zamestnanec.Prijmeni, Objednavka.ID_Objednavky AS Objednavka, Objednavka.Datum_Dodani, Vozidlo.StatniPoznavaciZnacka AS Vozidlo
FROM Objednavka JOIN RozvozPekarnouSPEC ON Objednavka.ID_Objednavky = RozvozPekarnouSPEC.ID_Objednavky
JOIN Zamestnanec ON RozvozPekarnouSPEC.ID_Zamestnance = Zamestnanec.IČO JOIN VOZIDLO ON RozvozPekarnouSPEC.ID_Vozidla = Vozidlo.StatniPoznavaciZnacka;

-- dva dotazy s klauzulí GROUP BY a agregační funkcí,
-- kolik celkem utratili jednotlivi zakaznici
-- funkce v aplikaci - informacni
SELECT Jmeno, Prijmeni, SUM(Objednavka.Cena) AS CelkovaCena FROM ZAKAZNIK NATURAL JOIN OBJEDNAVKA GROUP BY Jmeno, Prijmeni ORDER BY Prijmeni;

-- kolik zamestnancu pracuje na jednotlivych pozicich
-- funkce v aplikaci - infromacni - na jaké pozice je potřeba vypsat výběrové řízení
SELECT Pozice, COUNT(Pozice) AS Pocet FROM Zamestnanec GROUP BY Pozice;

-- jeden dotaz obsahující predikát EXISTS
-- ktery ridic jezdi pouze vozidlem znacky skoda a zadnou jinou znackou
SELECT DISTINCT Z.Jmeno, Z.Prijmeni, V.Znacka FROM Zamestnanec Z JOIN RozvozPekarnouSPEC R ON Z.IČO = R.ID_Zamestnance JOIN Vozidlo V ON R.ID_Vozidla = V.StatniPoznavaciZnacka
WHERE V.ZNACKA = 'Skoda' AND NOT EXISTS ( Select * FROM Vozidlo WHERE Z.IČO = R.ID_Zamestnance AND R.ID_Vozidla = V.StatniPoznavaciZnacka AND V.ZNACKA <> 'Skoda');

-- jeden dotaz s predikátem IN s vnořeným selectem (nikoliv IN s množinou konstantních dat)
-- ktere objednavky obsahuji v sobě pecivo rohlik
SELECT Objednavka.ID_Objednavky, Pecivo.Nazev, Pecivo.Popis, Objednavka_Pecivo_MN.Mnozstvi
FROM Objednavka JOIN Objednavka_Pecivo_MN ON Objednavka.ID_Objednavky = Objednavka_Pecivo_MN.ID_Objednavky JOIN Pecivo ON Objednavka_Pecivo_MN.ID_Peciva = Pecivo.ID_Peciva
WHERE Objednavka_Pecivo_MN.ID_Peciva IN ( SELECT Objednavka_Pecivo_MN.ID_Peciva FROM Objednavka_Pecivo_MN JOIN Pecivo ON Objednavka_Pecivo_MN.ID_Peciva = Pecivo.ID_Peciva WHERE Nazev = 'Rohlik')
ORDER BY Objednavka.ID_Objednavky;













-- Part 4 -------------------------------------------------------------------------------------------------------

-- vytvoření alespoň dvou netriviálních databázových triggerů vč. jejich předvedení,
CREATE OR REPLACE TRIGGER rozvozazet_muze_jen_ridic
    BEFORE INSERT ON RozvozPekarnouSPEC
    FOR EACH ROW
    DECLARE
        isDriver NUMBER(1);
    BEGIN
      SELECT CASE WHEN Pozice <> 'Ridic' THEN 1 ELSE 0 END
      INTO isDriver
      FROM Zamestnanec
      WHERE IČO = :NEW.ID_Zamestnance;

      IF isDriver = 1 THEN
        RAISE_APPLICATION_ERROR('Only drivers can be assigned to deliveries!');
      END IF;
    END;

-- zamestnanec s id 3 je pekar
-- INSERT INTO RozvozPekarnouSPEC VALUES (4, 2, 3, '3U5:7893');
-- insert into je zakomentovany aby bylo mozne spoustet skript (protoze vyhodi chybu)


CREATE OR REPLACE TRIGGER smaz_vstah_se_surovinou_on_pecivo_delete
    AFTER DELETE ON Pecivo
    FOR EACH ROW
    BEGIN
    DELETE FROM Surovina_Pecivo_MN
    WHERE ID_Peciva = :OLD.ID_Peciva;
    END;

SELECT * FROM SUROVINA_PECIVO_MN;
DELETE FROM Pecivo WHERE ID_Peciva = 2;

-- vytvoření alespoň dvou netriviálních uložených procedur vč. jejich předvedení, ve kterých se musí (dohromady) vyskytovat alespoň jednou kurzor, ošetření výjimek
-- a použití proměnné s datovým typem odkazujícím se na řádek či typ sloupce tabulky (table_name.column_name%TYPE nebo table_name%ROWTYPE),
-- procedura ktera vybere nejprodavanejsi pecivo v zadanem obdobi a vypise pocet prodanych kusu
CREATE OR REPLACE PROCEDURE NEJPRODAVANEJSI_PECIVO(
    datum_Od IN DATE,
    datum_Do IN DATE
) AS
    nazev_Peciva Pecivo.Nazev%TYPE;
    pocet INT;
BEGIN
    SELECT p.Nazev, SUM(op.Mnozstvi)
    INTO nazev_Peciva, pocet
    FROM Pecivo p
    JOIN Objednavka_Pecivo_MN op ON p.ID_Peciva = op.ID_Peciva
    JOIN Objednavka o ON op.ID_Objednavky = o.ID_Objednavky
    WHERE o.Datum_Dodani BETWEEN datum_Od AND datum_Do
    GROUP BY p.Nazev
    ORDER BY SUM(op.Mnozstvi) DESC
    FETCH FIRST 1 ROW ONLY;

    DBMS_OUTPUT.PUT_LINE('Nejprodávanější pečivo v období od ' || datum_Od || ' do ' || datum_Do || ':');
    DBMS_OUTPUT.PUT_LINE(nazev_Peciva || ': ' || pocet || ' ks');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('V zadaném období nebylo prodáno žádné pečivo.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Došlo k chybě:' || SQLERRM);
END;

BEGIN
    NEJPRODAVANEJSI_PECIVO(TO_DATE('2023/04/01', 'yyyy/mm/dd'), TO_DATE('2023/04/30', 'yyyy/mm/dd'));
END;

-- procedura ktera vypise pocet objednavek pro zakaznika s danym id s pouzitim kurzoru
CREATE OR REPLACE PROCEDURE ZOBRAZIT_POCET_OBJEDNAVEK(zakaznik_Id  IN Zakaznik.ID_Zakaznika%TYPE)
IS
    pocet NUMBER;
    jmeno_Zakaznika Zakaznik.Jmeno%TYPE;
    prijmeni_Zakaznika Zakaznik.Prijmeni%TYPE;
    cur SYS_REFCURSOR;
BEGIN
    SELECT Jmeno INTO jmeno_Zakaznika FROM Zakaznik WHERE ID_Zakaznika = zakaznik_Id;
    SELECT Prijmeni INTO prijmeni_Zakaznika FROM Zakaznik WHERE ID_Zakaznika = zakaznik_Id;

    OPEN cur FOR
        SELECT COUNT(*) FROM Objednavka WHERE ID_Zakaznika = zakaznik_Id;

  FETCH cur INTO pocet;
  CLOSE cur;

    DBMS_OUTPUT.PUT_LINE('Počet objednávek pro zákazníka ' || jmeno_Zakaznika || ' ' || prijmeni_Zakaznika || ' je ' || pocet);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Zákazník s ID ' || zakaznik_Id || ' neexistuje.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Došlo k chybě:' || SQLERRM);
END;

BEGIN
    ZOBRAZIT_POCET_OBJEDNAVEK(4);
END;

-- explicitní vytvoření alespoň jednoho indexu tak, aby pomohl optimalizovat zpracování dotazů, přičemž musí být uveden také příslušný dotaz, na který má index vliv,
-- a v dokumentaci popsán způsob využití indexu v tomto dotazy (toto lze zkombinovat s EXPLAIN PLAN, vizte dále)

-- alespoň jedno použití EXPLAIN PLAN pro výpis plánu provedení databazového dotazu se spojením alespoň dvou tabulek, agregační funkcí a klauzulí GROUP BY,
-- přičemž v dokumentaci musí být srozumitelně popsáno, jak proběhne dle toho výpisu plánu provedení dotazu, vč. objasnění použitých prostředků pro jeho urychlení
-- (např. použití indexu, druhu spojení, atp.), a dále musí být navrnut způsob, jak konkrétně by bylo možné dotaz dále urychlit (např. zavedením nového indexu),
-- navržený způsob proveden (např. vytvořen index), zopakován EXPLAIN PLAN a jeho výsledek porovnán s výsledkem před provedením navrženého způsobu urychlení,
EXPLAIN PLAN FOR
    SELECT Count(*)
    FROM Objednavka JOIN Objednavka_Pecivo_MN ON Objednavka.ID_Objednavky = Objednavka_Pecivo_MN.ID_Objednavky JOIN Pecivo ON Objednavka_Pecivo_MN.ID_Peciva = Pecivo.ID_Peciva
    WHERE Objednavka_Pecivo_MN.ID_Peciva IN ( SELECT Objednavka_Pecivo_MN.ID_Peciva FROM Objednavka_Pecivo_MN JOIN Pecivo ON Objednavka_Pecivo_MN.ID_Peciva = Pecivo.ID_Peciva WHERE Nazev = 'Rohlik')
    ORDER BY Objednavka.ID_Objednavky;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- sort agregate provádí agregační funkci
-- filter filtrace na základě podmínek
-- index fast full scann je prohledavani pomoci indexu primárního klíče
-- nested loops spojuje dve tabulky dohromady
-- table access by index rowid přístup k řádku pomocí indexu pk

CREATE INDEX tmp
ON Objednavka_Pecivo_MN (ID_OBJEDNAVKY);
CREATE INDEX tmp1
ON Objednavka_Pecivo_MN (ID_Peciva);

-- databáze nyní využívá index range scan prohledani s vyuzitim indexu
-- pridani indexu vysledek tohoto dotazu zrychli, u ceny(cost) došlo ke snížení asi o 3/5

-- definici přístupových práv k databázovým objektům pro druhého člena týmu,
GRANT ALL ON Objednavka_Pecivo_MN       TO XKALUT00;
GRANT ALL ON NakupSurovin_Surovina_MN   TO XKALUT00;
GRANT ALL ON Surovina_Pecivo_MN         TO XKALUT00;
GRANT ALL ON NakupSurovin               TO XKALUT00;
GRANT ALL ON RozvozPekarnouSPEC         TO XKALUT00;
GRANT ALL ON OdberZakaznikemSPEC        TO XKALUT00;
GRANT ALL ON Zamestnanec                TO XKALUT00;
GRANT ALL ON Pecivo                     TO XKALUT00;
GRANT ALL ON Surovina                   TO XKALUT00;
GRANT ALL ON Vozidlo                    TO XKALUT00;
GRANT ALL ON Objednavka                 TO XKALUT00;
GRANT ALL ON Zakaznik                   TO XKALUT00;
GRANT ALL ON Adresa                     TO XKALUT00;

-- vytvoření alespoň jednoho materializovaného pohledu patřící druhému členu týmu a používající tabulky definované prvním členem týmu (nutno mít již definována přístupová práva),
-- vč. SQL příkazů/dotazů ukazujících, jak materializovaný pohled funguje,
DROP MATERIALIZED VIEW MV_Aktualni_Stav_Surovin;

-- ziskat aktualni stav surovin na sklade
CREATE MATERIALIZED VIEW MV_Aktualni_Stav_Surovin AS
SELECT ID_Suroviny, Nazev, Jednotek_Na_Sklade
FROM Surovina;

GRANT ALL ON MV_Aktualni_Stav_Surovin TO XKALUT00;

-- vypis materializovaneho pohledu
SELECT * FROM MV_Aktualni_Stav_Surovin;

-- zmena poctu mouky na sklade
UPDATE Surovina
SET Jednotek_Na_Sklade = 360
WHERE ID_Suroviny = 1;

-- v materializovanem pohledu se zmena nezobrazi
SELECT * FROM MV_Aktualni_Stav_Surovin;


-- vytvoření jednoho komplexního dotazu SELECT využívajícího klauzuli WITH a operátor CASE. V poznámce musí být uvedeno, jaká data dotaz získává
-- vrací předpokládaný stav objednávky v závislosti na tom, kolik času zbývá do data donání
-- (TO_DATE('2023/04/01 08:31:59', 'yyyy/mm/dd hh24:mi:ss') by se nahradilo dnesnim datem - TRUNC(CURRENT_DATE))
SELECT Jmeno, Prijmeni, Datum_Dodani,
       CASE WHEN Cena > 100000 THEN 'Extra velka objednavka!'
           WHEN Datum_Dodani > TO_DATE('2023/04/01 08:31:59', 'yyyy/mm/dd hh24:mi:ss') + 20 THEN 'Casu dost'
           WHEN  Datum_Dodani > TO_DATE('2023/04/01 08:31:59', 'yyyy/mm/dd hh24:mi:ss') + 10 THEN 'Cas objednat suroviny'
           WHEN  Datum_Dodani > TO_DATE('2023/04/01 08:31:59', 'yyyy/mm/dd hh24:mi:ss') + 1 THEN 'Cas péci pecivo'
           ELSE 'Objednavka po datu donání'
       END AS Predpokladany_stav_objednavky
FROM Zakaznik NATURAL JOIN Objednavka;

COMMIT;