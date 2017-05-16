using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace _4SC1WCFServer
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    
    public class HelloWebService : System.Web.Services.WebService
    {

        [WebMethod]
        public string displayMessage(string msg)
        {
            string newMsg = msg + " [From Server]";
            return newMsg;
        }
    }
}
