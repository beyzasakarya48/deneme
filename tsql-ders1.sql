--T-SQL --> Microsoft / Sybase
-- PL/SQL --> Oracle
--DEÐÝÞKEN TANIMLA
--DECLARE --> DEÐÝÞKEN TANIMLAMA
DECLARE @sayi INT;
--SET --> deðiþkene deðer atama
SET @sayi = 5;
DECLARE @karakter varchar(20)
DECLARE @sayi1 INT, @sayi2 INT, 
@toplam INT;
SET @sayi1=10
SET @sayi2=10
SELECT @toplam=@sayi1+@sayi2
DECLARE @enyuksekmaas MONEY
SELECT @enyuksekmaas=MAX(maas)
FROM PERSONEL --deðiþkene yazýlan
--sorgu teksatýr dönmelidir!
SET @enyuksekmaas = 100000
SELECT @enyuksekmaas = 100000
--EN FAZLA SAYFA SAYISINI BULMA
SELECT MAX(s_sayisi) FROM KITAPLAR
DECLARE @maxsayfa INT
SELECT @maxsayfa=MAX(s_sayisi) 
FROM KITAPLAR
SELECT @maxsayfa AS "MAKS Sayfa"
/* SELECT @maxsayfa AS "MAKS Sayfa" */
-- SÝSTEM FONKSÝYONLARI
/* @@ERROR --> AKTÝF BAÐLANTI 
SIRASINDA MEYDANA GELEN HATALAR

@@SERVICENAME -->SQL SERVER'IN 
WINDOWS SERVÝS ÝSMÝNÝ GÖSTERÝR

@@SERVERNAME --> SQL SERVER'IN
ÇALIÞTIÐI SUNUCU BÝLGÝSÝNÝ GÖSTERÝR

@@VERSION --> SQL SERVER'IN VERSÝYON
BÝLGÝSÝNÝ GÖSTERÝR

@@DATEFIRST -->SQL SERVER ÝÇÝN HAFTANIN
ÝLK GÜNÜNÜ GÖSTERÝR 1=PAZARTESÝ

@@ROWCOUNT -->SON KULLANILAN SQL ÝFADESÝ
SONUCUNDAKÝ SATIR SAYISINI GÖSTERÝR

@@CONNECTIONS -->SQL SERVERIN BAÐLAN-
TILARINI GÖSTERÝR

@@CPU_BUSY --> SQL SERVER'IN SON ÇALIÞ-
MASINDAN ÝTÝBAREN ÇALIÞMA SÜRESÝNÝ MÝLÝ-
SANÝYE CÝNSÝNDEN GÖSTERÝR.

@@TOTAL_READ -->SQL SERVER'IN SON ÇALIÞ-
MASINDAN ÝTÝBAREN MEYDANA GELEN DÝSK 
OKUMA ÝÞLEM SAYISINI GÖSTERÝR.

@@TOTAL_WRITE -->SQL SERVER'IN SON ÇALIÞ-
MASINDAN ÝTÝBAREN MEYDANA GELEN DÝSK 
YAZMA ÝÞLEM SAYISINI GÖSTERÝR.*/
SELECT 5/0
SELECT @@ERROR

SELECT @@SERVERNAME AS "SUNUCU BÝLGÝSÝ"
SELECT @@SERVICENAME AS "SERVÝS BÝLGÝSÝ"
SELECT*FROM sys.messages
SELECT @@VERSION AS "VERSÝYON BÝLGÝSÝ"
SELECT @@LANGUAGE AS "DÝL BÝLGÝSÝ"
/* GO ÝLE YIÐIN  YÖNETÝMÝ GO KOMUTU 
KULLANILMADIKÇA YAZILAN SORGULARIN SONUNA
GELMEDEN SORGULAR SUNUCUYA GÖNDERÝLMEZ.
GO KOMUTU ÝLE AYNI SATIRDA T-SQL KOMUTLARI
BULUNMAZ!

T-SQL ÝFADELERÝ
....
...
GO
T-SQL ÝFADELERÝ
..
GO
..
ÖRNEK: @deger isminde bir deðiþken tanýmlanmýþ,
daha sonra deðer atamasý yapýlmýþ, sonra yýðýn
GO ile sonlandýrýlýp SELECT ifadesiyle deðiþken 
içeriði listelenmek istenmiþtir.*/
DECLARE @deger INT
SET @deger=15

SELECT @deger 
GO
/*
USE --> sorgunun hangi veritabaný üzerinden 
çalýþacaðýný gösterir.
USE veritabaný_adý

PRINT --> deðiþken deðerlerini, istenilen bilgiyi,
hatalarý vb. ekrana yazdýrma komutudur.

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
/* TABLO tipi deðiþkenler
Bunun sayesinden ayný deðiþkene birden fazla deðer
atanabilir.
KULLANIM ÞEKLÝ:
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
Örnek: Öðrenci numarasý, adsoyad ve telefon 
bilgilerini içerecek, numara deðeri otomatik artacak
ve adsoyad bilgisi NULL deðer içermeyecek þekilde 
öðrenci tablo deðiþkenini oluþturarak içerisine deðer
giriþi yapalým.*/
DECLARE @OGRENCI TABLE(
						ogr_no INT IDENTITY(1,1),
						adsoyad VARCHAR(50) NOT NULL,
						telefon VARCHAR(15)
						)
INSERT INTO @OGRENCI VALUES('Omer DOGAN','123456')
INSERT INTO @OGRENCI VALUES('Kerem ELMAS','45265')
SELECT * FROM @OGRENCI
/* Yazar numaralarýný içeren @yazar isminde ve yazar_no 
bilgisini tutan tablo tipi deðiþkenini tanýmlayalým.*/
DECLARE @yazar TABLE(
					yazar_no INT
					)
/* deðer atamasý yapalým */
INSERT INTO @yazar VALUES(1)
INSERT INTO @yazar VALUES(2)
INSERT INTO @yazar VALUES(4)
/* @yazar deðiþkeni ile YAZARLAR tablosunu ortak kullanarak
yazarlarýn ad ve soyad bilgilerini bulalým */
SELECT yazar_adi,yazar_soyadi FROM YAZARLAR
WHERE yazar_no IN (SELECT * FROM @yazar)
