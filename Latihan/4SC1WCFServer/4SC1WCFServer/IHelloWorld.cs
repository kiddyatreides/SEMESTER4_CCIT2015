using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace _4SC1WCFServer
{
    [ServiceContract]
    public interface IHelloWorld
    {
        [OperationContract]
        string displayMessage(string msg);
    }
}
