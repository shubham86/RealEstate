using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        //public void fillddlLocation()
        //{
        //    WIHO.DHO objDAL = new WIHO.DHO();
        //    DataTable DT = new DataTable();
        //    ListItem lstItem = new ListItem();

        //    lstItem = new ListItem();
        //    lstItem.Text = "--Select Location";
        //    lstItem.Value = "0";
        //    ddlLocation.Items.Add(lstItem);

        //    try
        //    {
        //        objDAL.SQLConnectionString = ConfigurationManager.ConnectionStrings["CONST_RealEstate_DBCONN"].ToString();
        //        objDAL.QueryType = "procedure";
        //        objDAL.QueryName = "proc_RealEstate_Location_fetchAllinDdl";

        //        DT = objDAL.FetchDatainDT();
        //        if (DT.Rows.Count > 0)
        //        {
        //            for (int i = 0; i < DT.Rows.Count; i++)
        //            {
        //                lstItem = new ListItem();
        //                lstItem.Text = DT.Rows[i]["location"].ToString();
        //                lstItem.Value = DT.Rows[i]["locationID"].ToString();
        //                ddlLocation.Items.Add(lstItem);
        //            }
        //        }
        //        else
        //        {
        //            //lblAlert.Text = "No Record Found ...";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        string x = ex.ToString();
        //        //lblAlert.Text = "ERROR !!! Please try after some time";
        //    }
        //}

        //protected void btnDelete1_Click(object sender, System.EventArgs e)
        //{
        //    lblImg1.Text = "empty";
        //    lblImg1.ForeColor = System.Drawing.Color.White;
        //    Image1.ImageUrl = "";
        //}
        //protected void btnDelete2_Click(object sender, System.EventArgs e)
        //{
        //    lblImg2.Text = "empty";
        //    lblImg2.ForeColor = System.Drawing.Color.White;
        //    Image2.ImageUrl = "";
        //}
        //protected void btnDelete3_Click(object sender, System.EventArgs e)
        //{
        //    lblImg3.Text = "empty";
        //    lblImg3.ForeColor = System.Drawing.Color.White;
        //    Image3.ImageUrl = "";
        //}
        //protected void btnDelete4_Click(object sender, System.EventArgs e)
        //{
        //    lblImg4.Text = "empty";
        //    lblImg4.ForeColor = System.Drawing.Color.White;
        //    Image4.ImageUrl = "";
        //}
        //protected void btnDelete5_Click(object sender, System.EventArgs e)
        //{
        //    lblImg5.Text = "empty";
        //    lblImg5.ForeColor = System.Drawing.Color.White;
        //    Image5.ImageUrl = "";
        //}
        //protected void btnDelete6_Click(object sender, System.EventArgs e)
        //{
        //    lblImg6.Text = "empty";
        //    lblImg6.ForeColor = System.Drawing.Color.White;
        //    Image6.ImageUrl = "";
        //}
        //protected void btnDelete7_Click(object sender, System.EventArgs e)
        //{
        //    lblImg7.Text = "empty";
        //    lblImg7.ForeColor = System.Drawing.Color.White;
        //    Image7.ImageUrl = "";
        //}
    }    
}