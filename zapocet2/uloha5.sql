Use OsobaVztah;
GO

-- Uloha è. 5
CREATE NONCLUSTERED INDEX IX_Osoba_Vaha_Vyska
    ON Osoba (vaha, vyska)
    WHERE vyska > 160;
GO