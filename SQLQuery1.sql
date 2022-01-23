create database VT_ALISVERIS3
use VT_ALISVERIS3
create table tblMusteriler(

id int primary key identity(1,1),
isim varchar (20) not null ,
soyisim varchar(20) not null,
mail varchar (20) not null,


);

create table tblUrunKategori(

id int primary key identity(1,1),
kategori varchar(30) not null,


);

create table tblUrunler(
id int primary key identity(1,1),
ad varchar (20) not null,
fiyat float not null,
barkod varchar (30),
urun_kategori_id int foreign key references tblUrunKategori(id),



);

create table tblMusteriAlisverisTarihi(
id int primary key identity(1,1),
tarih datetime default current_timestamp,


);

create table tblAlisverisKayit(
alisveris_id int foreign key references tblMusteriAlisverisTarihi(id),
musteri_id int foreign key references tblMusteriler(id),
urun_id int foreign key references tblUrunler(id),
urun_fiyat float not null,
adet float not null,



);

insert into tblMusteriler values('ali','kaya','ak@gmail.com'),
											('hasan','alan','al@gmail.com'),
											('ayse','bilir','ay@gmail.com')

insert into tblUrunKategori values('g�da');
insert into tblUrunKategori values('�ark�teri');
insert into tblUrunKategori values('�ikolata');
insert into tblUrunKategori values('bisk�vi');
insert into tblUrunKategori values('unlu mam�ller');
insert into tblUrunKategori values('temizlik �r�nleri');

 
insert into tblUrunler values ('peynir',15.00,'100',2);
insert into tblUrunler values ('yumurta',16.00,'101',1);
insert into tblUrunler values ('�ay',17.00,'102',1);
insert into tblUrunler values ('Halley',1.00,'103',4);
insert into tblUrunler values ('negro',1.50,'104',4);
insert into tblUrunler values ('deterjan',19.55,'105',6);
------------------------------------------------------

insert into tblMusteriAlisverisTarihi (tarih) values(current_timestamp);--tarih ekleme g�n ay y�l yaz�ld��� tarihi yazar

--1.m��teriye 1.ali�veri�i ekle 

--sql de de�i�ken olu�turma
declare @fiyat float 
set @fiyat=(select fiyat from tblUrunler where id=1)


insert into tblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
values(1, 1, 1, @fiyat , 3); 


declare @fiyat float
set @fiyat=(select fiyat from tblUrunler where id=2)

insert into tblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
values(1,1,2,@fiyat,5);

declare @fiyat float
set @fiyat=(select fiyat from tblUrunler where id=3)

insert into tblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
values(1,1,3,@fiyat,4);

declare @fiyat float
set @fiyat=(select fiyat from tblUrunler where id=5)

insert into tblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
values(1,1,5,@fiyat,4);

--m��teri ad� �r�n ismi �ekmek istersek inner join kullanaca��z

-----------------------------------
--2.m��teriye ali�veri� ekle

insert into tblMusteriAlisverisTarihi(tarih) values(current_timestamp)--tarih ekleme

declare @fiyat float
set @fiyat=(select fiyat from tblUrunler where id=1)
insert into tblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet)
values(2,2,1,@fiyat,3)

declare @fiyat float
set @fiyat=(select fiyat from tblUrunler where id=2)
insert into tblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet)
values(2,2,2,@fiyat,4)


declare @fiyat float
set @fiyat=(select fiyat from tblUrunler where id=3)

insert into tblAlisverisKayit (alisveris_id,musteri_id,urun_id,urun_fiyat,adet)
values (2,2,3,@fiyat,5)

-------------------------
--urunlerin ad�n� kategorisni musteri adlar�n� g�rmek i�in inner join veya select where kullanaca��z

--1 select where ile:
select tblAlisverisKayit.alisveris_id,tblMusteriler.isim,tblMusteriler.soyisim,tblUrunler.ad,tblUrunler.fiyat guncel_fiyat,
tblAlisverisKayit.urun_fiyat eski_fiyat,tblAlisverisKayit.adet,tblMusteriAlisverisTarihi.tarih from tblAlisverisKayit,tblMusteriler,tblUrunler,
tblMusteriAlisverisTarihi where (tblMusteriler.id=tblAlisverisKayit.musteri_id) and (tblUrunler.id=tblAlisverisKayit.urun_id)
and(tblAlisverisKayit.alisveris_id=tblMusteriAlisverisTarihi.id)

--inner join ile // tblaslisveris kay�t al�n�r ��nk� foreign keyler ordaa tutulur
select tblAlisverisKayit.musteri_id,tblMusteriler.isim,tblMusteriler.soyisim,tblUrunler.fiyat,tblAlisverisKayit.adet,
tblMusteriAlisverisTarihi.tarih from (tblAlisverisKayit 
inner join tblMusteriler on tblAlisverisKayit.musteri_id=tblMusteriler.id
inner join tblUrunler on tblAlisverisKayit.urun_id=tblUrunler.id
inner join tblMusteriAlisverisTarihi on tblAlisverisKayit.alisveris_id=tblMusteriAlisverisTarihi.id

)



select *from tblUrunKategori
select *from tblUrunler
select *from tblMusteriAlisverisTarihi
select *from tblAlisverisKayit






	

















