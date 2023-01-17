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
    public partial class PropertyDetails : System.Web.UI.Page
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
                if (lblClientStatus.Text == "Owner")
                {
                    Brokrage.Visible = true;
                }
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
                objDAL.QueryName = "proc_RealEstate_Property_fetchPropertyDetails_forApproval";

                objDAL.SetParameters("@PropertyID", "integer", Convert.ToInt32(Request.QueryString["ID"]), 4);

                DS = objDAL.FetchDatainDS();
                if (DS.Tables[0].Rows.Count > 0)
                {
                    lblName.Text = DS.Tables[0].Rows[0]["contactPersonName"].ToString();
                    lblMobile.Text = DS.Tables[0].Rows[0]["contactNumber"].ToString();
                    lblClientStatus.Text = DS.Tables[0].Rows[0]["brokerOrOwner"].ToString();
                    lblbrokethrough.Text = DS.Tables[0].Rows[0]["brokeThrough"].ToString();
                    lblClientAddress.Text = DS.Tables[0].Rows[0]["contactAddress"].ToString() == "" ? "-" : DS.Tables[0].Rows[0]["contactAddress"].ToString();
                    lblDays.Text = Convert.ToInt32(string.Format("{0:0}", (DateTime.Now.AddDays(-1) - Convert.ToDateTime(DS.Tables[0].Rows[0]["postDate"])).TotalDays)) <= 0 ? "" : string.Format("{0:0}", (DateTime.Now.AddDays(-1) - Convert.ToDateTime(DS.Tables[0].Rows[0]["postDate"])).TotalDays) + " days ago";
                    lblPostDate.Text = Convert.ToDateTime(DS.Tables[0].Rows[0]["postDate"]).ToString("dd/MM/yyyy");
                    lblPropertyStatus.Text = DS.Tables[0].Rows[0]["rentOrSale"].ToString();
                    lblPropertyType.Text = DS.Tables[0].Rows[0]["propertyType"].ToString();
                    lblArea.Text = DS.Tables[0].Rows[0]["area"].ToString() == "" ? "-" : DS.Tables[0].Rows[0]["area"].ToString();
                    lblLocation.Text = DS.Tables[0].Rows[0]["location"].ToString();
                    lblPropertyAddress.Text = DS.Tables[0].Rows[0]["flatNo_buildingName"].ToString() + ", " + DS.Tables[0].Rows[0]["address"].ToString();
                    lblPossessionDate.Text = Convert.ToDateTime(DS.Tables[0].Rows[0]["possessionDate"]).ToString("dd/MM/yyyy");
                    lblBed.Text = DS.Tables[0].Rows[0]["bedrooms"].ToString() == "" ? "-" : DS.Tables[0].Rows[0]["bedrooms"].ToString();
                    lblBath.Text = DS.Tables[0].Rows[0]["bathrooms"].ToString() == "" ? "-" : DS.Tables[0].Rows[0]["bathrooms"].ToString();
                    lblFloor.Text = DS.Tables[0].Rows[0]["floor"].ToString();
                    lblFurnishing.Text = DS.Tables[0].Rows[0]["furnished"].ToString();
                    lblTenants.Text = DS.Tables[0].Rows[0]["preferredTenants"].ToString();
                    lblParking.Text = DS.Tables[0].Rows[0]["parking"].ToString();
                    lblAge.Text = DS.Tables[0].Rows[0]["age"].ToString() == "" ? "-" : DS.Tables[0].Rows[0]["age"].ToString() + " Years";
                    lblRent.Text = DS.Tables[0].Rows[0]["rent"].ToString() == "Null" ? "-" : DS.Tables[0].Rows[0]["rent"].ToString(); 
                    lblDeposit.Text = DS.Tables[0].Rows[0]["deposite"].ToString() == "Null" ? "-" : DS.Tables[0].Rows[0]["deposite"].ToString(); 
                    lblMaintenance.Text = DS.Tables[0].Rows[0]["maintenance"].ToString() == "Null" ? "-" : DS.Tables[0].Rows[0]["maintenance"].ToString(); 
                    lblprice.Text = DS.Tables[0].Rows[0]["price"].ToString() == "null" ? "-" : DS.Tables[0].Rows[0]["price"].ToString();
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
            Response.Redirect("ApprovalList.aspx");
        }

        protected void btnApprove_Onclick(object sender, System.EventArgs e)
        {
            if (approveProperty(Convert.ToInt32(Request.QueryString["ID"])))
            {
                Response.Redirect("ApprovalList.aspx?ID=approved");
            }
            else
            {
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "ERROR !!! Please try after some time";
            }
        }

        protected void btnReject_Onclick(object sender, System.EventArgs e)
        {
            deletePropertyPhotos(Convert.ToInt32(Request.QueryString["ID"]));
            if (deleteProperty(Convert.ToInt32(Request.QueryString["ID"])))
            {
                Response.Redirect("ApprovalList.aspx?ID=reject");
            }
            else
            {
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "ERROR !!! Please try after some time";
            }
        }

        public bool approveProperty(int ID)
        {
            bool _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Property_ApproveProperty";

                objDAL.SetParameters("@PropertyID", "integer", ID, 4);

                return objDAL.IUDData();
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

            return _retVal;
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


        public bool deleteProperty(int ID)
        {
            bool _retVal = false;
            WIHO.DHO objDAL = new WIHO.DHO();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "procedure";
                objDAL.QueryName = "proc_RealEstate_Property_delete";

                objDAL.SetParameters("@PropertyID", "integer", ID, 4);

                return objDAL.IUDData();
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

            return _retVal;
        }
    }
}