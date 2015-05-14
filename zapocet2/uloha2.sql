USE tempdb;
GO

-- Uloha è. 2
CREATE FUNCTION dbo.daj_vek (@DOB DATE) 
RETURNS int
AS BEGIN
	DECLARE @VEK int
	set @VEK = DATEDIFF(YEAR, @DOB, GETDATE())
	RETURN(@VEK)
END

SELECT dbo.daj_vek('2011-02-04') AS 'vek';