--use Library
--name ve surname getiren sorgu
--select a.Name, a.Surname from Authors a
--select * from Authors

--Yazarlar�n id, ad ve soyadlar�n� raporla.(Format� D.Bitmez)
--select LEFT(a.Name,1)+'.'+A.Surname AdSoyad from Authors a

--Bor�lar�n id, amount, ispaid, loanidyi raporlay�n
--select f.FineId,f.Amount,f.IsPaid,f.LoanId, f.Amount*1.18 'kdvli' from Fines f

--��rencilerin ad ve soyadlar�yla birlikte ya�lar�n� raporlay�n�z.
--select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, DATEDIFF(YEAR,s.BirthDate,GETDATE()) 'Ya�' from Students s
--select * from Students

--kitap �creti 150dan y�ksek olan kitaplar� raporlay�n�z
--select b.Price from Books b where b.Price>150 

--Kategorisi korku olan kitaplar� listeleyen program
--select c.CategoryName from Categories c where c.CategoryName='Horror'

--Category idsi 5 olmayan kitaplar�n adlar�n� ve kategori idlerini yaz�n�z.
--select b.Title, b.CategoryId from Books b where b.CategoryId!=5

--01.01.1993 tarihinden sonra al�nm�� kitaplar�n ad�n�, idsini ve d�n�� tarihini raporlay�n�z.
--select l.BookId, l.ReturnDate from Loan l where l.LoanDate>'01.01.1993'

--kitaplar�n aras�nda stok miktar� 20 ile 50 aras�nda olan kitaplar� raporlay�n�z.
--select b.Stock from Books b where b.Stock>20 and b.Stock<=50

--ya�� 20den b�y�k istanbulda ya�ayan ��rencilerin adlar�n� ve ya�lar�n� raporla(ancak isimler �u formatta olmal�d�r A.fen)
--select LEFT(s.Name,1)+'.'+ s.Surname 'AdSoyad' , s.Region, DATEDIFF(YEAR,s.BirthDate,GETDATE()) 'Yas' from Students s where DATEDIFF(YEAR,s.BirthDate,GETDATE()) > 20 and s.Region='Istanbul'

--1997 dahil y�l�ndan sonra al�nm��, �creti 700den b�y�k ve geri d�n�� tarihi olmayan sipari�lerin idsini, al�� tarihini, d�n�� tarihlerini ve kitap �cretlerini raporlay�n�z.
--select f.FineId,f.Amount, f.IsPaid from Fines f
--where f.FineId=2 and f.Amount>20 and f.IsPaid=1

--b�lge bilgisi girilmemi� ��rencileri listeleyin.
--select * from Students s where s.Region is null

--Publishers� girilmemi� kitaplar� listeleyin.
--select * from Publishers p where p.Name is null 

--title'� Greek ve sanhj olan kitaplar�n isbn verisi 2000den b�y�k olan, category idsi 5ten b�y�k, author idsi 8den k���k olan kitaplar� listeleyiniz.
--select b.Title, b.ISBN, b.CategoryId, b.AuthorId from Books b where (b.Title='Greek' and b.Title='sanhj') and b.ISBN>20000 and b.CategoryId>5 and AuthorId<8

--kategorileri a-zye s�rala
--select * from Categories c
--order by c.CategoryId asc

--authorlar�n idsini ve ad�n� s�ralay�n ancak ad jane olacak ve id tersten s�ralanacak.
--select a.AuthorId, a.Name from Authors a 
--where a.Name='Jane'
--order by a.AuthorId desc

--en uygun 10 fines� listeleyin.
--select top 10 f.Amount from Fines f

--en son k�t�phaneden al�nan 5 kitab� listeleyin.
--select top 5 l.BookId from Loan l

--kitab�n stok miktar� 20den b�y�k 49dan k���k olan kitaplar� listeleyin.
--select b.Stock from Books b where b.Stock between 20 and 49

--01.01.1997 ile 06.06.1998 tarihleri aras�ndaki kitap geri d�n��erini raporlay�n�z.
--select l.ReturnDate, l.StudentId from Loan l where l.ReturnDate between '01.01.1997' and '06.06.1998' and l.StudentId=4 and l.StudentId=7

--ba� harfi c olan stoklarda mevcut 10 ile 250 dolar aras� �creti olan kitaplar� fiyatlar�na g�re listeleyiniz.
--select b.Title, b.Stock, b.Stock from Books b where b.Title like 'c%' and b.Stock between 10 and 250

----�ar�amba g�n� al�nan student 1 ile 7 aras�nda olan, teslim tarihi null olmayan kitaplar�n bilgilerini raporlay�n�z 
--ve tarihine g�re b�y�kten k����e s�ralayan�z
--select l.LoanDate, l.StudentId, l.ReturnDate from Loan l where DATENAME(weekday,l.LoanDate)='Wednesday' and l.StudentId between 1 and 7
-- and l.ReturnDate is not null

--kategorileri a harfi ile ba�layanlar� s�ralay�n�z.
--select * from Categories c where c.CategoryName like 'c%'
--librarians isimleri aras�nda ltd ge�en �irketleri listeleyen program
--select * from Librarians l where l.Name like '%ltd%'

--��renci idlerinden ilk iki harfi bilinmeyen ama son �� harfi mon olan ��renciyi g�sterin.
--select s.StudentId, s.Name from Students s where s.Name like '__mon'

--kategori idlerinden ilk harfi a ya da s olan kategori
--select * from Categories c where c.CategoryName like '[AS]%'

--Publishers ilk harfi a ile k aras�nda olan publisherslar
--select * from Publishers p where p.Name like '[A-K]%'

--publishers ilk harfi a olan ikinci harfi n olmayan
--select * from Publishers p where p.Name like 'a[^n]%'

--�ehri istanbul olmayan ad� a ile ba�lay�p soyad� r ile biten do�um tarihi 1985den �nce ��renci kimdir
--select*from Students s where s.Region!='Istanbul' and s.Name like 'a%' and s.Surname like '%r' and YEAR(s.BirthDate)<1985

--Authors'� kank olan eleman kimdir
--select * from Authors a where a.Name like '%kank%'

--stokta bulunan ka� adet kitab�m var
--select b.Stock, COUNT(distinct b.Stock) from Books b 
--group by b.Stock

--fiyat� 50 tlden fazla al�nm�� ka� kitap vard�r?
--select COUNT(b.Price) from Books b where b.Price>50

--Ka� �ehirden ��renci var
--select s.Region,COUNT(s.Region) from Students s
--group by s.Region

----kitaplar�n stok fiyatlar�n� toplayan program
--select SUM(b.Stock) stok from Books b 

--depoda �cret bazl� olarak toplam ne kadar kitab�m kalm��t�r?
--select SUM(b.Stock*b.Price) toplam from Books b 

--fine idsi 6 olan kitab�n toplam ne kadar �cret getirdi�ini hesapla
--select SUM(f.Amount) toplam from Fines f where f.FineId=6

--bu zamana dek �denmi� ortalama kitap �cretleri
--select AVG(b.Price) ortalama from Books b 

--�u ana kadar kitaplarda yap�lan ciro
--select SUM(b.Price*b.Stock) ciro from Books b

--en y�ksek bedele sahip fine
--select MAX(f.Amount) enBuyuk from Fines f 

--en k���k bedele sahip fine
--select MIN(f.Amount) enKucuk from Fines f

----kitap idleri a k aras�nda olanlar�n vermi� olduklar� stoklar� 100 ile 200  aras�nda olan sipari�lere en az ne kadar 
--�cret �denmi�tir?
--select b.Title, b.Stock, MIN(b.Price) ucret from Books b where b.Title like '[A-K]' and b.Stock between 100 and 200
--group by b.Title, b.Stock

--en fazla gelen �cret
--select MAX(b.Price*b.Stock) enYuksek from Books b

--1 veya 8 numaral� idye sahip, 1996 y�l�nda bir cumartesi g�n� al�nm�� sipari�lerin idlerine g�re max s�ralamas�.
--select MAX(l.BookId) from Loan l where l.LoanId in (1,8) and l.BookId = 2 and Year(l.ReturnDate)=1996 and DATENAME(WEEKDAY,l.ReturnDate)='Saturday'

--Kitap ismi rakt veya pasd olan, idsi 5 olan , �creti 20 ile 80 aras�nda olan toplam �creti hesapla.
--select SUM(b.Price) from Books b where b.Title in ('rakt','pasd') and b.BookId=5 and b.Price between 20 and 80

--�ehirlere g�re ��renci say�s� nedir
--select s.Region,COUNT(s.Region) from Students s
--group by s.Region

--Hangi kitab�n ka� sto�u var
--select b.Title,b.Stock, COUNT(b.Stock) stok from Books b 
--group by b.Title, b.Stock

--Publishers ad�na g�re ka� adet kitap idsi vard�r?
--select p.Name, COUNT(p.PublisherId) id from Publishers p
--group by p.Name

--regionlara g�re hangi ��rencilerin kitap ald���n� ve bu �lkeleri en �ok kitap alan 3 ��rencinin region� olarak s�ralay�n
--select s.Name,s.Region, COUNT(s.Region) ulke from Students s 
--group by s.Name,s.Region

-- ��rencilerin ka� adet maili vard�r?
--select s.Email, COUNT(s.Email) from Students s 
--group by s.Email

--Ka� adet kitap gecikme �creti vard�r?
--select f.FineId,f.Amount, COUNT(f.Amount) ucret from Fines f 
--group by f.FineId,f.Amount

--hangi kitab�n ka� kategori idsi vard�r?
--select b.CategoryId, COUNT(b.CategoryId)kategori from Books b
--group by b.CategoryId

--Kitaplar�n adlar�n� ve kategori adlar�n� listeleyeniz.
--select b.Title, c.CategoryName from Books b inner join Categories c on b.Title=c.CategoryName

--�d�n� al�nan kitab�n idsini ve �d�n� veren k�t�phaneci idsini listeleyiniz
--select b.BookId, l.LibrarianId from Books b inner join Librarians l on b.BookId=l.LibrarianId

--�d�n� al�nan kitab�n idsi ile �sbn numaras�n� ve  kitab�n ad�n� listeleyiniz.
--select l.BookId, b.ISBN, b.BookId from Loan l inner join Books b on l.BookId=b.ISBN

--K�t�phanedeki kitaplar�n ve publisher�n ad�n� giriniz.
--select p.Name, b.Title from Publishers p inner join Books b on p.Name=b.Title

--Kitab�n yazar�n�n idsi, kitab�n isbn'i, idsi ve publisher�n idsini listeleyiniz.
--select a.AuthorId, b.ISBN, b.BookId, p.PublisherId from Authors a inner join Books b on a.AuthorId=b.ISBN inner join Publishers p on b.BookId=p.PublisherId

--��rencinin hangi kitab� �d�n� ald��� ve toplam ka� lira ceza �dedi�ini listeleyin.
--select f.FineId, l.BookId, f.Amount, b.Price from Fines f inner join Loan l on f.FineId=l.BookId inner join Books b on f.Amount=b.Price

--��rencinin ya� bilgisi, kitap �d�n� alma tarihi, ald��� kitab�n idsi ve kitab� veren k�t�phanecinin idsini listeleyiniz.
--select s.BirthDate, l.ReturnDate, l.BookId, li.LibrarianId from Students s inner join Loan l on s.BirthDate=l.ReturnDate inner join Librarians li on l.BookId=li.LibrarianId

--Author ve publisher�n idlerini listeleyin.
--select a.AuthorId, p.PublisherId from Authors a inner join Publishers p on a.AuthorId=p.PublisherId

--Kitab�n kategorisi bo� olan ile kitab� �d�n� alan ��rencinin idsi kitab� veren k�t�phanecinin ad� ve verilen kitab�n ad�n� listeleyiniz.
--select c.CategoryName, c.CategoryId,b.BookId, l.StudentId, li.Name from Categories c inner join Books b on c.CategoryName=b.CategoryId
--inner join Loan l on b.BookId=l.StudentId 
--inner join Librarians li on b.Title=li.Name 
--where c.CategoryName is null
--group by c.CategoryName, c.CategoryId, b.BookId, l.StudentId, li.Name

--Kitab�n publisher idsi ile isbni listeleyin. ve burada idsi null olmayanlar� ibnde de null olanlar� listelesin
--select p.PublisherId, b.ISBN from Publishers p inner join Books b on p.PublisherId=b.ISBN
--where p.PublisherId is not null and b.ISBN is null
--group by p.PublisherId, b.ISBN

--�d�n� al�rken �demeyi yapt� m� ve geri iade etti mi kontrol�n� sa�layan liste. �demesi yap�lmam��lar� listele
--select f.IsPaid,l.IsReturned from Fines f inner join Loan l on f.IsPaid=l.IsReturned
--where IsPaid is null 
--group by f.IsPaid, l.IsReturned

--en �ok tercih edilen kitap ve bunlar�n fiyatlar�n� listeleyiniz.
--select top 3 l.BookId,COUNT(b.Price) price from Loan l inner join Books b on l.BookId=b.Price
--group by l.BookId

--Loan tablosundaki t�m kay�tlar� ve bu kay�tlar�n Books tablosundaki kar��l�k gelen bilgileri listele.
--select * from Loan l left join Books b on l.BookId=b.Price

--Books tablosundaki t�m kay�tlar� ve bu kay�tlar�n Loan tablosundaki kar��l�k gelen bilgileri listele
--select * from Loan l right join Books b on l.BookId=b.Price

--Hangi ��renci hangi kitab�n cezas�na ne kadar �demi�tir?(�demese bile g�r�nmelidir.)
--select s.StudentId, l.BookId, f.Amount from Students s inner join Loan l on s.StudentId=l.BookId left join Fines f on l.BookId=f.Amount
--group by s.StudentId, l.BookId, f.Amount

--Hangi yazar�n kitab�n�n hangi �crete sahip oldu�unu ve �d�n� al�nmas� durumundaki idsi ile o kitab� veren k�t�phanecinin idsini listeleyiniz.
 --select a.AuthorId,b.BookId ,b.Price,l.LibrarianId,li.LibrarianId, SUM(b.Price*b.Stock) toplam from Authors a 
 --left join Books b on a.AuthorId=b.Price 
 --left join Loan l on l.BookId=b.Price 
 --left join Librarians li on l.LibrarianId=li.LibrarianId
 --group by a.AuthorId, b.BookId,b.Price,l.LibrarianId,li.LibrarianId
 --order by b.Price desc

 --��rencinin �d�n� ald��� kitab�n cezas�n�n toplam �cretini zam geldi�i i�in 1.18 ile �arp�p getirelim.
 --select s.StudentId, l.StudentId, l.LoanId,f.Amount, SUM(f.Amount*1.18) toplam from Students s 
 --left join Loan l on s.StudentId=l.StudentId 
 --left join Fines f on l.LoanId=f.Amount
 --group by s.StudentId, l.StudentId, l.LoanId,f.Amount
 --order by f.Amount desc

 --��rencinin ad ,soyad ve idsini alan ve �d�n� ald��� kitap var m� diye kontrol eden daha sonras�nda kitaplara �denen toplam �creti listeleyin.
 --select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, s.StudentId, b.stock ,SUM(b.Price*b.Stock) toplam from Students s 
 --left join Loan l on s.StudentId=l.LoanId 
 --left join Books b on l.StudentId=b.Price
 --group by LEFT(s.Name,1)+'.'+s.Surname, s.StudentId, b.stock
 --order by toplam desc

 --Kategori idsi toplam� 20den b�y�k olan kitaplar�n titlelar�n� listeleyiniz.
 --select b.Title, SUM(c.CategoryId) toplam from Categories c inner join Books b on c.CategoryId=b.CategoryId
 --group by b.Title, c.CategoryId
 --having c.CategoryId>20
 --order by c.CategoryId desc

 --kategori idlerin bulundu�u kitaplar�n hangi yazara ait oldu�unu belirtiniz. ve bu kitaplar�n toplam �cretini getiriniz.
 --select c.CategoryId,a.AuthorId,SUM(b.Price*b.Stock) toplam from Categories c inner join Books b on c.CategoryId=b.CategoryId inner join Authors a on b.AuthorId=a.AuthorId
 --group by c.CategoryId,a.AuthorId
 --order by toplam desc

 --select * from Authors 
 --insert Authors values(3,'Fan','Yle', '2000-03-26')

 --insert Authors values(4,'Terek','Yaml', '2002-03-26')

 --select * from Books 
 --insert Books values('Greek',454687957,2,2,2,100,50)

 --select * from Students
 --insert Students values('Charles','Bitr','chbtr@gmail.com','Istanbul','2002-05-05')

 --select * from Librarians

 --update Librarians set Name='Oledi'
 --where LibrarianId=2

  --select * from Publishers
  --update Publishers set Name='Yt'
  --where PublisherId=1

  --select * from Students
  --delete from Students where StudentId=3


 --Hangi ��rencilerin 2 idli kitab� �d�n� kitap ald���n� listeleyen program
 --create view IstanbulluOgrenciler
 --as
 --select s.StudentId,b.BookId from Loan l inner join Students s on s.StudentId=l.StudentId inner join Books b on l.LoanId=b.BookId
 --where b.BookId=2

 --select * from IstanbulluOgrenciler

 --alter view IstanbulluOgrenciler
 --as
 --select s.StudentId,b.BookId from Loan l inner join Students s on s.StudentId=l.StudentId inner join Books b on l.LoanId=b.BookId
 --where b.BookId=2

 --Kategori idsi 8 veya 9 olan, �d�n� olan kitab�n idsi 5 veya 6 olan ve kitab� veren k�t�phanecinin idsini listeleyiniz
 --create view Kitap
 --as
 --select c.CategoryId, b.BookId, l.LibrarianId from Categories c 
 --inner join Books b on c.CategoryId=b.CategoryId 
 --inner join Loan l on b.BookId=l.BookId 
 --inner join Librarians li on l.LibrarianId=li.LibrarianId
 --where c.CategoryId in (8,9) and l.BookId in (5,6)

 --select * from Kitap

 --��rencinin ad, soyad, ya�� ile birlikte �d�n� ald��� kitaplar ve bu kitaplar�n cezas� var m� listeleyiniz.
 --create view Kitap2
 --as
 --select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, DATEDIFF(YEAR,s.BirthDate,GETDATE()) yas,l.LoanId,f.FineId from Students s 
 --left join Loan l on s.StudentId=l.StudentId 
 --right join Fines f on l.LoanId=f.FineId

 --select * from Kitap2

 --Hangi k�t�phanecinin �d�n� kitap verdi�ini ve bu kitab�n hangi kategoriye ait oldu�unu listeleyiniz.
 --create view Kitap_3
 --with schemabinding
 --as
 --select l.LibrarianId,l.BookId,c.CategoryId from dbo.Librarians li 
 --left join dbo.Loan l on li.LibrarianId=l.LibrarianId 
 --left join dbo.Books b on l.BookId=b.BookId 
 --left join dbo.Categories c on b.CategoryId=c.CategoryId

 --select * from Kitap_3



 --��rencilerin �d�n� alm�� oldu�u kitaplar� listeleyen program
 --create view Ogrenci
 --with schemabinding, encryption
 --as
 --select s.StudentId,b.BookId, s.Name from dbo.Students s 
 --inner join dbo.Loan l on s.StudentId=l.StudentId 
 --inner join dbo.Books b on l.BookId=b.BookId
 --where s.Name is not null

 --select * from Ogrenci

 --Kategori ekleyen bir prosed�r yaz�n�z.
 --create proc ekleKategori5
 --(
 --@kAd� nvarchar(35)
 --)
 --as
 --insert Categories(CategoryName) values(@kAd�)
 --go
 --ekleKategori 'Dram'
 --select * from Categories

 --kitap fiyatlar�na zam yapan prosed�r� yaz�n�z.
 --Create proc Zam2
 --(
 --@miktar money
 --)
 --as
 --update Books set Price=Price*+@miktar

 --select * from Books

 --ad� d��ar�dan verilmi�,�d�n� al�nm�� kitaplar� yazd�ran prosed�r
 --create proc loan5
 --(
 --@ad nvarchar(35)
 --)
 --as
 --select b.BookId from Loan l inner join Books b on l.BookId=b.BookId
 --where b.Title=@ad
 
 --loan5 'hghghg'
 --select * from Books

 --d��ardan sto�u girilen kitab�n kategorisini yazd�ran prosed�r
 --create proc stok4
 --(
 --@stok int
 --)
 --as
 --select b.CategoryId, b.Stock from Books b inner join Categories c on b.CategoryId=c.CategoryId
 --where b.Stock=@stok
 --go
 --stok4 70

 --select * from Books

 --kitaplar�n stok miktar� ve �creti d��ardan girilen ve iki de�er aras�nda olan, fiyat� kdvli hali olarak verilen title, �sbn, loanid verilerini getiren prosed�r
-- create proc islem2
-- (
-- @stok1 int,
-- @stok2 int,
-- @ucret1 money,
-- @ucret2 money
-- )
-- as
-- select b.Stock, b.Title, b.ISBN, l.LoanId,b.Stock,b.Price from Books b inner join Loan l on b.BookId=l.BookId
-- where b.Stock between @stok1 and @stok2 
-- and b.Price between @ucret1 and @ucret2
--go
--islem2 50,40,100,200

--select * from Books

--ayn kategori idsi ve ismi
--create proc KategoriEkle1
--(
--@ad nvarchar(20)
--)
--as
--if(not exists(select *from Categories where CategoryName=@ad))
--begin
--insert Categories(CategoryName)values(@ad)
--end
--else
--begin
--print 'Zaten b�yle bir kategori var'
--end
--kategoriEkle1 'abcd'
--select*from Categories

--d��ardan gelen iki de�eri �arp�p bize de�er d�nd�ren fonk.
--create function carp
--(
--@sayi1 int,
--@sayi2 int
--)
--returns int
--as
--begin
--return @sayi1*@sayi2
--end

--select dbo.carp(5,3)

--stok ve price girildi�inde kdvli halini yazd�ran program
--create function indirimli2
--(
--@fiyat money,
--@stok int
--)
--returns money
--as
--begin
--return (@fiyat*@stok)*1.18
--end

--SELECT 
--    b.Price, 
--    b.Stock, 
--    '%18' AS KDVOrani,
--    dbo.indirimli2(b.Price, b.Stock) AS IndirimliFiyat
--FROM Books b

--d��ardan girilen kitab�n title bilgisini giren ve �d�n� al�nan kitab�n id bilgisinin fonk.
--create function title
--(
--@title nvarchar(50)
--)
--returns table
--as
--return select b.BookId, l.LoanId from Books b inner join Loan l on b.BookId=l.BookId
--where b.Title=@title

--select * from dbo.title('comedy')

--d��ardan girilen ��rencinin namei ve loan idsi al�nan fonk.

--create function prac
--(
--@name nvarchar(50)
--)
--returns table
--as
--return select LEFT(s.Name,1)+','+s.Surname AdSoyad,l.LoanId, s.StudentId from Students s inner join Loan l on s.Name=l.StudentId
--where s.Name=@name

--select * from dbo.prac('tre')

--title� greek olan bir kitap varsa stok, price ve isbn'i g�ncelle.

--IF (EXISTS (SELECT * FROM Librarians l WHERE l.Name = 'gffdf'))
--BEGIN
--    UPDATE Librarians 
--    SET Surname = 'Janly' 
--    WHERE Name = 'gffdf'

--    PRINT 'kay�t g�ncellendi'
--END
--ELSE
--BEGIN
--    INSERT INTO Librarians (Name, Surname) 
--    VALUES ('gffdf', 'Janly')

--    PRINT 'kay�t eklendi'
--	END
--SELECT * FROM Librarians

--author d��ardan name ve surname als�n e�er yoksa eklesin varsa da zaten var diye uyars�n
--CREATE PROCEDURE Authorproc
--(
--    @Name NVARCHAR(100),
--    @Surname NVARCHAR(100)
--)
--AS
--    IF (EXISTS (SELECT * FROM Authors WHERE Name = @Name AND Surname = @Surname))
--    BEGIN
--        PRINT 'Bu yazar zaten mevcut.'
--    END
--    ELSE
--    BEGIN
--        INSERT INTO Authors (Name, Surname) 
--        VALUES (@Name, @Surname)

--        PRINT 'Yeni yazar eklendi.'
--		 END
--EXEC Authorproc 'Jane', 'Janly'

--SELECT * FROM Authors

--��rencinin d��ardan ad ve soyad� al�ns�n e�er varsa bu ��renci mecvut de�ilse ekleyen fonk.
--CREATE PROCEDURE Studentproc1
--(
--    @Name NVARCHAR(100),
--    @Surname NVARCHAR(100)
--)
--AS
--    IF (EXISTS (SELECT * FROM Students WHERE Name = @Name AND Surname = @Surname))
--    BEGIN
--        PRINT 'Bu ��renci zaten mevcut.'
--    END
--    ELSE
--    BEGIN
--        INSERT INTO Students (Name, Surname) 
--        VALUES (@Name, @Surname)

--        PRINT 'Yeni ��renci eklendi.'
--    END

--EXEC Studentproc1 'Jake', 'Jane'

--SELECT * FROM Students