using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["mail"] != null)
                {
                    if (Request.Cookies["mail"].Value == "send")
                    {
                        pnlAlert.Attributes.Remove("class");
                        pnlAlert.Attributes.Add("class", "alert alert-success");
                        pnlAlert.Attributes.Remove("style");
                        pnlAlert.Attributes.Add("style","width:100%;display:block");
                        pnlAlert.Focus();

                        lblalert.Text = "Thank you for showing interest.";

                        Response.Cookies["mail"].Expires = DateTime.Now.AddDays(-1);
                    }
                }
                fillddlLocation();                
            }
        }

        public void fillddlLocation()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataTable DT = new DataTable();
            ListItem lstItem = new ListItem();

            lstItem = new ListItem();
            lstItem.Text = "-- Location --";
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
            }
            catch (Exception ex)
            {
                string x = ex.ToString();
            }
        }

        protected void btnSendMessage_Click(object sender, System.EventArgs e)
        {            
            addEnquiry(txtName.Value, ddlLocation.SelectedItem.Text, txtMobile.Value, txtType.Value, txtMsg.Value);
            SendMail(txtName.Value, ddlLocation.SelectedItem.Text, txtMobile.Value, txtType.Value,txtMsg.Value);
            //SendAcknowlegment(txtEmail2.Value);
        }

        private void addEnquiry(string name, string location, string mobile, string property, string message)
        {
            WIHO.DHO objDAL = new WIHO.DHO();

            objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
            objDAL.QueryType = "procedure";
            objDAL.QueryName = "proc_RealEstate_Enquiry_Add";

            objDAL.SetParameters("@name", "varchar", name, 100);
            objDAL.SetParameters("@location", "varchar", location, 50);
            objDAL.SetParameters("@mobile", "varchar", mobile, 15);
            objDAL.SetParameters("@rentOrSale", "varchar", ddlSatus.SelectedItem.Text, 5);
            objDAL.SetParameters("@property", "varchar", property, 20);
            objDAL.SetParameters("@message", "varchar", txtMsg.Value, 1000);

            objDAL.IUDData();

            objDAL.Dispose();
        }

        private void SendMail(string name, string location, string mobile,string property ,string message)
        {
            string SMTPServerName = ConfigurationManager.AppSettings["SMTPServerName"].ToString();
            string SMTPUser = ConfigurationManager.AppSettings["SMTPUser"].ToString();
            string SMTPPassword = "Hunthome@2019";//ConfigurationManager.AppSettings["SMTPPassword"].ToString();
            string strMessage = string.Empty;
            try
            {
                strMessage = strMessage + "<table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"2\" cellspacing=\"1\" style=\"FONT-SIZE: 9pt; COLOR: black; DIRECTION: ltr; LINE-HEIGHT: 12pt; FONT-FAMILY: Arial; LETTER-SPACING: normal; TEXT-ALIGN: justify\">";
                strMessage = strMessage + "<tr><td>Name - " + name + ",</td></tr>";
                strMessage = strMessage + "<tr><td height='20'></td></tr>";
                strMessage = strMessage + "<tr><td>Mobile Number - <a href='tel:" + mobile + "'>" + mobile + "</a>,</td></tr>";
                strMessage = strMessage + "<tr><td height='20'></td></tr>";
                strMessage = strMessage + "<tr><td>Location - " + location + ",</td></tr>";
                strMessage = strMessage + "<tr><td height='20'></td></tr>";
                strMessage = strMessage + "<tr><td>Property Type - " + property + ",</td></tr>";
                strMessage = strMessage + "<tr><td height='20'></td></tr>";
                strMessage = strMessage + "<tr><td>Property For - " + ddlSatus.SelectedItem.Text + ",</td></tr>";
                strMessage = strMessage + "<tr><td height='10'></td></tr>";
                strMessage = strMessage + "<tr><td>" + message + "</td></tr>";
                strMessage = strMessage + "<tr><td height='20'></td></tr>";
                strMessage = strMessage + "</table>";
                strMessage = strMessage + "<p><a href='http://hunthome.in/cpanel/AddRentEnquiry.aspx?name=" + name + "&mobile=" + mobile + "&location=" + location + "&status=" + ddlSatus.SelectedItem.Text + "' style='background-color:#4c4cb3;color:#ffffff;padding:5px 10;margin-left:40px;border-radius:5px;text-decoration:none;'>Save Enquiry</a></p>";

                MailMessage mm = new MailMessage();
                mm.IsBodyHtml = true;
                mm.From = new MailAddress(ConfigurationManager.AppSettings["CONST_MAIL_SIGNUP_FROM"].ToString());
                mm.To.Add(new MailAddress(ConfigurationManager.AppSettings["AdminEmail"].ToString()));
                mm.Subject = "Client enquiry at hunthome.in";
                mm.Body = strMessage.ToString();

                SmtpClient mSmtpClient = new SmtpClient();
                mSmtpClient.EnableSsl = true;
                mSmtpClient.Host = SMTPServerName;
                mSmtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["SMTP_Port"]);
                mSmtpClient.UseDefaultCredentials = true;
                mSmtpClient.Credentials = new System.Net.NetworkCredential(SMTPUser, SMTPPassword);
                mSmtpClient.Send(mm);
            }
            catch (Exception ex)
            {
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;

                lblalert.Text = "Send enquiry error - Please try again";
                //lblalert.Text = "Send enquiry Error - " + ex.Message;                

            }
            finally
            {
                txtName.Value = "";
                txtMobile.Value = "";
                txtType.Value = "";
                txtMsg.Value = "";
                ddlLocation.ClearSelection();

                HttpCookie Cookie = new HttpCookie("mail");
                Cookie.Value = "send";
                Cookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(Cookie);

                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}