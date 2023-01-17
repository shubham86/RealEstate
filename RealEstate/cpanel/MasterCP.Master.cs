using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.cpanel
{
    public partial class MasterCP : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["v_session_str_AdminName"] != null)
                {
                    lblName.Text = Session["v_session_str_AdminName"].ToString();
                    lblName2.Text = Session["v_session_str_AdminName"].ToString();
                    lblRole.Text = new CultureInfo("en-US").TextInfo.ToTitleCase(Session["v_session_str_AdminRole"].ToString());
                }
                else
                {
                    Response.Redirect("LoginPage.aspx");
                    return;
                }

                fillNotificationReapeter();
            }
        }

        private void fillNotificationReapeter()
        {
            WIHO.DHO objDAL = new WIHO.DHO();
            DataSet DS = new DataSet();

            try
            {
                objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
                objDAL.QueryType = "Procedure";
                objDAL.QueryName = "proc_RealEstate_Notification_FetchLatest5";

                DS = objDAL.FetchDatainDS();
                if (DS.Tables[0].Rows.Count > 0)
                {
                    rptrPropertyNotification.DataSource = DS.Tables[0];
                    rptrPropertyNotification.DataBind();
                }
                else
                {
                    rptrPropertyNotification.DataSource = null;
                    rptrPropertyNotification.DataBind();
                }

                if (DS.Tables[1].Rows.Count > 0)
                {
                    lblNotificationCount.Text = DS.Tables[1].Rows[0]["PropertyNotificationCount"].ToString();
                    if (DS.Tables[1].Rows[0]["PropertyNotificationCount"].ToString() == "0")
                    {
                        NotificationBatch.Visible = false;
                    }
                }
                else
                {
                    NotificationBatch.Visible = false;
                }
            }
            catch(Exception ex)
            {
                NotificationBatch.Visible = false;
                string x = ex.ToString();
                pnlAlert.Attributes.Add("class", "alert alert-danger");
                pnlAlert.Visible = true;
                lblalert.Text = "Notification ERROR !!! Please try after some time";
            }
            finally
            {
                objDAL.Dispose();
            }
        }
    }
}