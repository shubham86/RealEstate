using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.cpanel
{
    public partial class AddLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["v_session_str_AdminID"]) == 0)
            {
                Response.Redirect("Logout.aspx");
            }
            if (Session["v_session_str_AdminRole"].ToString() != "admin")
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void btnSave_Click(object sender, System.EventArgs e)
        {
            if (insertLocation())
            {
                Response.Redirect("ManageLocation.aspx?action=insert");
                return;
            }
            else
            {
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "Record could not be Added... Please try again !!!";
                return;
            }
        }

        private bool insertLocation()
        {
            bool functionReturnValue = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Location_AddLocation";

                objDAL.SetParameters("@location", "varchar", CultureInfo.CurrentCulture.TextInfo.ToTitleCase((txtLocation.Text.ToLower()).Trim()), 50);

                if (objDAL.IUDData())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
            }
            return functionReturnValue;
        }

        protected void btnCancel_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("ManageLocation.aspx");
        }
    }
}