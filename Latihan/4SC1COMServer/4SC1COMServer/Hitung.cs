using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.EnterpriseServices;

namespace _4SC1COMServer
{
    class Hitung : ServicedComponent
    {
        private int hasil;

        public void setCalculation(int bil1, int bil2)
        {
            hasil = bil1 * bil2;
        }
        public int getCalculation()
        {
            return hasil;
        }
    }
}
