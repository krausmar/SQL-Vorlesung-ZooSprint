-- Eltern-Tabellen (ohne Fremdschlüssel)
CREATE TABLE Gehege (
    gehege_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    flaeche DECIMAL(10, 2),
    standort VARCHAR(255)
);

CREATE TABLE Tierart (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    durchschn_lebensdauer INT,
    nahrungstyp_haupt VARCHAR(255)
);

CREATE TABLE Pfleger (
    personal_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    qualifikation VARCHAR(255)
);

CREATE TABLE Besucher (
    besucher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    kontakt VARCHAR(255)
);

CREATE TABLE Nahrungstyp (
    nahrungs_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    preis DECIMAL(10, 2),
    menge VARCHAR(50),
    lagerort VARCHAR(255)
);

-- Kind-Tabelle (mit 1:n Beziehungen)
CREATE TABLE Tier (
    tier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    geburtsdatum DATE,
    geschlecht VARCHAR(10),
    eintrittsdatum DATE,
    art_id INT,
    gehege_id INT,
    FOREIGN KEY (art_id) REFERENCES Tierart(art_id),
    FOREIGN KEY (gehege_id) REFERENCES Gehege(gehege_id)
);

-- Angepasste Führungstabelle, um Stakeholder-Frage 2 zu beantworten
CREATE TABLE Führung (
    fuehrungs_id INT PRIMARY KEY AUTO_INCREMENT,
    datum DATETIME NOT NULL,
    thema VARCHAR(255),
    dauer INT, -- Dauer in Minuten
    gehege_id INT, -- Jede Führung ist einem Gehege zugeordnet
    FOREIGN KEY (gehege_id) REFERENCES Gehege(gehege_id)
);

-- Junction-Tabellen (für n:m Beziehungen)
CREATE TABLE Pfleger_Tier (
    personal_id INT,
    tier_id INT,
    PRIMARY KEY (personal_id, tier_id),
    FOREIGN KEY (personal_id) REFERENCES Pfleger(personal_id),
    FOREIGN KEY (tier_id) REFERENCES Tier(tier_id)
);

CREATE TABLE Tier_Nahrungstyp (
    tier_id INT,
    nahrungs_id INT,
    PRIMARY KEY (tier_id, nahrungs_id),
    FOREIGN KEY (tier_id) REFERENCES Tier(tier_id),
    FOREIGN KEY (nahrungs_id) REFERENCES Nahrungstyp(nahrungs_id)
);

CREATE TABLE Besucher_Fuehrung (
    besucher_id INT,
    fuehrungs_id INT,
    PRIMARY KEY (besucher_id, fuehrungs_id),
    FOREIGN KEY (besucher_id) REFERENCES Besucher(besucher_id),
    FOREIGN KEY (fuehrungs_id) REFERENCES Führung(fuehrungs_id)
);