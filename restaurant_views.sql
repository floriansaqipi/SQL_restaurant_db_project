use restaurant;

#view 1
create view kamarieret as
select emri, mbiemri, adresa , numri_tel
from stafi
where roli = 'Kamariere';

select * from kamarieret;

#view 2
create view porosite_pas_dates_tet_2022 as
select porosi_id, data_, staf_id, konsumatori_id
from porosi
where data_ >= "2022-10-01";

select * from porosite_pas_dates_tet_2022;

#view 3
create view top_5_konsumatoret as
select k.*, count(*) as nr_rez from konsumatoret k 
inner join rezervimet r  on k.konsumatori_id = r.konsumatori_id
group by k.konsumatori_id
order by nr_rez desc
limit 5;

select * from top_5_konsumatoret;