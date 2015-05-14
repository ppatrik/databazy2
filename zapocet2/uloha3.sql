USE OsobaVztah;
GO 

-- Uloha Ë. 3
DECLARE @meno VARCHAR(255)
DECLARE @priezvisko VARCHAR(255)
DECLARE @dat_nar DATETIME
DECLARE @vyska float
DECLARE @vaha float

DECLARE kurDB CURSOR FOR   
	SELECT meno, priezvisko, dat_nar, vyska, vaha FROM Osoba

OPEN kurDB    
FETCH NEXT FROM kurDB INTO @meno, @priezvisko, @dat_nar, @vyska, @vaha   
WHILE @@FETCH_STATUS = 0   BEGIN 
	DECLARE @vek int
	DECLARE @BMI int
	set @vek = DATEDIFF(YEAR, @dat_nar, GETDATE())
	set @vyska = @vyska / 100
	set @BMI = @vaha / (@vyska * @vyska)
	print @meno + N', ' + @priezvisko + N', ' + STR(@vek) + N' Rokov, BMI ' + COALESCE(STR(@BMI), N'Ned· sa vypoËÌtaù')
	FETCH NEXT FROM kurDB INTO @meno, @priezvisko, @dat_nar, @vyska, @vaha   
END 
CLOSE kurDB DEALLOCATE kurDB