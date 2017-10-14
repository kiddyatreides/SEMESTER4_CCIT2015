/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Badrus
 */
public class Database {
    Connection con;
   public Connection Open()
    {
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=CCIT_WEB";
            con = DriverManager.getConnection(url,"sa","2707itachi");
            return con;
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
           return null;
        }
    }
}
