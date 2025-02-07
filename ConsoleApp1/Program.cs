using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class Program
    {
        private const int V = 0;

        static void Main(string[] args)
        {
        //    Console.BackgroundColor = ConsoleColor.Black;
        //    Console.Clear();
        //    int[] masa = new int[200];
        //    int[,] siparis = new int[200, 20];
        //    int[] masalar = new int[200];
        //    int[] fiyatlar = new int[] { 50, 100, 150, 150, 150, 150, 100, 250, 200, 250, 300, 300, 150, 150, 150, 200, 200, 250, 250, 200 };
        //    int fiyatToplam = 0;
        //    bool cikis = false;
        //m:
        //    Console.WriteLine("Restorantımıza hoş geldiniz...");
        //    Console.WriteLine("Yapmak istediğiniz işlemi seçiniz: 1-Masa açma 2-Masa işlem 3-Masa Hesap 4-Kasa İşlemleri 5-Çıkış");
        //    int secim = int.Parse(Console.ReadLine());
        //    switch (secim)
        //    {
        //        case 1:

        //            Console.WriteLine("Kaç masa açılsın?");
        //            int deger = int.Parse(Console.ReadLine());
        //            if (deger >= 200)
        //            {
        //                Console.WriteLine("Maksimum kapasite 200'dür");
        //            }

        //            for (int j = 1; j <= deger; j++)
        //            {
        //                if (masa[j] == 0)
        //                {
        //                    Console.WriteLine("Masa " + j + " boş.");
        //                }
        //                else
        //                {
        //                    Console.WriteLine("Masa " + j + " dolu.");
        //                }
        //            }
        //        z:
                    //    //Console.WriteLine("Masa girmek için masanın idsini giriniz:");
                    //    //int i = int.Parse(Console.ReadLine());
                    //    //for (int k = 1; k < i; k++)
                    //    //{
                    //    //    if (masa[k] == 0)
                    //    //    {
                    //    //        Console.WriteLine("Masa " + i + " boş.");
                    //    //    }
                    //    //    else
                    //    //    {
                    //    //        Console.WriteLine("Masa " + i + " dolu.");
                    //    //        Console.WriteLine("Bu masa dolu. Lütfen başka masa seçiniz.");
                    //    //        goto z;
                    //    //    }


                    //    //}


                //    Console.WriteLine("Masa girmek için masanın idsini giriniz:");
                //    int i = int.Parse(Console.ReadLine()) - 1;
                //    if (masa[i] == 0)
                //    {
                //        Console.WriteLine("Masa " + (i + 1));
                //        masa[i] = 1;
                //    }
                //    else
                //    {
                //        Console.WriteLine("Bu masa dolu. Lütfen başka masa seçiniz.");
                //    }
                //    goto x;
                //    break;


                //case 2:
                //x:
                //    Console.Clear();
                //    Console.WriteLine("Menümüz:");
                //    Console.WriteLine("Başlangıç: ");
                //    Console.WriteLine("1-Volovan(50 TL) ");
                //    Console.WriteLine("2-Haydari(100 TL) ");
                //    Console.WriteLine("3-Paçanga Böreği(150 TL) ");
                //    Console.WriteLine("4-Kabak Mücver(150 TL) ");
                //    Console.WriteLine("-------------------------------");

                //    Console.WriteLine("Ara Yemek: ");
                //    Console.WriteLine("5-Kırmızı köz biber kızartması(150 TL) ");
                //    Console.WriteLine("6-Patates kroket(150 TL) ");
                //    Console.WriteLine("7-Rum böreği(100 TL) ");
                //    Console.WriteLine("8-Karidesli güveç(250 TL) ");
                //    Console.WriteLine("----------------------------");

                //    Console.WriteLine("Ana Yemek: ");
                //    Console.WriteLine("9-Tekirdağ köftesi(200 TL) ");
                //    Console.WriteLine("10- Tas Kebabı(250 TL) ");
                //    Console.WriteLine("11-Özel Soslu Tavuk Kanat(300 TL) ");
                //    Console.WriteLine("12- Fırında Kremalı Patatesli Tavuk Göğsü(300 TL) ");
                //    Console.WriteLine("--------------------------------------");

                //    Console.WriteLine("Salatalar: ");
                //    Console.WriteLine("13-Tavuklu Arpa Şehriye Salatası(150 TL) ");
                //    Console.WriteLine("14- Yıldız Şehriye Salatası(150 TL) ");
                //    Console.WriteLine("15- Muhteşem Patates Salatası(150 TL) ");
                //    Console.WriteLine("16- Kısır(200 TL) ");
                //    Console.WriteLine("--------------------------------------------");
                //    Console.WriteLine("Tatlı: ");
                //    Console.WriteLine("17- Fırında Sütlaç(200 TL) ");
                //    Console.WriteLine("18- Magnolia(250 TL) ");
                //    Console.WriteLine("19- Şekerpare(250 TL) ");
                //    Console.WriteLine("20- Profiterol(200 TL) ");

                    //while (true)
                    //{
                    //    Console.WriteLine("Ana menü: [ESC]");

                    //    if (Console.KeyAvailable && Console.ReadKey(true).Key == ConsoleKey.Escape)
                    //    {
                    //        break;
                    //    }

                    //    Console.WriteLine("Lütfen sipariş vermek istediğiniz ürünün kodunu giriniz:(Sipariş vermeyi tamamladıysanız 0'a basın)");
                    //    int siparis1 = int.Parse(Console.ReadLine());
                    //    if (siparis1 == 0)
                    //    {
                    //        // Siparişleri göster
                    //        Console.Clear();
                    //        for (int masaNo = V; masaNo < 200; masaNo++)
                    //        {
                    //            if (masa[masaNo] == 1)
                    //            {
                    //                Console.WriteLine("Masa " + (masaNo + 1) + " siparişleri:");
                    //                for (int urunKodu = 1; urunKodu <= 20; urunKodu++)
                    //                {
                    //                    if (siparis[masaNo, urunKodu] > 0)
                    //                    {
                    //                        Console.WriteLine("Ürün " + urunKodu + ": " + siparis[masaNo, urunKodu] + " adet");
                    //                    }
                    //                }
                    //            }
                    //        }
                    //        break;
                    //    }

                    //    Console.WriteLine("Adet sayısını belirleyiniz");
                    //    int adet = int.Parse(Console.ReadLine());

                    //    Console.WriteLine("Doğrulamak için yukarıda yazan masa no'yu giriniz");
                    //    int masaNo = int.Parse(Console.ReadLine()) - 1;

                    //    if (masaNo >= 0 && masaNo < 200)
                    //    {
                    //        if (masa[masaNo] == 1)
                    //        {
                    //            siparis[masaNo, siparis1] += adet;
                    //            Console.WriteLine("Siparişiniz eklendi.");
                    //        }
                    //        else
                    //        {
                    //            Console.WriteLine("Masa bulunamadı veya kapalı.");
                    //        }
                    //    }
                    //}
                    //break;

               //if (masa[masaNo] == 1)
                    //{
                    //    siparis[masaNo, siparis1] += adet;
                    //    Console.WriteLine("Siparişiniz" + siparis);
                    //}
                    //else
                    //{
                    //    Console.WriteLine("Masa bulunamadı veya kapalı.");
                    //}



                    //if (siparis1>0 && siparis1<200)
                    //{
                    //    masalar[i]+= siparis1*adet;
              //    siparis[i, siparis1] += adet;
                    //}
            

                //Console.WriteLine("Eğer masanızı seçmediyseniz masanızı seçmek için 1 girin");
                //int secim2 = int.Parse(Console.ReadLine());
                //goto z;
                //break;

        //        case 3:
        //        Console.Clear();
        //        Console.WriteLine("Masa no'yu giriniz:");
        //        int masaNoHesap = int.Parse(Console.ReadLine()) - 1;
        //        if (masaNoHesap >= 0 && masaNoHesap < 200 && masa[masaNoHesap] == 1)
        //        {
        //            int toplamFiyat = 0;
        //            for (int j = 1; j <= 20; j++)
        //            {
        //                toplamFiyat += siparis[masaNoHesap, j] * fiyatlar[j - 1];
        //            }
        //            Console.WriteLine("Toplam hesap: " + toplamFiyat + " TL");
        //            masa[masaNoHesap] = 0;  // Masa kapanır
        //        }
        //        else
        //        {
        //            Console.WriteLine("Masa bulunamadı veya kapalı.");
        //        }
        //        break;

        //    case 4:
        //        Console.Clear();
        //        int toplamCiro = 0;
        //        for (i = 0; i < 200; i++)
        //        {
        //            if (masa[i] == 1)
        //            {
        //                for (int j = 1; j <= 20; j++)
        //                {
        //                    toplamCiro += siparis[i, j] * fiyatlar[j - 1];
        //                }
        //            }
        //        }
        //        Console.WriteLine("Masaların toplam cirosu: " + toplamCiro + " TL");
        //        break;

        //    case 5:
        //            Console.WriteLine("Çıkmak istediğinize emin misiniz?");
        //            Console.WriteLine("1-Evet eminim. 2-Hayır, Ana menüye dönmek istiyorum.");
        //            int cikis1 = int.Parse(Console.ReadLine());
        //            if (cikis1 == 1)
        //            {
        //                Console.WriteLine("Çıkış yapmak için esc tuşuna basabilirsiniz.");
        //                if (Console.ReadKey().Key == ConsoleKey.Escape)
        //                {
        //                    cikis = true;
        //                }
        //            }
        //            else
        //            {
        //                Console.WriteLine("Ana menüye yönlendiriliyorsunuz.");
        //                goto m;
        //            }
        //            break;
        //    }
        }
    }
}
