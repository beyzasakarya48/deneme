--T-SQL --> Microsoft / Sybase
-- PL/SQL --> Oracle
--DE���KEN TANIMLA
--DECLARE --> DE���KEN TANIMLAMA
DECLARE @sayi INT;
--SET --> de�i�kene de�er atama
SET @sayi = 5;
DECLARE @karakter varchar(20)
DECLARE @sayi1 INT, @sayi2 INT, 
@toplam INT;
SET @sayi1=10
SET @sayi2=10
SELECT @toplam=@sayi1+@sayi2
DECLARE @enyuksekmaas MONEY
SELECT @enyuksekmaas=MAX(maas)
FROM PERSONEL --de�i�kene yaz�lan
--sorgu teksat�r d�nmelidir!
SET @enyuksekmaas = 100000
SELECT @enyuksekmaas = 100000
--EN FAZLA SAYFA SAYISINI BULMA
SELECT MAX(s_sayisi) FROM KITAPLAR
DECLARE @maxsayfa INT
SELECT @maxsayfa=MAX(s_sayisi) 
FROM KITAPLAR
SELECT @maxsayfa AS "MAKS Sayfa"
/* SELECT @maxsayfa AS "MAKS Sayfa" */
-- S�STEM FONKS�YONLARI
/* @@ERROR --> AKT�F BA�LANTI 
SIRASINDA MEYDANA GELEN HATALAR

@@SERVICENAME -->SQL SERVER'IN 
WINDOWS SERV�S �SM�N� G�STER�R

@@SERVERNAME --> SQL SERVER'IN
�ALI�TI�I SUNUCU B�LG�S�N� G�STER�R

@@VERSION --> SQL SERVER'IN VERS�YON
B�LG�S�N� G�STER�R

@@DATEFIRST -->SQL SERVER ���N HAFTANIN
�LK G�N�N� G�STER�R 1=PAZARTES�

@@ROWCOUNT -->SON KULLANILAN SQL �FADES�
SONUCUNDAK� SATIR SAYISINI G�STER�R

@@CONNECTIONS -->SQL SERVERIN BA�LAN-
TILARINI G�STER�R

@@CPU_BUSY --> SQL SERVER'IN SON �ALI�-
MASINDAN �T�BAREN �ALI�MA S�RES�N� M�L�-
SAN�YE C�NS�NDEN G�STER�R.

@@TOTAL_READ -->SQL SERVER'IN SON �ALI�-
MASINDAN �T�BAREN MEYDANA GELEN D�SK 
OKUMA ��LEM SAYISINI G�STER�R.

@@TOTAL_WRITE -->SQL SERVER'IN SON �ALI�-
MASINDAN �T�BAREN MEYDANA GELEN D�SK 
YAZMA ��LEM SAYISINI G�STER�R.*/
SELECT 5/0
SELECT @@ERROR

SELECT @@SERVERNAME AS "SUNUCU B�LG�S�"
SELECT @@SERVICENAME AS "SERV�S B�LG�S�"
SELECT*FROM sys.messages
SELECT @@VERSION AS "VERS�YON B�LG�S�"
SELECT @@LANGUAGE AS "D�L B�LG�S�"
/* GO �LE YI�IN  Y�NET�M� GO KOMUTU 
KULLANILMADIK�A YAZILAN SORGULARIN SONUNA
GELMEDEN SORGULAR SUNUCUYA G�NDER�LMEZ.
GO KOMUTU �LE AYNI SATIRDA T-SQL KOMUTLARI
BULUNMAZ!

T-SQL �FADELER�
....
...
GO
T-SQL �FADELER�
..
GO
..
�RNEK: @deger isminde bir de�i�ken tan�mlanm��,
daha sonra de�er atamas� yap�lm��, sonra y���n
GO ile sonland�r�l�p SELECT ifadesiyle de�i�ken 
i�eri�i listelenmek istenmi�tir.*/
DECLARE @deger INT
SET @deger=15

SELECT @deger 
GO
/*
USE --> sorgunun hangi veritaban� �zerinden 
�al��aca��n� g�sterir.
USE veritaban�_ad�

PRINT --> de�i�ken de�erlerini, istenilen bilgiyi,
hatalar� vb. ekrana yazd�rma komutudur.

PRINT @degisken_adi */
DECLARE @deger INT
SET @deger=15
PRINT @deger
DECLARE @sayi1 INT, @sayi2 INT, 
@toplam INT;
SET @sayi1=10
SET @sayi2=10
SELECT @toplam=@sayi1+@sayi2
PRINT @toplam
/* TABLO tipi de�i�kenler
Bunun sayesinden ayn� de�i�kene birden fazla de�er
atanabilir.
KULLANIM �EKL�:
DECLARE @degisken_adi TABLE (
                             degisken_adi veritipi,
							 degisken_adi veritipi
							 .
							 .
							 ) */
DECLARE @ogrenci TABLE(
						numara INT IDENTITY(1,1),
						isim VARCHAR(20),
						soyisim VARCHAR(20)
						)
/*
�rnek: ��renci numaras�, adsoyad ve telefon 
bilgilerini i�erecek, numara de�eri otomatik artacak
ve adsoyad bilgisi NULL de�er i�ermeyecek �ekilde 
��renci tablo de�i�kenini olu�turarak i�erisine de�er
giri�i yapal�m.*/
DECLARE @OGRENCI TABLE(
						ogr_no INT IDENTITY(1,1),
						adsoyad VARCHAR(50) NOT NULL,
						telefon VARCHAR(15)
						)
INSERT INTO @OGRENCI VALUES('Omer DOGAN','123456')
INSERT INTO @OGRENCI VALUES('Kerem ELMAS','45265')
SELECT * FROM @OGRENCI
/* Yazar numaralar�n� i�eren @yazar isminde ve yazar_no 
bilgisini tutan tablo tipi de�i�kenini tan�mlayal�m.*/
DECLARE @yazar TABLE(
					yazar_no INT
					)
/* de�er atamas� yapal�m */
INSERT INTO @yazar VALUES(1)
INSERT INTO @yazar VALUES(2)
INSERT INTO @yazar VALUES(4)
/* @yazar de�i�keni ile YAZARLAR tablosunu ortak kullanarak
yazarlar�n ad ve soyad bilgilerini bulal�m */
SELECT yazar_adi,yazar_soyadi FROM YAZARLAR
WHERE yazar_no IN (SELECT * FROM @yazar)
