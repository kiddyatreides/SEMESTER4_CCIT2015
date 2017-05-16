using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace _4SC1WCFServer
{
    /// <summary>
    /// Summary description for CalculatorWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CalculatorWebService : System.Web.Services.WebService
    {

        [WebMethod]
        public int addNumber(int num1, int num2)
        {
            int result = num1 + num2;
            return result;
        }

        [WebMethod]
        public int substractNumber(int num1, int num2)
        {
            int result = num1 - num2;
            return result;
        }

        [WebMethod]
        public int multiplyNumber(int num1, int num2)
        {
            int result = num1 * num2;
            return result;
        }

        [WebMethod]
        public int divideNumber(int num1, int num2)
        {
            int result = num1 / num2;
            return result;
        }
    }
}
