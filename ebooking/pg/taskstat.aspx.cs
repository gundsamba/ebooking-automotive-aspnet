using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking.pg
{
    public partial class taskstat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eBook_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas();
        }
        protected void setDatas()
        {
            for (int i = 2010; i <= DateTime.Now.Year + 1; i++) {
                pTab1SelectYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            pTab1SelectYear.SelectedIndex = pTab1SelectYear.Items.IndexOf(pTab1SelectYear.Items.FindByValue(DateTime.Now.Year.ToString()));
            pTab1SelectMonth.SelectedIndex = pTab1SelectMonth.Items.IndexOf(pTab1SelectMonth.Items.FindByValue(DateTime.Now.Month.ToString()));
        }
    }
}