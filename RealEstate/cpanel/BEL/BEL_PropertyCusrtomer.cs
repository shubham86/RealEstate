using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstate.cpanel.BEL
{
    public class BEL_PropertyCusrtomer
    {
        public int clientID { get; set; }
        public int enquiryID { get; set; }
        public int rentPropertyID { get; set; }
        public string clientName { get; set; }
        public string clientMobile { get; set; }
        public string clientEmail { get; set; }
        public DateTime dateOfPossession { get; set; }
        public DateTime dateOfAgreementExpiry { get; set; }
        public decimal? rentAmount { get; set; }
        public decimal? soldPrice { get; set; }
        public decimal? depositeAmount { get; set; }
        public decimal personalBrokerage { get; set; }
        public decimal collectedBrokerage { get; set; }
    }
}