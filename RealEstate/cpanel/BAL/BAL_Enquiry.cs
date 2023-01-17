using RealEstate.cpanel.BEL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace RealEstate.cpanel.BAL
{
    public class BAL_Enquiry
    {
        //Add Enquiry
        public Boolean addEnquiry(BEL_Enquiry objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Enquiry_AddRentEnquiry";

                objDAL.SetParameters("@clientName", "varchar", objBEL.clientName, 100);
                objDAL.SetParameters("@clientMobile", "varchar", objBEL.clientMobile, 10);
                objDAL.SetParameters("@clientEmail", "varchar", objBEL.clientEmail, 150);
                objDAL.SetParameters("@propertyType", "varchar", objBEL.propertyType, 50);
                objDAL.SetParameters("@rentOrSale", "varchar", objBEL.rentOrSale, 5);
                objDAL.SetParameters("@area", "smallint", objBEL.area, 4);
                objDAL.SetParameters("@location", "varchar", objBEL.location, 50);
                objDAL.SetParameters("@source", "varchar", objBEL.source, 20);                
                objDAL.SetParameters("@brokeThrough", "tinyint", objBEL.brokeThrough, 1);
                objDAL.SetParameters("@possessionDays", "tinyint", objBEL.possessionDays, 10);
                objDAL.SetParameters("@bedrooms", "varchar", objBEL.bedrooms, 10);
                objDAL.SetParameters("@bathrooms", "tinyint", objBEL.bathrooms, 1);
                objDAL.SetParameters("@furnished", "varchar", objBEL.furnished, 15);
                objDAL.SetParameters("@tenants", "varchar", objBEL.tenants, 20);
                objDAL.SetParameters("@parking", "varchar", objBEL.parking, 10);
                objDAL.SetParameters("@rentBudget", "decimal", objBEL.rentBudget, 15);
                objDAL.SetParameters("@priceBudget", "decimal", objBEL.priceBudget, 15);

                return objDAL.IUDData();
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
            }
            finally
            {
                objDAL.Dispose();
            }
            return _retVal;
        }

        //update Enquiry
        public Boolean updateEnquiry(BEL_Enquiry objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Enquiry_UpdateRentEnquiry";

                objDAL.SetParameters("@enquiryID", "varchar", objBEL.enquiryID, 100);
                objDAL.SetParameters("@clientName", "varchar", objBEL.clientName, 100);
                objDAL.SetParameters("@clientMobile", "varchar", objBEL.clientMobile, 10);
                objDAL.SetParameters("@clientEmail", "varchar", objBEL.clientEmail, 150);
                objDAL.SetParameters("@propertyType", "varchar", objBEL.propertyType, 50);
                objDAL.SetParameters("@rentOrSale", "varchar", objBEL.rentOrSale, 5);
                objDAL.SetParameters("@area", "integer", objBEL.area, 4);
                objDAL.SetParameters("@location", "varchar", objBEL.location, 50);
                objDAL.SetParameters("@source", "varchar", objBEL.source, 20);
                objDAL.SetParameters("@brokeThrough", "tinyint", objBEL.brokeThrough, 1);
                objDAL.SetParameters("@possessionDays", "tinyint", objBEL.possessionDays, 10);
                objDAL.SetParameters("@bedrooms", "varchar", objBEL.bedrooms, 10);
                objDAL.SetParameters("@bathrooms", "tinyint", objBEL.bathrooms, 1);
                objDAL.SetParameters("@furnished", "varchar", objBEL.furnished, 15);
                objDAL.SetParameters("@tenants", "varchar", objBEL.tenants, 20);
                objDAL.SetParameters("@parking", "varchar", objBEL.parking, 10);
                objDAL.SetParameters("@rentBudget", "decimal", objBEL.rentBudget, 15);
                objDAL.SetParameters("@priceBudget", "decimal", objBEL.priceBudget, 15);

                return objDAL.IUDData();
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
            }
            finally
            {
                objDAL.Dispose();
            }
            return _retVal;
        }
    }
}