using RealEstate.cpanel.BEL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace RealEstate.cpanel.BAL
{
    public class BAL_Property
    {
        //Add Property
        public Boolean addRentProperty(BEL_Property objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Properties_AddRentProperty";

                objDAL.SetParameters("@propertyType", "varchar", objBEL.propertyType, 50);
                objDAL.SetParameters("@rentOrSale", "varchar", objBEL.rentOrSale, 5);
                objDAL.SetParameters("@area", "integer", objBEL.area, 4);
                objDAL.SetParameters("@location", "varchar", objBEL.location, 50);
                objDAL.SetParameters("@address", "varchar", objBEL.address, 250);
                objDAL.SetParameters("@latitude", "varchar", objBEL.latitude, 50);
                objDAL.SetParameters("@longitude", "varchar", objBEL.longitude, 50);
                objDAL.SetParameters("@source", "varchar", objBEL.source, 20);
                objDAL.SetParameters("@contactPersonName", "varchar", objBEL.contactPersonName, 100);
                objDAL.SetParameters("@contactNumber", "varchar", objBEL.contactNumber, 10);
                objDAL.SetParameters("@brokeThrough", "tinyint", objBEL.brokeThrough, 1);
                objDAL.SetParameters("@possessionDate", "date", objBEL.possessionDate, 10);
                objDAL.SetParameters("@bedrooms", "varchar", objBEL.bedrooms, 12);
                objDAL.SetParameters("@bathrooms", "varchar", objBEL.bathrooms, 5);
                objDAL.SetParameters("@floor", "varchar", objBEL.floor, 10);
                objDAL.SetParameters("@furnished", "varchar", objBEL.furnished, 15);
                objDAL.SetParameters("@preferredTenants", "varchar", objBEL.preferredTenants, 20);
                objDAL.SetParameters("@parking", "varchar", objBEL.parking, 10);
                objDAL.SetParameters("@description", "varchar", objBEL.description, 500);
                objDAL.SetParameters("@rent", "decimal", objBEL.rent, 15);
                objDAL.SetParameters("@deposite", "decimal", objBEL.deposite, 15);
                objDAL.SetParameters("@brokerage", "decimal", objBEL.brokerage, 15);
                objDAL.SetParameters("@flatNo_buildingName", "varchar", objBEL.flatNo_buildingName, 100);
                objDAL.SetParameters("@age", "varchar", objBEL.age, 5);
                objDAL.SetParameters("@maintenance", "decimal", objBEL.maintenance, 15);
                objDAL.SetParameters("@negotiation", "varchar", objBEL.negotiation, 15);
                objDAL.SetParameters("@isApproved", "bit", 1, 1);
                objDAL.SetParameters("@contactToAdmin", "varchar", objBEL.contactToAdmin, 1);

                objDAL.SetParameters("@photoName1", "varchar", objBEL.photoName1, 250);
                objDAL.SetParameters("@photoPath1", "varchar", objBEL.path1, 1000);
                objDAL.SetParameters("@photoName2", "varchar", objBEL.photoName2, 250);
                objDAL.SetParameters("@photoPath2", "varchar", objBEL.path2, 1000);
                objDAL.SetParameters("@photoName3", "varchar", objBEL.photoName3, 250);
                objDAL.SetParameters("@photoPath3", "varchar", objBEL.path3, 1000);
                objDAL.SetParameters("@photoName4", "varchar", objBEL.photoName4, 250);
                objDAL.SetParameters("@photoPath4", "varchar", objBEL.path4, 1000);
                objDAL.SetParameters("@photoName5", "varchar", objBEL.photoName5, 250);
                objDAL.SetParameters("@photoPath5", "varchar", objBEL.path5, 1000);
                objDAL.SetParameters("@photoName6", "varchar", objBEL.photoName6, 250);
                objDAL.SetParameters("@photoPath6", "varchar", objBEL.path6, 1000);
                objDAL.SetParameters("@photoName7", "varchar", objBEL.photoName7, 250);
                objDAL.SetParameters("@photoPath7", "varchar", objBEL.path7, 1000);

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

        //update Property
        public Boolean updateRentProperty(BEL_Property objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Properties_UpdateRentProperty";

                objDAL.SetParameters("@propertyID", "integer", objBEL.propertyID, 4);
                objDAL.SetParameters("@propertyType", "varchar", objBEL.propertyType, 50);
                objDAL.SetParameters("@rentOrSale", "varchar", objBEL.rentOrSale, 5);
                objDAL.SetParameters("@area", "integer", objBEL.area, 4);
                objDAL.SetParameters("@location", "varchar", objBEL.location, 50);
                objDAL.SetParameters("@address", "varchar", objBEL.address, 250);
                objDAL.SetParameters("@latitude", "varchar", objBEL.latitude, 50);
                objDAL.SetParameters("@longitude", "varchar", objBEL.longitude, 50);
                objDAL.SetParameters("@source", "varchar", objBEL.source, 20);
                objDAL.SetParameters("@contactPersonName", "varchar", objBEL.contactPersonName, 100);
                objDAL.SetParameters("@contactNumber", "varchar", objBEL.contactNumber, 10);
                objDAL.SetParameters("@brokeThrough", "integer", objBEL.brokeThrough, 1);
                objDAL.SetParameters("@possessionDate", "date", objBEL.possessionDate, 10);
                objDAL.SetParameters("@bedrooms", "varchar", objBEL.bedrooms, 12);
                objDAL.SetParameters("@bathrooms", "varchar", objBEL.bathrooms, 5);
                objDAL.SetParameters("@floor", "varchar", objBEL.floor, 10);
                objDAL.SetParameters("@furnished", "varchar", objBEL.furnished, 15);
                objDAL.SetParameters("@preferredTenants", "varchar", objBEL.preferredTenants, 20);
                objDAL.SetParameters("@parking", "varchar", objBEL.parking, 10);
                objDAL.SetParameters("@description", "varchar", objBEL.description, 500);
                objDAL.SetParameters("@rent", "decimal", objBEL.rent, 15);
                objDAL.SetParameters("@deposite", "decimal", objBEL.deposite, 15);
                objDAL.SetParameters("@brokerage", "decimal", objBEL.brokerage, 15);
                objDAL.SetParameters("@flatNo_buildingName", "varchar", objBEL.flatNo_buildingName, 100);
                objDAL.SetParameters("@age", "varchar", objBEL.age, 5);
                objDAL.SetParameters("@maintenance", "decimal", objBEL.maintenance, 15);
                objDAL.SetParameters("@negotiation", "varchar", objBEL.negotiation, 15);
                objDAL.SetParameters("@contactToAdmin", "varchar", objBEL.contactToAdmin, 1);

                objDAL.SetParameters("@photoID1", "integer", objBEL.photoID1, 4);
                objDAL.SetParameters("@photoName1", "varchar", objBEL.photoName1, 250);
                objDAL.SetParameters("@photoPath1", "varchar", objBEL.path1, 1000);
                objDAL.SetParameters("@photoID2", "integer", objBEL.photoID2, 4);
                objDAL.SetParameters("@photoName2", "varchar", objBEL.photoName2, 250);
                objDAL.SetParameters("@photoPath2", "varchar", objBEL.path2, 1000);
                objDAL.SetParameters("@photoID3", "integer", objBEL.photoID3, 4);
                objDAL.SetParameters("@photoName3", "varchar", objBEL.photoName3, 250);
                objDAL.SetParameters("@photoPath3", "varchar", objBEL.path3, 1000);
                objDAL.SetParameters("@photoID4", "integer", objBEL.photoID4, 4);
                objDAL.SetParameters("@photoName4", "varchar", objBEL.photoName4, 250);
                objDAL.SetParameters("@photoPath4", "varchar", objBEL.path4, 1000);
                objDAL.SetParameters("@photoID5", "integer", objBEL.photoID5, 4);
                objDAL.SetParameters("@photoName5", "varchar", objBEL.photoName5, 250);
                objDAL.SetParameters("@photoPath5", "varchar", objBEL.path5, 1000);
                objDAL.SetParameters("@photoID6", "integer", objBEL.photoID6, 4);
                objDAL.SetParameters("@photoName6", "varchar", objBEL.photoName6, 250);
                objDAL.SetParameters("@photoPath6", "varchar", objBEL.path6, 1000);
                objDAL.SetParameters("@photoID7", "integer", objBEL.photoID7, 4);
                objDAL.SetParameters("@photoName7", "varchar", objBEL.photoName7, 250);
                objDAL.SetParameters("@photoPath7", "varchar", objBEL.path7, 1000);

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

        //Add Property
        public Boolean addSaleProperty(BEL_Property objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Properties_AddSaleProperty";

                objDAL.SetParameters("@propertyType", "varchar", objBEL.propertyType, 50);
                objDAL.SetParameters("@rentOrSale", "varchar", objBEL.rentOrSale, 5);
                objDAL.SetParameters("@area", "integer", objBEL.area, 4);
                objDAL.SetParameters("@location", "varchar", objBEL.location, 50);
                objDAL.SetParameters("@address", "varchar", objBEL.address, 250);
                objDAL.SetParameters("@latitude", "varchar", objBEL.latitude, 50);
                objDAL.SetParameters("@longitude", "varchar", objBEL.longitude, 50);
                objDAL.SetParameters("@source", "varchar", objBEL.source, 20);
                objDAL.SetParameters("@contactPersonName", "varchar", objBEL.contactPersonName, 100);
                objDAL.SetParameters("@contactNumber", "varchar", objBEL.contactNumber, 10);
                objDAL.SetParameters("@brokeThrough", "tinyint", objBEL.brokeThrough, 1);
                objDAL.SetParameters("@possessionDate", "date", objBEL.possessionDate, 10);
                objDAL.SetParameters("@bedrooms", "varchar", objBEL.bedrooms, 12);
                objDAL.SetParameters("@bathrooms", "varchar", objBEL.bathrooms, 5);
                objDAL.SetParameters("@floor", "varchar", objBEL.floor, 10);
                objDAL.SetParameters("@furnished", "varchar", objBEL.furnished, 15);
                objDAL.SetParameters("@parking", "varchar", objBEL.parking, 10);
                objDAL.SetParameters("@description", "varchar", objBEL.description, 500);
                objDAL.SetParameters("@price", "decimal", objBEL.price, 15);
                objDAL.SetParameters("@brokerage", "decimal", objBEL.brokerage, 15);
                objDAL.SetParameters("@flatNo_buildingName", "varchar", objBEL.flatNo_buildingName, 100);
                objDAL.SetParameters("@age", "varchar", objBEL.age, 5);
                objDAL.SetParameters("@negotiation", "varchar", objBEL.negotiation, 15);
                objDAL.SetParameters("@isApproved", "bit", 1, 1);
                objDAL.SetParameters("@contactToAdmin", "varchar", objBEL.contactToAdmin, 1);

                objDAL.SetParameters("@photoName1", "varchar", objBEL.photoName1, 250);
                objDAL.SetParameters("@photoPath1", "varchar", objBEL.path1, 1000);
                objDAL.SetParameters("@photoName2", "varchar", objBEL.photoName2, 250);
                objDAL.SetParameters("@photoPath2", "varchar", objBEL.path2, 1000);
                objDAL.SetParameters("@photoName3", "varchar", objBEL.photoName3, 250);
                objDAL.SetParameters("@photoPath3", "varchar", objBEL.path3, 1000);
                objDAL.SetParameters("@photoName4", "varchar", objBEL.photoName4, 250);
                objDAL.SetParameters("@photoPath4", "varchar", objBEL.path4, 1000);
                objDAL.SetParameters("@photoName5", "varchar", objBEL.photoName5, 250);
                objDAL.SetParameters("@photoPath5", "varchar", objBEL.path5, 1000);
                objDAL.SetParameters("@photoName6", "varchar", objBEL.photoName6, 250);
                objDAL.SetParameters("@photoPath6", "varchar", objBEL.path6, 1000);
                objDAL.SetParameters("@photoName7", "varchar", objBEL.photoName7, 250);
                objDAL.SetParameters("@photoPath7", "varchar", objBEL.path7, 1000);

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

        //update Property
        public Boolean updateSaleProperty(BEL_Property objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Properties_UpdateSaleProperty";

                objDAL.SetParameters("@propertyID", "integer", objBEL.propertyID, 4);
                objDAL.SetParameters("@propertyType", "varchar", objBEL.propertyType, 50);
                objDAL.SetParameters("@rentOrSale", "varchar", objBEL.rentOrSale, 5);
                objDAL.SetParameters("@area", "integer", objBEL.area, 4);
                objDAL.SetParameters("@location", "varchar", objBEL.location, 50);
                objDAL.SetParameters("@address", "varchar", objBEL.address, 250);
                objDAL.SetParameters("@latitude", "varchar", objBEL.latitude, 50);
                objDAL.SetParameters("@longitude", "varchar", objBEL.longitude, 50);
                objDAL.SetParameters("@source", "varchar", objBEL.source, 20);
                objDAL.SetParameters("@contactPersonName", "varchar", objBEL.contactPersonName, 100);
                objDAL.SetParameters("@contactNumber", "varchar", objBEL.contactNumber, 10);
                objDAL.SetParameters("@brokeThrough", "integer", objBEL.brokeThrough, 1);
                objDAL.SetParameters("@possessionDate", "date", objBEL.possessionDate, 10);
                objDAL.SetParameters("@bedrooms", "varchar", objBEL.bedrooms, 12);
                objDAL.SetParameters("@bathrooms", "varchar", objBEL.bathrooms, 5);
                objDAL.SetParameters("@floor", "varchar", objBEL.floor, 10);
                objDAL.SetParameters("@furnished", "varchar", objBEL.furnished, 15);
                objDAL.SetParameters("@parking", "varchar", objBEL.parking, 10);
                objDAL.SetParameters("@description", "varchar", objBEL.description, 500);
                objDAL.SetParameters("@price", "decimal", objBEL.price, 15);
                objDAL.SetParameters("@brokerage", "decimal", objBEL.brokerage, 15);
                objDAL.SetParameters("@flatNo_buildingName", "varchar", objBEL.flatNo_buildingName, 100);
                objDAL.SetParameters("@age", "varchar", objBEL.age, 5);
                objDAL.SetParameters("@negotiation", "varchar", objBEL.negotiation, 15);
                objDAL.SetParameters("@contactToAdmin", "varchar", objBEL.contactToAdmin, 1);

                objDAL.SetParameters("@photoID1", "integer", objBEL.photoID1, 4);
                objDAL.SetParameters("@photoName1", "varchar", objBEL.photoName1, 250);
                objDAL.SetParameters("@photoPath1", "varchar", objBEL.path1, 1000);
                objDAL.SetParameters("@photoID2", "integer", objBEL.photoID2, 4);
                objDAL.SetParameters("@photoName2", "varchar", objBEL.photoName2, 250);
                objDAL.SetParameters("@photoPath2", "varchar", objBEL.path2, 1000);
                objDAL.SetParameters("@photoID3", "integer", objBEL.photoID3, 4);
                objDAL.SetParameters("@photoName3", "varchar", objBEL.photoName3, 250);
                objDAL.SetParameters("@photoPath3", "varchar", objBEL.path3, 1000);
                objDAL.SetParameters("@photoID4", "integer", objBEL.photoID4, 4);
                objDAL.SetParameters("@photoName4", "varchar", objBEL.photoName4, 250);
                objDAL.SetParameters("@photoPath4", "varchar", objBEL.path4, 1000);
                objDAL.SetParameters("@photoID5", "integer", objBEL.photoID5, 4);
                objDAL.SetParameters("@photoName5", "varchar", objBEL.photoName5, 250);
                objDAL.SetParameters("@photoPath5", "varchar", objBEL.path5, 1000);
                objDAL.SetParameters("@photoID6", "integer", objBEL.photoID6, 4);
                objDAL.SetParameters("@photoName6", "varchar", objBEL.photoName6, 250);
                objDAL.SetParameters("@photoPath6", "varchar", objBEL.path6, 1000);
                objDAL.SetParameters("@photoID7", "integer", objBEL.photoID7, 4);
                objDAL.SetParameters("@photoName7", "varchar", objBEL.photoName7, 250);
                objDAL.SetParameters("@photoPath7", "varchar", objBEL.path7, 1000);

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

        //Add Property
        public Boolean addRentPropertyFromFrontEnd(BEL_Property objBEL)
        {
            Boolean _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Properties_AddPropertyByFrontEnd";


                objDAL.SetParameters("@contactPersonName", "varchar", objBEL.contactPersonName, 100);
                objDAL.SetParameters("@contactNumber", "varchar", objBEL.contactNumber, 10);
                objDAL.SetParameters("@source", "varchar", objBEL.source, 20);
                objDAL.SetParameters("@brokeThrough", "tinyint", objBEL.brokeThrough, 1);
                objDAL.SetParameters("@contactAddress", "varchar", objBEL.contactAddress, 250);
                objDAL.SetParameters("@brokerOrOwner", "varchar", objBEL.brokerOrOwner, 6);
                objDAL.SetParameters("@rentOrSale", "varchar", objBEL.rentOrSale, 5);
                objDAL.SetParameters("@propertyType", "varchar", objBEL.propertyType, 50);
                objDAL.SetParameters("@area", "integer", objBEL.area, 4);
                objDAL.SetParameters("@location", "varchar", objBEL.location, 50);
                objDAL.SetParameters("@address", "varchar", objBEL.address, 250);
                objDAL.SetParameters("@latitude", "varchar", objBEL.latitude, 50);  
                objDAL.SetParameters("@longitude", "varchar", objBEL.longitude, 50);
                objDAL.SetParameters("@possessionDate", "date", objBEL.possessionDate, 10);
                objDAL.SetParameters("@bedrooms", "varchar", objBEL.bedrooms, 10);
                objDAL.SetParameters("@bathrooms", "varchar", objBEL.bathrooms, 5);
                objDAL.SetParameters("@floor", "varchar", objBEL.floor, 10);
                objDAL.SetParameters("@furnished", "varchar", objBEL.furnished, 15);
                objDAL.SetParameters("@preferredTenants", "varchar", objBEL.preferredTenants, 20);
                objDAL.SetParameters("@parking", "varchar", objBEL.parking, 10);
                objDAL.SetParameters("@description", "varchar", objBEL.description, 500);
                objDAL.SetParameters("@rent", "decimal", objBEL.rent, 15);
                objDAL.SetParameters("@price", "decimal", objBEL.price, 15);
                objDAL.SetParameters("@deposite", "decimal", objBEL.deposite, 15);
                objDAL.SetParameters("@brokerage", "decimal", objBEL.brokerage, 15);
                objDAL.SetParameters("@flatNo_buildingName", "varchar", objBEL.flatNo_buildingName, 100);
                objDAL.SetParameters("@age", "varchar", objBEL.age, 5);
                objDAL.SetParameters("@maintenance", "decimal", objBEL.maintenance, 15);
                objDAL.SetParameters("@negotiation", "varchar", objBEL.negotiation, 15);

                objDAL.SetParameters("@photoName1", "varchar", objBEL.photoName1, 250);
                objDAL.SetParameters("@photoPath1", "varchar", objBEL.path1, 1000);
                objDAL.SetParameters("@photoName2", "varchar", objBEL.photoName2, 250);
                objDAL.SetParameters("@photoPath2", "varchar", objBEL.path2, 1000);
                objDAL.SetParameters("@photoName3", "varchar", objBEL.photoName3, 250);
                objDAL.SetParameters("@photoPath3", "varchar", objBEL.path3, 1000);
                objDAL.SetParameters("@photoName4", "varchar", objBEL.photoName4, 250);
                objDAL.SetParameters("@photoPath4", "varchar", objBEL.path4, 1000);
                objDAL.SetParameters("@photoName5", "varchar", objBEL.photoName5, 250);
                objDAL.SetParameters("@photoPath5", "varchar", objBEL.path5, 1000);
                objDAL.SetParameters("@photoName6", "varchar", objBEL.photoName6, 250);
                objDAL.SetParameters("@photoPath6", "varchar", objBEL.path6, 1000);
                objDAL.SetParameters("@photoName7", "varchar", objBEL.photoName7, 250);
                objDAL.SetParameters("@photoPath7", "varchar", objBEL.path7, 1000);

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