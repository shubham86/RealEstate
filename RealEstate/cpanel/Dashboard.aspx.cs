using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.cpanel
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["v_session_str_AdminID"]) == 0)
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!Page.IsPostBack)
            {
                if (Session["v_session_str_AdminRole"].ToString() != "admin")
                {
                    Response.Redirect("LoginPage.aspx");
                }

                if (Request.Cookies["status"] != null)
                {
                    if (Request.Cookies["status"].Value == "Rent")
                    {
                        Response.Redirect("AddRentEnquiry.aspx", false);
                    }
                    else
                    {
                        Response.Redirect("AddSaleEnquiry.aspx", false);
                    }
                }

                fetchDetails();
            }
        }

        public void fetchDetails()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Dashboard_fetchcounts";

                DT = objDAL.FetchDatainDT();
                if (DT.Rows.Count > 0)
                {
                    lblRentProperty.Text = DT.Rows[0]["rentProperty"].ToString();
                    lblSaleProperty.Text = DT.Rows[0]["saleProperty"].ToString();
                    lblBrokers.Text = DT.Rows[0]["brokers"].ToString();
                    lblTotal.Text = (Convert.ToInt32(lblRentProperty.Text) + Convert.ToInt32(lblSaleProperty.Text)).ToString();
                }
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "ERROR !!! Please try after some time";
            }
            finally
            {
                objDAL.Dispose();
            }
        }
    }
}