using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking.pg
{
    public partial class dealerTab4AttachShowModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            myPdfFile.Src = "../files/agreement/" + myObj.ExecuteScalar("SELECT AGREEMENTATTACH FROM TBL_SOLDCARCUSTOMER_SELLCARS WHERE ID=" + Request.QueryString["id"]).ToString();
        }
    }
}