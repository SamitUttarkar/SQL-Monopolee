DELIMITER /
CREATE TRIGGER Monopolee.Rules 
BEFORE UPDATE ON player
FOR EACH ROW 
BEGIN
DECLARE location_id INT;
IF NEW.location_id =13 THEN
SET NEW.location_id = 5;
END IF;
IF NEW.location_id = 5 THEN
SET New.Location = 'IN JAIL';
END IF;
IF New.location_id = 3 AND New.Active = True THEN
SET New.Balance = New.Balance - 150, New.Location = 'CHANCE 1';
END IF;
IF New.location_id = 7 AND New.Active = True THEN
SET New.Balance = New.Balance + 100, New.Location = 'COMMUNITY CHEST 1';
END IF;
IF New.location_id = 11 AND New.Active = True THEN
SET New.location_id = New.location_id + 3, New.Location = 'AMBS';
END IF;
IF New.location_id = 15 AND New.Active = True THEN
SET New.Balance = New.Balance - 30,New.Location = 'COMMUNITY CHEST 2';
END IF;
IF NEW.location_id = 1 THEN
set New.Location = 'GO';
END IF;
IF NEW.location_id = 2 THEN
SET New.Location = 'Kilburn';
END IF;
IF NEW.location_id = 4 THEN
SET New.Location = 'Uni Place';
END IF;
IF NEW.location_id = 6 THEN
SET New.Location = 'Victoria';
END IF;
IF NEW.location_id = 8 THEN
SET New.Location = 'Piccadilly';
END IF;
IF NEW.location_id = 9 THEN
SET New.Location = 'FREE PARKING';
END IF;
IF NEW.location_id = 10 THEN
SET New.Location = 'Oak House';
END IF;
IF NEW.location_id = 12 THEN
SET New.Location = 'Owens Park';
END IF;
IF NEW.location_id = 14 THEN
SET New.Location = 'AMBS';
END IF;
IF NEW.location_id = 16 THEN
SET New.Location = 'Co-op';
END IF;
END /
DELIMITER ;


