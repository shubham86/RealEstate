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
    public partial class ManageRentProperty : System.Web.UI.Page
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
                    lblalert.Text = "Record register as rent Out successfully !!!";
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
                objDAL.QueryName = "proc_RealEstate_RentProperties_fetchInRepeater";

                DT = objDAL.FetchDatainDT();
                if (DT.Rows.Count > 0)
                {
                    rptrProperty.DataSource = DT;
                    rptrProperty.DataBind();
                }
                else
                {
                    rptrProperty.DataSource = null;
                    rptrProperty.DataBind();
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

        protected void rptrProperty_RowCommand(object sender, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {            
            if (e.CommandName == "edit")
            {
                Response.Redirect("AddRentProperty.aspx?ID=" + e.CommandArgument, false);
                return;
            }

            if (e.CommandName == "sold")
            {
                Response.Redirect("AddRentOutEntry.aspx?ID=" + e.CommandArgument, false);
                return;
            }
        }

        protected void imgbtnadd_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Response.Redirect("AddRentProperty.aspx", false);
            return;
        }
    }
}