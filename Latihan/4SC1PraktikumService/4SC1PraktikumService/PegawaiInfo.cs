using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace _4SC1PraktikumService
{
        [DataContract]
        public class PegawaiInfo
        {
            string id, nama, alamat, jk, telepon;

            [DataMember]
            public string IDPegawai
            {
                get { return id; }
                set { id = value; }
            }
            [DataMember]
            public string NamaPegawai
            {
                get { return nama; }
                set { nama = value; }
            }
            [DataMember]
            public string alamatPegawai
            {
                get { return alamat; }
                set { alamat = value; }
            }
            [DataMember]
            public string jeniskelaminPegawai
            {
                get { return jk; }
                set { jk = value; }
            }
            [DataMember]
            public string teleponPegawai
            {
                get { return telepon; }
                set { telepon = value; }
            }
        }
    
}