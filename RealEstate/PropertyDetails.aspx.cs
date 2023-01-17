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
    public partial class PropertyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fetchProperty();
            }
        }

        private void fetchProperty()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataSet DS = new DataSet();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Properties_fetchInForm";

                objDAL.SetParameters("propertyID", "integer", Convert.ToInt32(Request.QueryString["ID"]), 4);

                DS = objDAL.FetchDatainDS();
                if (DS.Tables.Count > 0)
                {
                    if (DS.Tables[0].Rows.Count > 0)
                    {
                        lblPropetyName.Text = (DS.Tables[0].Rows[0]["bedrooms"].ToString() == "Null" ? (DS.Tables[0].Rows[0]["area"].ToString() + (DS.Tables[0].Rows[0]["propertyType"].ToString() == "Plot" ? "Guntha" : "Sq Ft.")) : DS.Tables[0].Rows[0]["bedrooms"].ToString() == "" ? (DS.Tables[0].Rows[0]["area"].ToString() + (DS.Tables[0].Rows[0]["propertyType"].ToString() == "Plot" ? "Guntha" : "Sq Ft.")) : DS.Tables[0].Rows[0]["bedrooms"].ToString()) + " " + DS.Tables[0].Rows[0]["propertyType"].ToString() + " in " + DS.Tables[0].Rows[0]["location"].ToString();
                        lblAddress.Text = DS.Tables[0].Rows[0]["address"].ToString();
                        lblRent.Text = DS.Tables[0].Rows[0]["rentOrSale"].ToString() == "Rent" ? DS.Tables[0].Rows[0]["rent"].ToString() : DS.Tables[0].Rows[0]["price"].ToString();
                        lblNegotiation.Text= DS.Tables[0].Rows[0]["negotiation"].ToString();
                        lblDescription.Text = DS.Tables[0].Rows[0]["description"].ToString() == "" ? "NA" : DS.Tables[0].Rows[0]["description"].ToString() == "" ? "NA" : DS.Tables[0].Rows[0]["description"].ToString();
                        lat.Value= DS.Tables[0].Rows[0]["latitude"].ToString();
                        lng.Value = DS.Tables[0].Rows[0]["longitude"].ToString();

                        if (DS.Tables[0].Rows[0]["bedrooms"].ToString() == "Single Room")
                        {
                            lblBedroom.Text = "0";
                        }
                        else if (DS.Tables[0].Rows[0]["bedrooms"].ToString() == "1 RK")
                        {
                            lblBedroom.Text = "0";
                        }
                        else if (DS.Tables[0].Rows[0]["bedrooms"].ToString() == "1 BHK")
                        {
                            lblBedroom.Text = "1";
                        }
                        else if (DS.Tables[0].Rows[0]["bedrooms"].ToString() == "2 BHK")
                        {
                            lblBedroom.Text = "2";
                        }
                        else if (DS.Tables[0].Rows[0]["bedrooms"].ToString() == "3 BHK")
                        {
                            lblBedroom.Text = "3";
                        }
                        else if (DS.Tables[0].Rows[0]["bedrooms"].ToString() == "4 BHK")
                        {
                            lblBedroom.Text = "4";
                        }
                        else if (DS.Tables[0].Rows[0]["bedrooms"].ToString() == "4+ BHK")
                        {
                            lblBedroom.Text = "4+";
                        }
                        else
                        {
                            lblBedroom.Text = "NA";
                        }

                        lblArea.Text = DS.Tables[0].Rows[0]["area"].ToString();

                        if (DS.Tables[0].Rows[0]["propertyType"].ToString() == "Plot")
                        {
                            lblAreaUnit.Text = "Guntha";
                        }
                        else
                        {
                            lblAreaUnit.Text = "Sq Ft.";
                        }

                        lblPropertyType.Text = DS.Tables[0].Rows[0]["propertyType"].ToString();
                        lblTenants.Text= DS.Tables[0].Rows[0]["preferredTenants"].ToString() == "Null" ? "NA" : DS.Tables[0].Rows[0]["preferredTenants"].ToString() == "" ? "NA" : DS.Tables[0].Rows[0]["preferredTenants"].ToString();
                        lblFurnishing.Text= DS.Tables[0].Rows[0]["furnished"].ToString() == "Null" ? "NA" : DS.Tables[0].Rows[0]["furnished"].ToString() == "" ? "NA" : DS.Tables[0].Rows[0]["furnished"].ToString(); ;
                        lblPossession.Text= Convert.ToDateTime(DS.Tables[0].Rows[0]["possessionDate"]) <= DateTime.Now ? "Ready to Move" : string.Format( "{0:dd-MMM-yyyy}",DS.Tables[0].Rows[0]["possessionDate"]);

                        if (DS.Tables[0].Rows[0]["floor"].ToString() != "" && DS.Tables[0].Rows[0]["floor"].ToString() != "Null")
                        {
                            string[] floor = DS.Tables[0].Rows[0]["floor"].ToString().Split(new char[] { '/' });

                            for (int i = 0; i < floor.Length; i++)
                            {
                                if (i == 0)
                                {
                                    lblFloor.Text =  floor[0];
                                }
                                if (i == 1)
                                {
                                    lblTotalFloor.Text = floor[1];
                                }
                            }
                        }
                        else
                        {
                            lblTotalFloor.Text = "0";
                            lblFloor.Text = "0";
                        }

                        lblBath.Text = DS.Tables[0].Rows[0]["bathrooms"].ToString() == "Null" ? "NA" : DS.Tables[0].Rows[0]["bathrooms"].ToString() == "" ? "NA" : DS.Tables[0].Rows[0]["bathrooms"].ToString(); 
                        lblParking.Text = DS.Tables[0].Rows[0]["parking"].ToString() == "Null" ? "NA" : DS.Tables[0].Rows[0]["parking"].ToString() == "" ? "NA" : DS.Tables[0].Rows[0]["parking"].ToString();
                        //lblAge.Text = DS.Tables[0].Rows[0]["age"].ToString().GetType() == typeof(int)  ? (Convert.ToInt32(DS.Tables[0].Rows[0]["age"].ToString())) <= 2 ? "New construction" : ((Convert.ToInt32(DS.Tables[0].Rows[0]["age"].ToString())-2) + "-" + DS.Tables[0].Rows[0]["age"].ToString() + " years") : "NA";
                        lblAge.Text = DS.Tables[0].Rows[0]["age"].ToString() == "" ? "NA" : DS.Tables[0].Rows[0]["age"].ToString() + " Years";
                        lblPostDate.Text = (DateTime.Now - Convert.ToDateTime(DS.Tables[0].Rows[0]["postDate"])).TotalDays <= 30 ? (string.Format("{0:0}", (DateTime.Now - Convert.ToDateTime(DS.Tables[0].Rows[0]["postDate"])).TotalDays) + " days ago" ): string.Format("{0:dd-MMM-yyyy}", DS.Tables[0].Rows[0]["postDate"]);

                        if (DS.Tables[0].Rows[0]["rentOrSale"].ToString() == "Rent")
                        {
                            Label1.Text = "Rent";
                            Label2.Text = "Rent";

                            lblDescRent.Text = DS.Tables[0].Rows[0]["rent"].ToString();
                            lblDeposite.Text = DS.Tables[0].Rows[0]["deposite"].ToString();
                            lblMaintenance.Text = DS.Tables[0].Rows[0]["maintenance"].ToString();
                            lblRentBrokrage.Text = DS.Tables[0].Rows[0]["brokerage"].ToString();

                            RentDetails.Visible = true;
                            PriceDetails.Visible = false;
                        }
                        else
                        {
                            Label1.Text = "Price";
                            Label2.Text = "Price";

                            lblPrice.Text= DS.Tables[0].Rows[0]["price"].ToString();
                            lblPriceBrokerage.Text= DS.Tables[0].Rows[0]["brokerage"].ToString();

                            RentDetails.Visible = false;
                            PriceDetails.Visible = true;
                        }

                        if (DS.Tables[0].Rows[0]["contactToAdmin"].ToString() == "1")
                        {
                            lblName.Text = "Hunt Home";
                            lblCompanyContact.Visible = true;
                            lblVerified.Visible = true;
                            Call.HRef = "tel:7066053339";
                        }
                        else
                        {
                            lblName.Text = DS.Tables[0].Rows[0]["contactPersonName"].ToString();
                            lblAgentContact.Visible = true;
                            lblAgentContact.Text = DS.Tables[0].Rows[0]["contactNumber"].ToString();
                            Call.HRef = "tel:" + DS.Tables[0].Rows[0]["contactNumber"].ToString();
                        }
                    }

                    if (DS.Tables[1].Rows.Count > 0)
                    {
                        rptrPhoto.DataSource = DS.Tables[1];
                        rptrPhoto.DataBind();

                        rptrPhotoSmall.DataSource = DS.Tables[1];
                        rptrPhotoSmall.DataBind();

                        rptrPhoto.Visible = true;
                        rptrPhotoSmall.Visible = true;
                        NoPhoto.Visible = false;
                        NoPhotoSmall.Visible = false;
                    }
                    else
                    {
                        rptrPhoto.DataSource = null;
                        rptrPhoto.DataBind();

                        rptrPhotoSmall.DataSource = null;
                        rptrPhotoSmall.DataBind();

                        rptrPhoto.Visible = false;
                        rptrPhotoSmall.Visible = false;

                        NoPhoto.Visible = true;
                        NoPhotoSmall.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                string x = ex.ToString();                
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "ERROR !!! Please try after some time";
                return;
            }
        }
    }
}