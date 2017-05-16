using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;

namespace _4SC1WCFClient
{
    class Calculator
    {
        public void tambah()
        {

            CalculatorService.CalculatorClient objHello = new CalculatorService.CalculatorClient();

            Console.Write("Enter first number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());

            int res = objHello.addNumber(num1, num2);
            Console.Write("Response from server : ");
            Console.WriteLine(res);

            Console.ReadLine();
        }

        public void kurang()
        {

            CalculatorService.CalculatorClient objHello = new CalculatorService.CalculatorClient();

            Console.Write("Enter first number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());

            int res = objHello.substractNumber(num1, num2);
            Console.Write("Response from server : ");
            Console.WriteLine(res);

            Console.ReadLine();
        }

        public void kali()
        {

            CalculatorService.CalculatorClient objHello = new CalculatorService.CalculatorClient();

            Console.Write("Enter first number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());

            int res = objHello.multiplyNumber(num1, num2);
            Console.Write("Response from server : ");
            Console.WriteLine(res);

            Console.ReadLine();
        }

        public void bagi()
        {

            CalculatorService.CalculatorClient objHello = new CalculatorService.CalculatorClient();

            Console.Write("Enter first number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());

            try
            {
                int res = objHello.divideNumber(num1, num2);
                Console.Write("Response from server : ");
                Console.WriteLine(res);
            }
            catch (FaultException<CalculatorService.MyFaultException> faultex)
            {
                Console.WriteLine(faultex.Detail.message);
            }
            Console.ReadLine();
            
        }

        public void addFromWeb()
        {

            CalculatorWebRef.CalculatorWebService objHello = new CalculatorWebRef.CalculatorWebService();

            Console.Write("Enter first number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());

            int res = objHello.addNumber(num1, num2);
            Console.Write("Response from server : ");
            Console.WriteLine(res);

            Console.ReadLine();
        }
    }
}
