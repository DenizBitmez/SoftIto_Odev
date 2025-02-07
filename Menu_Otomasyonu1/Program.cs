using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Menu_Otomasyonu1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] masalar = new int[20];
            int[,] hesaplar = new int[50, 20];
            string[] urunAdlari = new string[20];
            int[] fiyatlar = new int[20];
            string[] siparisListesi = new string[1000];
            int siparisIndex = 0;
            bool masa = true;

            urunAdlari[0] = "Volovan"; fiyatlar[0] = 50;
            urunAdlari[1] = "Haydari"; fiyatlar[1] = 100;
            urunAdlari[2] = "Paçanga Böreği"; fiyatlar[2] = 150;
            urunAdlari[3] = "Kabak Mücver"; fiyatlar[3] = 150;
            urunAdlari[4] = "Kırmızı köz biber kızartması"; fiyatlar[4] = 150;
            urunAdlari[5] = "Patates kroket"; fiyatlar[5] = 150;
            urunAdlari[6] = "Rum böreği"; fiyatlar[6] = 100;
            urunAdlari[7] = "Karidesli güveç"; fiyatlar[7] = 250;
            urunAdlari[8] = "Tekirdağ köftesi"; fiyatlar[8] = 200;
            urunAdlari[9] = "Tas Kebabı"; fiyatlar[9] = 250;
            urunAdlari[10] = "Özel Soslu Tavuk Kanat"; fiyatlar[10] = 300;
            urunAdlari[11] = "Fırında Kremalı Patatesli Tavuk Göğsü"; fiyatlar[11] = 300;
            urunAdlari[12] = "Tavuklu Arpa Şehriye Salatası"; fiyatlar[12] = 150;
            urunAdlari[13] = "Yıldız Şehriye Salatası"; fiyatlar[13] = 150;
            urunAdlari[14] = "Muhteşem Patates Salatası"; fiyatlar[14] = 150;
            urunAdlari[15] = "Kısır"; fiyatlar[15] = 200;
            urunAdlari[16] = "Fırında Sütlaç"; fiyatlar[16] = 200;
            urunAdlari[17] = "Magnolia"; fiyatlar[17] = 250;
            urunAdlari[18] = "Şekerpare"; fiyatlar[18] = 250;
            urunAdlari[19] = "Profiterol"; fiyatlar[19] = 200;
        m:
            Console.WriteLine("Restorantımıza hoş geldiniz...");
            Console.WriteLine("Yapmak istediğiniz işlemi seçiniz: 1-Masa açma 2-Masa işlem 3-Masa Hesap 4-Kasa İşlemleri 5-Çıkış");
            int secim = int.Parse(Console.ReadLine());


            switch (secim)
            {
                case 1:

                    Console.WriteLine("Kaç masa açılsın?");
                    int deger = int.Parse(Console.ReadLine());
                    if (deger >= 50)
                    {
                        Console.WriteLine("Maksimum kapasite 50'dür");
                    }

                    for (int j = 1; j <= deger; j++)
                    {
                        if (masalar[j] == 0)
                        {
                            Console.WriteLine("Masa " + j + " boş.");
                            masa = true;
                        }
                        else
                        {
                            Console.WriteLine("Masa " + j + " dolu.");
                            masa = false;
                        }
                    }
                    Console.WriteLine("Ana menü:[ESC]");
                    Console.WriteLine("Masa girmek için masanın idsini giriniz:");
                    int i = int.Parse(Console.ReadLine());
                    if (Console.ReadKey().Key == ConsoleKey.Escape)
                    {
                        Console.WriteLine("Ana menüye dönülüyor:");
                        goto m;
                    }
                    if (masalar[i] == 0)
                    {
                        Console.WriteLine("Masa " + (i));
                        masalar[i] = 1;
                    }
                    else
                    {
                        Console.WriteLine("Bu masa dolu. Lütfen başka masa seçiniz.");
                    }
                    goto x;

                case 2:

                x:

                    bool cikis = false;
                    Console.WriteLine("Menümüz:");
                    
                    int index = 0;
                    foreach (var item in urunAdlari)
                    {
                        Console.WriteLine($"{index + 1} - {item} ({fiyatlar[index]} TL)");
                        index++;
                    }

                    while (cikis != true)
                    {
                        int masaNo = -1;

                    c:
                        

                        Console.WriteLine("SİPARİŞ LİSTESİ");
                        for (int s = 0; s < siparisIndex; s++)
                        {
                            if (!string.IsNullOrEmpty(siparisListesi[s]))
                            {
                                Console.WriteLine(siparisListesi[s]);
                            }
                        }

                        Console.WriteLine("Onayla " + "[Space]");
                        Console.WriteLine("Ana Menü " + "[ESC]");
                        Console.WriteLine("Geri git " + "[Sol ok]");

                        ConsoleKey consolekey = Console.ReadKey(true).Key;

                        if (consolekey == ConsoleKey.Spacebar)
                        {
                            Console.WriteLine("Sipariş veriliyor.");
                        }
                        else if (consolekey == ConsoleKey.Escape)
                        {
                            Console.WriteLine("Ana menüye yönlendiriliyorsunuz:");

                            goto m;

                        }
                        else if (consolekey == ConsoleKey.LeftArrow)
                        {
                            if (siparisIndex > 0)
                            {
                                siparisIndex--;
                                siparisListesi[siparisIndex] = null; 

                            }
                            else
                            {
                                Console.WriteLine("Sipariş listesi boş.");
                            }
                            Console.Clear();
                            goto c;
                            
                        }

                        else
                        {
                            Console.WriteLine("Lütfen sipariş vermek istediğiniz ürünün kodunu giriniz:(Sipariş vermeyi tamamladıysanız 0'a basın)");
                            int siparis1 = int.Parse(Console.ReadLine());
                            if (siparis1 != 0)
                            {
                                Console.WriteLine("Adet sayısını belirleyiniz");
                                int adet = int.Parse(Console.ReadLine());

                                Console.WriteLine("Doğrulamak için yukarıda yazan masa no'yu giriniz");
                                masaNo = int.Parse(Console.ReadLine());

                                if (masaNo >= 0 && masaNo < 200)
                                {
                                    if (masalar[masaNo] == 1)
                                    {
                                        hesaplar[masaNo, siparis1] += adet;
                                        string siparisGirdisi = "Masa " + (masaNo) + " - " + urunAdlari[siparis1 - 1] + " (" + fiyatlar[siparis1 - 1] + " TL) x " + adet;
                                        siparisListesi[siparisIndex] = siparisGirdisi;
                                        siparisIndex++;
                                        goto c;
                                    }
                                    else
                                    {
                                        Console.WriteLine("Masa bulunamadı");
                                        masa = false;
                                    }
                                }
                            }
                            else
                            {
                                Console.WriteLine("Siparişiniz Tamamlandı. Bekleme süreniz 30-40 dakika arasıdır.");
                                int sonMasa = masaNo;
                                masalar[masaNo] = 1;
                                masa = false;
                                Console.WriteLine("Ana menüye dönmek için yukarıda verilen tuşlara basabilirsiniz.");
                            }

                        }

                    }
                    break;

                case 3:
                f:
                    Console.Clear();
                    Console.WriteLine("Hangi masayı görüntülemek istiyorsunuz?");
                    int secim4 = int.Parse(Console.ReadLine());

                    if (secim4 > 0 && secim4 < 200)
                    {
                        if (masalar[secim4] == 1)
                        {
                            Console.Clear();
                            Console.WriteLine("Masa " + secim4 + " Hesabı:");
                            double toplamHesap = 0;
                            for (int k = 1; k < urunAdlari.Length; k++)
                            {
                                if (hesaplar[secim4, k] > 0)
                                {
                                    double urunToplam = hesaplar[secim4, k] * fiyatlar[k - 1];
                                    toplamHesap += urunToplam;
                                    Console.WriteLine(urunAdlari[k - 1] + " x " + hesaplar[secim4, k] + " = " + urunToplam + " TL");
                                }
                            }
                            Console.WriteLine("Toplam Hesap: " + toplamHesap + " TL");
                            Console.WriteLine("Hesap kapatmak için [Space] tuşuna Ana menüye dönmek için [ESC]");

                            while (true)
                            {
                                var keyInfo = Console.ReadKey(true);
                                if (keyInfo.Key == ConsoleKey.Spacebar)
                                {

                                    Console.WriteLine("Hesap kapatılıyor...");
                                    masalar[secim4] = 0;
                                    for (int k = 0; k < urunAdlari.Length; k++)
                                    {
                                        hesaplar[secim4, k] = 0;
                                        Console.Clear();
                                    }
                                    Console.WriteLine("Hesap kapatıldı.");
                                    goto m;
                                }
                                else if (keyInfo.Key == ConsoleKey.Escape)
                                {
                                    Console.WriteLine("Ana menüye geri dönülüyor");
                                    goto m;
                                }
                                else
                                {
                                    Console.WriteLine("Bu masa boş.");
                                    goto f;
                                }
                            }
                        }
                        else
                        {
                            Console.WriteLine("Geçersiz masa. Lütfen tekrar deneyiniz.");
                            goto f;
                        }

                    }
                    break;

                case 4:
                   
                    try
                    {
                        bool kasaCikis1 = false;
                        while (!kasaCikis1)
                        {
                            Console.WriteLine("Kasa İşlemleri");
                            Console.WriteLine("1. Açık masaların hesaplarını görüntüle");
                            Console.WriteLine("2. Kasayı sıfırla");
                            Console.WriteLine("Ana menüye dönmek için [ESC] tuşuna basın");

                            ConsoleKey key = Console.ReadKey(true).Key;
                            Console.Clear();

                            if (key == ConsoleKey.NumPad1)
                            {
                                double toplamKasa = 0;
                                for (int masa1 = 0; masa1 < 20; masa1++)
                                {
                                    if (masalar[masa1] == 1)
                                    {
                                        double masaHesabi = 0;
                                        for (int f = 1; f < urunAdlari.Length; f++)
                                        {
                                            masaHesabi += hesaplar[masa1, f] * fiyatlar[f];
                                        }
                                        if (masaHesabi > 0)
                                        {
                                            Console.WriteLine("Masa " + masa1 + " Hesabı: " + masaHesabi + " TL");

                                        }
                                        toplamKasa += masaHesabi;
                                    }
                                }
                                Console.WriteLine("Toplam Kasa: " + toplamKasa + " TL");
                            }
                            else if (key == ConsoleKey.NumPad2)
                            {
                                Console.WriteLine("Kasa sıfırlanıyor...");
                                for (int masa1 = 0; masa1 < 20; masa1++)
                                {
                                    for (int z = 0; z < urunAdlari.Length; z++)
                                    {
                                        hesaplar[masa1, z] = 0;
                                    }
                                }
                                Console.WriteLine("Kasa sıfırlandı.");
                            }
                            else if (key == ConsoleKey.Escape)
                            {
                                Console.WriteLine("Ana menüye dönülüyor...");
                                goto m;
                            }
                            else
                            {
                                Console.WriteLine("Geçersiz giriş. Lütfen tekrar deneyin.");
                            }
                        }
              
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Bir hata oluştu: " + e.Message);
                    }
         
                    break;

                case 5:
                    Console.WriteLine("Çıkmak istediğinize emin misiniz?");
                    Console.WriteLine("1-Evet eminim. 2-Hayır, Ana menüye dönmek istiyorum.");
                    int cikis4 = int.Parse(Console.ReadLine());
                    if (cikis4 == 1)
                    {
                        Console.WriteLine("Çıkış yapmak için esc tuşuna basabilirsiniz.");
                        if (Console.ReadKey().Key == ConsoleKey.Escape)
                        {
                            break;
                        }
                    }
                    else
                    {
                        Console.WriteLine("Ana menüye yönlendiriliyorsunuz.");
                        goto m;
                    }
                    break;
            }
        }
    }
}

