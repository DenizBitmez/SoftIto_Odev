using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftIto_Odev
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region odev1
            //int toplam = 0;
            //Console.WriteLine("Bir sayı giriniz:");
            //int sayi = int.Parse(Console.ReadLine());
            //while (sayi>=0)
            //{

            //    toplam += sayi;
            //    Console.WriteLine("Bir sayı giriniz:");
            //    sayi = int.Parse(Console.ReadLine());

            //    if (sayi == 0)
            //    {
            //        break;
            //    }

            //}
            //Console.WriteLine("Toplam:" + toplam);
            //    Console.ReadLine();
            #endregion

            #region odev2
            //int tekToplam = 0, ciftToplam = 0;
            //Console.WriteLine("Bir sayı giriniz:");
            //int sayi1= int.Parse(Console.ReadLine());
            //while (sayi1>=0)
            //{
            //    if (sayi1 == 0)
            //    {
            //        break;
            //    }

            //    if (sayi1 % 2 == 0)
            //    {
            //        ciftToplam += sayi1;
            //    }
            //    else
            //    {
            //        tekToplam += sayi1;
            //    }

            //    Console.WriteLine("Bir sayı giriniz:");
            //    sayi1 = int.Parse(Console.ReadLine());

            //}
            //Console.WriteLine("Çiftlerin toplamı:" + ciftToplam);
            //Console.WriteLine("Teklerin toplamı:"+tekToplam);
            //Console.ReadLine();
            #endregion

            #region odev3
            //Console.WriteLine("Sayı giriniz:");
            //int sayi= int.Parse(Console.ReadLine());
            //int i = 0;

            //while (i<sayi)
            //{
            //    i++;
            //    int j = 0;
            //    while (j<i)
            //    {
            //        j++;
            //        Console.WriteLine(i);
            //    }
            //}
            //Console.ReadLine();
            #endregion

            #region odev4
            //Console.WriteLine("Sayıyı giriniz:");
            //int sayi = int.Parse(Console.ReadLine());
            //int i = 1;
            //while (i <= sayi)    
            //{
            //    int j = sayi;

            //    while (j >= i)
            //    {

            //        Console.Write(i);
            //        j--;
            //    }
            //    i++;
            //}
            //Console.ReadLine();
            #endregion

            #region odev5
            //int i = 0;
            //while (i <= 4)
            //{
            //    ++i;
            //    int j = 0;
            //    while (j < 3)
            //    {
            //        j++;
            //        Console.Write("*");
            //    }
            //}
            //Console.ReadLine();
            #endregion

            #region odev6
            //int i = 0;
            //while (i <= 5)
            //{
            //    i++;
            //    int j = 1;
            //    while (j < i)
            //    {
            //        j++;
            //        Console.Write("*");
            //    }
            //    Console.WriteLine();
            //}
            //i = 0;
            //while (i < 6)
            //{
            //    i++;
            //    Console.WriteLine();
            //    int m = 5 - i;
            //    while (m > 0)
            //    {
            //        m--;
            //        Console.Write("");
            //        int k = 0;
            //        while (k < i)
            //        {
            //            k++;
            //            Console.Write("*");
            //        }
            //    }
            //}
            //Console.ReadLine();
            #endregion

            #region odev7
            //int i = 0;
            //while (i < 5)
            //{
            //    i++;
            //    Console.WriteLine();
            //    int j = 4 - i;
            //    while (j > 0)
            //    {
            //        j--;
            //        Console.Write(" ");



            //    }
            //    int z = 0;
            //    while (z < 2 * i + 1)
            //    {
            //        z++;
            //        Console.Write("*");
            //    }
            //}
            //i = 0;
            //while (i < 4)
            //{
            //    i++;
            //    Console.WriteLine();
            //    int j = 0;
            //    while (j < 3)
            //    {
            //        j++;
            //        Console.Write(" ");
            //    }
            //    int m = 0;
            //    while (m < 3)
            //    {
            //        m++;
            //        Console.Write("*");
            //    }
            //}
            //Console.ReadLine();
            #endregion

            #region odev8
            //int i = 0;
            //while (i < 4)
            //{

            //    Console.WriteLine();

            //    int j = 3 - i;
            //    while (j > 0)
            //    {
            //        Console.Write(" ");
            //        j--;
            //    }
            //    int k = 0;
            //    while (k < 2 * i + 1)
            //    {
            //        Console.Write("*");
            //        k++;
            //    }
            //    i++;
            //}
            //i = 0;
            //while (i < 4)
            //{
            //    i++;
            //    Console.WriteLine();

            //    int j = 0;
            //    while (j < i + 1)
            //    {

            //        Console.Write(" ");
            //        j++;

            //    }
            //    int k = 5 - (i * 2);
            //    while (k > 0)
            //    {

            //        Console.Write("*"); 
            //        k--;

            //    }

            //}
            //Console.ReadLine();
            #endregion

            #region odev9 
            //Console.WriteLine("Bir sayı giriniz:");
            //int sayi = int.Parse(Console.ReadLine());
            //int a = 1, b = 1, toplam = 0;
            //String metin = "1 1";
            //int i = 0;

            //while (i < sayi)
            //{
            //    toplam = a + b;
            //    a = b;
            //    b = toplam;
            //    metin = metin + " " + toplam;
            //    i++;
            //}
            //Console.WriteLine(metin);
            //Console.ReadLine();
            #endregion

            #region odev10
            //Console.WriteLine("Bir sayı giriniz:");
            //int sayi=int.Parse(Console.ReadLine());
            //int i = 2;
            //string metin = "";
            //while (i<=sayi)
            //{
            //    i++;
            //    bool durum = true;
            //    int j = 2;
            //    while (j<i)
            //    {
            //        j++;
            //        if (i % j == 0)
            //        {
            //          durum = false;
            //           break;
            //        }
            //    }

            //    if (durum==true)
            //    {
            //        metin = metin + i + " ";
            //    }

            //}
            //Console.WriteLine(metin);
            //Console.ReadLine();
            #endregion

            #region odev11
            //int i = 1;
            //while (i < 1000)
            //{

            //    if (1000 % i == 0)
            //    {
            //        Console.WriteLine(i);
            //    }
            //    i++;
            //}
            //Console.ReadLine();
            #endregion

            #region odev12
            //int bakiye = 10000;
            //int sayac = 0;
            //m:
            //Console.WriteLine("Hoş geldiniz. Şifrenizi giriniz:");
            //int sifre = int.Parse(Console.ReadLine());

            //while (sayac <= 4)
            //{
            //    if (sifre == 12345)
            //    {
            //        Console.WriteLine("Şifre doğru. Hoş geldiniz.");
            //    x:
            //        Console.WriteLine("1-Para çekme 2-Para yatırma 3-Bakiye kontrol 4-Çıkış");
            //        int secim = int.Parse(Console.ReadLine());
            //        switch (secim)
            //        {

            //            case 1:
            //                Console.WriteLine("Çekilecek tutar:");
            //                int para = int.Parse(Console.ReadLine());
            //                if (bakiye < para)
            //                {
            //                    Console.WriteLine("Bakiyeniz yetersiz. Hesabınızda bulunan para: " + bakiye + " Çekmek istediğiniz para: " + para);
            //                }
            //                else
            //                {
            //                    bakiye -= para;
            //                    Console.WriteLine("Çekilen tutar: " + para + " Kalan tutar: " + bakiye);
            //                }
            //                break;

            //            case 2:
            //                Console.WriteLine("Yatırmak istediğiniz tutar:");
            //                int yPara = int.Parse(Console.ReadLine());
            //                bakiye += yPara;
            //                Console.WriteLine("Eklediğiniz para: " + yPara + " Şimdiki bakiyeniz: " + bakiye);
            //                break;

            //            case 3:
            //                Console.WriteLine("Bakiyeniz: " + bakiye);
            //                break;

            //            case 4:
            //                Console.WriteLine("Çıkış yapmak istediğinize emin misiniz? 1-Eminim 2-Hayır, başka bir işlem daha yapmak istiyorum.");
            //                int tSecim = int.Parse(Console.ReadLine());
            //                if (tSecim == 1)
            //                {
            //                    Console.WriteLine("Çıkış yapılıyor...");
            //                    Console.WriteLine("Çıkış yapıldı. İyi günler dileriz.");
            //                    break;
            //                }
            //                else
            //                {
            //                    Console.WriteLine("Menüye yönlendiriliyorsunuz.");
            //                    goto x;
            //                }
            //            default:
            //                Console.WriteLine("Hatalı işlem yaptınız. Lütfen tekrar deneyiniz.");
            //                goto m;

            //        }
            //    }
            //    else
            //    {
            //        Console.WriteLine("Şifre yanlış. Tekrar deneyiniz.");
            //        sayac++;

            //        if (sayac >= 5)
            //        {
            //            Console.WriteLine("Kartınız bloke edildi");
            //        }
            //        sifre = int.Parse(Console.ReadLine());
            //    }


            //}
            #endregion


        }
    }
}
