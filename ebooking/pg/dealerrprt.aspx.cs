using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking.pg
{
    public partial class dealerrprt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eBook_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {

        }
    }
}