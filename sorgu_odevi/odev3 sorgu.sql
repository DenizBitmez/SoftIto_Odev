--use Library
--name ve surname getiren sorgu
--select a.Name, a.Surname from Authors a
--select * from Authors

--Yazarlarýn id, ad ve soyadlarýný raporla.(Formatý D.Bitmez)
--select LEFT(a.Name,1)+'.'+A.Surname AdSoyad from Authors a

--Borçlarýn id, amount, ispaid, loanidyi raporlayýn
--select f.FineId,f.Amount,f.IsPaid,f.LoanId, f.Amount*1.18 'kdvli' from Fines f

--öðrencilerin ad ve soyadlarýyla birlikte yaþlarýný raporlayýnýz.
--select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, DATEDIFF(YEAR,s.BirthDate,GETDATE()) 'Yaþ' from Students s
--select * from Students

--kitap ücreti 150dan yüksek olan kitaplarý raporlayýnýz
--select b.Price from Books b where b.Price>150 

--Kategorisi korku olan kitaplarý listeleyen program
--select c.CategoryName from Categories c where c.CategoryName='Horror'

--Category idsi 5 olmayan kitaplarýn adlarýný ve kategori idlerini yazýnýz.
--select b.Title, b.CategoryId from Books b where b.CategoryId!=5

--01.01.1993 tarihinden sonra alýnmýþ kitaplarýn adýný, idsini ve dönüþ tarihini raporlayýnýz.
--select l.BookId, l.ReturnDate from Loan l where l.LoanDate>'01.01.1993'

--kitaplarýn arasýnda stok miktarý 20 ile 50 arasýnda olan kitaplarý raporlayýnýz.
--select b.Stock from Books b where b.Stock>20 and b.Stock<=50

--yaþý 20den büyük istanbulda yaþayan öðrencilerin adlarýný ve yaþlarýný raporla(ancak isimler þu formatta olmalýdýr A.fen)
--select LEFT(s.Name,1)+'.'+ s.Surname 'AdSoyad' , s.Region, DATEDIFF(YEAR,s.BirthDate,GETDATE()) 'Yas' from Students s where DATEDIFF(YEAR,s.BirthDate,GETDATE()) > 20 and s.Region='Istanbul'

--1997 dahil yýlýndan sonra alýnmýþ, ücreti 700den büyük ve geri dönüþ tarihi olmayan sipariþlerin idsini, alýþ tarihini, dönüþ tarihlerini ve kitap ücretlerini raporlayýnýz.
--select f.FineId,f.Amount, f.IsPaid from Fines f
--where f.FineId=2 and f.Amount>20 and f.IsPaid=1

--bölge bilgisi girilmemiþ öðrencileri listeleyin.
--select * from Students s where s.Region is null

--Publishersý girilmemiþ kitaplarý listeleyin.
--select * from Publishers p where p.Name is null 

--title'ý Greek ve sanhj olan kitaplarýn isbn verisi 2000den büyük olan, category idsi 5ten büyük, author idsi 8den küçük olan kitaplarý listeleyiniz.
--select b.Title, b.ISBN, b.CategoryId, b.AuthorId from Books b where (b.Title='Greek' and b.Title='sanhj') and b.ISBN>20000 and b.CategoryId>5 and AuthorId<8

--kategorileri a-zye sýrala
--select * from Categories c
--order by c.CategoryId asc

--authorlarýn idsini ve adýný sýralayýn ancak ad jane olacak ve id tersten sýralanacak.
--select a.AuthorId, a.Name from Authors a 
--where a.Name='Jane'
--order by a.AuthorId desc

--en uygun 10 finesý listeleyin.
--select top 10 f.Amount from Fines f

--en son kütüphaneden alýnan 5 kitabý listeleyin.
--select top 5 l.BookId from Loan l

--kitabýn stok miktarý 20den büyük 49dan küçük olan kitaplarý listeleyin.
--select b.Stock from Books b where b.Stock between 20 and 49

--01.01.1997 ile 06.06.1998 tarihleri arasýndaki kitap geri dönüþerini raporlayýnýz.
--select l.ReturnDate, l.StudentId from Loan l where l.ReturnDate between '01.01.1997' and '06.06.1998' and l.StudentId=4 and l.StudentId=7

--baþ harfi c olan stoklarda mevcut 10 ile 250 dolar arasý ücreti olan kitaplarý fiyatlarýna göre listeleyiniz.
--select b.Title, b.Stock, b.Stock from Books b where b.Title like 'c%' and b.Stock between 10 and 250

----çarþamba günü alýnan student 1 ile 7 arasýnda olan, teslim tarihi null olmayan kitaplarýn bilgilerini raporlayýnýz 
--ve tarihine göre büyükten küçüðe sýralayanýz
--select l.LoanDate, l.StudentId, l.ReturnDate from Loan l where DATENAME(weekday,l.LoanDate)='Wednesday' and l.StudentId between 1 and 7
-- and l.ReturnDate is not null

--kategorileri a harfi ile baþlayanlarý sýralayýnýz.
--select * from Categories c where c.CategoryName like 'c%'
--librarians isimleri arasýnda ltd geçen þirketleri listeleyen program
--select * from Librarians l where l.Name like '%ltd%'

--öðrenci idlerinden ilk iki harfi bilinmeyen ama son üç harfi mon olan öðrenciyi gösterin.
--select s.StudentId, s.Name from Students s where s.Name like '__mon'

--kategori idlerinden ilk harfi a ya da s olan kategori
--select * from Categories c where c.CategoryName like '[AS]%'

--Publishers ilk harfi a ile k arasýnda olan publisherslar
--select * from Publishers p where p.Name like '[A-K]%'

--publishers ilk harfi a olan ikinci harfi n olmayan
--select * from Publishers p where p.Name like 'a[^n]%'

--þehri istanbul olmayan adý a ile baþlayýp soyadý r ile biten doðum tarihi 1985den önce öðrenci kimdir
--select*from Students s where s.Region!='Istanbul' and s.Name like 'a%' and s.Surname like '%r' and YEAR(s.BirthDate)<1985

--Authors'ý kank olan eleman kimdir
--select * from Authors a where a.Name like '%kank%'

--stokta bulunan kaç adet kitabým var
--select b.Stock, COUNT(distinct b.Stock) from Books b 
--group by b.Stock

--fiyatý 50 tlden fazla alýnmýþ kaç kitap vardýr?
--select COUNT(b.Price) from Books b where b.Price>50

--Kaç þehirden öðrenci var
--select s.Region,COUNT(s.Region) from Students s
--group by s.Region

----kitaplarýn stok fiyatlarýný toplayan program
--select SUM(b.Stock) stok from Books b 

--depoda ücret bazlý olarak toplam ne kadar kitabým kalmýþtýr?
--select SUM(b.Stock*b.Price) toplam from Books b 

--fine idsi 6 olan kitabýn toplam ne kadar ücret getirdiðini hesapla
--select SUM(f.Amount) toplam from Fines f where f.FineId=6

--bu zamana dek ödenmiþ ortalama kitap ücretleri
--select AVG(b.Price) ortalama from Books b 

--þu ana kadar kitaplarda yapýlan ciro
--select SUM(b.Price*b.Stock) ciro from Books b

--en yüksek bedele sahip fine
--select MAX(f.Amount) enBuyuk from Fines f 

--en küçük bedele sahip fine
--select MIN(f.Amount) enKucuk from Fines f

----kitap idleri a k arasýnda olanlarýn vermiþ olduklarý stoklarý 100 ile 200  arasýnda olan sipariþlere en az ne kadar 
--ücret ödenmiþtir?
--select b.Title, b.Stock, MIN(b.Price) ucret from Books b where b.Title like '[A-K]' and b.Stock between 100 and 200
--group by b.Title, b.Stock

--en fazla gelen ücret
--select MAX(b.Price*b.Stock) enYuksek from Books b

--1 veya 8 numaralý idye sahip, 1996 yýlýnda bir cumartesi günü alýnmýþ sipariþlerin idlerine göre max sýralamasý.
--select MAX(l.BookId) from Loan l where l.LoanId in (1,8) and l.BookId = 2 and Year(l.ReturnDate)=1996 and DATENAME(WEEKDAY,l.ReturnDate)='Saturday'

--Kitap ismi rakt veya pasd olan, idsi 5 olan , ücreti 20 ile 80 arasýnda olan toplam ücreti hesapla.
--select SUM(b.Price) from Books b where b.Title in ('rakt','pasd') and b.BookId=5 and b.Price between 20 and 80

--þehirlere göre öðrenci sayýsý nedir
--select s.Region,COUNT(s.Region) from Students s
--group by s.Region

--Hangi kitabýn kaç stoðu var
--select b.Title,b.Stock, COUNT(b.Stock) stok from Books b 
--group by b.Title, b.Stock

--Publishers adýna göre kaç adet kitap idsi vardýr?
--select p.Name, COUNT(p.PublisherId) id from Publishers p
--group by p.Name

--regionlara göre hangi öðrencilerin kitap aldýðýný ve bu ülkeleri en çok kitap alan 3 öðrencinin regioný olarak sýralayýn
--select s.Name,s.Region, COUNT(s.Region) ulke from Students s 
--group by s.Name,s.Region

-- öðrencilerin kaç adet maili vardýr?
--select s.Email, COUNT(s.Email) from Students s 
--group by s.Email

--Kaç adet kitap gecikme ücreti vardýr?
--select f.FineId,f.Amount, COUNT(f.Amount) ucret from Fines f 
--group by f.FineId,f.Amount

--hangi kitabýn kaç kategori idsi vardýr?
--select b.CategoryId, COUNT(b.CategoryId)kategori from Books b
--group by b.CategoryId

--Kitaplarýn adlarýný ve kategori adlarýný listeleyeniz.
--select b.Title, c.CategoryName from Books b inner join Categories c on b.Title=c.CategoryName

--ödünç alýnan kitabýn idsini ve ödünç veren kütüphaneci idsini listeleyiniz
--select b.BookId, l.LibrarianId from Books b inner join Librarians l on b.BookId=l.LibrarianId

--Ödünç alýnan kitabýn idsi ile ýsbn numarasýný ve  kitabýn adýný listeleyiniz.
--select l.BookId, b.ISBN, b.BookId from Loan l inner join Books b on l.BookId=b.ISBN

--Kütüphanedeki kitaplarýn ve publisherýn adýný giriniz.
--select p.Name, b.Title from Publishers p inner join Books b on p.Name=b.Title

--Kitabýn yazarýnýn idsi, kitabýn isbn'i, idsi ve publisherýn idsini listeleyiniz.
--select a.AuthorId, b.ISBN, b.BookId, p.PublisherId from Authors a inner join Books b on a.AuthorId=b.ISBN inner join Publishers p on b.BookId=p.PublisherId

--Öðrencinin hangi kitabý ödünç aldýðý ve toplam kaç lira ceza ödediðini listeleyin.
--select f.FineId, l.BookId, f.Amount, b.Price from Fines f inner join Loan l on f.FineId=l.BookId inner join Books b on f.Amount=b.Price

--Öðrencinin yaþ bilgisi, kitap ödünç alma tarihi, aldýðý kitabýn idsi ve kitabý veren kütüphanecinin idsini listeleyiniz.
--select s.BirthDate, l.ReturnDate, l.BookId, li.LibrarianId from Students s inner join Loan l on s.BirthDate=l.ReturnDate inner join Librarians li on l.BookId=li.LibrarianId

--Author ve publisherýn idlerini listeleyin.
--select a.AuthorId, p.PublisherId from Authors a inner join Publishers p on a.AuthorId=p.PublisherId

--Kitabýn kategorisi boþ olan ile kitabý ödünç alan öðrencinin idsi kitabý veren kütüphanecinin adý ve verilen kitabýn adýný listeleyiniz.
--select c.CategoryName, c.CategoryId,b.BookId, l.StudentId, li.Name from Categories c inner join Books b on c.CategoryName=b.CategoryId
--inner join Loan l on b.BookId=l.StudentId 
--inner join Librarians li on b.Title=li.Name 
--where c.CategoryName is null
--group by c.CategoryName, c.CategoryId, b.BookId, l.StudentId, li.Name

--Kitabýn publisher idsi ile isbni listeleyin. ve burada idsi null olmayanlarý ibnde de null olanlarý listelesin
--select p.PublisherId, b.ISBN from Publishers p inner join Books b on p.PublisherId=b.ISBN
--where p.PublisherId is not null and b.ISBN is null
--group by p.PublisherId, b.ISBN

--Ödünç alýrken ödemeyi yaptý mý ve geri iade etti mi kontrolünü saðlayan liste. ödemesi yapýlmamýþlarý listele
--select f.IsPaid,l.IsReturned from Fines f inner join Loan l on f.IsPaid=l.IsReturned
--where IsPaid is null 
--group by f.IsPaid, l.IsReturned

--en çok tercih edilen kitap ve bunlarýn fiyatlarýný listeleyiniz.
--select top 3 l.BookId,COUNT(b.Price) price from Loan l inner join Books b on l.BookId=b.Price
--group by l.BookId

--Loan tablosundaki tüm kayýtlarý ve bu kayýtlarýn Books tablosundaki karþýlýk gelen bilgileri listele.
--select * from Loan l left join Books b on l.BookId=b.Price

--Books tablosundaki tüm kayýtlarý ve bu kayýtlarýn Loan tablosundaki karþýlýk gelen bilgileri listele
--select * from Loan l right join Books b on l.BookId=b.Price

--Hangi öðrenci hangi kitabýn cezasýna ne kadar ödemiþtir?(ödemese bile görünmelidir.)
--select s.StudentId, l.BookId, f.Amount from Students s inner join Loan l on s.StudentId=l.BookId left join Fines f on l.BookId=f.Amount
--group by s.StudentId, l.BookId, f.Amount

--Hangi yazarýn kitabýnýn hangi ücrete sahip olduðunu ve ödünç alýnmasý durumundaki idsi ile o kitabý veren kütüphanecinin idsini listeleyiniz.
 --select a.AuthorId,b.BookId ,b.Price,l.LibrarianId,li.LibrarianId, SUM(b.Price*b.Stock) toplam from Authors a 
 --left join Books b on a.AuthorId=b.Price 
 --left join Loan l on l.BookId=b.Price 
 --left join Librarians li on l.LibrarianId=li.LibrarianId
 --group by a.AuthorId, b.BookId,b.Price,l.LibrarianId,li.LibrarianId
 --order by b.Price desc

 --Öðrencinin ödünç aldýðý kitabýn cezasýnýn toplam ücretini zam geldiði için 1.18 ile çarpýp getirelim.
 --select s.StudentId, l.StudentId, l.LoanId,f.Amount, SUM(f.Amount*1.18) toplam from Students s 
 --left join Loan l on s.StudentId=l.StudentId 
 --left join Fines f on l.LoanId=f.Amount
 --group by s.StudentId, l.StudentId, l.LoanId,f.Amount
 --order by f.Amount desc

 --Öðrencinin ad ,soyad ve idsini alan ve ödünç aldýðý kitap var mý diye kontrol eden daha sonrasýnda kitaplara ödenen toplam ücreti listeleyin.
 --select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, s.StudentId, b.stock ,SUM(b.Price*b.Stock) toplam from Students s 
 --left join Loan l on s.StudentId=l.LoanId 
 --left join Books b on l.StudentId=b.Price
 --group by LEFT(s.Name,1)+'.'+s.Surname, s.StudentId, b.stock
 --order by toplam desc

 --Kategori idsi toplamý 20den büyük olan kitaplarýn titlelarýný listeleyiniz.
 --select b.Title, SUM(c.CategoryId) toplam from Categories c inner join Books b on c.CategoryId=b.CategoryId
 --group by b.Title, c.CategoryId
 --having c.CategoryId>20
 --order by c.CategoryId desc

 --kategori idlerin bulunduðu kitaplarýn hangi yazara ait olduðunu belirtiniz. ve bu kitaplarýn toplam ücretini getiriniz.
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


 --Hangi öðrencilerin 2 idli kitabý ödünç kitap aldýðýný listeleyen program
 --create view IstanbulluOgrenciler
 --as
 --select s.StudentId,b.BookId from Loan l inner join Students s on s.StudentId=l.StudentId inner join Books b on l.LoanId=b.BookId
 --where b.BookId=2

 --select * from IstanbulluOgrenciler

 --alter view IstanbulluOgrenciler
 --as
 --select s.StudentId,b.BookId from Loan l inner join Students s on s.StudentId=l.StudentId inner join Books b on l.LoanId=b.BookId
 --where b.BookId=2

 --Kategori idsi 8 veya 9 olan, ödünç olan kitabýn idsi 5 veya 6 olan ve kitabý veren kütüphanecinin idsini listeleyiniz
 --create view Kitap
 --as
 --select c.CategoryId, b.BookId, l.LibrarianId from Categories c 
 --inner join Books b on c.CategoryId=b.CategoryId 
 --inner join Loan l on b.BookId=l.BookId 
 --inner join Librarians li on l.LibrarianId=li.LibrarianId
 --where c.CategoryId in (8,9) and l.BookId in (5,6)

 --select * from Kitap

 --Öðrencinin ad, soyad, yaþý ile birlikte ödünç aldýðý kitaplar ve bu kitaplarýn cezasý var mý listeleyiniz.
 --create view Kitap2
 --as
 --select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, DATEDIFF(YEAR,s.BirthDate,GETDATE()) yas,l.LoanId,f.FineId from Students s 
 --left join Loan l on s.StudentId=l.StudentId 
 --right join Fines f on l.LoanId=f.FineId

 --select * from Kitap2

 --Hangi kütüphanecinin ödünç kitap verdiðini ve bu kitabýn hangi kategoriye ait olduðunu listeleyiniz.
 --create view Kitap_3
 --with schemabinding
 --as
 --select l.LibrarianId,l.BookId,c.CategoryId from dbo.Librarians li 
 --left join dbo.Loan l on li.LibrarianId=l.LibrarianId 
 --left join dbo.Books b on l.BookId=b.BookId 
 --left join dbo.Categories c on b.CategoryId=c.CategoryId

 --select * from Kitap_3



 --öðrencilerin ödünç almýþ olduðu kitaplarý listeleyen program
 --create view Ogrenci
 --with schemabinding, encryption
 --as
 --select s.StudentId,b.BookId, s.Name from dbo.Students s 
 --inner join dbo.Loan l on s.StudentId=l.StudentId 
 --inner join dbo.Books b on l.BookId=b.BookId
 --where s.Name is not null

 --select * from Ogrenci

 --Kategori ekleyen bir prosedür yazýnýz.
 --create proc ekleKategori5
 --(
 --@kAdý nvarchar(35)
 --)
 --as
 --insert Categories(CategoryName) values(@kAdý)
 --go
 --ekleKategori 'Dram'
 --select * from Categories

 --kitap fiyatlarýna zam yapan prosedürü yazýnýz.
 --Create proc Zam2
 --(
 --@miktar money
 --)
 --as
 --update Books set Price=Price*+@miktar

 --select * from Books

 --adý dýþarýdan verilmiþ,ödünç alýnmýþ kitaplarý yazdýran prosedür
 --create proc loan5
 --(
 --@ad nvarchar(35)
 --)
 --as
 --select b.BookId from Loan l inner join Books b on l.BookId=b.BookId
 --where b.Title=@ad
 
 --loan5 'hghghg'
 --select * from Books

 --dýþardan stoðu girilen kitabýn kategorisini yazdýran prosedür
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

 --kitaplarýn stok miktarý ve ücreti dýþardan girilen ve iki deðer arasýnda olan, fiyatý kdvli hali olarak verilen title, ýsbn, loanid verilerini getiren prosedür
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
--print 'Zaten böyle bir kategori var'
--end
--kategoriEkle1 'abcd'
--select*from Categories

--dýþardan gelen iki deðeri çarpýp bize deðer döndüren fonk.
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

--stok ve price girildiðinde kdvli halini yazdýran program
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

--dýþardan girilen kitabýn title bilgisini giren ve ödünç alýnan kitabýn id bilgisinin fonk.
--create function title
--(
--@title nvarchar(50)
--)
--returns table
--as
--return select b.BookId, l.LoanId from Books b inner join Loan l on b.BookId=l.BookId
--where b.Title=@title

--select * from dbo.title('comedy')

--dýþardan girilen öðrencinin namei ve loan idsi alýnan fonk.

--create function prac
--(
--@name nvarchar(50)
--)
--returns table
--as
--return select LEFT(s.Name,1)+','+s.Surname AdSoyad,l.LoanId, s.StudentId from Students s inner join Loan l on s.Name=l.StudentId
--where s.Name=@name

--select * from dbo.prac('tre')

--titleý greek olan bir kitap varsa stok, price ve isbn'i güncelle.

--IF (EXISTS (SELECT * FROM Librarians l WHERE l.Name = 'gffdf'))
--BEGIN
--    UPDATE Librarians 
--    SET Surname = 'Janly' 
--    WHERE Name = 'gffdf'

--    PRINT 'kayýt güncellendi'
--END
--ELSE
--BEGIN
--    INSERT INTO Librarians (Name, Surname) 
--    VALUES ('gffdf', 'Janly')

--    PRINT 'kayýt eklendi'
--	END
--SELECT * FROM Librarians

--author dýþardan name ve surname alsýn eðer yoksa eklesin varsa da zaten var diye uyarsýn
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

--öðrencinin dýþardan ad ve soyadý alýnsýn eðer varsa bu öðrenci mecvut deðilse ekleyen fonk.
--CREATE PROCEDURE Studentproc1
--(
--    @Name NVARCHAR(100),
--    @Surname NVARCHAR(100)
--)
--AS
--    IF (EXISTS (SELECT * FROM Students WHERE Name = @Name AND Surname = @Surname))
--    BEGIN
--        PRINT 'Bu öðrenci zaten mevcut.'
--    END
--    ELSE
--    BEGIN
--        INSERT INTO Students (Name, Surname) 
--        VALUES (@Name, @Surname)

--        PRINT 'Yeni öðrenci eklendi.'
--    END

--EXEC Studentproc1 'Jake', 'Jane'

--SELECT * FROM Students