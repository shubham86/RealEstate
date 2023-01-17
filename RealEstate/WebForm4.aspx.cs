using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected static string ReCaptcha_Key = "6LeeHI8UAAAAAGM66UPQa20CJqW9xxwk6B3PIvW4";
        protected static string ReCaptcha_Secret = "6LeeHI8UAAAAAE1mQuKgTpMlORZD1fR4bp8eUX9U";

        [WebMethod]
        public static string VerifyCaptcha(string response)
        {
            string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
            return (new WebClient()).DownloadString(url);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MessageBox("submited");
        }

        #region "Message Box"
        private void MessageBox(String msg)
        {
            Label lbl = new Label();
            msg = msg.Replace("'", "");
            msg = msg.Replace(".", "");
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(string), lbl.Text, lbl.Text, false);
        }
        #endregion

    }
}