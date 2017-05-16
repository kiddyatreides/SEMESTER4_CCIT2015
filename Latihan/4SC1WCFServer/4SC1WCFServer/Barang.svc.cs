using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data.SqlClient;

namespace _4SC1WCFServer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Barang" in code, svc and config file together.
    public class Barang : IBarang
    {
        public string deleteBarang(string id){
            Koneksi kon = new Koneksi();
            SqlConnection sqlcon = kon.getConnection();
            string msg = string.Empty;
            using(sqlcon){
                sqlcon.Open();
                string sql = "delete from barang where idbarang = @id";
                SqlCommand sqlcom =  new SqlCommand(sql,sqlcon);
                using(sqlcom){
                    sqlcom.Parameters.AddWithValue("@id", id);
                    int res = sqlcom.ExecuteNonQuery();
                    msg = (res != 0? "Data has been deleted." : "Error !");
                }
                sqlcon.Close();
            }
            return msg;
        }
        public string insertBarang(BarangInfo data)
        {
            Koneksi con = new Koneksi();
            SqlConnection sqlcon = con.getConnection();
            string msg = string.Empty;
            using (sqlcon)
            {
                sqlcon.Open();
                string sql = "insert into barang values (@id, @nama, @stok, @harga)";
                SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                using (sqlcom)
                {
                    sqlcom.Parameters.AddWithValue("@id", data.IDBarang);
                    sqlcom.Parameters.AddWithValue("@nama", data.NamaBarang);
                    sqlcom.Parameters.AddWithValue("@stok", data.StokBarang);
                    sqlcom.Parameters.AddWithValue("@harga", data.HargaBarang);
                    int res = sqlcom.ExecuteNonQuery();
                    msg = (res != 0 ? "Data has been saved." : "Error !");
                }
                sqlcon.Close();
            }
            return msg;
        }

        public List<BarangInfo> getBarangByID(string id)
        {
            Koneksi con = new Koneksi();
            SqlConnection sqlcon = con.getConnection();
            List<BarangInfo> objList = new List<BarangInfo>();
            using (sqlcon)
            {
                sqlcon.Open();
                string sql = "select * from barang where idbarang = @id";
                SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                using (sqlcom)
                {
                    sqlcom.Parameters.AddWithValue("@id", id);
                    SqlDataReader dr = sqlcom.ExecuteReader();
                    if(dr.Read())
                    {
                        //gunakan setter method dari BarangInfo
                        BarangInfo objBarang = new BarangInfo();
                        objBarang.IDBarang = dr.GetString(0);
                        objBarang.NamaBarang = dr.GetString(1);
                        objBarang.StokBarang = dr.GetInt32(2);
                        objBarang.HargaBarang = dr.GetInt32(3);
                        objList.Add(objBarang);
                    }
                }
                sqlcon.Close();

                return objList;
            }

        }



        public List<BarangInfo> getAllBarang()
        {
            Koneksi con = new Koneksi();
            SqlConnection sqlcon = con.getConnection();
            using(sqlcon){
                sqlcon.Open();
                string sql = "select * from barang";
                SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                List<BarangInfo> objList = new List<BarangInfo>();
                using (sqlcom)
                {
                    SqlDataReader dr = sqlcom.ExecuteReader();
                    while (dr.Read())
                    {
                        //gunakan setter method dari BarangInfo
                        BarangInfo objBarang = new BarangInfo();
                        objBarang.IDBarang = dr.GetString(0);
                        objBarang.NamaBarang = dr.GetString(1);
                        objBarang.StokBarang = dr.GetInt32(2);
                        objBarang.HargaBarang = dr.GetInt32(3);
                        objList.Add(objBarang);
                    }
                }
                sqlcon.Close();

                return objList;    
            }
            
        }

        


    }
}
