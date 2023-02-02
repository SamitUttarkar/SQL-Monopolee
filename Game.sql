call Update_player('Jane',3)
call Update_player('Norman',1)
call Update_balance('Jane',50)
call Update_balance('Bill',50)
call Update_balance('Mary',50)
call Update_player('Mary',4)
call Update_player('Bill',2)

call update_audit(1)

call Update_player('Jane',5)
call Update_balance('Jane',-75)
call Update_balance('Bill',75)
call Update_player('Norman',4)
call Update_player('Mary',5)
call Update_balance('Mary',-200)
call Update_balance('Norman',+200)
call Update_player('Bill',9)

call update_audit(2)

