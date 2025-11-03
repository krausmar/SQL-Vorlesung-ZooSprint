-- Intent: Zählt die Gesamtzahl der eindeutigen Besucher, die an mindestens einer Führung teilgenommen haben.
-- Tables/keys: Besucher_Fuehrung
SELECT COUNT(DISTINCT besucher_id) AS anzahl_fuehrungsbesucher
FROM Besucher_Fuehrung;

-- Intent: Findet heraus, wie viele eindeutige Besucher an einer Führung teilgenommen haben, die in einem Gehege stattfand, in dem Pinguine leben.
-- Tables/keys: Besucher_Fuehrung -> Führung -> Gehege -> Tier -> Tierart
SELECT COUNT(DISTINCT bf.besucher_id) AS anzahl_besucher_pinguine
FROM Besucher_Fuehrung bf
JOIN Führung f ON bf.fuehrungs_id = f.fuehrungs_id
JOIN Gehege g ON f.gehege_id = g.gehege_id
JOIN Tier t ON g.gehege_id = t.gehege_id
JOIN Tierart ta ON t.art_id = ta.art_id
WHERE ta.name = 'Pinguin';

-- Intent: Listet Nahrungstypen auf, die von Tieren in mehr als einem unterschiedlichen Gehege gefressen werden.
-- Tables/keys: Nahrungstyp -> Tier_Nahrungstyp -> Tier -> Gehege
SELECT
    n.name AS nahrungstyp,
    COUNT(DISTINCT t.gehege_id) AS anzahl_verschiedener_gehege
FROM Nahrungstyp n
JOIN Tier_Nahrungstyp tn ON n.nahrungs_id = tn.nahrungs_id
JOIN Tier t ON tn.tier_id = t.tier_id
GROUP BY n.name
HAVING COUNT(DISTINCT t.gehege_id) > 1;