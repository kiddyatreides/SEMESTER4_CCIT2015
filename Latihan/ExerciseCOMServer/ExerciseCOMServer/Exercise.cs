using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.EnterpriseServices;

namespace ExerciseCOMServer
{
    public class Exercise
    {
        private string message, name;
        private int year, totalAmount;

        public void setLoan(int year, int totalAmount, string name)
        {
            if(year == 5 )
            {
                int totalTax = 5;
                int total = totalTax * totalAmount / 100;
                int total_fix = total + totalAmount;
                message = "Hai " + name + ", Final Amount Anda  = " + Convert.ToString(total_fix);
            }
            else if (year == 3)
            {
                int totalTax = 10;
                int total = totalTax * totalAmount / 100;
                int total_fix = total + totalAmount;
                message = "Hai " + name + ", Final Amount Anda  = " + Convert.ToString(total_fix);
            }
            else if (year == 2)
            {
                int totalTax = 15;
                int total = totalTax * totalAmount / 100;
                int total_fix = total + totalAmount;
                message = "Hai " + name + ", Final Amount Anda  = " + Convert.ToString(total_fix);
            }
            else
            {
                message = "Error, Pilihan anda salah";
            }
        }
        public string getLoan()
        {
            return message;
        }
    }
}
