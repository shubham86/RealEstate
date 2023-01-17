using RealEstate.cpanel.BAL;
using RealEstate.cpanel.BEL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.cpanel
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            VerifyLoginUser(txtUserName.Text.ToString(), txtPassword.Text.ToString());
        }

        //verify login
        private void VerifyLoginUser(string Uname, string Password)
        {
            DataTable dt = new DataTable();

            BEL_Admin objBEL = new BEL_Admin();
            BAL_Admin objBAL = new BAL_Admin();

            objBEL.adminUserName = Uname;
            objBEL.password = Password;
            try
            {
                dt = objBAL.VerifyAdmin(objBEL);
                if (dt.Rows.Count > 0)
                {
                    Session["v_session_str_AdminID"] = dt.Rows[0]["adminID"].ToString();
                    Session["v_session_str_AdminName"] = dt.Rows[0]["adminName"].ToString();
                    Session["v_session_str_AdminRole"] = dt.Rows[0]["role"].ToString();

                    if (dt.Rows[0]["role"].ToString() != "admin")
                    {
                        Response.Redirect("Dashboard2.aspx", false);
                    }
                    else
                    {
                        Response.Redirect("Dashboard.aspx", false);
                    }
                }
                else
                {
                    pnlAlert.Attributes.Add("class", "alert alert-danger");
                    pnlAlert.Visible = true;
                    lblalert.Text = "User Name or Password is Incorrect, Please try again !!!";
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
    }
}