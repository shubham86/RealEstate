using RealEstate.cpanel.BAL;
using RealEstate.cpanel.BEL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.cpanel
{
    public partial class AddRentOutEntry : System.Web.UI.Page
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
                    fetchProperty();
                }
                if (Request.QueryString["EnqID"] != null)
                {
                    btnSkip.Enabled = false;
                    fetchEnquiry();
                }
            }
        }

        public void fetchProperty()
        {

            WIHO.DHO objDAL = new WIHO.DHO();
            DataSet DS = new DataSet();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Properties_fetchInForm";

                objDAL.SetParameters("@propertyID", "integer", Convert.ToInt32(Request.QueryString["ID"]), 4);

                DS = objDAL.FetchDatainDS();
                if (DS.Tables.Count > 0)
                {
                    if (DS.Tables[0].Rows.Count > 0)
                    {                        
                        txtRent.Text = DS.Tables[0].Rows[0]["rent"].ToString();
                        txtDeposit.Text = DS.Tables[0].Rows[0]["deposite"].ToString();                  
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

        public void fetchEnquiry()
        {

            WIHO.DHO objDAL = new WIHO.DHO();
            DataSet DS = new DataSet();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Enquiry_fetchInForm";

                objDAL.SetParameters("@enquiryID", "integer", Convert.ToInt32(Request.QueryString["EnqID"]), 4);

                DS = objDAL.FetchDatainDS();
                if (DS.Tables.Count > 0)
                {
                    if (DS.Tables[0].Rows.Count > 0)
                    {
                        txtClientName.Text = DS.Tables[0].Rows[0]["clientName"].ToString();
                        txtClientMobile.Text = DS.Tables[0].Rows[0]["clientMobile"].ToString();
                        txtClientEmail.Text = DS.Tables[0].Rows[0]["clientEmail"].ToString();
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

        protected void btnSave_Click(object sender, System.EventArgs e)
        {
            if (insertRentOutEntry(Convert.ToInt32(Request.QueryString["ID"])))
            {
                if (Request.QueryString["EnqID"] != null)
                {
                    makeEnquiryInactive(Convert.ToInt32(Request.QueryString["EnqID"]));
                    deletePropertyPhotos(Convert.ToInt32(Request.QueryString["ID"]));
                    Response.Redirect("ManageRentEnquiry.aspx?action=rentOut");
                }                
                else
                {
                    Response.Redirect("ManageRentProperty.aspx?action=rentOut");
                    return;
                }                
            }
            else
            {
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "Record could not be Inserted... Please try again !!!";
                return;
            }
        }

        private bool insertRentOutEntry(int ID)
        {
            bool functionReturnValue = false;

            BEL_PropertyCusrtomer objBEL = new BEL_PropertyCusrtomer();
            WIHO.BHO objBAL = new WIHO.BHO();
            BAL_PropertyCusrtomer objBALL = new BAL_PropertyCusrtomer();

            try
            {
                objBEL.rentPropertyID = ID;
                objBEL.clientName = txtClientName.Text;
                objBEL.clientMobile = txtClientMobile.Text;
                objBEL.clientEmail = txtClientEmail.Text;
                objBEL.dateOfPossession = Convert.ToDateTime(txtPossessionDate.Text);
                objBEL.dateOfAgreementExpiry = Convert.ToDateTime(txtPossessionDate.Text).AddMonths(Convert.ToInt32(txtAgrimentMonth.Value));
                objBEL.rentAmount = Convert.ToDecimal(txtRent.Text);
                objBEL.depositeAmount = Convert.ToDecimal(txtDeposit.Text);
                objBEL.personalBrokerage = Convert.ToDecimal(txtPersonalBrokerage.Text);
                objBEL.collectedBrokerage = Convert.ToDecimal(txtCollectedBrokerage.Text);

                if (objBALL.addRentOutEntry(objBEL))
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

        protected void btnSkip_Click(object sender, System.EventArgs e)
        {
            if (skipEntry(Convert.ToInt32(Request.QueryString["ID"])))
            {
                deletePropertyPhotos(Convert.ToInt32(Request.QueryString["ID"]));
                Response.Redirect("ManageRentProperty.aspx?action=rentOut");
                return;
            }
            else
            {
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "Record could not be Inserted... Please try again !!!";
                return;
            }
        }

        private bool skipEntry(int ID)
        {
            bool functionReturnValue = false;

            BEL_PropertyCusrtomer objBEL = new BEL_PropertyCusrtomer();
            WIHO.BHO objBAL = new WIHO.BHO();
            BAL_PropertyCusrtomer objBALL = new BAL_PropertyCusrtomer();

            try
            {
                objBEL.rentPropertyID = ID;

                if (objBALL.skipRentOutEntry(objBEL))
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

        private void deletePropertyPhotos(int ID)
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Property_fetchPhotos";

                objDAL.SetParameters("@PropertyID", "integer", ID, 4);

                DT = objDAL.FetchDatainDT();

                if (DT.Rows.Count > 0)
                {
                    for (int i = 0; i < DT.Rows.Count; i++)
                    {
                        string path = Server.MapPath("../cpanel/Property_Photos/" + DT.Rows[i]["photoName"].ToString());
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
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

        private void makeEnquiryInactive(int ID)
        {
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Enquiry_makeInactive";

                objDAL.SetParameters("@enquiryID", "integer", ID, 4);

                objDAL.IUDData();                
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

        protected void btnCancel_Click(object sender, System.EventArgs e)
        {
            txtAgrimentMonth.Value = "";
            txtClientEmail.Text = "";
            txtClientMobile.Text = "";
            txtClientName.Text = "";
            txtCollectedBrokerage.Text = "";
            txtDeposit.Text = "";
            txtPersonalBrokerage.Text = "";
            txtPossessionDate.Text = "";
            txtRent.Text = "";

            if (Request.QueryString["EnqID"] != null)
            {
                Response.Redirect("RentPropertiesForEnquiry.aspx?ID=" + Request.QueryString["EnqID"].ToString());
            }
            else
            {
                Response.Redirect("ManageRentProperty.aspx");
            }            
        }
    }
}