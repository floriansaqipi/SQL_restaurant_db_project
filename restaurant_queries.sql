use restaurant;

#query 1
select * from konsumatoret k where k.qyteti = 'Prishtine';

#query 2
select distinct k.emri, k.mbiemri from konsumatoret k 
inner join rezervimet r on k.konsumatori_id = r.konsumatori_id 
where  year(r.data_kur_rez)  = 2022
group by r.konsumatori_id having count(*) > 1;

#query 3
select distinct k.emri,k.mbiemri from konsumatoret k
inner join rezervimet r on k.konsumatori_id = r.konsumatori_id 
where (year(r.data_kur_rez) = 2021 or year(r.data_kur_rez) = 2022) and r.anuluar = true;

#query 4
select distinct s.emri, s.mbiemri from stafi s where paga > 500 
union
select distinct k.emri, k.mbiemri from konsumatoret k 
inner join rezervimet r on k.konsumatori_id = r.konsumatori_id 
where date(r.data_kur_rez) = '2023-01-01';    

#query 5
SELECT distinct pa.porosi_id, count(pa.artikulli_id) as nr_artikujve , 
k.konsumatori_id, k.emri as emri_kons, k.mbiemri as mbiemri_kons, k.nr_tel as nr_tel_kons,
s.staf_id ,s.emri as emri_kam, s.mbiemri as mbiemri_kam 
FROM porosi p 
inner join porosi_artikuj pa on p.porosi_id = pa.porosi_id  
inner join konsumatoret k on p.konsumatori_id = k.konsumatori_id
inner join stafi s on p.staf_id = s.staf_id
WHERE MONTH(data_) >= MONTH(NOW()) - 2
group by pa.porosi_id
order by nr_artikujve desc
limit 5;

#query 6
select YEAR(p.data_) as viti, MONTH(p.data_) as muaji, SUM(m.cmimi) as shuma from porosi p 
inner join porosi_artikuj pa on p.porosi_id = pa.porosi_id
inner join menu m on pa.artikulli_id = m.artikulli_id
where date(p.data_) >= '2022-10-01' and date(p.data_) <= '2022-12-31'
group by MONTH(p.data_);


#query 7
select dayname(data_) as dita_e_javes, avg(nr_rez) as nr_mesatar_i_rez from (
select r.data_e_rez as data_, count(*) as nr_rez from rezervimet r
where month(r.data_e_rez) = 7 or month(r.data_e_rez) = 8 
group by date(r.data_e_rez)) as rez_per_date
group by dayname(data_); 

#query 8
select * from menu m inner join(
select artikulli_id as id_produkti_top,  max(cnt) as numri_i_porosive from (
select m.artikulli_id as artikulli_id, count(*) as cnt from menu m 
inner join porosi_artikuj pa on m.artikulli_id = pa.artikulli_id
inner join porosi p on pa.porosi_id = p.porosi_id
where m.kategoria <> "pije" and  year(p.data_) = year(now())
 group by m.artikulli_id) as nr_porosive_artikull) as max_prod
on m.artikulli_id = max_prod.id_produkti_top; 

# query 9
select  p.porosi_id as porosi_id, p.data_, p.staf_id, p.tavolin_id, p.konsumatori_id from porosi p 
inner join porosi_artikuj pa on p.porosi_id = pa. porosi_id
inner join menu m on pa.artikulli_id = m.artikulli_id
where m.kategoria = 'Pizza' 
group by p.porosi_id 
having count(*) > 2;
