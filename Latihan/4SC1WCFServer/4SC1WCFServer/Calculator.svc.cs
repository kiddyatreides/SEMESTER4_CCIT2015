using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace _4SC1WCFServer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Calculator" in code, svc and config file together.
    public class Calculator : ICalculator
    {
        public int addNumber(int num1, int num2)
        {
            int result = num1 + num2;
            return result;
        }
        public int substractNumber(int num1, int num2)
        {
            int result = num1 - num2;
            return result;
        }
        public int multiplyNumber(int num1, int num2)
        {
            int result = num1 * num2;
            return result;
        }
        public int divideNumber(int num1, int num2)
        {
            if (num2 == 0)
            {
                MyFaultException objError = new MyFaultException();
                objError.message = "Pembagi tidak boleh 0";
                throw new FaultException<MyFaultException>(objError);
            }
            if (num1 < num2)
            {
                MyFaultException objError = new MyFaultException();
                objError.message = "Value of denominator can not be greater than numerator";
                throw new FaultException<MyFaultException>(objError);
            }
            int result = num1 / num2;
            return result;
        }
    }
}
