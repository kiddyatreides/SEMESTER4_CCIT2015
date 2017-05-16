using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace _4SC1WCFServer
{
    [DataContract]
    public class MyFaultException
    {
        [DataMember]
        public string message;
    }
}