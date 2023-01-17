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
    public partial class ManageLocation : System.Web.UI.Page
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
                objDAL.QueryName = "proc_RealEstate_Location_fetchInRepeater";

                DT = objDAL.FetchDatainDT();
                if (DT.Rows.Count > 0)
                {
                    rptrLocation.DataSource = DT;
                    rptrLocation.DataBind();
                }
                else
                {
                    rptrLocation.DataSource = null;
                    rptrLocation.DataBind();
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

        protected void rptrEnquiry_RowCommand(object sender, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                WIHO.BHO objBAL = new WIHO.BHO();

                objBAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objBAL.QueryType = "procedure";
                try
                {
                    objBAL.QueryName = "proc_RealEstate_Location_delete";
                    if (objBAL.DeleteRecord("@locationID", Convert.ToInt32(e.CommandArgument)))
                    {
                        pnlAlert.Attributes.Add("class", "alert alert-success");
                        pnlAlert.Visible = true;
                        lblalert.Text = "Record Deleted Successfully !!!";
                        fillRepeater();
                        return;
                    }
                    else
                    {
                        pnlAlert.Attributes.Add("class", "alert alert-danger");
                        pnlAlert.Visible = true;
                        lblalert.Text = "Unable to Delete Record...Please try again !!";
                        return;
                    }
                }
                catch (Exception ex)
                {
                    pnlAlert.Attributes.Add("class", "alert alert-danger");
                    pnlAlert.Visible = true;
                    lblalert.Text = "ERROR !!! Please try after some time";
                }
            }
        }

        protected void imgbtnadd_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Response.Redirect("AddLocation.aspx", false);
            return;
        }
    }
}