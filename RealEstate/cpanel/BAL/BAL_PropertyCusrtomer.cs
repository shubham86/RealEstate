using RealEstate.cpanel.BEL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace RealEstate.cpanel.BAL
{
    public class BAL_PropertyCusrtomer
    {
        //Add rent out entry
        public Boolean addRentOutEntry(BEL_PropertyCusrtomer objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_RentPropertyCusrtomer_AddEntry";

                objDAL.SetParameters("@propertyID", "integer", objBEL.rentPropertyID, 4);
                objDAL.SetParameters("@clientName", "varchar", objBEL.clientName, 100);
                objDAL.SetParameters("@clientMobile", "varchar", objBEL.clientMobile, 10);
                objDAL.SetParameters("@clientEmail", "varchar", objBEL.clientEmail, 150);
                objDAL.SetParameters("@dateOfPossession", "date", objBEL.dateOfPossession, 12);
                objDAL.SetParameters("@dateOfAgreementExpiry", "date", objBEL.dateOfAgreementExpiry, 12);
                objDAL.SetParameters("@rentAmount", "decimal", objBEL.rentAmount, 15);
                objDAL.SetParameters("@depositeAmount", "decimal", objBEL.depositeAmount, 15);
                objDAL.SetParameters("@personalBrokerage", "decimal", objBEL.personalBrokerage, 15);
                objDAL.SetParameters("@collectedBrokerage", "decimal", objBEL.collectedBrokerage, 15);

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

        //Add rent out entry
        public Boolean addSoldOutEntry(BEL_PropertyCusrtomer objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_SoldPropertyCusrtomer_AddEntry";

                objDAL.SetParameters("@propertyID", "integer", objBEL.rentPropertyID, 4);
                objDAL.SetParameters("@clientName", "varchar", objBEL.clientName, 100);
                objDAL.SetParameters("@clientMobile", "varchar", objBEL.clientMobile, 10);
                objDAL.SetParameters("@clientEmail", "varchar", objBEL.clientEmail, 150);
                objDAL.SetParameters("@dateOfPossession", "date", objBEL.dateOfPossession, 12);
                objDAL.SetParameters("@soldPrice", "decimal", objBEL.soldPrice, 15);
                objDAL.SetParameters("@personalBrokerage", "decimal", objBEL.personalBrokerage, 15);
                objDAL.SetParameters("@collectedBrokerage", "decimal", objBEL.collectedBrokerage, 15);

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

        //skip rent out entry
        public Boolean skipRentOutEntry(BEL_PropertyCusrtomer objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_PropertyCusrtomer_skipEntry";

                objDAL.SetParameters("@propertyID", "integer", objBEL.rentPropertyID, 4);

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