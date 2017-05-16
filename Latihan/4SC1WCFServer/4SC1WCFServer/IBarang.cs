using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace _4SC1WCFServer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IBarang" in both code and config file together.
    [ServiceContract]
    public interface IBarang
    {
        [OperationContract]
        List<BarangInfo> getAllBarang();

        [OperationContract]
        string insertBarang(BarangInfo data);

        [OperationContract]
        List<BarangInfo> getBarangByID(string id);

        [OperationContract]
        string deleteBarang(string id);
         
    }
}
