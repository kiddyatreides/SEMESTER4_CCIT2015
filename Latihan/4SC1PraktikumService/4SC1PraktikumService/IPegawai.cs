using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace _4SC1PraktikumService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IPegawai" in both code and config file together.
    [ServiceContract]
    public interface IPegawai
    {
        [OperationContract]
        List<PegawaiInfo> getPegawaiInfo();

        [OperationContract]
        List<PegawaiInfo> getPegawaiID();

        [OperationContract]
        string getPegawaiLastID();

        [OperationContract]
        string insertPegawai(PegawaiInfo data);

        [OperationContract]
        string updatePegawai(PegawaiInfo data);

        [OperationContract]
        string deletePegawai(string id);
    }
}
