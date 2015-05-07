CREATE DATABASE DatabazyPatrik

go

USE DatabazyPatrik

go

/*==============================================================*/
/* Table: Predmet                                               */
/*==============================================================*/
create table Predmet (
   predmet_id           bigint               not null,
   skola_id             bigint               null,
   Názov                text                 null,
   Oblasť               text                 null,
   Laboratórium         bit                  null,
   constraint PK_PREDMET primary key nonclustered (predmet_id)
)
go

/*==============================================================*/
/* Table: Učiteľ                                                */
/*==============================================================*/
create table Učiteľ (
   ucitel_id            bigint               not null,
   skola_id             bigint               null,
   Meno                 text                 null,
   Priezvisko           text                 null,
   Pozícia              text                 null,
   constraint PK_UČITEĽ primary key nonclustered (ucitel_id)
)
go

/*==============================================================*/
/* Table: Škola                                                 */
/*==============================================================*/
create table Škola (
   skola_id             bigint               not null,
   Názov                text                 null,
   Adresa               text                 null,
   Mesto                text                 null,
   constraint PK_ŠKOLA primary key nonclustered (skola_id)
)
go

/*==============================================================*/
/* Table: Študent                                               */
/*==============================================================*/
create table Študent (
   student_id           bigint               not null,
   skola_id             bigint               null,
   Meno                 text                 null,
   Priezvisko           text                 null,
   Adresa               text                 null,
   constraint PK_ŠTUDENT primary key nonclustered (student_id)
)
go

/*==============================================================*/
/* Table: "Žiacka Knižka"                                       */
/*==============================================================*/
create table "Žiacka Knižka" (
   znamka_id            bigint               not null,
   predmet_id           bigint               null,
   ucitel_id            bigint               null,
   student_id           bigint               null,
   "Dátum čas"          datetime             null,
   Popis                text                 null,
   Známka               int                  null,
   constraint "PK_ŽIACKA KNIŽKA" primary key nonclustered (znamka_id)
)
go

alter table Predmet
   add constraint FK_PREDMET_REFERENCE_ŠKOLA foreign key (skola_id)
      references Škola (skola_id)
go

alter table Učiteľ
   add constraint FK_UČITEĽ_REFERENCE_ŠKOLA foreign key (skola_id)
      references Škola (skola_id)
go

alter table Študent
   add constraint FK_ŠTUDENT_REFERENCE_ŠKOLA foreign key (skola_id)
      references Škola (skola_id)
go

alter table "Žiacka Knižka"
   add constraint "FK_ŽIACKA K_REFERENCE_PREDMET" foreign key (predmet_id)
      references Predmet (predmet_id)
go

alter table "Žiacka Knižka"
   add constraint "FK_ŽIACKA K_REFERENCE_ŠTUDENT" foreign key (student_id)
      references Študent (student_id)
go

alter table "Žiacka Knižka"
   add constraint "FK_ŽIACKA K_REFERENCE_UČITEĽ" foreign key (ucitel_id)
      references Učiteľ (ucitel_id)
go

INSERT INTO Škola (skola_id, Názov, Adresa, Mesto) VALUES 
(1, 'UPJŠ', 'Jesenského 29', 'Košice'),
(2, 'Gym, P.O.Hviezdoslava', 'Hviezdoslavova 1', 'Kežmarok'),
(3, 'Gym, Kukučínova', 'Kukučínova 23', 'Poprad');

go

INSERT INTO Predmet (predmet_id, skola_id, Názov, Oblasť, Laboratórium) VALUES
(1, 1, 'Paz1a', 'Informatika', 1),
(2, 1, 'Paz1b', 'Informatika', 1),
(3, 1, 'Fyzika pre informatikov', 'Fyzika', 1),
(4, 2, 'Fyzika', 'Fyzika', 1),
(5, 2, 'Slovenský jazyk', 'Jazyk', 0),
(6, 3, 'Slovenský jazyk', 'Jazyk', 0);

go

INSERT INTO Učiteľ (ucitel_id, skola_id, Meno, Priezvisko, Pozícia) VALUES
(1, 1, 'František', 'Galčík', 'Informatika'),
(2, 2, 'Ivan', 'Duľa', 'Fyzika'),
(3, 2, 'Anna', 'Zubalová', 'Informatika'),
(4, 2, 'Teta', 'Petrašková', 'Jazyk'),
(5, 3, 'Paula', 'Andrašová', 'Jazyk');

go

INSERT INTO Študent (student_id, skola_id, Meno, Priezvisko, Adresa) VALUES
(1, 1, 'Jožko', 'Mrkvička', 'Poprad'),
(2, 2, 'Juraj', 'Kopernik', 'Kežmarok'),
(3, 3, 'Ivan', 'Malý', 'Košice');

go

INSERT INTO [Žiacka Knižka] (znamka_id, predmet_id, ucitel_id, student_id, [Dátum čas], Popis, Známka) VALUES
(1, 1, 1, 1, '2015-03-20', 'Midterm', 1),
(2, 4, 2, 2, '2015-03-22', 'Písomka - Optika', 2),
(3, 5, 2, 2, '2015-03-30', 'Diktát', 1);

go
