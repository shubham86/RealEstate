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
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class PostProperty : System.Web.UI.Page
    {
        protected static string ReCaptcha_Key = ConfigurationManager.AppSettings["Capcha_Kye"].ToString();
        protected static string ReCaptcha_Secret = ConfigurationManager.AppSettings["Capcha_Secret"].ToString();

        [WebMethod]
        public static string VerifyCaptcha(string response)
        {
            string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
            return (new WebClient()).DownloadString(url);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fillddlLocation();

                if (Request.QueryString["action"] == "insert")
                {
                    pnlAlert.Attributes.Add("class", "alert alert-success");
                    pnlAlert.Visible = true;
                    lblalert.Text = "Property Upload successfully !!!";
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
                    //lblAlert.Text = "No Record Found ...";
                }
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
                //lblAlert.Text = "ERROR !!! Please try after some time";
            }
        }

        protected void btnSave_Click(object sender, System.EventArgs e)
        {
            if (insertProperty())
            {
                ClearForm();
                Response.Redirect("PostProperty.aspx?action=insert");
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

        private bool insertProperty()
        {
            bool functionReturnValue = false;

            BEL_Property objBEL = new BEL_Property();
            WIHO.BHO objBAL = new WIHO.BHO();
            BAL_Property objBALL = new BAL_Property();

            try
            {
                objBEL.contactPersonName = txtContactName.Text;
                objBEL.contactNumber = txtContactNo.Text.ToString();
                objBEL.source = ddlSource.SelectedItem.Text == "Broker" ? "Other Agent" : "Owner";
                objBEL.brokeThrough = Convert.ToInt32(ddlBrokethrough.SelectedItem.Value);
                objBEL.contactAddress = txtContactAddress.Text;
                objBEL.brokerOrOwner = ddlSource.SelectedItem.Text;
                objBEL.rentOrSale = ddlStatus.SelectedItem.Value;
                objBEL.propertyType = ddlPropertyType.SelectedItem.Text.ToString();
                objBEL.area = Convert.ToInt32(txtArea.Text);
                objBEL.location = ddlLocation.SelectedItem.Text.ToString();
                objBEL.address = txtAddress.Text;
                objBEL.latitude = lat.Value.ToString() == "" ? null : lat.Value.ToString();
                objBEL.longitude = lng.Value.ToString() == "" ? null : lng.Value.ToString();

                objBEL.possessionDate = Convert.ToDateTime(txtPossessionDate.Text);
                objBEL.bedrooms = ddlRoom.SelectedItem.Text.ToString() == "-- Select Rooms --" ? null : ddlRoom.SelectedItem.Text.ToString();
                objBEL.bathrooms = rdbBath.SelectedItem == null ? "0" : rdbBath.SelectedItem.Value; ;
                objBEL.floor = txtFloor.Value == "" ? null : txtFloor.Value + "/" + txtTotalFloor.Value;
                objBEL.furnished = ddlFurnishing.SelectedItem.Value == "0" ? null : ddlFurnishing.SelectedItem.Text.ToString(); ;
                objBEL.preferredTenants = ddlTenants.SelectedItem.Text.ToString() == "-- Select Tenants --" ? null : ddlTenants.SelectedItem.Text.ToString();
                objBEL.parking = rdbParking.SelectedItem == null ? null : rdbParking.SelectedItem.Text.ToString();
                objBEL.description = txtDescription.Text;
                objBEL.rent = txtRent.Text == "" ? (decimal?)null : Convert.ToDecimal(txtRent.Text);
                objBEL.price = txtPrice.Text == "" ? (decimal?)null : Convert.ToDecimal(txtPrice.Text);
                objBEL.deposite = txtDeposit.Text == "" ? (decimal?)null : Convert.ToDecimal(txtDeposit.Text);
                objBEL.brokerage = txtBrokerage.Text == "" ? (decimal?)null : ddlBrokethrough.SelectedItem.Value == "0" ? Convert.ToDecimal(txtBrokerage.Text) : (Convert.ToDecimal(txtBrokerage.Text) / Convert.ToInt32(ddlBrokethrough.SelectedItem.Value));
                objBEL.flatNo_buildingName = txtFlatNo.Text;
                objBEL.age = ddlAge.SelectedItem.Text == "-- Age of Building --" ? "" : ddlAge.SelectedItem.Text;
                objBEL.maintenance = txtMaintenance.Text == "" ? (decimal?)null : Convert.ToDecimal(txtMaintenance.Text);
                objBEL.negotiation = rdbNegotiation.SelectedItem.Text;

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
                objBEL.path2 = Path.GetFileName(FileUpload2.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile2;

                objBEL.photoName3 = Path.GetFileName(FileUpload3.PostedFile.FileName) == "" ? "empty" : imgfile3;
                objBEL.path3 = Path.GetFileName(FileUpload3.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile3;

                objBEL.photoName4 = Path.GetFileName(FileUpload4.PostedFile.FileName) == "" ? "empty" : imgfile4;
                objBEL.path4 = Path.GetFileName(FileUpload4.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile4;

                objBEL.photoName5 = Path.GetFileName(FileUpload5.PostedFile.FileName) == "" ? "empty" : imgfile5;
                objBEL.path5 = Path.GetFileName(FileUpload5.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile5;

                objBEL.photoName6 = Path.GetFileName(FileUpload6.PostedFile.FileName) == "" ? "empty" : imgfile6;
                objBEL.path6 = Path.GetFileName(FileUpload6.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile6;

                objBEL.photoName7 = Path.GetFileName(FileUpload7.PostedFile.FileName) == "" ? "empty" : imgfile7;
                objBEL.path7 = Path.GetFileName(FileUpload7.PostedFile.FileName) == "" ? "empty" : "../cpanel/Property_Photos/" + imgfile7;

                if (objBALL.addRentPropertyFromFrontEnd(objBEL))
                {
                    if (Path.GetFileName(FileUpload1.PostedFile.FileName) != "")
                    {
                        //FileUpload1.SaveAs(Server.MapPath("cpanel/Property_Photos/") + imgfile1);
                        string targetFile = Server.MapPath("cpanel/Property_Photos/") + imgfile1;
                        Stream strm = FileUpload1.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload2.PostedFile.FileName) != "")
                    {
                        //FileUpload2.SaveAs(Server.MapPath("cpanel/Property_Photos/") + imgfile2);
                        string targetFile = Server.MapPath("cpanel/Property_Photos/") + imgfile2;
                        Stream strm = FileUpload2.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload3.PostedFile.FileName) != "")
                    {
                        //FileUpload3.SaveAs(Server.MapPath("cpanel/Property_Photos/") + imgfile3);
                        string targetFile = Server.MapPath("cpanel/Property_Photos/") + imgfile3;
                        Stream strm = FileUpload3.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload4.PostedFile.FileName) != "")
                    {
                        //FileUpload4.SaveAs(Server.MapPath("cpanel/Property_Photos/") + imgfile4);
                        string targetFile = Server.MapPath("cpanel/Property_Photos/") + imgfile4;
                        Stream strm = FileUpload4.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload5.PostedFile.FileName) != "")
                    {
                        //FileUpload5.SaveAs(Server.MapPath("cpanel/Property_Photos/") + imgfile5);
                        string targetFile = Server.MapPath("cpanel/Property_Photos/") + imgfile5;
                        Stream strm = FileUpload5.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload6.PostedFile.FileName) != "")
                    {
                        //FileUpload6.SaveAs(Server.MapPath("cpanel/Property_Photos/") + imgfile6);
                        string targetFile = Server.MapPath("cpanel/Property_Photos/") + imgfile6;
                        Stream strm = FileUpload6.PostedFile.InputStream;
                        ReduceImageSize(strm, targetFile);
                    }
                    if (Path.GetFileName(FileUpload7.PostedFile.FileName) != "")
                    {
                        //FileUpload7.SaveAs(Server.MapPath("cpanel/Property_Photos/") + imgfile7);
                        string targetFile = Server.MapPath("cpanel/Property_Photos/") + imgfile7;
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

        private void ReduceImageSize(Stream sourcePath, string targetPath)
        {
            using (var image = System.Drawing.Image.FromStream(sourcePath))
            {
                var newWidth = 700;//image.Width * scaleFactor
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

        protected void btnDelete1_Click(object sender, System.EventArgs e)
        {
            lblImg1.Text = "empty";
            lblImg1.ForeColor = System.Drawing.Color.White;
            Image1.ImageUrl = "";
        }
        protected void btnDelete2_Click(object sender, System.EventArgs e)
        {
            lblImg2.Text = "empty";
            lblImg2.ForeColor = System.Drawing.Color.White;
            Image2.ImageUrl = "";
        }
        protected void btnDelete3_Click(object sender, System.EventArgs e)
        {
            lblImg3.Text = "empty";
            lblImg3.ForeColor = System.Drawing.Color.White;
            Image3.ImageUrl = "";
        }
        protected void btnDelete4_Click(object sender, System.EventArgs e)
        {
            lblImg4.Text = "empty";
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
            txtDeposit.Text = "";
            txtDescription.Text = "";
            txtFloor.Value = "";
            txtPossessionDate.Text = "";
            txtRent.Text = "";
            txtMaintenance.Text = "";
            txtPrice.Text = "";
            txtTotalFloor.Value = "";
            ddlLocation.ClearSelection();
            ddlPropertyType.ClearSelection();
            ddlRoom.ClearSelection();
            ddlSource.ClearSelection();
            ddlTenants.ClearSelection();
            rdbBath.ClearSelection();
            ddlBrokethrough.ClearSelection();
            ddlFurnishing.ClearSelection();
            rdbParking.ClearSelection();
            txtCaptcha.Text = "";
        }
    }
}