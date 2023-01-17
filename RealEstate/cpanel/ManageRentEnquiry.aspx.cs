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
    public partial class ManageRentEnquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["v_session_str_AdminID"]) == 0)
            {
                Response.Redirect("Logout.aspx");
            }

            if (!Page.IsPostBack)
            {
                if (Session["v_session_str_AdminRole"].ToString() != "admin")
                {
                    Response.Redirect("Logout.aspx");
                }

                if (Request.QueryString["action"] == "insert")
                {
                    pnlAlert.Attributes.Add("class", "alert alert-success");
                    pnlAlert.Visible = true;
                    lblalert.Text = "Record Inserted successfully !!!";
                }
                else if (Request.QueryString["action"] == "update")
                {
                    pnlAlert.Attributes.Add("class", "alert alert-success");
                    pnlAlert.Visible = true;
                    lblalert.Text = "Record Updated successfully !!!";
                }
                else if (Request.QueryString["action"] == "delete")
                {
                    pnlAlert.Attributes.Add("class", "alert alert-success");
                    pnlAlert.Visible = true;
                    lblalert.Text = "Record Deleted successfully !!!";
                }
                else if (Request.QueryString["action"] == "rentOut")
                {
                    pnlAlert.Attributes.Add("class", "alert alert-success");
                    pnlAlert.Visible = true;
                    lblalert.Text = "Enquiry fullfill successfully !!!";
                }

                fillRepeater();
            }
        }

        public void fillRepeater()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_RentEnquiry_fetchInRepeater";

                DT = objDAL.FetchDatainDT();
                if (DT.Rows.Count > 0)
                {
                    rptrEnquiry.DataSource = DT;
                    rptrEnquiry.DataBind();
                }
                else
                {
                    rptrEnquiry.DataSource = null;
                    rptrEnquiry.DataBind();
                }
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "ERROR !!! Please try after some time";
            }
        }

        protected void rptrEnquiry_RowCommand(object sender, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Response.Redirect("AddRentEnquiry.aspx?ID=" + e.CommandArgument, false);
                return;
            }

            if (e.CommandName == "search")
            {
                Response.Redirect("RentPropertiesForEnquiry.aspx?ID=" + e.CommandArgument, false);
                return;
            }
        }

        protected void imgbtnadd_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Response.Redirect("AddRentEnquiry.aspx", false);
            return;
        }
    }
}