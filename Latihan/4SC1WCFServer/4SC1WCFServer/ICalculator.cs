using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace _4SC1WCFServer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ICalculator" in both code and config file together.
    [ServiceContract]
    public interface ICalculator
    {
        [OperationContract]
        int addNumber(int num1, int num2);

        [OperationContract]
        int multiplyNumber(int num1, int num2);

        [OperationContract]
        int substractNumber(int num1, int num2);

        [OperationContract]
        [FaultContract(typeof(MyFaultException))]
        int divideNumber(int num1, int num2);
    }

}
