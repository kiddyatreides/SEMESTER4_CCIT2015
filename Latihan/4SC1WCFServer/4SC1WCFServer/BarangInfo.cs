using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace _4SC1WCFServer
{
    [DataContract]
    public class BarangInfo
    {
        string id = string.Empty;
        string nama = string.Empty;
        int stok = 0;
        int harga = 0;


        [DataMember]
        public string IDBarang
        {
            get { return id; }
            set { id = value; }
        }

        [DataMember]
        public string NamaBarang
        {
            get { return nama; }
            set { nama = value; }
        }

        [DataMember]
        public int StokBarang
        {
            get { return stok; }
            set { stok = value; }
        }

        [DataMember]
        public int HargaBarang
        {
            get { return harga; }
            set { harga = value; }
        }


    }
}