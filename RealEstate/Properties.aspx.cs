using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class Properties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fillddlLocation();

                if (Request.QueryString["s"] != null)
                {
                    ddlStatus.Items.FindByValue(Request.QueryString["s"].ToString()).Selected = true;
                    ddlPropertyType.Items.FindByValue(Request.QueryString["pt"].ToString()).Selected = true;
                    //lblLocations.Text = Request.QueryString["l"].ToString();
                    ddlLocation.Items.FindByText(Request.QueryString["l"].ToString() == "Location" ? "All" : Request.QueryString["l"].ToString()).Selected = true;
                    ddlTenants.Items.FindByValue(Request.QueryString["t"].ToString()).Selected = true;
                    ddlBedroom.Items.FindByValue(Request.QueryString["b"].ToString()).Selected = true;
                    ddlMinRent.Items.FindByValue(Request.QueryString["minR"].ToString()).Selected = true;
                    ddlMaxRent.Items.FindByValue(Request.QueryString["maxR"].ToString()).Selected = true;
                    ddlMinPrice.Items.FindByValue(Request.QueryString["minP"].ToString()).Selected = true;
                    ddlMaxPrice.Items.FindByValue(Request.QueryString["maxP"].ToString()).Selected = true;
                    //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "setRange()", true);
                }

                fetchPropertyCount();
                fetchPropertiesByFilter(1);
            }
        }

        public void fillddlLocation()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();
            ListItem lstItem = new ListItem();

            lstItem = new ListItem();
            lstItem.Text = "All";
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
                    lblAlert.Text="No Record Found ...";
                }
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
                lblAlert.Text = "ERROR !!! Please try after some time";
            }
        }

        private void fetchPropertyCount()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataSet DS = new DataSet();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Propety_fetchProperyCount";

                DS = objDAL.FetchDatainDS();
                if (DS.Tables.Count > 0)
                {
                    if (DS.Tables[0].Rows.Count > 0)
                    {
                        lblApartment.Text = "(" + DS.Tables[0].Rows[0]["appartment"].ToString() + ")";
                        lblVilla.Text = "(" + DS.Tables[0].Rows[0]["villa"].ToString() + ")";
                        lblIndependentFloor.Text = "(" + DS.Tables[0].Rows[0]["independentFloor"].ToString() + ")";
                        lblOffice.Text = "(" + DS.Tables[0].Rows[0]["plot"].ToString() + ")";
                        lblPlot.Text = "(" + DS.Tables[0].Rows[0]["office"].ToString() + ")";
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
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
                lblAlert.Text = "ERROR !!! Please try after some time";
            }
        }

        private int PageSize = 10;
        private void fetchPropertiesByFilter(int pageIndex)
        {
            string constring = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("proc_RealEstate_Properties_fetchByFilter", con))
                {
                    string sort = "";
                    if (ddlSort1.SelectedItem.Value == "0")
                    {
                        sort = "0";
                    }
                    else if (ddlSort1.SelectedItem.Value == "1" && ddlStatus.SelectedItem.Value == "Rent")
                    {
                        sort = "1";
                    }
                    else if (ddlSort1.SelectedItem.Value == "2" && ddlStatus.SelectedItem.Value == "Rent")
                    {
                        sort = "2";
                    }

                    else if (ddlSort1.SelectedItem.Value == "1" && ddlStatus.SelectedItem.Value == "Sale")
                    {
                        sort = "3";
                    }
                    else if (ddlSort1.SelectedItem.Value == "2" && ddlStatus.SelectedItem.Value == "Sale")
                    {
                        sort = "4";
                    }
                    
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pageIndex", pageIndex);
                    cmd.Parameters.AddWithValue("@pageSize", PageSize);
                    cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedItem.Value == "0" ? "" : ddlStatus.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@propertyType", ddlPropertyType.SelectedItem.Value == "0" ? "" : ddlPropertyType.SelectedItem.Text);
                    //cmd.Parameters.AddWithValue("@location", lblLocations.Text == "" ? "" : lblLocations.Text);
                    cmd.Parameters.AddWithValue("@location", ddlLocation.SelectedItem.Value == "0" ? "" : ddlLocation.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@tenants", ddlTenants.SelectedItem.Value == "0" ? "" : ddlTenants.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@bedroom", ddlBedroom.SelectedItem.Value == "0" ? "" : ddlBedroom.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@bathroom", ddlBathroom.SelectedItem.Value == "0" ? "" : ddlBathroom.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@sort", sort);
                    //cmd.Parameters.AddWithValue("@minRange", ddlStatus.SelectedItem.Value == "Rent" ? Convert.ToDecimal(lblMinRent.Text) :Convert.ToDecimal(lblMinPrice.Text));
                    //cmd.Parameters.AddWithValue("@maxRange", ddlStatus.SelectedItem.Value == "Rent" ? Convert.ToDecimal(lblMaxRent.Text) : Convert.ToDecimal(lblMaxPrice.Text));
                    cmd.Parameters.AddWithValue("@minRange", ddlStatus.SelectedItem.Value == "Rent" ? Convert.ToDecimal(ddlMinRent.SelectedItem.Value) : Convert.ToDecimal(ddlMinPrice.SelectedItem.Value));
                    cmd.Parameters.AddWithValue("@maxRange", ddlStatus.SelectedItem.Value == "Rent" ? Convert.ToDecimal(ddlMaxRent.SelectedItem.Value) : Convert.ToDecimal(ddlMaxPrice.SelectedItem.Value));
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    con.Open();
                    IDataReader idr = cmd.ExecuteReader();
                    if (idr != null)
                    {
                        rptrProperties.DataSource = idr;
                        rptrProperties.DataBind();
                    }
                    else
                    {
                        rptrProperties.DataSource = null;
                        rptrProperties.DataBind();
                        lblAlert.Text = "Sorry! Property not available for related search.";
                    }
                    idr.Close();
                    con.Close();
                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    lblCount.Text = recordCount.ToString();
                    PopulatePager(recordCount, pageIndex);
                }
            }
        }

        protected void btnSearch_Onclick(object sender, EventArgs e)
        {
            fetchPropertiesByFilter(1);
        }

        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }

        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            //fetchAllRentProperties(pageIndex);
            fetchPropertiesByFilter(pageIndex);
        }

        protected void btnClear_Onclick(object sender, EventArgs e)
        {
            clearFilter();
        }

        private void clearFilter()
        {
            ddlBathroom.ClearSelection();
            ddlBedroom.ClearSelection();
            ddlLocation.ClearSelection();
            ddlMaxPrice.ClearSelection();
            ddlMaxRent.ClearSelection();
            ddlMinPrice.ClearSelection();
            ddlPropertyType.ClearSelection();
            ddlStatus.ClearSelection();
            ddlTenants.ClearSelection();

            fetchPropertiesByFilter(1);
        }
    }
}