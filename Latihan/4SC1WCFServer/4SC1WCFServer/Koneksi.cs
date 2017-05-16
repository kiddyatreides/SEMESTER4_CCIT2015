using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace _4SC1WCFServer
{
    public class Koneksi
    {
        public SqlConnection getConnection()
        {
            SqlConnection con = new SqlConnection(

                "Data Source = KIDDY\\DHANA;" +
                "Initial Catalog = latihanwcf;" +
                "User Id = sa; Password = 123456"
             );
            return con;
        }
    }
}