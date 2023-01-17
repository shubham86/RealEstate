using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate.cpanel
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("v_session_int_AdminID");
            Session.Remove("v_session_str_AdminName");
            Session.Remove("v_session_str_AdminRole");
            if (Request.Cookies["name"] != null)
            {
                Response.Cookies["name"].Expires = DateTime.Now.AddDays(-1);
            }
            if (Request.Cookies["mobile"] != null)
            {
                Response.Cookies["mobile"].Expires = DateTime.Now.AddDays(-1);
            }
            if (Request.Cookies["location"] != null)
            {
                Response.Cookies["location"].Expires = DateTime.Now.AddDays(-1);
            }
            if (Request.Cookies["status"] != null)
            {
                Response.Cookies["status"].Expires = DateTime.Now.AddDays(-1);
            }
            Response.Redirect("LoginPage.aspx", false);
        }
    }
}