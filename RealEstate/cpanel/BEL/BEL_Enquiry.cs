using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstate.cpanel.BEL
{
    public class BEL_Enquiry
    {
        public int enquiryID {get; set;}
        public DateTime enquiryDate {get; set;}
        public string clientName {get; set;}
        public string clientMobile {get; set;}
        public string clientEmail {get; set;}
        public string propertyType {get; set;}
        public string rentOrSale {get; set;}
        public int area {get; set;}
        public string location {get; set;}
        public string source {get; set;}
        public int brokeThrough {get; set;}
        public int possessionDays {get; set;}
        public string bedrooms {get; set;}
        public int bathrooms {get; set;}
        public string furnished {get; set;}
        public string tenants {get; set;}
        public string parking {get; set;}
        public decimal? priceBudget {get; set;}
        public decimal? rentBudget {get; set;}
        public bool isActive {get; set;}
    }
}