using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class SalePropertiesForEnquiry : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["v_session_str_AdminID"]) == 0)
            {
                Response.Redirect("Logout.aspx");
            }

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    fetchEnquiry();
                    fillRepeater();
                }
            }
        }

        public void fetchEnquiry()
        {

            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Enquiry_fetchInForm";

                objDAL.SetParameters("@enquiryID", "integer", Convert.ToInt32(Request.QueryString["ID"]), 4);

                DT = objDAL.FetchDatainDT();
                if (DT.Rows.Count > 0)
                {
                    lblDate.Text = Convert.ToDateTime(DT.Rows[0]["enquiryDate"]).ToString("dd/MM/yyyy");
                    lblDays.Text = string.Format("{0:0}", (DateTime.Now.AddDays(-1) - Convert.ToDateTime(DT.Rows[0]["enquiryDate"])).TotalDays);
                    lblName.Text = DT.Rows[0]["clientName"].ToString();
                    lblMobile.Text = DT.Rows[0]["clientMobile"].ToString();
                    lblEmail.Text = DT.Rows[0]["clientEmail"].ToString();
                    lblPropertyType.Text = DT.Rows[0]["propertyType"].ToString();
                    lblArea.Text = DT.Rows[0]["area"].ToString() == "" ? "-" : DT.Rows[0]["area"].ToString();
                    lblLocation.Text = DT.Rows[0]["location"].ToString();
                    lblSource.Text = DT.Rows[0]["source"].ToString();
                    lblBroker.Text = DT.Rows[0]["brokeThrough"].ToString();

                    if (DT.Rows[0]["possessionDays"].ToString() == "0")
                    {
                        lblPossessionDays.Text = "Immediate";
                    }
                    else
                    {
                        lblPossessionDays.Text = "Within " + DT.Rows[0]["possessionDays"].ToString() + " days";
                    }

                    lblBed.Text = DT.Rows[0]["bedrooms"].ToString() == "" ? "-" : DT.Rows[0]["bedrooms"].ToString();
                    lblBath.Text = DT.Rows[0]["bathrooms"].ToString() == "" ? "-" : DT.Rows[0]["bathrooms"].ToString(); ;
                    lblFurnishing.Text = DT.Rows[0]["furnished"].ToString();
                    lblTenants.Text = DT.Rows[0]["tenants"].ToString();
                    lblParking.Text = DT.Rows[0]["parking"].ToString();

                    if (DT.Rows[0]["rentOrSale"].ToString() == "Rent")
                    {
                        lblBudget.Text = DT.Rows[0]["rentBudget"].ToString();
                    }
                    else
                    {
                        lblBudget.Text = DT.Rows[0]["priceBudget"].ToString();
                    }

                }
                else
                {
                    pnlAlert.Attributes.Add("class", "alert alert-danger");
                    pnlAlert.Visible = true;
                    lblalert.Text = "No record Found ...";
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

        public void fillRepeater()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_SaleProperties_fetchByEnquiry";

                objDAL.SetParameters("@location", "varchar", lblLocation.Text, 50);
                objDAL.SetParameters("@bedroom", "varchar", lblBed.Text, 10);
                objDAL.SetParameters("@tenants", "varchar", lblTenants.Text, 20);
                objDAL.SetParameters("@priceBudget", "decimal", (Convert.ToDecimal(lblBudget.Text) + Convert.ToDecimal(2000)), 13);

                DT = objDAL.FetchDatainDT();
                if (DT.Rows.Count > 0)
                {
                    rptrProperty.DataSource = DT;
                    rptrProperty.DataBind();
                    filter.Visible = true;
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
                Response.Redirect("SalePropertyDetails.aspx?ID=" + e.CommandArgument + "&EnqID=" + Request.QueryString["ID"].ToString(), false);
                return;
            }

            if (e.CommandName == "sold")
            {
                Response.Redirect("AddSoldOutEntry.aspx?ID=" + e.CommandArgument + "&EnqID=" + Request.QueryString["ID"].ToString(), false);
                return;
            }
        }

        protected void btnCancel_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("ManageSaleEnquiry.aspx");
        }
    }
}