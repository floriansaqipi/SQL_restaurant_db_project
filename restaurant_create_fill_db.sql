
#krijimi i tabelave
drop database restaurant;
CREATE database restaurant;
use restaurant;
create table konsumatoret(
konsumatori_id integer,
emri varchar(40),
mbiemri varchar(40),
nr_tel varchar(40),
qyteti varchar(40),
kategoria varchar(40),
primary KEY(konsumatori_id)
);

create table tavolinat(
tavolin_id integer,
statusi varchar(20),
primary KEY(tavolin_id)
);

create table stafi(
staf_id integer,
emri varchar(40),   #dy EMRI
mbiemri varchar(40),
roli varchar(80),
paga decimal(7,2),
adresa varchar(40),
numri_tel varchar(40),
primary KEY(staf_id)
);
create table rezervimet(
rezervimet_id integer,
data_kur_rez datetime,
data_e_rez datetime,
anuluar boolean,
konsumatori_id integer not null,
staf_id integer not null,
tavolin_id integer not null,
primary KEY(rezervimet_id),
foreign key (konsumatori_id) references konsumatoret(konsumatori_id),
foreign key (staf_id) references stafi(staf_id),
foreign key (tavolin_id) references tavolinat(tavolin_id)
);

create table vleresimet(
vleresimi_id integer,
vlera integer,
koment varchar(60),
data_ datetime, #data nuk bon se  emer si parameter
konsumatori_id integer not null,
primary KEY(vleresimi_id),
foreign key (konsumatori_id) references konsumatoret(konsumatori_id)
);


create table bonuse(
bonus_id integer,
shuma decimal(7,2),
data_ datetime,
staf_id integer not null,
primary KEY (bonus_id),
foreign key(staf_id) references stafi(staf_id)
);
create table menu(
artikulli_id integer,
kategoria varchar(40),
nen_kategoria varchar(40),
pershkrimi varchar(80),
cmimi decimal(7,2),
primary key(artikulli_id)
);

create table porosi(
porosi_id integer,
data_ datetime,
staf_id integer not null,
tavolin_id integer not null,
konsumatori_id integer not null,
primary key(porosi_id),
foreign key (staf_id) references stafi(staf_id),
foreign key (tavolin_id) references tavolinat(tavolin_id),
foreign key(konsumatori_id) references konsumatoret(konsumatori_id)
);

create table porosi_artikuj(
 porosi_artikuj_id integer,
 porosi_id integer not null,
 artikulli_id integer not null,
 primary key(porosi_artikuj_id),
 foreign key(porosi_id) references porosi(porosi_id),
 foreign key(artikulli_id) references menu(artikulli_id)
);

create table eventet(
event_id integer,
pershkrimi varchar(80),
data_ datetime,
cmimi decimal(7,2),
staf_id integer not null,
primary key(event_id),
foreign key (staf_id) references stafi(staf_id)
);

create table pagesat(
pagesa_id integer,
shuma decimal(7,2),
bakshish decimal(7,2),
konsumatori_id integer not null,
staf_id integer not null,
porosi_id integer unique not null,
primary key(pagesa_id),
foreign key (staf_id) references stafi(staf_id),
foreign key (konsumatori_id) references konsumatoret(konsumatori_id),
foreign key (porosi_id) references porosi(porosi_id)
);

create table pushimet(
pushim_id integer,
arsyeja varchar(40),
data_kerkimit datetime,
data_fillimit datetime,
data_mbarimit datetime,
aprovohet boolean,
staf_id integer not null,
primary key(pushim_id),
foreign key (staf_id) references stafi(staf_id)
);

#Mbushja e tabelave me vlera

INSERT INTO konsumatoret(konsumatori_id,emri,mbiemri,nr_tel,qyteti,kategoria)
VALUES
(1,'Festina','Hasani','+383 45-123-123','Prishtine','gold'),
(2,'Blerta','Kamberi','+383 44-124-124','Presheve','silver'),
(3,'Benina','Gashi','+383 49-789-456','Gjilan','rregullt'),
(4,'Adni','Cana','+383 49-565-565','Podujeve','bronze'),
(5,'Elda','Sele','+383 45-125-162','Drenas','rregullt'),
(6,'Besa','Hyseni','+383 49-785-785','Kamenice','silver'),
(7,'Verona','Berisha','+383 44-562-321','Prizren','bronze'),
(8,'Blert','Syla','+383 45-696-696','Kline','rregullt'),
(9,'Trim','Tolaj','+383 44-758-758','Istog','silver'),
(10,'Dior','Misini','+383 45-621-621','Peje','gold'),
(11,'Erleta','Shemsiu','+383 45-144-123','Vushtrri','gold'),
(12,'Marigona','Hoxha','+383 45-123-124','Prishtine','rregullt'),
(13,'Arjan','Zeneli','+383 45-123-125','Prishtine','bronze');

-- SELECT * FROM konsumatoret;

INSERT INTO stafi(staf_id,emri,mbiemri,roli,paga,adresa,numri_tel)
VALUES
(1,'Endrita','Gjyrevci','Menaxhere',600,'Prishtine','+383 45-123-123'),
(2,'Bledar','Gashi','Asistent i menaxherit',550,'Prishtine','+383 44-771-225'),
(3,'Molosa','Bytyqi','Mbikqyrese',450,'Gjakove','+383 49-879-654'),
(4,'Besjana','Miftari','Kamariere',400,'Malisheve','+383 44-124-124'),
(5,'Blerte','Miftari','Kamariere',400,'Ferizaj','+383 49-557-668'),
(6,'Sarandë','Zejnullahu','Shankiste',350,'Gjilan','+383 49-985-785'),
(7,'Gezim','Ahmeti','Banakiere',350,'Drenas','+383 44-563-421'),
(8,'Gerta','Qela','Pastruese',300,'Prizren','+383 45-696-789'),
(9,'Elvira','Caka','Kamariere',400,'Mitrovice','+383 49-798-758'),
(10,'Medina','Nika','Kamariere',400,'Vushtrri','+383 45-898-621');

-- SELECT * FROM stafi;

INSERT INTO bonuse(bonus_id,shuma,data_,staf_id)
VALUES
(1,4.00,'22-06-18 10:34:09',3),
(2,8.00,'22-06-19 11:35:54',5),
(3,9.33,'22-06-20 09:47:54',1),
(4,1.00,'22-06-22 08:27:34',4),
(5,2.0,'22-06-23 12:11:01',2),
(6,2.67,'22-07-01 14:10:24',10),
(7,2.33,'22-07-02 19:31:54',7),
(8,6.00,'22-07-05 09:07:14',6),
(9,10.67,'22-07-10 20:54:54',9),
(10,14.67,'22-07-14 19:01:39',8),
(11,8.33,'22-07-20 21:15:00',3),
(12,9.00,'22-07-25 15:15:53',1),
(13,6.33,'22-07-26 11:11:11',2);

-- SELECT * FROM bonuse;

INSERT INTO menu(artikulli_id,kategoria,nen_kategoria,pershkrimi,cmimi)
VALUES
(1,'Mengjesi','Llokuma','(djath,qaj,marmelate)',5),
(2,'Pizza','Marrgarita','(kaqkavall,sos domatesh)',3),
(3,'Pizza','Pershute','(kaqkavall,pershute,sos domatesh)',4),
(4,'Pizza','Tuna','(kaqkavall,tune,sos domatesh)','4'),
(5,'Sandwich','Pershute','(kaqkavall,pershute,sos,pomfrita)',3),
(6,'Sandwich','Pule','(kaqkavall,pule,sos,pomfrita',3),
(7,'Sallate','Pule','(laker,domate,djath,ullinj,pule)',2.50),
(8,'Sallate','Greke','(laker,brokoli,djath,ullinj)',2.50),
(9,'Misherat','Kombinim i misherave','(Mish gjelli,mish pule,mish,pleskavica)',8),
(10,'Pije','Coca-cola','(Pije e gazuar)',1.2),
(11,'Pije','Fanta','(Pije e gazuar)',1.2),
(12,'Pije','Sprite','(Pije e gazuar)',1.2),
(13,'Pije','Schweppes','(Pije e gazuar)',1.2);

-- SELECT * FROM menu;

INSERT INTO tavolinat(tavolin_id,statusi)
VALUES
(1,'e lire'),
(2,'jo e lire'),
(3,'e lire'),
(4,'jo e lire'),
(5,'jo e lire'),
(6,'e lire'),
(7,'jo e lire'),
(8,'e lire'),
(9,'e lire'),
(10,'jo e lire'),
(11,'e lire'),
(12,'e lire'),
(13,'jo e lire');

-- SELECT * FROM tavolinat;

INSERT INTO rezervimet(rezervimet_id,data_kur_rez,data_e_rez,anuluar,konsumatori_id,staf_id,tavolin_id)
VALUES
(1,'21-11-07 11:34:51','21-12-12 20:00:00',false,1,1,1),
(2,'21-07-01 09:13:32','21-09-10 21:30:00',true,2,8,9),
(3,'21-10-04 12:45:12','21-12-05 14:00:00',false,3,2,7),
(4,'21-08-05 15:01:46','21-12-09 18:15:00',false,6,4,3),
(5,'22-02-02 17:49:34','22-04-02 15:45:00',true,4,7,8),
(6,'22-03-07 16:31:27','22-09-09 19:30:00',false,6,5,5),
(7,'22-04-08 20:54:53','22-09-09 11:30:00',true,7,1,4),
(8,'22-06-05 21:01:12','22-10-13 21:45:00',false,8,6,2),
(9,'23-01-01 08:23:41','23-01-04 20:30:00',false,9,9,9),
(10,'23-01-01 08:23:41','23-01-04 20:30:00',false,10,10,10),
(11,'22-02-02 17:49:34','22-04-02 15:45:00',false,4,7,8),
(12,'22-03-07 16:31:27','22-04-09 19:30:00',false,6,5,5),
(13,'22-04-08 20:54:53','22-09-09 11:30:00',false,7,1,4),
(14,'22-06-05 21:01:12','22-10-13 21:45:00',false,8,6,2),

(15,'22-06-06 20:01:12','22-07-13 21:45:00',false,8,6,2),
(16,'22-06-07 20:05:12','22-07-14 22:45:00',false,8,6,10),
(17,'22-06-08 20:06:12','22-07-15 16:45:00',false,3,4,11),
(18,'22-06-09 20:08:12','22-07-16 14:45:00',false,1,2,6),
(19,'22-06-09 20:21:12','22-07-16 18:45:00',false,4,7,10),
(20,'22-06-10 20:31:12','22-07-17 19:45:00',false,2,8,4),
(21,'22-06-14 20:41:12','22-07-17 21:45:00',false,7,10,7),
(22,'22-06-17 21:23:12','22-07-17 22:45:00',false,1,2,1),
(23,'22-06-21 21:44:12','22-07-19 22:45:00',false,2,3,4),
(24,'22-06-21 22:43:12','22-07-20 22:45:00',false,4,2,8),

(25,'22-06-06 21:01:12','22-08-10 21:45:00',false,9,6,11),
(26,'22-06-07 21:01:12','22-08-10 22:45:00',false,1,4,7),
(27,'22-06-08 21:01:12','22-08-12 16:45:00',false,2,4,11),
(28,'22-06-09 21:01:12','22-08-13 14:45:00',false,4,5,6),
(29,'22-06-09 21:01:12','22-08-14 18:45:00',false,2,3,10),
(30,'22-06-10 21:01:12','22-08-15 18:45:00',false,8,8,4),
(31,'22-06-14 21:01:12','22-08-16 18:45:00',false,9,10,7);

-- SELECT * FROM rezervimet;

INSERT INTO porosi(porosi_id,data_,staf_id,tavolin_id,konsumatori_id)
VALUES
(1,'22-12-01 12:15:22',1,1,2),
(2,'22-12-02 20:13:12',2,2,3),
(3,'22-06-05 19:19:09',3,3,5),
(4,'22-10-09 16:34:12',4,4,2),
(5,'22-03-05 21:05:54',5,5,1),
(6,'22-11-08 22:30:30',6,6,4),
(7,'22-12-06 15:37:56',7,7,6),
(8,'22-07-07 14:59:12',8,8,7),
(9,'22-09-05 13:56:45',9,9,9),
(10,'22-09-07 13:56:45',10,10,10);

-- SELECT * FROM porosi;

INSERT INTO pagesat(pagesa_id,shuma,bakshish,konsumatori_id,staf_id,porosi_id)
VALUES
(1,7.50,2,1,4,1),
(2,3.00,1.50,2,5,3),
(3,2.85,2.30,3,9,4),
(4,14.00,0.50,4,10,5),
(5,12.25,0.00,5,4,10),
(6,7.50,0.70,6,5,2),
(7,3.50,0.30,7,10,6),
(8,2.60,0.00,8,10,7),
(9,3.60,0.00,9,5,9),
(10,5.00,0.00,10,4,8);

-- SELECT * FROM pagesat;

INSERT INTO pushimet(pushim_id,arsyeja,data_kerkimit,data_fillimit,data_mbarimit,aprovohet,staf_id)
VALUES
(1,'pushim vjetore','22-01-17 16:20:20','22-05-22 15:18:16','22-06-17 18:29:52',true,1),
(2,'shendetesore','22-10-09 12:12:12','22-10-12 13:33:55','22-10-30 10:36:12',true,6),
(3,'pushim vjetor','22-12-04 18:12:03','22-12-12 18:22:30','23-1-12 16:09:10',false,7),
(4,'familjare','22-09-27 15:09:52','22-10-11 14:55:32','22-12-12 15:15:15',true,3),
(5,'pushim vjetor','22-7-14 19:55:42','22-7-20 09:23:16','22-7-31 19:52:52',true,8),
(6,'shendetsore','22-6-7 13:36:21','22-09-10 13:33:58','22-10-10 10:16:19',true,5),
(7,'pushim vjetor','22-11-19 15:26:43','22-12-20 17:15:03','23-01-01 13:59:01',true,4),
(8,'familjare','22-10-13 14:03:22','23-01-01 12:54:59','23-01-01 15:16:17',false,2),
(9,'pushim vjetor','22-12-30 13:52:49','23-02-02 17:03:04','23-03-02 16:12:50',true,10),
(10,'pushim vjetor','22-12-30 13:52:49','23-02-02 17:03:04','23-03-02 16:12:50',true,8);

-- SELECT * FROM pushimet;

INSERT INTO vleresimet(vleresimi_id,vlera,koment,data_,konsumatori_id)
VALUES
(1,2,'Nuk me ka pelqyer shume','22-06-17 16:03:44',1),
(2,3,'Me ka pelqyer','22-10-30 14:14:02',11),
(3,4,'Me ka pelqyer shume','22-04-15 08:05:45',7),             
(4,3,'Me ka pelqyer','22-12-12 18:00:33',3),
(5,5,'Me ka pelqyer shume dhe gjithqka ishte ne rregull','22-07-30 11:01:21',8),
(6,1,'Nuk me ka pelqyer fare','22-10-10 16:33:35',5),
(7,4,'Me ka pelqyer shume','23-01-01 10:11:20',4),
(8,3,'Me ka pelqyer','23-01-15 13:26:12',2),
(9,5,'Me ka pelqyer shume dhe gjithqka ishte ne rregull','23-03-02 14:45:01',10),
(10,3,'Me ka pelqyer','23-01-15 13:26:12',5); 

-- SELECT * FROM vleresimet;

INSERT INTO eventet(event_id,pershkrimi,data_,cmimi,staf_id)
VALUES
(1,'bank muzikor','22-10-01 08:15:13',5,9),  
(2,'shfaqje teatrale','22-10-10 12:09:12',11,7),
(3,'muzik live','22-12-04 03:03:03',7,1),
(4,'fejes','22-12-12 09:17:45',5,9),
(5,'ditelindje','22-01-10 06:14:55',8,1),
(6,'muzik live','22-10-07 09:12:13',9,7),
(7,'martese','22-09-03 02:16:03',15,6),
(8,'ditelindje','23-05-03 12:22:22',7,10),
(9,'fejese','22-02-11 16:19:19',10,9),
(10,'fejese','22-04-11 16:19:19',10,4);

-- SELECT * FROM eventet;

insert into porosi_artikuj(porosi_artikuj_id,porosi_id,artikulli_id) values
(1,1,2),(2,1,3),(3,1,2),(4,1,4),
(5,2,1),(6,2,3),(7,2,8),
(8,3,3),(9,3,2),(10,3,7),
(11,4,1),(12,4,6),
(13,5,5),(14,5,10),
(15,6,1),(16,6,3),(17,6,2),(18,6,4),(19,6,2),
(20,7,1),(21,7,9),(22,7,10),(23,7,9),
(24,8,1),(25,8,2),(26,8,3),(27,8,4),(28,8,5),
(29,9,1),(30,9,4),(31,9,9),(32,9,8),
(33,10,3),(34,10,10),(35,10,7),(36,10,9);

