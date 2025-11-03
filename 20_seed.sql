-- 1. Eltern-Tabellen füllen
INSERT INTO Gehege (name, flaeche, standort) VALUES
('Savanne', 5000.00, 'Sektor A'),
('Pinguinbucht', 800.50, 'Sektor C'),
('Tropenhaus', 1200.00, 'Sektor B');

INSERT INTO Tierart (name, durchschn_lebensdauer, nahrungstyp_haupt) VALUES
('Löwe', 12, 'Fleisch'),
('Pinguin', 15, 'Fisch'),
('Papagei', 50, 'Früchte');

INSERT INTO Pfleger (name, qualifikation) VALUES
('Anna Meier', 'Zootierpflegerin'),
('Ben Schmidt', 'Tierarzt');

INSERT INTO Besucher (name, kontakt) VALUES
('Familie Müller', 'mueller@email.com'),
('Schulklasse 3B', 'lehrer@schule.de'),
('Max Mustermann', 'max@domain.com');

INSERT INTO Nahrungstyp (name, preis, menge, lagerort) VALUES
('Frischer Fisch', 15.50, '10kg Kiste', 'Kühlhaus 1'),
('Rindfleisch', 25.00, '5kg Stück', 'Kühlhaus 2'),
('Tropenfrüchte-Mix', 30.00, '20kg Korb', 'Lagerhalle A');

-- 2. Kind-Tabellen füllen
INSERT INTO Tier (name, geburtsdatum, geschlecht, eintrittsdatum, art_id, gehege_id) VALUES
('Simba', '2020-05-10', 'männlich', '2021-01-15', 1, 1),
('Nala', '2019-08-22', 'weiblich', '2021-01-15', 1, 1),
('Kowalski', '2022-02-01', 'männlich', '2022-03-20', 2, 2),
('Skipper', '2021-11-15', 'männlich', '2022-03-20', 2, 2),
('Rio', '2015-06-30', 'männlich', '2016-01-10', 3, 3);

INSERT INTO Führung (datum, thema, dauer, gehege_id) VALUES
('2025-10-22 10:00:00', 'Pinguin-Fütterung', 45, 2),
('2025-10-22 14:00:00', 'Das Leben in der Savanne', 60, 1),
('2025-10-23 11:00:00', 'Die Vögel des Dschungels', 50, 3);

-- 3. Junction-Tabellen füllen
INSERT INTO Pfleger_Tier (personal_id, tier_id) VALUES
(1, 1), (1, 2), (1, 5),
(2, 3), (2, 4);

INSERT INTO Tier_Nahrungstyp (tier_id, nahrungs_id) VALUES
(1, 2), (2, 2), -- Löwen essen Rindfleisch
(3, 1), (4, 1), -- Pinguine essen Fisch
(5, 3); -- Papagei isst Früchte

INSERT INTO Besucher_Fuehrung (besucher_id, fuehrungs_id) VALUES
(1, 2), -- Familie Müller bei der Savannen-Führung
(2, 1), -- Schulklasse 3B bei der Pinguin-Fütterung
(3, 1), -- Max Mustermann auch bei den Pinguinen
(3, 3); -- Max Mustermann auch bei den Vögeln