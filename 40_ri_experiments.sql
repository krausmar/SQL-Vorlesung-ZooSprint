-- Experiment 1:
-- Versuch, das Savannen-Gehege (ID 1) zu löschen, in dem sich Löwen befinden.
DELETE FROM Gehege WHERE gehege_id = 1;


-- Experiment 2:
-- 1. Fremdschlüssel mit ON DELETE CASCADE neu definieren 
ALTER TABLE Besucher_Fuehrung DROP FOREIGN KEY besucher_fuehrung_ibfk_2;
ALTER TABLE Besucher_Fuehrung ADD CONSTRAINT fk_fuehrung_cascade
FOREIGN KEY (fuehrungs_id) REFERENCES Führung(fuehrungs_id) ON DELETE CASCADE;

-- 2. Zustand VOR dem Löschen prüfen
SELECT * FROM Besucher_Fuehrung WHERE fuehrungs_id = 1;

-- 3. Die Führung mit der ID 1 ('Pinguin-Fütterung') löschen
DELETE FROM Führung WHERE fuehrungs_id = 1;

-- 4. Zustand NACH dem Löschen prüfen
SELECT * FROM Besucher_Fuehrung WHERE fuehrungs_id = 1;


-- Experiment 3:
-- 1. Fremdschlüssel mit ON DELETE SET NULL neu definieren und Spalte auf NULLable ändern
ALTER TABLE Tier DROP FOREIGN KEY tier_ibfk_1;
ALTER TABLE Tier MODIFY art_id INT NULL;
ALTER TABLE Tier ADD CONSTRAINT fk_art_set_null
FOREIGN KEY (art_id) REFERENCES Tierart(art_id) ON DELETE SET NULL;

-- 2. Zustand VOR dem Löschen prüfen
SELECT tier_id, name, art_id FROM Tier WHERE name = 'Rio';

-- 3. Die Tierart 'Papagei' (ID 3) löschen
DELETE FROM Tierart WHERE art_id = 3;

-- 4. Zustand NACH dem Löschen prüfen
SELECT tier_id, name, art_id FROM Tier WHERE name = 'Rio';