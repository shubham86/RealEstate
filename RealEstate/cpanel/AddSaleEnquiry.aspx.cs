using RealEstate.cpanel.BAL;
using RealEstate.cpanel.BEL;
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
    public partial class AddSaleEnquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["status"] != null)
            {
                HttpCookie Cookie = new HttpCookie("name");
                Cookie.Value = Request.QueryString["name"].ToString();
                Cookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(Cookie);

                HttpCookie Cookie1 = new HttpCookie("mobile");
                Cookie1.Value = Request.QueryString["mobile"].ToString();
                Cookie1.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(Cookie1);

                HttpCookie Cookie2 = new HttpCookie("location");
                Cookie2.Value = Request.QueryString["location"].ToString();
                Cookie2.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(Cookie2);

                HttpCookie Cookie3 = new HttpCookie("status");
                Cookie3.Value = Request.QueryString["status"].ToString();
                Cookie3.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(Cookie3);

                if (Request.QueryString["status"].ToString() == "buy")
                {
                    Response.Redirect("AddSaleEnquiry.aspx", false);
                }
            }


            if (Convert.ToInt32(Session["v_session_str_AdminID"]) == 0)
            {
                Response.Redirect("Logout.aspx");
            }

            if (!Page.IsPostBack)
            {
                fillddlLocation();
                if (Request.Cookies["status"] != null && Request.Cookies["name"] != null)
                {
                    txtClientName.Text = Request.Cookies["name"].Value;
                    txtClientMobile.Text = Request.Cookies["mobile"].Value;
                    ddlLocation.Items.FindByText(Request.Cookies["location"].Value).Selected = true;

                    Response.Cookies["name"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["mobile"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["location"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["status"].Expires = DateTime.Now.AddDays(-1);
                }

                if (Request.QueryString["name"] != null)
                {
                    txtClientName.Text = Request.QueryString["name"].ToString();
                    txtClientMobile.Text = Request.QueryString["mobile"].ToString();
                    ddlLocation.Items.FindByText(Request.QueryString["location"].ToString()).Selected = true;
                }

                if (Request.QueryString["ID"] != null)
                {
                    fetchEnquiry();
                }
            }
        }

        public void fillddlLocation()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();
            ListItem lstItem = new ListItem();

            lstItem = new ListItem();
            lstItem.Text = "--Select Location--";
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
                    pnlAlert.Attributes.Add("class", "alert alert-danger");
                    pnlAlert.Visible = true;
                    lblalert.Text = "No Record Found ...";
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
                    txtClientName.Text= DT.Rows[0]["clientName"].ToString();
                    txtClientMobile.Text = DT.Rows[0]["clientMobile"].ToString();
                    txtClientEmail.Text = DT.Rows[0]["clientEmail"].ToString();
                    ddlPropertyType.Items.FindByText(DT.Rows[0]["propertyType"].ToString()).Selected = true;
                    txtArea.Text = DT.Rows[0]["area"].ToString();
                    ddlLocation.Items.FindByText(DT.Rows[0]["location"].ToString()).Selected = true;
                    ddlSource.Items.FindByText(DT.Rows[0]["source"].ToString()).Selected = true;
                    rdbBroker.Items.FindByValue(DT.Rows[0]["brokeThrough"].ToString()).Selected = true;
                    ddlPossession.Items.FindByValue(DT.Rows[0]["possessionDays"].ToString()).Selected = true;
                    ddlRoom.Items.FindByText(DT.Rows[0]["bedrooms"].ToString()).Selected = true;
                    rdbBath.Items.FindByText(DT.Rows[0]["bathrooms"].ToString()).Selected = true;
                    rdbFurnishing.Items.FindByText(DT.Rows[0]["furnished"].ToString()).Selected = true;
                    //ddlTenants.Items.FindByText(DT.Rows[0]["tenants"].ToString()).Selected = true;
                    rdbParking.Items.FindByText(DT.Rows[0]["parking"].ToString()).Selected = true;
                    txtPriceBudget.Text = DT.Rows[0]["rentBudget"].ToString();
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

        protected void btnSave_Click(object sender, System.EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                if (updateEnquiry(Convert.ToInt32(Request.QueryString["ID"])))
                {
                    Response.Redirect("ManageSaleEnquiry.aspx?action=update");
                    return;
                }
                else
                {
                    pnlAlert.Attributes.Add("class", "alert alert-danger");
                    pnlAlert.Visible = true;
                    lblalert.Text = "Record could not be Updated... Please try again !!!";
                    return;
                }
            }
            else
            {
                if (insertEnquiry())
                {
                    ClearForm();
                    Response.Redirect("ManageSaleEnquiry.aspx?action=insert");
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
        }

        private bool insertEnquiry()
        {
            bool functionReturnValue = false;

            BEL_Enquiry objBEL = new BEL_Enquiry();
            WIHO.BHO objBAL = new WIHO.BHO();
            BAL_Enquiry objBALL = new BAL_Enquiry();

            try
            {
                objBEL.clientName = txtClientName.Text;
                objBEL.clientMobile = txtClientMobile.Text;
                objBEL.clientEmail = txtClientEmail.Text;
                objBEL.propertyType = ddlPropertyType.SelectedItem.Text.ToString();
                objBEL.rentOrSale = "Sale";
                objBEL.area = txtArea.Text == "" ? 0 : Convert.ToInt32(txtArea.Text);
                objBEL.location = ddlLocation.SelectedItem.Text.ToString();
                objBEL.source = ddlSource.SelectedItem.Text.ToString();
                objBEL.brokeThrough = Convert.ToInt32(rdbBroker.SelectedItem.Value);
                objBEL.possessionDays = Convert.ToInt32(ddlPossession.SelectedItem.Value);
                objBEL.bedrooms = ddlRoom.SelectedItem.Text.ToString() == "-- Select Rooms --" ? null : ddlRoom.SelectedItem.Text.ToString();
                objBEL.bathrooms = rdbBath.SelectedItem == null ? 0 : Convert.ToInt32(rdbBath.SelectedItem.Value);
                objBEL.furnished = rdbFurnishing.SelectedItem == null ? null : rdbFurnishing.SelectedItem.Text.ToString(); ;
                objBEL.tenants = "";//ddlTenants.SelectedItem.Text.ToString() == "-- Select Tenants --" ? null : ddlTenants.SelectedItem.Text.ToString();
                objBEL.parking = rdbParking.SelectedItem == null ? null : rdbParking.SelectedItem.Text.ToString();
                objBEL.rentBudget = null;
                objBEL.priceBudget = Convert.ToDecimal(txtPriceBudget.Text); ;

                if (objBALL.addEnquiry(objBEL))
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
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "ERROR !!! Please try after some time";
            }
            return functionReturnValue;
        }

        private bool updateEnquiry(int ID)
        {
            bool functionReturnValue = false;

            BEL_Enquiry objBEL = new BEL_Enquiry();
            WIHO.BHO objBAL = new WIHO.BHO();
            BAL_Enquiry objBALL = new BAL_Enquiry();

            try
            {
                objBEL.enquiryID = ID;
                objBEL.clientName = txtClientName.Text;
                objBEL.clientMobile = txtClientMobile.Text;
                objBEL.clientEmail = txtClientEmail.Text;
                objBEL.propertyType = ddlPropertyType.SelectedItem.Text.ToString();
                objBEL.rentOrSale = "Sale"; 
                objBEL.area = Convert.ToInt32(txtArea.Text);
                objBEL.location = ddlLocation.SelectedItem.Text.ToString();
                objBEL.source = ddlSource.SelectedItem.Text.ToString();
                objBEL.brokeThrough = Convert.ToInt32(rdbBroker.SelectedItem.Value);
                objBEL.possessionDays = Convert.ToInt32(ddlPossession.SelectedItem.Value);
                objBEL.bedrooms = ddlRoom.SelectedItem.Text.ToString() == "-- Select Rooms --" ? null : ddlRoom.SelectedItem.Text.ToString();
                objBEL.bathrooms = rdbBath.SelectedItem == null ? 0 : Convert.ToInt32(rdbBath.SelectedItem.Value);
                objBEL.furnished = rdbFurnishing.SelectedItem == null ? null : rdbFurnishing.SelectedItem.Text.ToString(); ;
                objBEL.tenants = "";//ddlTenants.SelectedItem.Text.ToString() == "-- Select Tenants --" ? null : ddlTenants.SelectedItem.Text.ToString();
                objBEL.parking = rdbParking.SelectedItem == null ? null : rdbParking.SelectedItem.Text.ToString();
                objBEL.rentBudget = null;
                objBEL.priceBudget = Convert.ToDecimal(txtPriceBudget.Text); ;

                if (objBALL.updateEnquiry(objBEL))
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
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "ERROR !!! Please try after some time";
            }
            return functionReturnValue;
        }

        protected void btnCancel_Click(object sender, System.EventArgs e)
        {
            ClearForm();            

            if (Request.QueryString["from"] == "enq")
            {
                Response.Redirect("ManageSaleEnquiry.aspx");
            }
            else
            {
                Response.Redirect("ManageSaleEnquiry.aspx");
            }
        }
                
        private void ClearForm()
        {
            txtArea.Text = "";
            txtClientName.Text = "";
            txtClientMobile.Text = "";
            txtClientEmail.Text = "";
            ddlPossession.ClearSelection();
            txtPriceBudget.Text = "";
            ddlLocation.ClearSelection();
            ddlPropertyType.ClearSelection();
            ddlRoom.ClearSelection();
            ddlSource.ClearSelection();
            //ddlTenants.ClearSelection();
            rdbBath.ClearSelection();
            rdbBroker.ClearSelection();
            rdbFurnishing.ClearSelection();
            rdbParking.ClearSelection();
        }
    }
}