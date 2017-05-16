using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.EnterpriseServices;

namespace _4SC1COMServer
{
    public class Hello : ServicedComponent
    {

        private string message, name;
        private int year, totalAmount;

        public void setLoan(int year, int totalAmount, string name)
        {
            if (year == 5)
            {
                int totalTax = 5;
                int total = totalTax * totalAmount / 100;
                int total_fix = total + totalAmount;
                message = "Hello, " + name + ", Final Amount kamu  sebesar " + Convert.ToString(total_fix);
            }
            else if (year == 3)
            {
                int totalTax = 10;
                int total = totalTax * totalAmount / 100;
                int total_fix = total + totalAmount;
                message = "Hello, " + name + ", Final Amount kamu  sebesar " + Convert.ToString(total_fix);
            }
            else if (year == 2)
            {
                int totalTax = 15;
                int total = totalTax * totalAmount / 100;
                int total_fix = total + totalAmount;
                message = "Hello, " + name + ", Final Amount kamu  sebesar " + Convert.ToString(total_fix);
            }
            else
            {
                message = "PILIHAN TIDAK ADA";
            }
        }
        public string getLoan()
        {
            return message;
        }
        /*private string message;

        public void setMessage(string str)
        {
            message = str;
        }
        public string getMessage()
        {
            return message;
        }

        private int hasil;

        public void setCalculation(int bil1, int bil2)
        {
            hasil = bil1 * bil2;
        }
        public int getCalculation()
        {
            return hasil;
        }*/

    }
}
