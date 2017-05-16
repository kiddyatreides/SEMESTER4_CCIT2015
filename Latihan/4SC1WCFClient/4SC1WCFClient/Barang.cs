using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace _4SC1WCFClient
{
    class Barang
    {
        public void deleteBarang()
        {
            Console.WriteLine("Delete Function");
            Console.WriteLine("Input ID Barang :");
            string id = Console.ReadLine();

            BarangService.BarangClient obj = new BarangService.BarangClient();
            IList<BarangService.BarangInfo> objBarang = new List<BarangService.BarangInfo>();

            objBarang = obj.getBarangByID(id);

            if (objBarang.Count != 0)
            {
                foreach(var x in objBarang){
                    Console.WriteLine(x.IDBarang + " / " + x.NamaBarang + " / " + x.StokBarang + " / " + x.HargaBarang);
                }
                Console.Write("Are you sure ? Y/N");
                string res = Console.ReadLine();
                if (res == "Y")
                {
                    string resmsg = obj.deleteBarang(id);
                    Console.WriteLine(resmsg);
                }
            }
            else
            {
                Console.WriteLine("Data Not Found");
            }


        }

        public void insertBarang()
        {
            Console.WriteLine("Input your new data");
            Console.Write("ID : ");
            string id = Console.ReadLine();
            Console.Write("Name : ");
            string name = Console.ReadLine();
            Console.Write("Stock : ");
            int stock = Convert.ToInt32(Console.ReadLine());
            Console.Write("Price : ");
            int price = Convert.ToInt32(Console.ReadLine());

            BarangService.BarangInfo obj = new BarangService.BarangInfo();

            obj.IDBarang = id;
            obj.NamaBarang = name;
            obj.StokBarang = stock;
            obj.HargaBarang = price;

            BarangService.BarangClient objclient = new BarangService.BarangClient();
            string msg = objclient.insertBarang(obj);
            Console.WriteLine(msg);
            Console.ReadLine();

        }

        public void getAllBarang()
        {
            BarangService.BarangClient obj = new BarangService.BarangClient();

            IList<BarangService.BarangInfo> databarang;
            databarang = obj.getAllBarang();

            foreach (var x in databarang)
            {
                Console.WriteLine(x.IDBarang + " / " + x.NamaBarang + " / " + x.StokBarang + " / " + x.HargaBarang);
            }

            Console.ReadKey();
        }
    }
}
