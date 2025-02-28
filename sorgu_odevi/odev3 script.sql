USE [master]
GO
/****** Object:  Database [Library]    Script Date: 11.02.2025 22:18:25 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Library] SET QUERY_STORE = ON
GO
ALTER DATABASE [Library] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Library]
GO
/****** Object:  UserDefinedFunction [dbo].[carp]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[carp]
(
@sayi1 int,
@sayi2 int
)
returns int
as
begin
return @sayi1*@sayi2
end
GO
/****** Object:  UserDefinedFunction [dbo].[indirimli2]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[indirimli2]
(
@fiyat money,
@stok int
)
returns money
as
begin
return (@fiyat*@stok)*1.18
end
GO
/****** Object:  UserDefinedFunction [dbo].[yas2]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[yas2]
(
@date date
)
returns int
as
begin
declare @yas1 int
set @yas1=DATEDIFF(YEAR,@date,GETDATE())
return @yas1
end 
GO
/****** Object:  Table [dbo].[Students]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Surname] [nchar](50) NOT NULL,
	[Email] [nvarchar](20) NULL,
	[Region] [nvarchar](30) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](70) NOT NULL,
	[ISBN] [nvarchar](15) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[Stock] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[LoanId] [int] IDENTITY(1,1) NOT NULL,
	[LoanDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[IsReturned] [bit] NOT NULL,
	[BookId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[LibrarianId] [int] NOT NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[LoanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[IstanbulluOgrenciler]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[IstanbulluOgrenciler]
 as
 select s.StudentId,b.BookId from Loan l inner join Students s on s.StudentId=l.StudentId inner join Books b on l.LoanId=b.BookId
 where b.BookId=2
GO
/****** Object:  Table [dbo].[Librarians]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarians](
	[LibrarianId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Librarians] PRIMARY KEY CLUSTERED 
(
	[LibrarianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Kitap]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--use Library
--select a.Name, a.Surname from Authors a
--select * from Authors

--select c.CategoryName from Categories c

--Yazarların id, ad ve soyadlarını raporla.(Formatı D.Bitmez)
--select LEFT(a.Name,1)+'.'+A.Surname AdSoyad from Authors a

--Borçların id, amount, ispaid, loanidyi raporlayın
--select f.FineId,f.Amount,f.IsPaid,f.LoanId, f.Amount*1.18 'kdvli' from Fines f

--öğrencilerin ad ve soyadlarıyla birlikte yaşlarını raporlayınız.
--select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, DATEDIFF(YEAR,s.BirthDate,GETDATE()) 'Yaş' from Students s
--select * from Students

--kitap ücreti 150dan yüksek olan kitapları raporlayınız
--select b.Price from Books b where b.Price>150 

--Kategorisi korku olan kitapları listeleyen program
--select c.CategoryName from Categories c where c.CategoryName='Horror'

--Category idsi 5 olmayan kitapların adlarını ve kategori idlerini yazınız.
--select b.Title, b.CategoryId from Books b where b.CategoryId!=5

--01.01.1993 tarihinden sonra alınmış kitapların adını, idsini ve dönüş tarihini raporlayınız.
--select l.BookId, l.ReturnDate from Loan l where l.LoanDate>'01.01.1993'

--kitapların arasında stok miktarı 20 ile 50 arasında olan kitapları raporlayınız.
--select b.Stock from Books b where b.Stock>20 and b.Stock<=50

--yaşı 20den büyük istanbulda yaşayan öğrencilerin adlarını ve yaşlarını raporla(ancak isimler şu formatta olmalıdır A.fen)
--select LEFT(s.Name,1)+'.'+ s.Surname 'AdSoyad' , s.Region, DATEDIFF(YEAR,s.BirthDate,GETDATE()) 'Yas' from Students s where DATEDIFF(YEAR,s.BirthDate,GETDATE()) > 20 and s.Region='Istanbul'

--1997 dahil yılından sonra alınmış, ücreti 700den büyük ve geri dönüş tarihi olmayan siparişlerin idsini, alış tarihini, dönüş tarihlerini ve kitap ücretlerini raporlayınız.
--select f.FineId,f.Amount, f.IsPaid from Fines f
--where f.FineId=2 and f.Amount>20 and f.IsPaid=1

--bölge bilgisi girilmemiş öğrencileri listeleyin.
--select * from Students s where s.Region is null

--Publishersı girilmemiş kitapları listeleyin.
--select * from Publishers p where p.Name is null 

--title'ı Greek ve sanhj olan kitapların isbn verisi 2000den büyük olan, category idsi 5ten büyük, author idsi 8den küçük olan kitapları listeleyiniz.
--select b.Title, b.ISBN, b.CategoryId, b.AuthorId from Books b where (b.Title='Greek' and b.Title='sanhj') and b.ISBN>20000 and b.CategoryId>5 and AuthorId<8

--kategorileri a-zye sırala
--select * from Categories c
--order by c.CategoryId asc

--authorların idsini ve adını sıralayın ancak ad jane olacak ve id tersten sıralanacak.
--select a.AuthorId, a.Name from Authors a 
--where a.Name='Jane'
--order by a.AuthorId desc

--en uygun 10 finesı listeleyin.
--select top 10 f.Amount from Fines f

--en son kütüphaneden alınan 5 kitabı listeleyin.
--select top 5 l.BookId from Loan l

--kitabın stok miktarı 20den büyük 49dan küçük olan kitapları listeleyin.
--select b.Stock from Books b where b.Stock between 20 and 49

--01.01.1997 ile 06.06.1998 tarihleri arasındaki kitap geri dönüşerini raporlayınız. jane veya queenin vermiş olduğu kitapları listele.
--select l.ReturnDate, l.StudentId from Loan l where l.ReturnDate between '01.01.1997' and '06.06.1998' and l.StudentId=4 and l.StudentId=7

--baş harfi c olan stoklarda mevcut 10 ile 250 dolar arası ücreti olan kitapları fiyatlarına göre listeleyiniz.
--select b.Title, b.Stock, b.Stock from Books b where b.Title like 'c%' and b.Stock between 10 and 250

----çarşamba günü alınan student 1 ile 7 arasında olan, teslim tarihi null olmayan kitapların bilgilerini raporlayınız 
--ve tarihine göre büyükten küçüğe sıralayanız
--select l.LoanDate, l.StudentId, l.ReturnDate from Loan l where DATENAME(weekday,l.LoanDate)='Wednesday' and l.StudentId between 1 and 7
-- and l.ReturnDate is not null

--kategorileri a harfi ile başlayanları sıralayınız.
--select * from Categories c where c.CategoryName like 'c%'
--librarians isimleri arasında ltd geçen şirketleri listeleyen program
--select * from Librarians l where l.Name like '%ltd%'

--öğrenci idlerinden ilk iki harfi bilinmeyen ama son üç harfi mon olan öğrenciyi gösterin.
--select s.StudentId, s.Name from Students s where s.Name like '__mon'

--kategori idlerinden ilk harfi a ya da s olan kategori
--select * from Categories c where c.CategoryName like '[AS]%'

--Publishers ilk harfi a ile k arasında olan publisherslar
--select * from Publishers p where p.Name like '[A-K]%'

--publishers ilk harfi a olan ikinci harfi n olmayan
--select * from Publishers p where p.Name like 'a[^n]%'

--şehri istanbul olmayan adı a ile başlayıp soyadı r ile biten doğum tarihi 1985den önce öğrenci kimdir
--select*from Students s where s.Region!='Istanbul' and s.Name like 'a%' and s.Surname like '%r' and YEAR(s.BirthDate)<1985

--Authors'ı kank olan eleman kimdir
--select * from Authors a where a.Name like '%kank%'

--stokta bulunan kaç adet kitabım var
--select b.Stock, COUNT(distinct b.Stock) from Books b 
--group by b.Stock

--fiyatı 50 tlden fazla alınmış kaç kitap vardır?
--select COUNT(b.Price) from Books b where b.Price>50

--Kaç şehirden öğrenci var
--select s.Region,COUNT(s.Region) from Students s
--group by s.Region

----kitapların stok fiyatlarını toplayan program
--select SUM(b.Stock) stok from Books b 

--depoda ücret bazlı olarak toplam ne kadar kitabım kalmıştır?
--select SUM(b.Stock*b.Price) toplam from Books b 

--fine idsi 6 olan kitabın toplam ne kadar ücret getirdiğini hesapla
--select SUM(f.Amount) toplam from Fines f where f.FineId=6

--bu zamana dek ödenmiş ortalama kitap ücretleri
--select AVG(b.Price) ortalama from Books b 

--şu ana kadar kitaplarda yapılan ciro
--select SUM(b.Price*b.Stock) ciro from Books b

--en yüksek bedele sahip fine
--select MAX(f.Amount) enBuyuk from Fines f 

--en küçük bedele sahip fine
--select MIN(f.Amount) enKucuk from Fines f

----kitap idleri a k arasında olanların vermiş oldukları stokları 100 ile 200  arasında olan siparişlere en az ne kadar 
--ücret ödenmiştir?
--select b.Title, b.Stock, MIN(b.Price) ucret from Books b where b.Title like '[A-K]' and b.Stock between 100 and 200
--group by b.Title, b.Stock

--en fazla gelen ücret
--select MAX(b.Price*b.Stock) enYuksek from Books b

--1 veya 8 numaralı idye sahip, 1996 yılında bir cumartesi günü alınmış siparişlerin idlerine göre max sıralaması.
--select MAX(l.BookId) from Loan l where l.LoanId in (1,8) and l.BookId = 2 and Year(l.ReturnDate)=1996 and DATENAME(WEEKDAY,l.ReturnDate)='Saturday'

--Kitap ismi rakt veya pasd olan, idsi 5 olan , ücreti 20 ile 80 arasında olan toplam ücreti hesapla.
--select SUM(b.Price) from Books b where b.Title in ('rakt','pasd') and b.BookId=5 and b.Price between 20 and 80

--şehirlere göre öğrenci sayısı nedir
--select s.Region,COUNT(s.Region) from Students s
--group by s.Region

--Hangi kitabın kaç stoğu var
--select b.Title,b.Stock, COUNT(b.Stock) stok from Books b 
--group by b.Title, b.Stock

--Publishers adına göre kaç adet kitap idsi vardır?
--select p.Name, COUNT(p.PublisherId) id from Publishers p
--group by p.Name

--regionlara göre hangi öğrencilerin kitap aldığını ve bu ülkeleri en çok kitap alan 3 öğrencinin regionı olarak sıralayın
--select s.Name,s.Region, COUNT(s.Region) ulke from Students s 
--group by s.Name,s.Region

-- öğrencilerin kaç adet maili vardır?
--select s.Email, COUNT(s.Email) from Students s 
--group by s.Email

--Kaç adet kitap gecikme ücreti vardır?
--select f.FineId,f.Amount, COUNT(f.Amount) ucret from Fines f 
--group by f.FineId,f.Amount

--hangi kitabın kaç kategori idsi vardır?
--select b.CategoryId, COUNT(b.CategoryId)kategori from Books b
--group by b.CategoryId

--Kitapların adlarını ve kategori adlarını listeleyeniz.
--select b.Title, c.CategoryName from Books b inner join Categories c on b.Title=c.CategoryName

--ödünç alınan kitabın idsini ve ödünç veren kütüphaneci idsini listeleyiniz
--select b.BookId, l.LibrarianId from Books b inner join Librarians l on b.BookId=l.LibrarianId

--Ödünç alınan kitabın idsi ile ısbn numarasını ve  kitabın adını listeleyiniz.
--select l.BookId, b.ISBN, b.BookId from Loan l inner join Books b on l.BookId=b.ISBN

--Kütüphanedeki kitapların ve publisherın adını giriniz.
--select p.Name, b.Title from Publishers p inner join Books b on p.Name=b.Title

--Kitabın yazarının idsi, kitabın isbn'i, idsi ve publisherın idsini listeleyiniz.
--select a.AuthorId, b.ISBN, b.BookId, p.PublisherId from Authors a inner join Books b on a.AuthorId=b.ISBN inner join Publishers p on b.BookId=p.PublisherId

--Öğrencinin hangi kitabı ödünç aldığı ve toplam kaç lira ceza ödediğini listeleyin.
--select f.FineId, l.BookId, f.Amount, b.Price from Fines f inner join Loan l on f.FineId=l.BookId inner join Books b on f.Amount=b.Price

--Öğrencinin yaş bilgisi, kitap ödünç alma tarihi, aldığı kitabın idsi ve kitabı veren kütüphanecinin idsini listeleyiniz.
--select s.BirthDate, l.ReturnDate, l.BookId, li.LibrarianId from Students s inner join Loan l on s.BirthDate=l.ReturnDate inner join Librarians li on l.BookId=li.LibrarianId

--Author ve publisherın idlerini listeleyin.
--select a.AuthorId, p.PublisherId from Authors a inner join Publishers p on a.AuthorId=p.PublisherId

--Kitabın kategorisi boş olan ile kitabı ödünç alan öğrencinin idsi kitabı veren kütüphanecinin adı ve verilen kitabın adını listeleyiniz.
--select c.CategoryName, c.CategoryId,b.BookId, l.StudentId, li.Name from Categories c inner join Books b on c.CategoryName=b.CategoryId
--inner join Loan l on b.BookId=l.StudentId 
--inner join Librarians li on b.Title=li.Name 
--where c.CategoryName is null
--group by c.CategoryName, c.CategoryId, b.BookId, l.StudentId, li.Name

--Kitabın publisher idsi ile isbni listeleyin. ve burada idsi null olmayanları ibnde de null olanları listelesin
--select p.PublisherId, b.ISBN from Publishers p inner join Books b on p.PublisherId=b.ISBN
--where p.PublisherId is not null and b.ISBN is null
--group by p.PublisherId, b.ISBN

--Ödünç alırken ödemeyi yaptı mı ve geri iade etti mi kontrolünü sağlayan liste. ödemesi yapılmamışları listele
--select f.IsPaid,l.IsReturned from Fines f inner join Loan l on f.IsPaid=l.IsReturned
--where IsPaid is null 
--group by f.IsPaid, l.IsReturned

--en çok tercih edilen kitap ve bunların fiyatlarını listeleyiniz.
--select top 3 l.BookId,COUNT(b.Price) price from Loan l inner join Books b on l.BookId=b.Price
--group by l.BookId

--Loan tablosundaki tüm kayıtları ve bu kayıtların Books tablosundaki karşılık gelen bilgileri listele.
--select * from Loan l left join Books b on l.BookId=b.Price

--Books tablosundaki tüm kayıtları ve bu kayıtların Loan tablosundaki karşılık gelen bilgileri listele
--select * from Loan l right join Books b on l.BookId=b.Price

--Hangi öğrenci hangi kitabın cezasına ne kadar ödemiştir?(ödemese bile görünmelidir.)
--select s.StudentId, l.BookId, f.Amount from Students s inner join Loan l on s.StudentId=l.BookId left join Fines f on l.BookId=f.Amount
--group by s.StudentId, l.BookId, f.Amount

--Hangi yazarın kitabının hangi ücrete sahip olduğunu ve ödünç alınması durumundaki idsi ile o kitabı veren kütüphanecinin idsini listeleyiniz.
 --select a.AuthorId,b.BookId ,b.Price,l.LibrarianId,li.LibrarianId, SUM(b.Price*b.Stock) toplam from Authors a left join Books b on a.AuthorId=b.Price 
 --left join Loan l on l.BookId=b.Price 
 --left join Librarians li on l.LibrarianId=li.LibrarianId
 --group by a.AuthorId, b.BookId,b.Price,l.LibrarianId,li.LibrarianId
 --order by b.Price desc

 --Öğrencinin ödünç aldığı kitabın cezasının toplam ücretini zam geldiği için 1.18 ile çarpıp getirelim.
 --select s.StudentId, l.StudentId, l.LoanId,f.Amount, SUM(f.Amount*1.18) toplam from Students s 
 --left join Loan l on s.StudentId=l.StudentId 
 --left join Fines f on l.LoanId=f.Amount
 --group by s.StudentId, l.StudentId, l.LoanId,f.Amount
 --order by f.Amount desc

 --Öğrencinin ad ,soyad ve idsini alan ve ödünç aldığı kitap var mı diye kontrol eden daha sonrasında kitaplara ödenen toplam ücreti listeleyin.
 --select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, s.StudentId, b.stock ,SUM(b.Price*b.Stock) toplam from Students s 
 --left join Loan l on s.StudentId=l.LoanId 
 --left join Books b on l.StudentId=b.Price
 --group by LEFT(s.Name,1)+'.'+s.Surname, s.StudentId, b.stock
 --order by toplam desc

 --Kategori idsi toplamı 20den büyük olan kitapların titlelarını listeleyiniz.
 --select b.Title, SUM(c.CategoryId) toplam from Categories c inner join Books b on c.CategoryId=b.CategoryId
 --group by b.Title, c.CategoryId
 --having c.CategoryId>20
 --order by c.CategoryId desc

 --2 soru kaldı join hangi personel ürünü diye başlayan





 --Hangi öğrencilerin 2 idli kitabı ödünç kitap aldığını listeleyen program
 --create view IstanbulluOgrenciler
 --as
 --select s.StudentId,b.BookId from Loan l inner join Students s on s.StudentId=l.StudentId inner join Books b on l.LoanId=b.BookId
 --where b.BookId=2

 --select * from IstanbulluOgrenciler

 --alter view IstanbulluOgrenciler
 --as
 --select s.StudentId,b.BookId from Loan l inner join Students s on s.StudentId=l.StudentId inner join Books b on l.LoanId=b.BookId
 --where b.BookId=2

 --Kategori idsi 8 veya 9 olan, ödünç olan kitabın idsi 5 veya 6 olan ve kitabı veren kütüphanecinin idsini listeleyiniz
 create view [dbo].[Kitap]
 as
 select c.CategoryId, b.BookId, l.LibrarianId from Categories c 
 inner join Books b on c.CategoryId=b.CategoryId 
 inner join Loan l on b.BookId=l.BookId 
 inner join Librarians li on l.LibrarianId=li.LibrarianId
 where c.CategoryId in (8,9) and l.BookId in (5,6)
GO
/****** Object:  Table [dbo].[Fines]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fines](
	[FineId] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[LoanId] [int] NOT NULL,
 CONSTRAINT [PK_Fines] PRIMARY KEY CLUSTERED 
(
	[FineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Kitap2]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create view [dbo].[Kitap2]
 as
 select LEFT(s.Name,1)+'.'+s.Surname AdSoyad, DATEDIFF(YEAR,s.BirthDate,GETDATE()) yas,l.LoanId,f.FineId from Students s 
 left join Loan l on s.StudentId=l.StudentId 
 right join Fines f on l.LoanId=f.FineId
GO
/****** Object:  View [dbo].[Kitap_3]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE view [dbo].[Kitap_3]
  
 as
 select l.LibrarianId,l.BookId,c.CategoryId from dbo.Librarians li 
 left join dbo.Loan l on li.LibrarianId=l.LibrarianId 
 left join dbo.Books b on l.BookId=b.BookId 
 left join dbo.Categories c on b.CategoryId=c.CategoryId
GO
/****** Object:  UserDefinedFunction [dbo].[title]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[title]
(
@title nvarchar(50)
)
returns table
as
return select b.BookId, l.LoanId from Books b inner join Loan l on b.BookId=l.BookId
where b.Title=@title
GO
/****** Object:  UserDefinedFunction [dbo].[prac]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[prac]
(
@name nvarchar(50)
)
returns table
as
return select LEFT(s.Name,1)+','+s.Surname AdSoyad,l.LoanId, s.StudentId from Students s inner join Loan l on s.Name=l.StudentId
where s.Name=@name
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Surname] [nvarchar](40) NOT NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (1, N'Jane', N'Kamck', NULL)
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (2, N'', N'', NULL)
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (3, N'Fan', N'Yle', CAST(N'2000-03-26' AS Date))
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (4, N'Terek', N'Yaml', CAST(N'2002-03-26' AS Date))
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (6, N'ffggfg', N'fgfgg', NULL)
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (7, N'Peter', N'Person', NULL)
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (8, N'Peter', N'Person', NULL)
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (9, N'Peter', N'Person', NULL)
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (10, N'Peter', N'Person', NULL)
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (11, N'Jane', N'Janly', NULL)
INSERT [dbo].[Authors] ([AuthorId], [Name], [Surname], [BirthDate]) VALUES (14, N'Fancy', N'Yne', CAST(N'2000-03-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [AuthorId], [CategoryId], [PublisherId], [Stock], [Price]) VALUES (4, N'hghghg', N'545454', 1, 1, 1, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [AuthorId], [CategoryId], [PublisherId], [Stock], [Price]) VALUES (15, N'Greek', N'454687957', 2, 2, 2, 100, 50.0000)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Horror')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Comedy')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Dram')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'abcd')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Fines] ([FineId], [Amount], [IsPaid], [LoanId]) VALUES (4, 150.0000, 1, 7)
GO
INSERT [dbo].[Librarians] ([LibrarianId], [Name], [Surname], [Email]) VALUES (1, N'Erdem', N'fgfggf', N'ghghg@gmail.com')
INSERT [dbo].[Librarians] ([LibrarianId], [Name], [Surname], [Email]) VALUES (2, N'Oledi', N'Janly', N'ddffddf@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Loan] ON 

INSERT [dbo].[Loan] ([LoanId], [LoanDate], [ReturnDate], [IsReturned], [BookId], [StudentId], [LibrarianId]) VALUES (7, CAST(N'1999-01-01' AS Date), CAST(N'1999-02-02' AS Date), 1, 4, 1, 1)
SET IDENTITY_INSERT [dbo].[Loan] OFF
GO
INSERT [dbo].[Publishers] ([PublisherId], [Name]) VALUES (1, N'Yt')
INSERT [dbo].[Publishers] ([PublisherId], [Name]) VALUES (2, N'Tk')
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [Name], [Surname], [Email], [Region], [BirthDate]) VALUES (1, N'hfhhfhf                                           ', N'fhhfhfhf                                          ', N'fffgfg@gmail.com', NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [Name], [Surname], [Email], [Region], [BirthDate]) VALUES (2, N'Jane                                              ', N'Eyer                                              ', N'janee@gmail.com', NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [Name], [Surname], [Email], [Region], [BirthDate]) VALUES (5, N'Charles                                           ', N'Bitr                                              ', N'chbtr@gmail.com', N'Istanbul', CAST(N'2002-05-05' AS Date))
INSERT [dbo].[Students] ([StudentId], [Name], [Surname], [Email], [Region], [BirthDate]) VALUES (6, N'Jake                                              ', N'Jane                                              ', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([PublisherId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers]
GO
ALTER TABLE [dbo].[Fines]  WITH CHECK ADD  CONSTRAINT [FK_Fines_Loan] FOREIGN KEY([LoanId])
REFERENCES [dbo].[Loan] ([LoanId])
GO
ALTER TABLE [dbo].[Fines] CHECK CONSTRAINT [FK_Fines_Loan]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Books]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Librarians] FOREIGN KEY([LibrarianId])
REFERENCES [dbo].[Librarians] ([LibrarianId])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Librarians]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Students]
GO
/****** Object:  StoredProcedure [dbo].[Authorproc]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Authorproc]
(
    @Name NVARCHAR(100),
    @Surname NVARCHAR(100)
)
AS
    IF (EXISTS (SELECT * FROM Authors WHERE Name = @Name AND Surname = @Surname))
    BEGIN
        PRINT 'Bu yazar zaten mevcut.'
    END
    ELSE
    BEGIN
        INSERT INTO Authors (Name, Surname) 
        VALUES (@Name, @Surname)

        PRINT 'Yeni yazar eklendi.'
		 END
GO
/****** Object:  StoredProcedure [dbo].[ekleKategori]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ekleKategori]
 (
 @kAdı nvarchar(35)
 )
 as
 insert Categories values(@kAdı)
GO
/****** Object:  StoredProcedure [dbo].[ekleKategori5]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[ekleKategori5]
 (
 @kAdı nvarchar(35)
 )
 as
 insert Categories(CategoryName) values(@kAdı)
GO
/****** Object:  StoredProcedure [dbo].[islem2]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[islem2]
 (
 @stok1 int,
 @stok2 int,
 @ucret1 money,
 @ucret2 money
 )
 as
 select b.Stock, b.Title, b.ISBN, l.LoanId,b.Stock,b.Price from Books b inner join Loan l on b.BookId=l.BookId
 where b.Stock between @stok1 and @stok2 
 and b.Price between @ucret1 and @ucret2
GO
/****** Object:  StoredProcedure [dbo].[KategoriEkle1]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KategoriEkle1]
(
@ad nvarchar(20)
)
as
if(not exists(select *from Categories where CategoryName=@ad))
begin
insert Categories(CategoryName)values(@ad)
end
else
begin
print 'Zaten böyle bir kategori var'
end
GO
/****** Object:  StoredProcedure [dbo].[loan4]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[loan4]
 (
 @ad nvarchar(35)
 )
 as
 select * from Loan l inner join Books b on l.BookId=b.BookId
 where b.Title=@ad
GO
/****** Object:  StoredProcedure [dbo].[loan5]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[loan5]
 (
 @ad nvarchar(35)
 )
 as
 select b.BookId from Loan l inner join Books b on l.BookId=b.BookId
 where b.Title=@ad
GO
/****** Object:  StoredProcedure [dbo].[stok4]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[stok4]
 (
 @stok int
 )
 as
 select b.CategoryId, b.Stock from Books b inner join Categories c on b.CategoryId=c.CategoryId
 where b.Stock=@stok
GO
/****** Object:  StoredProcedure [dbo].[Studentproc1]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Studentproc1]
(
    @Name NVARCHAR(100),
    @Surname NVARCHAR(100)
)
AS
    IF (EXISTS (SELECT * FROM Students WHERE Name = @Name AND Surname = @Surname))
    BEGIN
        PRINT 'Bu öğrenci zaten mevcut.'
    END
    ELSE
    BEGIN
        INSERT INTO Students (Name, Surname) 
        VALUES (@Name, @Surname)

        PRINT 'Yeni öğrenci eklendi.'
    END
GO
/****** Object:  StoredProcedure [dbo].[Zam2]    Script Date: 11.02.2025 22:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[Zam2]
 (
 @miktar money
 )
 as
 update Books set Price=Price*+@miktar
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
