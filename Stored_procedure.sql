DELIMITER //
CREATE PROCEDURE Update_player(IN Name varchar(45),IN dice INT)
BEGIN
	UPDATE player
    set Active = False;
    UPDATE player
    SET Balance = IF(location_id+dice>16,balance + 200,Balance), player.Active = True,
	location_id = IF(IF(MOD((location_id+dice),16)=0,16,MOD((location_id+dice),16))=13,5,IF(MOD((location_id+dice),16)=0,16,MOD((location_id+dice),16)))
	WHERE Player = Name;

    UPDATE property
    join location on location_id = property.location_id
    join player on player.location_id = location.id
    SET property.Owner = Name, player.Balance = player.Balance - property.Cost
    where property.location_id = player.location_id and property.Owner is Null;
    
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE Update_balance(IN Name varchar(45), IN Add_Balance INT)
BEGIN
	UPDATE player
    set Balance = Balance + Add_Balance
	WHERE Player = Name;
END //
    
DELIMITER ;

-- create stored procedure for updating audit trail
DELIMITER //
CREATE PROCEDURE update_audit(IN rnd INT)
BEGIN
	INSERT INTO audit(`player_id`,`location_id`,`Balance`)
	SELECT id,location_id,Balance FROM player;
    
    UPDATE audit
    set Round = rnd 
    where Round is Null;
END //
    
DELIMITER ;

CREATE VIEW gameView AS
 SELECT a.Round, p.Player, p.Token, p.Balance, p.Location
 FROM audit as a 
 JOIN player p on p.id = a.player_id
 WHERE Round = (SELECT MAX(Round) from Audit); 
 
DELIMITER //
CREATE PROCEDURE gameView()
BEGIN
	SELECT * FROM gameView;
END //
    
DELIMITER ;