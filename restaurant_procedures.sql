use restaurant;

#procedure 1
delimiter //
create procedure porosite_e_konsumatorit(konsumatori_id integer) 
begin 
	select p.* from konsumatoret k 
    inner join porosi p on k.konsumatori_id = p.konsumatori_id
    where k.konsumatori_id = konsumatori_id;
end //
delimiter ;

call porosite_e_konsumatorit(4);

#procedure 2
delimiter //
create procedure vleresimet_mbi_vleren(vlera integer)
begin
    select * from vleresimet v where v.vlera > vlera;
end //
delimiter ;

call vleresimet_mbi_vleren(3);


#procedure 3
delimiter $$
create procedure nr_rez_per_tav_ne_vitin(tavolin_id integer, viti integer)
begin
	select t.*, count(*) as nr_rez from tavolinat t 
    inner join rezervimet r on t.tavolin_id = r.tavolin_id
    where year(r.data_kur_rez) = viti and t.tavolin_id = tavolin_id
    group by t.tavolin_id;
end $$
delimiter ;

call nr_rez_per_tav_ne_vitin(5,2022);


