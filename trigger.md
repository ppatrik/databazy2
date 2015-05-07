# Uloha
```
DROP TRIGGER ucfirst_for_Osoba;

CREATE TRIGGER ucfirst_for_Osoba
ON Osoba
AFTER INSERT, UPDATE
AS
BEGIN
  UPDATE Osoba
  SET Osoba.meno = CONCAT(UPPER(SUBSTRING(Osoba.meno, 1, 1)), LOWER(RIGHT(Osoba.meno, LEN(Osoba.meno)-1))),
  Osoba.priezvisko = CONCAT(UPPER(SUBSTRING(Osoba.priezvisko, 1, 1)), LOWER(RIGHT(Osoba.priezvisko, LEN(Osoba.priezvisko)-1))),
  Osoba.rodne_priezvisko = CONCAT(UPPER(SUBSTRING(Osoba.rodne_priezvisko, 1, 1)), LOWER(RIGHT(Osoba.rodne_priezvisko, LEN(Osoba.rodne_priezvisko)-1)))
  FROM inserted AS i
  WHERE i.id = Osoba.id
END;

DELETE FROM Osoba WHERE id=100;
Insert into Osoba VALUES (100, 'jozo', 'mrkvicka', 'jozkovic', GETDATE(), GETDATE(), 'm', 200, 300, NULL, NULL);
SELECT * FROM Osoba WHERE id=100;
UPDATE Osoba SET meno='paTrik' WHERE id=100;
UPDATE Osoba SET priezvisko='malÝ' WHERE id=100;
UPDATE Osoba SET rodne_priezvisko='maliSt' WHERE id=100;
SELECT * FROM Osoba WHERE id=100;
```
