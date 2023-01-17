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
    public partial class SalePropertyDetails : System.Web.UI.Page
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

                fetchPropertyDetails();
            }
        }

        public void fetchPropertyDetails()
        {

            WIHO.DHO objDAL = new WIHO.DHO();
            DataSet DS = new DataSet();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Property_fetchPropertyDetails";

                objDAL.SetParameters("@PropertyID", "integer", Convert.ToInt32(Request.QueryString["ID"]), 4);

                DS = objDAL.FetchDatainDS();
                if (DS.Tables[0].Rows.Count > 0)
                {
                    lblName.Text = DS.Tables[0].Rows[0]["contactPersonName"].ToString();
                    lblMobile.Text = DS.Tables[0].Rows[0]["contactNumber"].ToString();
                    lblClientStatus.Text = Convert.ToInt32(DS.Tables[0].Rows[0]["brokeThrough"].ToString()) == 0 ? "Owner" : "Broker";
                    lblbrokethrough.Text = DS.Tables[0].Rows[0]["brokeThrough"].ToString();
                    lblDays.Text = Convert.ToInt32(string.Format("{0:0}", (DateTime.Now.AddDays(-1) - Convert.ToDateTime(DS.Tables[0].Rows[0]["postDate"])).TotalDays)) <= 0 ? "" : string.Format("{0:0}", (DateTime.Now.AddDays(-1) - Convert.ToDateTime(DS.Tables[0].Rows[0]["postDate"])).TotalDays) + " days ago";
                    lblPostDate.Text = Convert.ToDateTime(DS.Tables[0].Rows[0]["postDate"]).ToString("dd/MM/yyyy");
                    lblPropertyStatus.Text = DS.Tables[0].Rows[0]["rentOrSale"].ToString();
                    lblPropertyType.Text = DS.Tables[0].Rows[0]["propertyType"].ToString();
                    lblArea.Text = DS.Tables[0].Rows[0]["area"].ToString() == "" ? "-" : DS.Tables[0].Rows[0]["area"].ToString();
                    lblLocation.Text = DS.Tables[0].Rows[0]["location"].ToString();
                    lblPropertyAddress.Text = DS.Tables[0].Rows[0]["flatNo_buildingName"].ToString() + ", " + DS.Tables[0].Rows[0]["address"].ToString();
                    lblPossessionDate.Text = Convert.ToDateTime(DS.Tables[0].Rows[0]["possessionDate"]).ToString("dd/MM/yyyy");
                    lblBed.Text = DS.Tables[0].Rows[0]["bedrooms"].ToString() == "Null" ? "-" : DS.Tables[0].Rows[0]["bedrooms"].ToString();
                    lblBath.Text = DS.Tables[0].Rows[0]["bathrooms"].ToString() == "Null" ? "-" : DS.Tables[0].Rows[0]["bathrooms"].ToString();
                    lblFloor.Text = DS.Tables[0].Rows[0]["floor"].ToString();
                    lblFurnishing.Text = DS.Tables[0].Rows[0]["furnished"].ToString();
                    lblTenants.Text = DS.Tables[0].Rows[0]["preferredTenants"].ToString();
                    lblParking.Text = DS.Tables[0].Rows[0]["parking"].ToString();
                    lblAge.Text = DS.Tables[0].Rows[0]["age"].ToString() == "Null" ? "-" : DS.Tables[0].Rows[0]["age"].ToString();
                    lblPrice.Text = DS.Tables[0].Rows[0]["price"].ToString() == "Null" ? "-" : DS.Tables[0].Rows[0]["price"].ToString();
                    lblBrokerage.Text = DS.Tables[0].Rows[0]["brokerage"].ToString() == "Null" ? "-" : DS.Tables[0].Rows[0]["brokerage"].ToString();
                    lblNegitiation.Text = DS.Tables[0].Rows[0]["negotiation"].ToString();
                    lblDescription.Text = DS.Tables[0].Rows[0]["description"].ToString() == "" ? "-" : DS.Tables[0].Rows[0]["description"].ToString();
                }
                else
                {
                    pnlAlert.Attributes.Add("class", "alert alert-danger");
                    pnlAlert.Visible = true;
                    lblalert.Text = "No record Found ...";
                }

                if (DS.Tables[1].Rows.Count > 0)
                {
                    rptrPhoto.DataSource = DS.Tables[1];
                    rptrPhoto.DataBind();
                }
                else
                {
                    rptrPhoto.DataSource = null;
                    rptrPhoto.DataBind();
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

        protected void btnBack_Onclick(object sender, System.EventArgs e)
        {
            Response.Redirect("SalePropertiesForEnquiry.aspx?ID=" + Request.QueryString["EnqID"].ToString(), false);
        }

        protected void btnSoldIt_Onclick(object sender, System.EventArgs e)
        {
            Response.Redirect("AddSoldOutEntry.aspx?ID=" + Request.QueryString["ID"].ToString() + "&EnqID=" + Request.QueryString["EnqID"].ToString(), false);
        }

    }
}