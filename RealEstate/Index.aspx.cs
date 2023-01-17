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
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fillddlLocation();
                fetchRecentProperty();
            }
        }

        public void fillddlLocation()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();
            ListItem lstItem = new ListItem();

            lstItem = new ListItem();
            lstItem.Text = "Location";
            lstItem.Value = "0";
            ddlLocation.Items.Add(lstItem);

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Location_fetchAllinDdl";

                DT = objDAL.FetchDatainDT();
                if (DT.Rows.Count > 0)
                {
                    for (int i = 0; i < DT.Rows.Count; i++)
                    {
                        lstItem = new ListItem();
                        lstItem.Text = DT.Rows[i]["location"].ToString();
                        lstItem.Value = DT.Rows[i]["locationID"].ToString();
                        ddlLocation.Items.Add(lstItem);
                    }
                }
                else
                {
                    lblAlert.Text = "No Record Found ...";
                }
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
                lblAlert.Text = "ERROR !!! Please try after some time";
            }
        }

        protected void btnSearch_Onclick(object sender, EventArgs e)
        {
            //string x = lblLocations.Text;
            Response.Redirect("Properties.aspx?s=" + ddlStatus.SelectedItem.Value + "&pt=" + ddlPropertyType.SelectedItem.Value + "&l=" + ddlLocation.SelectedItem.Text + "&t=" + ddlTenants.SelectedItem.Value + "&b=" + ddlBedroom.SelectedItem.Value + "&minR=" + ddlMinRent.SelectedItem.Value + "&maxR=" + ddlMaxRent.SelectedItem.Value + "&minP=" + ddlMinPrice.SelectedItem.Value + "&maxP=" + ddlMaxPrice.SelectedItem.Value);
        }

        private void fetchRecentProperty()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataSet DS = new DataSet();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Propety_fetchRecentAndFeatured4";

                DS = objDAL.FetchDatainDS();

                if (DS.Tables[0].Rows.Count > 0)
                {
                    rptrFeaturedProperty.DataSource = DS.Tables[0];
                    rptrFeaturedProperty.DataBind();
                }
                else
                {
                    rptrFeaturedProperty.DataSource = null;
                    rptrFeaturedProperty.DataBind();
                }
                if (DS.Tables[1].Rows.Count > 0)
                {
                    rptrRecentProperty.DataSource = DS.Tables[1];
                    rptrRecentProperty.DataBind();
                }
                else
                {
                    rptrRecentProperty.DataSource = null;
                    rptrRecentProperty.DataBind();
                }
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
                lblAlert.Text = "ERROR !!! Please try after some time";
            }
        }
    }
}