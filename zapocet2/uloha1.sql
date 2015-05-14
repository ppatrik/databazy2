USE tempdb;
GO

-- Uloha è. 1
DROP PROCEDURE delitelnost;
CREATE PROCEDURE delitelnost 
	@N int
OUTPUT
AS BEGIN
	DECLARE @A int
	DECLARE @SUM int
	set @SUM = 0
	WHILE @N > 0 BEGIN
		set @A = @N%10
		set @SUM = @SUM + @A
		set @N = @N/10
	END
	IF @SUM%3=0
		print 'ANO'
	ELSE print 'NIE'
END
-- Lukas povedal ze sa to ma len vypisat :)

EXEC delitelnost 102

