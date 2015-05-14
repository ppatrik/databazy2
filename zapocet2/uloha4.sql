USE OsobaVztah;
GO

-- Úloha è. 4
DROP TRIGGER ucfirst_for_Osoba;

CREATE TRIGGER ucfirst_for_Osoba
ON Osoba
AFTER INSERT, UPDATE
AS
BEGIN
  UPDATE Osoba
  SET Osoba.meno = CONCAT(UPPER(SUBSTRING(Osoba.meno, 1, 1)), LOWER(RIGHT(Osoba.meno, LEN(Osoba.meno)-1))),
	Osoba.priezvisko = CONCAT(UPPER(SUBSTRING(Osoba.priezvisko, 1, 1)), LOWER(RIGHT(Osoba.priezvisko, LEN(Osoba.priezvisko)-1)))
  FROM inserted AS i
  WHERE i.id = Osoba.id;

  declare @dat_smrti datetime
  set @dat_smrti = (select top 1 dat_smrti from inserted)

  IF @dat_smrti IS NOT NULL BEGIN
	  UPDATE Vztah SET Vztah.do = @dat_smrti FROM inserted AS i WHERE i.id IN (Vztah.id_on, Vztah.id_ona) 
  END
END;

SELECT * FROM Vztah
SELECT * FROM Osoba
Update Osoba Set rodne_priezvisko = 'a' where id=5
Update Osoba SET dat_smrti = '2014-01-01' WHERE id=5;
SELECT * FROM Vztah
Update Vztah SET do = null where id=5
