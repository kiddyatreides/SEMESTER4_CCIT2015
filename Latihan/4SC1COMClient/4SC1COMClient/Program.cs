using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using _4SC1COMServer;

namespace _4SC1COMClient
{
    class Program
    {
        static void Main(string[] args)
        {
            Hello obj = new Hello();
            Console.Write("Input Nama Pegawai : ");
            string name = Console.ReadLine();
            Console.Write("Input Tahun Kerja : ");
            string year1 = Console.ReadLine();
            Console.Write("Input Jumlah Uang : ");
            string totalAmountt = Console.ReadLine();

            int year = Convert.ToInt32(year1);

            int totalAmount = Convert.ToInt32(totalAmountt);

            obj.setLoan(year, totalAmount, name);

            string response = obj.getLoan();
            Console.WriteLine(response);
            Console.ReadLine();


            /*Hello obj = new Hello();

            var message = Console.ReadLine();

            obj.setMessage(message);

            string response = obj.getMessage();

            Console.WriteLine(response);

            Console.ReadLine();*/

            /*Hello obj = new Hello();

            Console.WriteLine("Masukkan Bilangan 1");
            int bil1 = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Masukkan Bilangan 2");
            int bil2 = Convert.ToInt32(Console.ReadLine());

            obj.setCalculation(bil1, bil2);

            int response = obj.getCalculation();

            Console.WriteLine("Hasilnya adalah = " + response);

            Console.ReadLine();*/
        }
    }
}
