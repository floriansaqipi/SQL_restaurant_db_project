use restaurant;

#trigger 1
delimiter //
create trigger name_uppercase_on_insert
before insert on stafi
for each row
begin
set new.emri=upper(new.emri), new.mbiemri=upper(new.mbiemri);
end //
delimiter ;

insert into stafi(staf_id, emri, mbiemri, roli, paga, adresa, numri_tel) 
values(11,'Albina','Maloku','Kamariere',400,'Prishtine','+383 49-342-456');
select * from stafi;

#trigger 2
delimiter //
create trigger name_uppercase_on_update
before update on stafi
for each row
begin
	set new.emri=upper(new.emri), new.mbiemri=upper(new.mbiemri);
end //
delimiter ;

update stafi s set s.mbiemri = 'Nikaj' where s.staf_id = 10;
select * from stafi;  


#trigger 3
delimiter $$
create trigger valido_pagen_on_insert
before insert on stafi
for each row
begin
if new.paga <= 250
then signal sqlstate '45000'
set message_text='Paga nuk mund te jete me e ulet se 250 euro';
end if;
end $$
delimiter ;

insert into stafi(staf_id, emri, mbiemri, roli, paga, adresa, numri_tel) 
values (12, 'Alberta', 'Fisnikaj', 'Kamariere', 200, 'Prishtine', '+383 49-335-453');

#trigger 4
delimiter $$
create trigger valido_pagen_on_update
before update on stafi
for each row
begin
if new.paga <= 250
then signal sqlstate '45000'
set message_text='Paga nuk mund te jete me e ulet se 250 euro';
end if;
end $$
delimiter ;

update stafi s set paga = 200 where s.staf_id = 11;
