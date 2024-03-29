houssam est bo
--Exo1--

CREATE DATABASE projet5 CHARACTER SET 'utf8';

--Exo2--

CREATE USER 'hugo'@'192.168.43.223' IDENTIFIED BY 'coding';
GRANT ALL ON projet5.* TO 'hugo'@'192.168.43.223';
FLUSH PRIVILEGES;
(DROP USER 'hugo'@'192.168.43.223')

--Exo3--

CREATE TABLE IF NOT EXISTS Utilisateurs(
	Id_user int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    User_name varchar(20) NOT NULL,
    User_firstname varchar(20) NOT NULL,
 	User_email varchar(100) NOT NULL,
    User_phone varchar(10) NOT NULL,
    User_adresse varchar(100) NOT NULL,
 	User_code_postal varchar(5) NOT NULL,
    User_role VARCHAR(15) NOT NULL,
    User_password varchar(150) NOT NULL,
 	PRIMARY KEY (Id_user)
	)
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS football_team(
	Id_team_f int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	Team_name VARCHAR(50) NOT NULL,
    Team_create DATE NOT NULL,
    Site_team VARCHAR(100) NOT NULL,
    PRIMARY KEY (Id_team_f)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS football_player(
	Id_player_f int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Name_player_f VARCHAR(20) NOT NULL,
    Firstname_player_f VARCHAR(20) NOT NULL,
    Age_player_f VARCHAR(2) NOT NULL,
    J_id_team_f int(10) UNSIGNED NOT NULL,
    Titulaire_player_f VARCHAR(20) NOT NULL,
    FOREIGN KEY (J_id_team_f) REFERENCES football_team (Id_team_f) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_player_f)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS matchs_football(
	Id_match_f int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Date_match_f DATETIME NOT NULL,
    Id_team_inside_f int(10) UNSIGNED NOT NULL,
    Id_team_outside_f int(10) UNSIGNED NOT NULL,
    Nbr_but_inside_f int(10) UNSIGNED NOT NULL,
    Nbr_but_outside_f int(10) UNSIGNED NOT NULL,
    FOREIGN KEY (Id_team_inside_f) REFERENCES football_team (Id_team_f) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_team_outside_f) REFERENCES football_team (Id_team_f) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_match_f)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS players_tennis(
	Id_player_t int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Name_player_t VARCHAR(20) NOT NULL,
    Firstname_player_t VARCHAR(20) NOT NULL,
    Age_player_t VARCHAR(2) NOT NULL,
    Nbr_medal_t VARCHAR(3),
    PRIMARY KEY (Id_player_t)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS matchs_tennis(
	Id_match_t int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Date_match_t DATETIME NOT NULL,
    Location_match_t VARCHAR(40) NOT NULL,
    Surface_t VARCHAR(30) NOT NULL,
    Id_first_player_t int(10) UNSIGNED NOT NULL,
    Id_secondary_player_t int(10) UNSIGNED NOT NULL,
    Speed_shot_first_player_t int(3) NOT NULL,
    Speed_shot_secondary_player_t int(3) NOT NULL,
    Speedrun_first_player_t int(2) NOT NULL,
    Speedrun_secondary_player_t int(2) NOT NULL,
    Result_match_t VARCHAR(1) NOT NULL,
	FOREIGN KEY (Id_first_player_t) REFERENCES players_tennis (Id_player_t) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_secondary_player_t) REFERENCES players_tennis (Id_player_t) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_match_t)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS chevaux_hippique(
	Id_horse int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Name_horse VARCHAR(70) NOT NULL,
    Age_horse int(2) NOT NULL,
    Picture_horse VARCHAR(100) NOT NULL,
    Date_veterinaire DATE NOT NULL,
    PRIMARY KEY (Id_horse)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS jockeys_hippique(
	Id_jockey int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Name_jockey VARCHAR(20) NOT NULL,
    Firstname_jockey VARCHAR(20) NOT NULL,
    Age_jockey int(2) NOT NULL,
    Weight_jockey int(3) NOT NULL,
    Id_horse_j int(10) UNSIGNED NOT NULL,
    FOREIGN KEY (Id_horse_j) REFERENCES chevaux_hippique (Id_horse) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_jockey)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS race_hippiques(
	Id_race int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Time_race DATETIME NOT NULL,
    Location_race VARCHAR(40) NOT NULL,
    Weather_race VARCHAR(20) NOT NULL,
    PRIMARY KEY (Id_race)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS classement_horse_race(
	Id_classement_h int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Id_race_c int(10)UNSIGNED NOT NULL,
    Id_horse_c int(10)UNSIGNED NOT NULL,
    Classement_horse int(2) NOT NULL,
    Speed_horse int(3) NOT NULL,
    FOREIGN KEY (Id_race_c) REFERENCES race_hippiques (Id_race) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_horse_c) REFERENCES chevaux_hippique (Id_horse) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_classement_h)
    )
ENGINE=InnoDB;

--Exo4--

INSERT INTO `Utilisateurs`(`User_name`, `User_firstname`, `User_email`, `User_phone`, `User_adresse`, `User_code_postal`, `User_role`, `User_password`)
VALUES ("DEBUCHY","Florent","florent.debuchy@edu.itescia.fr","0634827604","45 rue des boustipailles","48370","Admin3","LemotDePasseCriptéSaMere")

INSERT INTO `Utilisateurs`(`User_name`, `User_firstname`, `User_email`, `User_phone`, `User_adresse`, `User_code_postal`, `User_role`, `User_password`)
VALUES ("MONNERIE","Hugo","hugo.monnerie@edu.itescia.fr","0647326669","82 chemin des grands chênes","39360","Admin","XXXXXXXXXX")

INSERT INTO `Utilisateurs`(`User_name`, `User_firstname`, `User_email`, `User_phone`, `User_adresse`, `User_code_postal`, `User_role`, `User_password`)
VALUES ("GRANDPIERRE","Andrian","Andrian.grandpierre@edu.itescia.fr","0611093245","28 chemin des grandes personnes","31820","Normale","ZZROT")

--Exo5--

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Casseurs Flowters', '2014-12-12', 'https://casseur-flowter.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Pied ballon','2015-04-01','https://piedballon.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Paris Saint-Germain','1970-06-12','https://psg.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Les Bizounours', '1980-06-14', 'https://bizounours.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Olypique de Marseille', '1899-06-31', 'https://om.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Olympique lyonnais', '1950-06-04', 'https://ol.fr');

--Exo6--

-- TEAM 1
INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('San', 'Orel', '37', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Dupond', 'Bernard', '25', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('San', 'Albert', '26', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Cérien', 'Jean', '37', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Tretien', 'Jean', '28', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Aïmar', 'Jean', '31', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Boréal', 'Aurore', '32', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Lavillan', 'Rose', '30', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Rible', 'Téo', '28', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Troajour', 'Adan', '22', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Ein', 'Jeff', '24', 1, 'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Croch','Sara','24',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Touille','Sacha','28',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Orlapydza','Jade','21',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Orkaéfcé','Jade','20',1,'remplaçant');

-- TEAM 2
INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Coptère','Élie','24',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Kedalcesoir','Énora','28',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Nouie','Éva','21',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('lepaké','Jamie','20',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('redemende','Jean','24',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Peuplu','Jean','28',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Hépipiholi','Jeff','21',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Hun','Jeff','25',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Nanasse','Judas','26',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('age','Karl','28',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Caille','Lara','31',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Golade','Larry','24',2,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Tatouille','Lara','28',2,'remplaçant');

-- TEAM 3
INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Navas','Keylor','32',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Bernat','Juan','26',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Corrêa','Marquinhos','25',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Silva','Thiago','35',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Meunier','Thomas','28',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Verrati','Marco','27',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Gueye','Idrissa','30',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Di maria','Angel','29',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Junior','Neymar','27',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('M’bappe','Kylian','20',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Icardi','Mauro','26',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Cavani','Edison','32',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Diallo','Abdou','26',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Draxler','Julian','27',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Kehrer','Thilo','22',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Kimpembe','Presnel','24',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Herrera','Ander','29',3,'remplaçant');


-- TEAM 4
INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Dépoin','Marc','24',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Dégouts','Roland','28',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Dissoire','Sam','21',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Ypontoise','Serge','20',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Houtan','Laurent','24',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Dycull','Thierry','28',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Tim','Vic','21',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Noisète','Lucas','25',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Sur','LucSur','26',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Ômaly','Anne','28',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Cehef','Hassan','31',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Magniez','Thibaut','34',4,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Gonçalves','Romain','31',4,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Cornet','François','38',4,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Frisch','Valéry','43',4,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('De Sousa','André','34',4,'remplaçant');

-- TEAM 5
INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Payet', 'Dimitri', '32', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Thauvin', 'Florian', '26', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Benedetto', 'Albert', '26', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Cérien', 'Darío', '29', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Rongier', 'Valentin', '24', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('González Soberón', 'Álvaro', '29', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Lopez', 'Maxime', '21', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Strootman', 'Kevin', '29', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Mandanda', 'Steve', '34', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Germain', 'Valère', '29', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Sakai', 'Hiroki', '29', 5, 'titulaire');

-- TEAM 6
INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Depay', 'Memphis', '25', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Dembele', 'Moussa', '23', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('San', 'Albert', '26', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Traoré', 'Bertrand', '24', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Aouar', 'Houssem', '21', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Lopes', 'Anthony', '29', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Andersen', 'Joachim', '23', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Reine-Adélaïde', 'Jeff', '21', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Oliveira', 'Jean Lucas', '21', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Cornet', 'Maxwell', '23', 6, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Tousart', 'Tousart', '22', 6, 'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Terrier','Martin','22',6,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Mendes','Thiago','27',6,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Denayer','Jason','24',6,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Dubois','Léo','25',6,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Koné','Youssouf','24',6,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Tătăruşanu','Ciprian','33',6,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Tete','Kenny','24',6,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`)
VALUES ('Marçal','Fernando','30',6,'remplaçant');

--Exo7--

--TEAM1
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-02-02',1,3,1,2);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-06-11',2,1,1,8);

--TEAM2
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-07-10',5,2,0,3);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-09-14',4,2,0,11);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-09-14',2,5,4,3);

--TEAM3
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-06-14',2,3,0,3);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-06-21',3,2,10,4);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-06-21',3,6,3,1);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-06-21',6,3,1,3);

--TEAM4
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-09-14',6,4,4,9);
--TEAM5

--TEAM6
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2011-02-10',1,6,1,3);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-09-14',2,6,3,4);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-09-14',2,6,0,3);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES ('2010-09-14',5,6,4,5);

--Exo8--

INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Nadal’,‘Rafael’,33,84);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Djokovic’,‘Novak’,32,77);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Federer’,‘Roger’,38,103);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Medvedev’,‘Daniil’,23,7);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Thiem’,‘Dominic’,26,16);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Stéfanos’,‘Tsitsipas’,21,3);

--Exo9--


--Exo10--

INSERT INTO chevaux_hippique(Name_horse, Age_horse, Picture_horse, Date_veterinaire)
VALUES ('Bold Eagle',8,'https://upload.wikimedia.org/wikipedia/commons/6/65/Bold_Eagle_2015-12-13.jpg','2015-08-24');

INSERT INTO chevaux_hippique(Name_horse, Age_horse, Picture_horse, Date_veterinaire)
VALUES ('Nassume Pas',5,'https://pbs.twimg.com/profile_images/1128958860285415425/Dzt-UC2S_400x400.png','2015-02-12');

INSERT INTO chevaux_hippique(Name_horse, Age_horse, Picture_horse, Date_veterinaire)
VALUES ('Revolver',6,'https://pbs.twimg.com/profile_images/1128958860285415425/Dzt-UC2S_400x400.png','2015-03-12');

INSERT INTO chevaux_hippique(Name_horse, Age_horse, Picture_horse, Date_veterinaire)
VALUES ('Body Guard',4,'https://pbs.twimg.com/media/DDwFPr0W0AIynSc.jpg','2015-06-05');

INSERT INTO chevaux_hippique(Name_horse, Age_horse, Picture_horse, Date_veterinaire)
VALUES ('Foudre',7,'https://www.letrot.com/images/ACTUALITES_TURFCOM/bold_capelle_opt.jpg','2015-06-14');

--Exo11--

INSERT INTO `jockeys_hippique`(`Name_jockey`, `Firstname_jockey`, `Age_jockey`, `Weight_jockey`, `Id_horse_j`)
VALUES ('Lestrade','Bertrand','36','58',1);

INSERT INTO `jockeys_hippique`(`Name_jockey`, `Firstname_jockey`, `Age_jockey`, `Weight_jockey`, `Id_horse_j`)
VALUES ('Clé','Blague','28','60',2);

INSERT INTO `jockeys_hippique`(`Name_jockey`, `Firstname_jockey`, `Age_jockey`, `Weight_jockey`, `Id_horse_j`)
VALUES ('Pieux','Christophe','52','62',3);

INSERT INTO `jockeys_hippique`(`Name_jockey`, `Firstname_jockey`, `Age_jockey`, `Weight_jockey`, `Id_horse_j`)
VALUES ('Ricou','Jacques','39','63',4);

INSERT INTO `jockeys_hippique`(`Name_jockey`, `Firstname_jockey`, `Age_jockey`, `Weight_jockey`, `Id_horse_j`)
VALUES ('Cottin','David','29','61',5);

--Exo12--

--course 1
INSERT INTO `race_hippiques`(`Time_race`, `Location_race`, `Weather_race`)
VALUES ('2019-04-12 14:00:00','Champs de course Engien','Ensoleillé');

--course 2
INSERT INTO `race_hippiques`(`Time_race`, `Location_race`, `Weather_race`)
VALUES ('2019-06-21 15:30:00','Hippodrome de Marseille','Ensoleillé');

--course 3
INSERT INTO `race_hippiques`(`Time_race`, `Location_race`, `Weather_race`)
VALUES ('2019-03-04 17:20:00','Hippodrome de Maisons-Laffitte','Pluvieux');

--course 4
INSERT INTO `race_hippiques`(`Time_race`, `Location_race`, `Weather_race`)
VALUES ('2019-05-27 08:45:00','Champs de course Engien','Brouillard');

--course 5
INSERT INTO `race_hippiques`(`Time_race`, `Location_race`, `Weather_race`)
VALUES ('2019-08-30 16:15:00','Hippodrome de ParisLongchamp','Pluvieux');

--Exo13--

--course 1
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (1,1,2,82);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (1,2,5,81);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (1,3,1,88);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (1,4,4,79);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (1,5,3,80);

--course 2
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (2,1,1,81);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (2,2,4,78);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (2,3,3,79);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (2,4,2,76);

--course 3
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (3,5,1,78);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (3,3,2,79);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (3,4,3,76);

-- course 4
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (4,1,5,82);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (4,2,4,81);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (4,3,2,88);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (4,4,1,79);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (4,5,3,80);

--  course5
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (5,1,1,82);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (5,2,2,81);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (5,3,5,88);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (5,4,4,79);
INSERT INTO classement_horse_race(Id_race_c, Id_horse_c, Classement_horse, Speed_horse)
VALUES (5,5,3,80);

--Exo14--X

SELECT FT.Team_name, COUNT(distinct FP.Id_player_f) AS NbrPlayer, COUNT( MF.Id_team_inside_f) + COUNT( MF2.Id_team_outside_f) AS NbrMatch, FT.Team_create, FT.Site_team
FROM football_team as FT
LEFT JOIN football_player as FP
    ON FP.J_id_team_f = FT.Id_team_f
LEFT JOIN matchs_football as MF
    ON MF.Id_team_inside_f = FT.Id_team_f
LEFT JOIN matchs_football as MF2
    ON MF2.Id_team_outside_f = FT.Id_team_f
GROUP BY FP.J_id_team_f
ORDER BY FT.Team_name ASC


#essaie brique par brique
SELECT *  from (
SELECT Id_team_f , (count(Id_team_inside_f) over(PARTITION by FT.Id_team_f)) as nbInside
from  matchs_football
LEFT JOIN football_team AS FT
    ON Id_team_inside_f = FT.Id_team_f

) as Tab
group by Id_team_f

---------

SELECT FT.Team_name, MF.Id_team_inside_f, count(MF.Id_team_inside_f) + count(MF.Id_team_outside_f)
FROM matchs_football AS MF
LEFT JOIN football_team AS FT
    ON FT.Id_team_f = MF.Id_team_inside_f
LEFT JOIN football_team AS FT2
    ON FT2.Id_team_f = MF.Id_team_outside_f
WHERE FT.Id_team_f = 1
group by MF.Id_team_inside_f, MF.Id_team_outside_f

--Exo15--

SELECT FP.Firstname_player_f, FP.Name_player_f,  FP.Age_player_f, FT.Team_name
FROM football_player AS FP
LEFT JOIN football_team AS FT
    ON FP.J_id_team_f = FT.Id_team_f
ORDER BY FP.Name_player_f ASC

--Exo16--X

SELECT MF.`Id_match_f`, FT.Team_name, MAX(MF.Nbr_but_inside_f), FT2.Team_name
FROM matchs_football AS MF
LEFT JOIN football_team AS FT
    ON FT.Id_team_f = MF.Id_team_outside_f
LEFT JOIN football_team AS FT2
    ON FT2.Id_team_f = MF.Id_team_outside_f

--Exo17--X

SELECT FT.Name_team, MF.Nbr_but_inside_f, MF.Nbr_but_outside_f, FT2.Name_team
FROM football_team AS FT
LEFT JOIN matchs_football AS MF
    ON FT.Id_team_f = MF.Id_team_inside_f
LEFT JOIN matchs_football AS MF2
    ON FT.Id_team_f = MF2.Id_team_outside_f
WHERE FT2.Name_team == MF.Nbr_but_inside_f<3 OR FT2.Name_team == MF.Nbr_but_outside_f<3
ORDER BY MF.Nbr_but_inside_f ASC

--Exo18--


--Exo23--

SELECT CH.*, JH.*
FROM chevaux_hippique AS CH
LEFT JOIN jockeys_hippique AS JH
    ON JH.Id_horse_j = CH.Id_horse
ORDER BY CH.Name_horse ASC

--Exo24--

SELECT CH.Name_horse, CH.Age_horse, COUNT(CHH.Classement_horse) AS premier, COUNT(CHH.Classement_horse) AS podium, COUNT(CHH.Classement_horse=MAX(CHH.Classement_horse)) AS dernier
FROM chevaux_hippique AS CH
LEFT JOIN classement_horse_race AS CHH
    ON CH.Id_horse = CHH.Id_horse_c
WHERE CH.Id_horse = 1
ORDER BY premier ASC

--EXO25

SELECT CH.NAme_horse, RH.Location_race, CHH.Speed_horse
FROM classement_horse_race AS CHH
LEFT JOIN race_hippiques as RH
ON CHH.Id_race_c = RH.Id_race
LEFT JOIN chevaux_hippique as CH
ON CH.Id_horse = CHH.Id_horse_c

WHERE Weather_race = 'Pluvieux'
ORDER BY CHH.Speed_horse DESC
