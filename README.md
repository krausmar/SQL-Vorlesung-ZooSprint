# Zoo-Aufgabe

Anlegen einer Datenbank mit mehreren Tabellen mit dem Thema `Zoo`.
Lernen von grundlegenden SQL Befehlen, Syntax und Arbeiten mit Tabellen in einer Datenbank.
[LAB NOTES](LAB_NOTES.md)

---

### ER-Diagramm
![ER-Diagramm](./screenshots/ER-Diagramm.png)

---

### Stakeholder-Fragen
- Wie viele Besucher haben an einer Führung teilgenommen?
- Wie viele Führungsbesucher haben die Tierart `Pinguine` gesehen?
- Gibt es Tierarten, die denselben Nahrungstyp teilen, aber in unterschiedlichen Gehegen leben?

---

### Beantwortung der Fragen mit SQL
**Frage 1:**
![Query zu Stakeholderfrage 1](./screenshots/Q1_result.png)

**Frage 2:**
![Query zu Stakeholderfrage 2](./screenshots/Q2_result.png)

**Frage 3:**
![Query zu Stakeholderfrage 3](./screenshots/Q3_result.png)

---

### Info
Da wir mit MySQL gearbeitet haben, brauchen wir kein `PRAGMA`-Befehl wie in SQLite nötig wäre, weil die Foreign-Key-Prüfung in MySQL standardmäßig aktiv ist.