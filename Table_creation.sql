CREATE TABLE Monopolee.location (
  id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(45) NOT NULL,
  Type VARCHAR(45) NULL,
  PRIMARY KEY (id));
  
CREATE TABLE Monopolee.token(
id INT NOT NULL,
Name Varchar(45),
PRIMARY KEY(id));

CREATE TABLE Monopolee.bonus(
  id INT NOT NULL,
  Bonus VARCHAR(45) NOT NULL,
  Description TINYTEXT ,
  location_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (location_id) REFERENCES location(id));
  
CREATE TABLE Monopolee.property(
  id INT NOT NULL,
  Property VARCHAR(45) NOT NULL,
  Cost INT,
  Colour varchar(45),
  Owner varchar(10),
  location_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (location_id) REFERENCES location(id)); 
  
CREATE TABLE Monopolee.player(
  id INT NOT NULL AUTO_INCREMENT ,
  Player VARCHAR(45) NOT NULL,
  Token VARCHAR(45) NOT NULL,
  Location VARCHAR(45) NOT NULL,
  Balance VARCHAR(45) NOT NULL,
  location_id INT NOT NULL,
  token_id INT NOT NULL,
  Active Bool,
  PRIMARY KEY(id),
  FOREIGN KEY (location_id) REFERENCES location(id),
  FOREIGN KEY (token_id) REFERENCES token(id));
  
  
CREATE TABLE Monopolee.audit(
player_id INT NOT NULL,
location_id INT NOT NULL,
Balance INT,
Round INT,
FOREIGN KEY (player_id) REFERENCES player(id));

INSERT INTO token
values
(1,'dog'),
(2,'car'),
(3,'battle-ship'),
(4,'top hat'),
(5,'thimble'),
(6,'boot')

INSERT INTO location (Name,Type)
VALUES ('GO','Corner'),
('Kilburn','Property'),
('CHANCE 1','Chance'),
('Uni Place','Property'),
('IN JAIL','Corner'),
('Victoria','Property'),
('COMMUNITY CHEST 1','Community chest'),
('Piccadilly','Property'),
('FREE PARKING','Corner'),
('Oak House','Property'),
('CHANCE 2','Chance'),
('Owens Park','Property'),
('GO TO JAIL','Corner'),
('AMBS','Property'),
('COMMUNITY CHEST 2','Community chest'),
('Co-op','Property');


INSERT INTO property
VALUES (1,'Oak house', 100, 'Orange','Norman’,10),
(2,'Ownes Park',30,'Orange','Norman',12),
(3,'AMBS',400,'Blue',DEFAULT,14),
(4,'Co-Op',30,'Blue','Jane',16),
(5,'Kilburn',120,'Yellow',DEFAULT,2),
(6,'Uni Place',100,'Yellow',DEFAULT,4),
(8,'Victoria',75,'Green','Bill',6),
(9,'Piccadilly',35,'Green',DEFAULT,8);

INSERT INTO bonus
VALUES (1,'Chance 1', 'Pay each of the other players £50',2),
(2,'Chance 2','Move forward 3 spaces',11),
(3,'Community Chest 1','For winning a Beauty Contest, you win £100',7),
(4,'Community Chest 2','Your library books are overdue. Play a fine of £30',15),
(5,'Free Parking','No action',9),
(6,'Go to Jail','Go to Jail, do not pass GO, do not collect £200',13),
(7,'GO','Collect £200',1);

INSERT INTO token
values
(1,'Dog'),
(2,'Car'),
(3,'Battleship'),
(4,'Top Hat'),
(5,'Thimble'),
(6,'Boot')

INSERT INTO player(Player,Token,Location,Balance,location_id)
VALUES ('Mary', 'Battleship','FREE PARKING',190,9,3,False),
('Bill','Dog','Owens Park',500,12,1,False),
('Jane','Car','AMBS',150,14,2,False),
('Norman','Thimble','Kilburn', 250,2,5,False)

INSERT INTO audit
VALUES (1, 9,DEFAULT),
(2,12,DEFAULT),
(3,14,DEFAULT),
(4,2,DEFAULT);



