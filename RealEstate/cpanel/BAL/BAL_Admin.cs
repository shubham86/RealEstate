using RealEstate.cpanel.BEL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace RealEstate.cpanel.BAL
{
    public class BAL_Admin
    {
        //Allow Login
        public DataTable VerifyAdmin(BEL_Admin objBEL)
        {
            DataTable dt = new DataTable();
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Admin_Verify";

                objDAL.SetParameters("@userName", "varchar", objBEL.adminUserName, 50);
                objDAL.SetParameters("@password", "varchar", objBEL.password, 20);
                dt = objDAL.FetchDatainDT();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDAL.Dispose();
            }
            return dt;
        }
    }
}