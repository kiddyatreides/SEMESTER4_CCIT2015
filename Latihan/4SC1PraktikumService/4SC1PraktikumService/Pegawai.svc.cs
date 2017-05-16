using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data.SqlClient;

namespace _4SC1PraktikumService
{
    // NOTE: MADE BY Kiddy
    public class Pegawai : IPegawai
    {
        public List<PegawaiInfo> getPegawaiInfo()
        {
            // kode get data from sql server..
            Koneksi kon = new Koneksi();
            SqlConnection sqlcon = kon.getConnection();
            List<PegawaiInfo> objList = new List<PegawaiInfo>();
            using (sqlcon)
            {
                sqlcon.Open();
                string sql = "select * from pegawai";
                SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                using (sqlcom)
                {
                    SqlDataReader dr = sqlcom.ExecuteReader();
                    while (dr.Read())
                    {
                        PegawaiInfo obj = new PegawaiInfo();
                        obj.IDPegawai = dr.GetString(0);
                        obj.NamaPegawai = dr.GetString(1);
                        obj.alamatPegawai = dr.GetString(2);
                        obj.jeniskelaminPegawai = dr.GetString(3);
                        obj.teleponPegawai = dr.GetString(4);
                        objList.Add(obj);
                    }
                }
                sqlcon.Close();
            }
            return objList;
        }
        public string getPegawaiLastID()
        {
            try
            {
                Koneksi kon = new Koneksi();
                SqlConnection sqlcon = kon.getConnection();
                List<PegawaiInfo> objList = new List<PegawaiInfo>();
                string result = string.Empty;
                string nextid = string.Empty;

                using (sqlcon)
                {
                    String sql = "select top 1 idpegawai,nama from pegawai order by idpegawai desc";
                    SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                    using (sqlcom)
                    {
                        SqlDataReader dr = sqlcom.ExecuteReader();
                        if (dr.Read())
                        {
                            result = dr.GetString(0);
                            int cut = Convert.ToInt32(result.Substring(8,3)) + 1;
                            if (cut < 10)
                            {
                                nextid = "PGW"+ DateTime.Now.Year + "000"+cut;
                            }
                            else if (cut < 100)
                            {
                                nextid = "PGW" + DateTime.Now.Year + "00"+cut;
                            }
                            else if (cut < 1000)
                            {
                                nextid = "PGW" + DateTime.Now.Year + "0"+cut;
                            }
                            else
                            {
                                //
                            }
                        }
                        else
                        {
                            nextid = nextid = "PGW" + DateTime.Now.Year + "0001";
                        }
                    }

                }
                return nextid;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return null;
            }
        }
        public List<PegawaiInfo> getPegawaiID()
        {
            try
            {
                //Koneksi kon = new Koneksi();
                //SqlConnection sqlcon = kon.getConnection();
                //List<PegawaiInfo> objList = new List<PegawaiInfo>();
                //string result = string.Empty;
                //string nextid = string.Empty;

                //using (sqlcon)
                //{
                //    String sql = "select top 1 IDBook from Book order by IDBook desc";
                //    SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                //    using (sqlcom)
                //    {
                //        SqlDataReader dr = sqlcom.ExecuteReader();
                //        if (dr.NextResult())
                //        {
                //            result = dr.GetString(0);
                //            int cut = Convert.ToInt32(result.Trim(1)) + 1;
                //            if (cut < 10)
                //            {
                //                nextid = "B00" + cut;
                //            }
                //            else if (cut < 100)
                //            {
                //                nextid = "B0" + cut;
                //            }
                //            else if (cut < 1000)
                //            {
                //                nextid = "B" + cut;
                //            }
                //            else
                //            {
                //                System.err.println("DB Full");
                //            }
                //        }
                //        else
                //        {
                //            nextid = "B001";
                //        }
                //    }
                //    return nextid;
                //}
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public string insertPegawai(PegawaiInfo data)
        {
            Koneksi kon = new Koneksi();
            SqlConnection sqlcon = kon.getConnection();
            string msg = string.Empty;
            using (sqlcon)
            {
                sqlcon.Open();
                string sql = "insert pegawai values(@id, @nama, @alamat, @jk, @telepon)";
                SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                using (sqlcom)
                {
                    sqlcom.Parameters.AddWithValue("@id", data.IDPegawai);
                    sqlcom.Parameters.AddWithValue("@nama", data.NamaPegawai);
                    sqlcom.Parameters.AddWithValue("@alamat", data.alamatPegawai);
                    sqlcom.Parameters.AddWithValue("@jk", data.jeniskelaminPegawai);
                    sqlcom.Parameters.AddWithValue("@telepon", data.teleponPegawai);
                    int res = sqlcom.ExecuteNonQuery();
                    msg = (res != 0 ? "Data has been saved." : "Oops, something went wrong.");
                }
                sqlcon.Close();
            }
            return msg;
        }
        public string updatePegawai(PegawaiInfo data)
        {
            Koneksi kon = new Koneksi();
            SqlConnection sqlcon = kon.getConnection();
            string msg = string.Empty;
            using (sqlcon)
            {
                sqlcon.Open();
                string sql = "update pegawai set nama = @nama, alamat = @alamat, jk = @jk, telepon = @telepon where idpegawai = @id";
                SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                using (sqlcom)
                {
                    sqlcom.Parameters.AddWithValue("@id", data.IDPegawai);
                    sqlcom.Parameters.AddWithValue("@nama", data.NamaPegawai);
                    sqlcom.Parameters.AddWithValue("@alamat", data.alamatPegawai);
                    sqlcom.Parameters.AddWithValue("@jk", data.jeniskelaminPegawai);
                    sqlcom.Parameters.AddWithValue("@telepon", data.teleponPegawai);
                    int res = sqlcom.ExecuteNonQuery();
                    msg = (res != 0 ? "Data has been updated." : "Oops, something went wrong.");
                }
                sqlcon.Close();
            }
            return msg;
        }
        public string deletePegawai(string id)
        {
            Koneksi kon = new Koneksi();
            SqlConnection sqlcon = kon.getConnection();
            string msg = string.Empty;
            using (sqlcon)
            {
                sqlcon.Open();
                string sql = "delete from pegawai where idpegawai = @id";
                SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
                using (sqlcom)
                {
                    sqlcom.Parameters.AddWithValue("@id", id);
                    int res = sqlcom.ExecuteNonQuery();
                    msg = (res != 0 ? "Data has been deleted." : "Oops, something went wrong.");
                }
                sqlcon.Close();
            }
            return msg;
        }
    }
}
