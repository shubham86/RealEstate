using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstate.cpanel.BEL
{
    public class BEL_Property
    {
          public int rentPropertyID {get; set;}
          public DateTime postDate {get; set;}
          public string rentOrSale { get; set; }
          public string propertyType {get; set;}
          public int area {get; set;}
          public string location {get; set;}
          public string address {get; set;}
          public string latitude {get; set;}
          public string longitude {get; set;}
          public string source { get; set;}
          public string contactPersonName { get; set;}
          public string contactNumber { get; set;}
          public int brokeThrough {get; set;}
          public DateTime possessionDate {get; set;}
          public string bedrooms { get; set;}
          public string bathrooms {get; set;}
          public string floor { get; set;}
          public string furnished { get; set;}
          public string preferredTenants { get; set;}
          public string parking { get; set;}
          public string description { get; set;}
          public decimal? rent {get; set;}
          public decimal? price { get; set; }
          public decimal? deposite { get; set;}
          public decimal? brokerage { get; set;}
          public Boolean isSold {get; set;}
        public decimal? maintenance { get; set; }
        public string flatNo_buildingName { get; set; }
        public string age { get; set; }
        public string negotiation { get; set; }
        public string contactAddress { get; set; }
        public string brokerOrOwner { get; set; }
        public string contactToAdmin { get; set; }


        public int photoID { get; set; }
          public int photoID1 { get; set; }
          public int photoID2 { get; set; }
          public int photoID3 { get; set; }
          public int photoID4 { get; set; }
          public int photoID5 { get; set; }
          public int photoID6 { get; set; }
          public int photoID7 { get; set; }
          public int propertyID { get; set; }
          public string photoName1 { get; set; }
          public string path1 { get; set; }
          public string photoName2 { get; set; }
          public string path2 { get; set; }
          public string photoName3 { get; set; }
          public string path3 { get; set; }
          public string photoName4 { get; set; }
          public string path4 { get; set; }
          public string photoName5 { get; set; }
          public string path5 { get; set; }
          public string photoName6 { get; set; }
          public string path6 { get; set; }
          public string photoName7 { get; set; }
          public string path7 { get; set; }
    }
}