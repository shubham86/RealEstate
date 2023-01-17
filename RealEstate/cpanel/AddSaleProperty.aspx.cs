using RealEstate.cpanel.BAL;
using RealEstate.cpanel.BEL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.cpanel
{
    public partial class AddSaleProperty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["v_session_str_AdminID"]) == 0)
            {
                Response.Redirect("Logout.aspx");
            }

            if (!Page.IsPostBack)
            {
                fillddlLocation();
                if (Request.QueryString["ID"] != null)
                {
                    fetchProperty();
                }
                if (Request.QueryString["EnqID"] != null)
                {
                    btnSave.Enabled = false;
                }
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
                        if (DS.Tables[0].Rows[0]["propertyType"].ToString() != "Null")
                        {
                            ddlPropertyType.Items.FindByText(DS.Tables[0].Rows[0]["propertyType"].ToString()).Selected = true;
                        }

                        if (DS.Tables[0].Rows[0]["propertyType"].ToString() == "Plot")
                        {
                            lblAreaUnit.Text = "Guntha";
                        }
                        else
                        {
                            lblAreaUnit.Text = "Sq Ft.";
                        }

                        txtArea.Text = DS.Tables[0].Rows[0]["area"].ToString();

                        if (DS.Tables[0].Rows[0]["location"].ToString() != "Null")
                        {
                            ddlLocation.Items.FindByText(DS.Tables[0].Rows[0]["location"].ToString()).Selected = true;
                        }

                        txtFlatNo.Text = DS.Tables[0].Rows[0]["flatNo_buildingName"].ToString();
                        txtAddress.Text = DS.Tables[0].Rows[0]["address"].ToString();

                        if (DS.Tables[0].Rows[0]["source"].ToString() != "Null")
                        {
                            ddlSource.Items.FindByText(DS.Tables[0].Rows[0]["source"].ToString()).Selected = true;
                        }
                                                
                        txtContactName.Text = DS.Tables[0].Rows[0]["contactPersonName"].ToString();
                        txtContactNo.Text = DS.Tables[0].Rows[0]["contactNumber"].ToString();

                        if (DS.Tables[0].Rows[0]["brokeThrough"].ToString() != "Null")
                        {
                            rdbBroker.Items.FindByValue(DS.Tables[0].Rows[0]["brokeThrough"].ToString()).Selected = true;
                        }
                        
                        txtPossessionDate.Text = Convert.ToDateTime(DS.Tables[0].Rows[0]["possessionDate"]).ToString("dd/MM/yyyy");

                        if (DS.Tables[0].Rows[0]["bedrooms"].ToString() != "Null")
                        {
                            ddlRoom.Items.FindByText(DS.Tables[0].Rows[0]["bedrooms"].ToString()).Selected = true;
                        }

                        if (DS.Tables[0].Rows[0]["bathrooms"].ToString() != "0")
                        {
                            rdbBath.Items.FindByText(DS.Tables[0].Rows[0]["bathrooms"].ToString()).Selected = true;
                        }

                        if (DS.Tables[0].Rows[0]["furnished"].ToString() != "Null")
                        {
                            rdbFurnishing.Items.FindByText(DS.Tables[0].Rows[0]["furnished"].ToString()).Selected = true;
                        }

                        if (DS.Tables[0].Rows[0]["parking"].ToString() != "Null")
                        {
                            rdbParking.Items.FindByText(DS.Tables[0].Rows[0]["parking"].ToString()).Selected = true;
                        }

                        ddlAge.Items.FindByText(DS.Tables[0].Rows[0]["age"].ToString() == "" ? "-- Age of Building --" : DS.Tables[0].Rows[0]["age"].ToString()).Selected = true;
                        txtDescription.Text = DS.Tables[0].Rows[0]["description"].ToString();
                        txtPrice.Text = DS.Tables[0].Rows[0]["price"].ToString() == "Null" ? "0.00" : DS.Tables[0].Rows[0]["price"].ToString() == "" ? "0.00" : DS.Tables[0].Rows[0]["price"].ToString();
                        txtBrokerage.Text = DS.Tables[0].Rows[0]["brokerage"].ToString() == "Null" ? "0.00" : DS.Tables[0].Rows[0]["brokerage"].ToString() == "" ? "0.00" : DS.Tables[0].Rows[0]["brokerage"].ToString();
                        rdbNegotiation.Items.FindByText(DS.Tables[0].Rows[0]["negotiation"].ToString()).Selected = true;
                        lat.Value = DS.Tables[0].Rows[0]["latitude"].ToString();
                        lng.Value = DS.Tables[0].Rows[0]["longitude"].ToString();
                        ddlShowContact.Items.FindByValue(DS.Tables[0].Rows[0]["contactToAdmin"].ToString()).Selected = true;

                        string[] floor = DS.Tables[0].Rows[0]["floor"].ToString().Split(new char[] { '/' });

                        for (int i = 0; i < floor.Length; i++)
                        {
                            if (i == 0)
                            {
                                txtFloor.Value = floor[0] == null ? "" : floor[0];
                            }
                            if (i == 1)
                            {
                                txtTotalFloor.Value = floor[1] == null ? "" : floor[1];
                            }
                        }
                    }
                    if (DS.Tables[1].Rows.Count > 0)
                    {
                        if (DS.Tables[1].Rows.Count == 1)
                        {
                            lblImg1.ForeColor = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            lblOldName1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            Image1.ImageUrl = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[0]["path"].ToString();
                            lblPhotoID1.Text = DS.Tables[1].Rows[0]["photoID"].ToString();
                        }

                        else if (DS.Tables[1].Rows.Count == 2)
                        {
                            lblImg1.ForeColor = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            lblOldName1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            Image1.ImageUrl = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[0]["path"].ToString();
                            lblPhotoID1.Text = DS.Tables[1].Rows[0]["photoID"].ToString();

                            lblImg2.ForeColor = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            lblOldName2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            Image2.ImageUrl = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[1]["path"].ToString();
                            lblPhotoID2.Text = DS.Tables[1].Rows[1]["photoID"].ToString();
                        }

                        else if (DS.Tables[1].Rows.Count == 3)
                        {
                            lblImg1.ForeColor = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            lblOldName1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            Image1.ImageUrl = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[0]["path"].ToString();
                            lblPhotoID1.Text = DS.Tables[1].Rows[0]["photoID"].ToString();

                            lblImg2.ForeColor = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            lblOldName2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            Image2.ImageUrl = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[1]["path"].ToString();
                            lblPhotoID2.Text = DS.Tables[1].Rows[1]["photoID"].ToString();

                            lblImg3.ForeColor = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            lblOldName3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            Image3.ImageUrl = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[2]["path"].ToString();
                            lblPhotoID3.Text = DS.Tables[1].Rows[2]["photoID"].ToString();
                        }

                        else if (DS.Tables[1].Rows.Count == 4)
                        {
                            lblImg1.ForeColor = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            lblOldName1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            Image1.ImageUrl = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[0]["path"].ToString();
                            lblPhotoID1.Text = DS.Tables[1].Rows[0]["photoID"].ToString();

                            lblImg2.ForeColor = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            lblOldName2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            Image2.ImageUrl = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[1]["path"].ToString();
                            lblPhotoID2.Text = DS.Tables[1].Rows[1]["photoID"].ToString();

                            lblImg3.ForeColor = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            lblOldName3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            Image3.ImageUrl = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[2]["path"].ToString();
                            lblPhotoID3.Text = DS.Tables[1].Rows[2]["photoID"].ToString();

                            lblImg4.ForeColor = DS.Tables[1].Rows[3]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg4.Text = DS.Tables[1].Rows[3]["photoName"].ToString();
                            lblOldName4.Text = DS.Tables[1].Rows[3]["photoName"].ToString();
                            Image4.ImageUrl = DS.Tables[1].Rows[3]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID4.Text = DS.Tables[1].Rows[3]["photoID"].ToString();
                        }

                        if (DS.Tables[1].Rows.Count == 5)
                        {
                            lblImg1.ForeColor = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            lblOldName1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            Image1.ImageUrl = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[0]["path"].ToString();
                            lblPhotoID1.Text = DS.Tables[1].Rows[0]["photoID"].ToString();

                            lblImg2.ForeColor = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            lblOldName2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            Image2.ImageUrl = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[1]["path"].ToString();
                            lblPhotoID2.Text = DS.Tables[1].Rows[1]["photoID"].ToString();

                            lblImg3.ForeColor = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            lblOldName3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            Image3.ImageUrl = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[2]["path"].ToString();
                            lblPhotoID3.Text = DS.Tables[1].Rows[2]["photoID"].ToString();

                            lblImg4.ForeColor = DS.Tables[1].Rows[3]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg4.Text = DS.Tables[1].Rows[3]["photoName"].ToString();
                            lblOldName4.Text = DS.Tables[1].Rows[3]["photoName"].ToString();
                            Image4.ImageUrl = DS.Tables[1].Rows[3]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID4.Text = DS.Tables[1].Rows[3]["photoID"].ToString();

                            lblImg5.ForeColor = DS.Tables[1].Rows[4]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg5.Text = DS.Tables[1].Rows[4]["photoName"].ToString();
                            lblOldName5.Text = DS.Tables[1].Rows[4]["photoName"].ToString();
                            Image5.ImageUrl = DS.Tables[1].Rows[4]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID5.Text = DS.Tables[1].Rows[4]["photoID"].ToString();
                        }

                        if (DS.Tables[1].Rows.Count == 6)
                        {
                            lblImg1.ForeColor = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            lblOldName1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            Image1.ImageUrl = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[0]["path"].ToString();
                            lblPhotoID1.Text = DS.Tables[1].Rows[0]["photoID"].ToString();

                            lblImg2.ForeColor = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            lblOldName2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            Image2.ImageUrl = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[1]["path"].ToString();
                            lblPhotoID2.Text = DS.Tables[1].Rows[1]["photoID"].ToString();

                            lblImg3.ForeColor = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            lblOldName3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            Image3.ImageUrl = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[2]["path"].ToString();
                            lblPhotoID3.Text = DS.Tables[1].Rows[2]["photoID"].ToString();

                            lblImg4.ForeColor = DS.Tables[1].Rows[3]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg4.Text = DS.Tables[1].Rows[3]["photoName"].ToString();
                            lblOldName4.Text = DS.Tables[1].Rows[3]["photoName"].ToString();
                            Image4.ImageUrl = DS.Tables[1].Rows[3]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID4.Text = DS.Tables[1].Rows[3]["photoID"].ToString();

                            lblImg5.ForeColor = DS.Tables[1].Rows[4]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg5.Text = DS.Tables[1].Rows[4]["photoName"].ToString();
                            lblOldName5.Text = DS.Tables[1].Rows[4]["photoName"].ToString();
                            Image5.ImageUrl = DS.Tables[1].Rows[4]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID5.Text = DS.Tables[1].Rows[4]["photoID"].ToString();

                            lblImg6.ForeColor = DS.Tables[1].Rows[5]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg6.Text = DS.Tables[1].Rows[5]["photoName"].ToString();
                            lblOldName6.Text = DS.Tables[1].Rows[5]["photoName"].ToString();
                            Image6.ImageUrl = DS.Tables[1].Rows[5]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID6.Text = DS.Tables[1].Rows[5]["photoID"].ToString();
                        }


                        if (DS.Tables[1].Rows.Count == 7)
                        {
                            lblImg1.ForeColor = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            lblOldName1.Text = DS.Tables[1].Rows[0]["photoName"].ToString();
                            Image1.ImageUrl = DS.Tables[1].Rows[0]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[0]["path"].ToString();
                            lblPhotoID1.Text = DS.Tables[1].Rows[0]["photoID"].ToString();

                            lblImg2.ForeColor = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            lblOldName2.Text = DS.Tables[1].Rows[1]["photoName"].ToString();
                            Image2.ImageUrl = DS.Tables[1].Rows[1]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[1]["path"].ToString();
                            lblPhotoID2.Text = DS.Tables[1].Rows[1]["photoID"].ToString();

                            lblImg3.ForeColor = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            lblOldName3.Text = DS.Tables[1].Rows[2]["photoName"].ToString();
                            Image3.ImageUrl = DS.Tables[1].Rows[2]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[2]["path"].ToString();
                            lblPhotoID3.Text = DS.Tables[1].Rows[2]["photoID"].ToString();

                            lblImg4.ForeColor = DS.Tables[1].Rows[3]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg4.Text = DS.Tables[1].Rows[3]["photoName"].ToString();
                            lblOldName4.Text = DS.Tables[1].Rows[3]["photoName"].ToString();
                            Image4.ImageUrl = DS.Tables[1].Rows[3]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID4.Text = DS.Tables[1].Rows[3]["photoID"].ToString();

                            lblImg5.ForeColor = DS.Tables[1].Rows[4]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg5.Text = DS.Tables[1].Rows[4]["photoName"].ToString();
                            lblOldName5.Text = DS.Tables[1].Rows[4]["photoName"].ToString();
                            Image5.ImageUrl = DS.Tables[1].Rows[4]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID5.Text = DS.Tables[1].Rows[4]["photoID"].ToString();

                            lblImg6.ForeColor = DS.Tables[1].Rows[5]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg6.Text = DS.Tables[1].Rows[5]["photoName"].ToString();
                            lblOldName6.Text = DS.Tables[1].Rows[5]["photoName"].ToString();
                            Image6.ImageUrl = DS.Tables[1].Rows[5]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID6.Text = DS.Tables[1].Rows[5]["photoID"].ToString();

                            lblImg7.ForeColor = DS.Tables[1].Rows[6]["photoName"].ToString() == "empty" ? System.Drawing.Color.White : System.Drawing.Color.Black;
                            lblImg7.Text = DS.Tables[1].Rows[6]["photoName"].ToString();
                            lblOldName7.Text = DS.Tables[1].Rows[6]["photoName"].ToString();
                            Image7.ImageUrl = DS.Tables[1].Rows[6]["photoName"].ToString() == "empty" ? "" : DS.Tables[1].Rows[3]["path"].ToString();
                            lblPhotoID7.Text = DS.Tables[1].Rows[6]["photoID"].ToString();
                        }
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
            if (Request.QueryString["ID"] != null)
            {
                if (updateProperty(Convert.ToInt32(Request.QueryString["ID"])))
                {
                    Response.Redirect("ManageSaleProperty.aspx?action=update");
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
                if (insertProperty())
                {
                    ClearForm();
                    Response.Redirect("ManageSaleProperty.aspx?action=insert");
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

        private bool insertProperty()
        {
            bool functionReturnValue = false;

            BEL_Property objBEL = new BEL_Property();
            WIHO.BHO objBAL = new WIHO.BHO();
            BAL_Property objBALL = new BAL_Property();

            try
            {
                objBEL.propertyType = ddlPropertyType.SelectedItem.Text.ToString();
                objBEL.rentOrSale = "Sale";//ddlRentOrSale.SelectedItem.Text.ToString(); 
                objBEL.area = Convert.ToInt32(txtArea.Text);
                objBEL.location = ddlLocation.SelectedItem.Text.ToString();
                objBEL.address = txtAddress.Text;
                objBEL.latitude = lat.Value.ToString() == "" ? null : lat.Value.ToString();
                objBEL.longitude = lng.Value.ToString() == "" ? null : lng.Value.ToString();
                objBEL.source = ddlSource.SelectedItem.Text.ToString();
                objBEL.contactPersonName = txtContactName.Text;
                objBEL.contactNumber = txtContactNo.Text.ToString();
                objBEL.brokeThrough = Convert.ToInt32(rdbBroker.SelectedItem.Value);
                objBEL.possessionDate = Convert.ToDateTime(txtPossessionDate.Text);
                objBEL.bedrooms = ddlRoom.SelectedItem.Text.ToString() == "-- Select Rooms --" ? null : ddlRoom.SelectedItem.Text.ToString();
                objBEL.bathrooms = rdbBath.SelectedItem == null ? "0" : rdbBath.SelectedItem.Value;
                objBEL.floor = txtFloor.Value == "" ? null : txtFloor.Value + "/" + txtTotalFloor.Value;
                objBEL.furnished = rdbFurnishing.SelectedItem == null ? null : rdbFurnishing.SelectedItem.Text.ToString(); ;
                objBEL.parking = rdbParking.SelectedItem == null ? null : rdbParking.SelectedItem.Text.ToString();
                objBEL.description = txtDescription.Text;
                objBEL.price = Convert.ToDecimal(txtPrice.Text);
                objBEL.brokerage = Convert.ToDecimal(txtBrokerage.Text);
                objBEL.flatNo_buildingName = txtFlatNo.Text;
                objBEL.age = ddlAge.SelectedItem.Text == "-- Age of Building --" ? "" : ddlAge.SelectedItem.Text;
                objBEL.negotiation = rdbNegotiation.SelectedItem.Text;
                objBEL.contactToAdmin = ddlShowContact.SelectedItem.Value;

                string imgfile1 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_1" + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);//Path.GetFileName(FileUpload1.PostedFile.FileName);
                string imgfile2 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_2" + System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName);//Path.GetFileName(FileUpload2.PostedFile.FileName);
                string imgfile3 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_3" + System.IO.Path.GetExtension(FileUpload3.PostedFile.FileName);//Path.GetFileName(FileUpload3.PostedFile.FileName);
                string imgfile4 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_4" + System.IO.Path.GetExtension(FileUpload4.PostedFile.FileName);//Path.GetFileName(FileUpload4.PostedFile.FileName);
                string imgfile5 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_5" + System.IO.Path.GetExtension(FileUpload5.PostedFile.FileName);//Path.GetFileName(FileUpload5.PostedFile.FileName);
                string imgfile6 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_6" + System.IO.Path.GetExtension(FileUpload6.PostedFile.FileName);//Path.GetFileName(FileUpload6.PostedFile.FileName);
                string imgfile7 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_7" + System.IO.Path.GetExtension(FileUpload7.PostedFile.FileName);//Path.GetFileName(FileUpload7.PostedFile.FileName);

                objBEL.photoName1 = Path.GetFileName(FileUpload1.PostedFile.FileName) == "" ? "empty" : imgfile1;
                objBEL.path1 = Path.GetFileName(FileUpload1.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile1;

                objBEL.photoName2 = Path.GetFileName(FileUpload2.PostedFile.FileName) == "" ? "empty" : imgfile2;
                objBEL.path2 = Path.GetFileName(FileUpload1.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile2;

                objBEL.photoName3 = Path.GetFileName(FileUpload3.PostedFile.FileName) == "" ? "empty" : imgfile3;
                objBEL.path3 = Path.GetFileName(FileUpload1.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile3;

                objBEL.photoName4 = Path.GetFileName(FileUpload4.PostedFile.FileName) == "" ? "empty" : imgfile4;
                objBEL.path4 = Path.GetFileName(FileUpload1.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile4;

                objBEL.photoName5 = Path.GetFileName(FileUpload5.PostedFile.FileName) == "" ? "empty" : imgfile5;
                objBEL.path5 = Path.GetFileName(FileUpload5.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile5;

                objBEL.photoName6 = Path.GetFileName(FileUpload6.PostedFile.FileName) == "" ? "empty" : imgfile6;
                objBEL.path6 = Path.GetFileName(FileUpload6.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile6;

                objBEL.photoName7 = Path.GetFileName(FileUpload7.PostedFile.FileName) == "" ? "empty" : imgfile7;
                objBEL.path7 = Path.GetFileName(FileUpload7.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile7;                
                
                if (objBALL.addSaleProperty(objBEL))
                {
                    if (Path.GetFileName(FileUpload1.PostedFile.FileName) != "")
                    {
                        //FileUpload1.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile1);
                        string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile1;
                        Stream strm = FileUpload1.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);

                    }
                    if (Path.GetFileName(FileUpload2.PostedFile.FileName) != "")
                    {
                        //FileUpload2.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile2);
                        string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile2;
                        Stream strm = FileUpload2.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload3.PostedFile.FileName) != "")
                    {
                        //FileUpload3.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile3);
                        string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile3;
                        Stream strm = FileUpload3.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload4.PostedFile.FileName) != "")
                    {
                        //FileUpload4.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile4);
                        string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile4;
                        Stream strm = FileUpload4.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload5.PostedFile.FileName) != "")
                    {
                        //FileUpload5.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile5);
                        string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile5;
                        Stream strm = FileUpload5.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload6.PostedFile.FileName) != "")
                    {
                        //FileUpload6.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile6);
                        string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile6;
                        Stream strm = FileUpload6.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload7.PostedFile.FileName) != "")
                    {
                        //FileUpload7.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile7);
                        string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile7;
                        Stream strm = FileUpload7.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }

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

        private bool updateProperty(int ID)
        {
            bool functionReturnValue = false;

            BEL_Property objBEL = new BEL_Property();
            WIHO.BHO objBAL = new WIHO.BHO();
            BAL_Property objBALL = new BAL_Property();

            try
            {
                objBEL.propertyID = ID;
                objBEL.propertyType = ddlPropertyType.SelectedItem.Text.ToString();
                objBEL.rentOrSale = "Sale";//ddlRentOrSale.SelectedItem.Text.ToString(); 
                objBEL.area = Convert.ToInt32(txtArea.Text);
                objBEL.location = ddlLocation.SelectedItem.Text.ToString();
                objBEL.address = txtAddress.Text;
                objBEL.latitude = lat.Value.ToString() == "" ? null : lat.Value.ToString();
                objBEL.longitude = lng.Value.ToString() == "" ? null : lng.Value.ToString();
                objBEL.source = ddlSource.SelectedItem.Text.ToString();
                objBEL.contactPersonName = txtContactName.Text;
                objBEL.contactNumber = txtContactNo.Text.ToString();
                objBEL.brokeThrough = Convert.ToInt32(rdbBroker.SelectedItem.Value);
                objBEL.possessionDate = Convert.ToDateTime(txtPossessionDate.Text);
                objBEL.bedrooms = ddlRoom.SelectedItem.Text.ToString() == "-- Select Rooms --" ? null : ddlRoom.SelectedItem.Text.ToString();
                objBEL.bathrooms = rdbBath.SelectedItem == null ? "0" : rdbBath.SelectedItem.Value; 
                objBEL.floor = txtFloor.Value == "" ? null : txtFloor.Value + "/" + txtTotalFloor.Value;
                objBEL.furnished = rdbFurnishing.SelectedItem == null ? null : rdbFurnishing.SelectedItem.Text.ToString(); ;
                objBEL.parking = rdbParking.SelectedItem == null ? null : rdbParking.SelectedItem.Text.ToString();
                objBEL.description = txtDescription.Text;
                objBEL.price = Convert.ToDecimal(txtPrice.Text);
                objBEL.brokerage = Convert.ToDecimal(txtBrokerage.Text);
                objBEL.flatNo_buildingName = txtFlatNo.Text;
                objBEL.age = ddlAge.SelectedItem.Text == "-- Age of Building --" ? "" : ddlAge.SelectedItem.Text;
                objBEL.negotiation = rdbNegotiation.SelectedItem.Text;
                objBEL.contactToAdmin = ddlShowContact.SelectedItem.Value;

                string imgfile1 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_1" + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);//Path.GetFileName(FileUpload1.PostedFile.FileName);
                string imgfile2 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_2" + System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName);//Path.GetFileName(FileUpload2.PostedFile.FileName);
                string imgfile3 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_3" + System.IO.Path.GetExtension(FileUpload3.PostedFile.FileName);//Path.GetFileName(FileUpload3.PostedFile.FileName);
                string imgfile4 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_4" + System.IO.Path.GetExtension(FileUpload4.PostedFile.FileName);//Path.GetFileName(FileUpload3.PostedFile.FileName);
                string imgfile5 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_5" + System.IO.Path.GetExtension(FileUpload5.PostedFile.FileName);//Path.GetFileName(FileUpload5.PostedFile.FileName);
                string imgfile6 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_6" + System.IO.Path.GetExtension(FileUpload6.PostedFile.FileName);//Path.GetFileName(FileUpload6.PostedFile.FileName);
                string imgfile7 = DateTime.Now.ToString("yyyy-MM-dd-hh.mm.ss.ff") + "_7" + System.IO.Path.GetExtension(FileUpload7.PostedFile.FileName);//Path.GetFileName(FileUpload7.PostedFile.FileName);

                if (Path.GetFileName(FileUpload1.PostedFile.FileName) != "")
                {
                    //delete recent photo
                    string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName1.Text);
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    //----------------

                    //FileUpload1.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile1);
                    string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile1;
                    Stream strm = FileUpload1.PostedFile.InputStream;
                    ReduceImageSize(strm, targetFile);

                    objBEL.photoName1 = imgfile1;
                    objBEL.path1 = "../cpanel/Property_Photos/" + imgfile1;
                    objBEL.photoID1 = Convert.ToInt32(lblPhotoID1.Text == "" ? "0" : lblPhotoID1.Text);
                }
                else
                {
                    //remove photo
                    if (lblImg1.Text == "empty")
                    {
                        string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName1.Text);
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    //----------------

                    objBEL.photoName1 = lblImg1.Text;
                    objBEL.path1 = lblImg1.Text == "empty" ? "empty" : "../cpanel/Property_Photos/" + lblImg1.Text;
                    objBEL.photoID1 = Convert.ToInt32(lblPhotoID1.Text == "" ? "0" : lblPhotoID1.Text);
                }

                if (Path.GetFileName(FileUpload2.PostedFile.FileName) != "")
                {
                    //delete recent photo
                    string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName2.Text);
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    //----------------

                    //FileUpload2.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile2);
                    string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile2;
                    Stream strm = FileUpload2.PostedFile.InputStream;
                    ReduceImageSize(strm, targetFile);

                    objBEL.photoName2 = imgfile2;
                    objBEL.path2 = "../cpanel/Property_Photos/" + imgfile2;
                    objBEL.photoID2 = Convert.ToInt32(lblPhotoID2.Text == "" ? "0" : lblPhotoID2.Text);
                }
                else
                {
                    //remove photo
                    if (lblImg2.Text == "empty")
                    {
                        string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName2.Text);
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    //----------------

                    objBEL.photoName2 = lblImg2.Text;
                    objBEL.path2 = lblImg2.Text == "empty" ? "empty" : "../cpanel/Property_Photos/" + lblImg2.Text;
                    objBEL.photoID2 = Convert.ToInt32(lblPhotoID2.Text == "" ? "0" : lblPhotoID2.Text);
                }

                if (Path.GetFileName(FileUpload3.PostedFile.FileName) != "")
                {
                    //delete recent photo
                    string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName3.Text);
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    //----------------

                    //FileUpload3.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile3);
                    string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile3;
                    Stream strm = FileUpload3.PostedFile.InputStream;
                    ReduceImageSize(strm, targetFile);

                    objBEL.photoName3 = imgfile3;
                    objBEL.path3 = "../cpanel/Property_Photos/" + imgfile3;
                    objBEL.photoID3 = Convert.ToInt32(lblPhotoID3.Text == "" ? "0" : lblPhotoID3.Text);
                }
                else
                {
                    //remove photo
                    if (lblImg3.Text == "empty")
                    {
                        string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName3.Text);
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    //----------------

                    objBEL.photoName3 = lblImg3.Text;
                    objBEL.path3 = lblImg3.Text == "empty" ? "empty" : "../cpanel/Property_Photos/" + lblImg3.Text;
                    objBEL.photoID3 = Convert.ToInt32(lblPhotoID3.Text == "" ? "0" : lblPhotoID3.Text);
                }

                if (Path.GetFileName(FileUpload4.PostedFile.FileName) != "")
                {
                    //delete recent photo
                    string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName4.Text);
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    //----------------

                    //FileUpload4.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile4);
                    string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile4;
                    Stream strm = FileUpload4.PostedFile.InputStream;
                    ReduceImageSize(strm, targetFile);

                    objBEL.photoName4 = imgfile4;
                    objBEL.path4 = "../cpanel/Property_Photos/" + imgfile4;
                    objBEL.photoID4 = Convert.ToInt32(lblPhotoID4.Text == "" ? "0" : lblPhotoID4.Text);
                }
                else
                {
                    //remove photo
                    if (lblImg4.Text == "empty")
                    {
                        string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName4.Text);
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    //----------------

                    objBEL.photoName4 = lblImg4.Text;
                    objBEL.path4 = lblImg4.Text == "empty" ? "empty" : "../cpanel/Property_Photos/" + lblImg4.Text;
                    objBEL.photoID4 = Convert.ToInt32(lblPhotoID4.Text == "" ? "0" : lblPhotoID4.Text);
                }

                if (Path.GetFileName(FileUpload5.PostedFile.FileName) != "")
                {
                    //delete recent photo
                    string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName5.Text);
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    //----------------

                    //FileUpload5.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile5);
                    string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile5;
                    Stream strm = FileUpload5.PostedFile.InputStream;
                    ReduceImageSize(strm, targetFile);

                    objBEL.photoName5 = imgfile5;
                    objBEL.path5 = "../cpanel/Property_Photos/" + imgfile5;
                    objBEL.photoID5 = Convert.ToInt32(lblPhotoID5.Text == "" ? "0" : lblPhotoID5.Text);
                }
                else
                {
                    //remove photo
                    if (lblImg5.Text == "empty")
                    {
                        string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName5.Text);
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    //----------------

                    objBEL.photoName5 = lblImg5.Text;
                    objBEL.path5 = lblImg5.Text == "empty" ? "empty" : "../cpanel/Property_Photos/" + lblImg5.Text;
                    objBEL.photoID5 = Convert.ToInt32(lblPhotoID5.Text == "" ? "0" : lblPhotoID5.Text);
                }

                if (Path.GetFileName(FileUpload6.PostedFile.FileName) != "")
                {
                    //delete recent photo
                    string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName6.Text);
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    //----------------

                    //FileUpload6.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile6);
                    string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile6;
                    Stream strm = FileUpload6.PostedFile.InputStream;
                    ReduceImageSize(strm, targetFile);

                    objBEL.photoName6 = imgfile6;
                    objBEL.path6 = "../cpanel/Property_Photos/" + imgfile6;
                    objBEL.photoID6 = Convert.ToInt32(lblPhotoID6.Text == "" ? "0" : lblPhotoID6.Text);
                }
                else
                {
                    //remove photo
                    if (lblImg6.Text == "empty")
                    {
                        string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName6.Text);
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    //----------------

                    objBEL.photoName6 = lblImg6.Text;
                    objBEL.path6 = lblImg6.Text == "empty" ? "empty" : "../cpanel/Property_Photos/" + lblImg6.Text;
                    objBEL.photoID6 = Convert.ToInt32(lblPhotoID6.Text == "" ? "0" : lblPhotoID6.Text);
                }

                if (Path.GetFileName(FileUpload7.PostedFile.FileName) != "")
                {
                    //delete recent photo
                    string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName7.Text);
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    //----------------

                    //FileUpload7.SaveAs(Server.MapPath("../cpanel/Property_Photos/") + imgfile7);
                    string targetFile = Server.MapPath("../cpanel/Property_Photos/") + imgfile7;
                    Stream strm = FileUpload7.PostedFile.InputStream;
                    ReduceImageSize(strm, targetFile);

                    objBEL.photoName7 = imgfile7;
                    objBEL.path7 = "../cpanel/Property_Photos/" + imgfile7;
                    objBEL.photoID7 = Convert.ToInt32(lblPhotoID7.Text == "" ? "0" : lblPhotoID7.Text);
                }
                else
                {
                    //remove photo
                    if (lblImg7.Text == "empty")
                    {
                        string path = Server.MapPath("../cpanel/Property_Photos/" + lblOldName7.Text);
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    //----------------

                    objBEL.photoName7 = lblImg7.Text;
                    objBEL.path7 = lblImg7.Text == "empty" ? "empty" : "../cpanel/Property_Photos/" + lblImg7.Text;
                    objBEL.photoID7 = Convert.ToInt32(lblPhotoID7.Text == "" ? "0" : lblPhotoID7.Text);
                }

                if (objBALL.updateSaleProperty(objBEL))
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

        private void ReduceImageSize(Stream sourcePath, string targetPath)
        {
            using (var image = System.Drawing.Image.FromStream(sourcePath))
            {
                var newWidth = 750;//image.Width * scaleFactor
                var newHeight = 500;//image.Height * scaleFactor
                var thumbnailImg = new Bitmap(newWidth, newHeight);
                var thumbGraph = Graphics.FromImage(thumbnailImg);
                thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
                thumbGraph.DrawImage(image, imageRectangle);
                thumbnailImg.Save(targetPath, image.RawFormat);
            }
        }

        protected void btnCancel_Click(object sender, System.EventArgs e)
        {
            ClearForm();
            if (Request.QueryString["EnqID"] != null)
            {
                Response.Redirect("SalePropertiesForEnquiry.aspx?ID=" + Request.QueryString["EnqID"].ToString());
            }
            else
            {
                Response.Redirect("ManageSaleProperty.aspx");
            }            
        }

        protected void btnDelete1_Click(object sender, System.EventArgs e)
        {
            lblImg1.Text = "empty.jpg";
            lblImg1.ForeColor = System.Drawing.Color.White;
            Image1.ImageUrl = "";
        }
        protected void btnDelete2_Click(object sender, System.EventArgs e)
        {
            lblImg2.Text = "empty.jpg";
            lblImg2.ForeColor = System.Drawing.Color.White;
            Image2.ImageUrl = "";
        }
        protected void btnDelete3_Click(object sender, System.EventArgs e)
        {
            lblImg3.Text = "empty.jpg";
            lblImg3.ForeColor = System.Drawing.Color.White;
            Image3.ImageUrl = "";
        }
        protected void btnDelete4_Click(object sender, System.EventArgs e)
        {
            lblImg4.Text = "empty.jpg";
            lblImg4.ForeColor = System.Drawing.Color.White;
            Image4.ImageUrl = "";
        }
        protected void btnDelete5_Click(object sender, System.EventArgs e)
        {
            lblImg5.Text = "empty";
            lblImg5.ForeColor = System.Drawing.Color.White;
            Image5.ImageUrl = "";
        }
        protected void btnDelete6_Click(object sender, System.EventArgs e)
        {
            lblImg6.Text = "empty";
            lblImg6.ForeColor = System.Drawing.Color.White;
            Image6.ImageUrl = "";
        }
        protected void btnDelete7_Click(object sender, System.EventArgs e)
        {
            lblImg7.Text = "empty";
            lblImg7.ForeColor = System.Drawing.Color.White;
            Image7.ImageUrl = "";
        }

        private void ClearForm()
        {
            txtAddress.Text = "";
            txtArea.Text = "";
            txtBrokerage.Text = "";
            txtContactName.Text = "";
            txtContactNo.Text = "";
            txtDescription.Text = "";
            txtFloor.Value = "";
            txtPossessionDate.Text = "";
            txtPrice.Text = "";
            txtTotalFloor.Value = "";
            ddlLocation.ClearSelection();
            ddlPropertyType.ClearSelection();
            ddlRoom.ClearSelection();
            ddlSource.ClearSelection();
            rdbBath.ClearSelection();
            rdbBroker.ClearSelection();
            rdbFurnishing.ClearSelection();
            rdbParking.ClearSelection();
        }
    }
}