using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.EnterpriseServices;
using ExerciseCOMServer;

namespace ExerciseCOMClient
{
    class Program
    {
        static void Main(string[] args)
        {
            Exercise obj = new Exercise();

            Console.Write("Masukan Nama Pegawai : ");
            string name = Console.ReadLine();
            Console.Write("Masukan Tahun Kerja : ");
            string year_1 = Console.ReadLine();
            Console.Write("Masukan Total Amount : ");
            string totalAmount_1 = Console.ReadLine();

            int year = Convert.ToInt32(year_1);

            int totalAmount = Convert.ToInt32(totalAmount_1);

            obj.setLoan(year, totalAmount, name);

            string response = obj.getLoan();
            Console.WriteLine(response);
            Console.ReadLine();
        }
    }
}
