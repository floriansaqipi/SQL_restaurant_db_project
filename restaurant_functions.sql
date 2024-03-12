
#funksioni 1
delimiter // 
create function merr_shumen_e_shpenzuar_nga_konsumatori_per_te_gjitha_porosite( cons_id int ) 
returns decimal(5,2) deterministic
begin
	declare n double default 0;
	declare b double default 0;

	select sum(shuma) into n from pagesat
	where pagesat.konsumatori_id = cons_id;

	select sum(bakshish) into b from pagesat
	where pagesat.konsumatori_id = cons_id;

	return n + b;
end //
delimiter ;

select merr_shumen_e_shpenzuar_nga_konsumatori_per_te_gjitha_porosite(6) as shuma_e_kl_per_gjitha_porosite;

#funksioni 2
delimiter //
create function shuma_e_bakshisheve_mbrenda_intervalit(kufiri_i_poshtem datetime, kufiri_i_larte datetime)
returns decimal(7,2) deterministic
begin
	declare shuma decimal(7,2) default 0.0;
	select sum(pa.shuma) as shuma_e_baksh into shuma from pagesat pa
    inner join porosi po on pa.porosi_id = po.porosi_id
    where date(po.data_) >= date(kufiri_i_poshtem) and date(po.data_) <= date(kufiri_i_larte);
    return shuma;
end//
delimiter ;

select shuma_e_bakshisheve_mbrenda_intervalit('2022-06-01','2022-12-31') as shuma_e_baksh_ne_intervalin;

