using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking.pg
{
    public partial class taskmissionmemomodal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            memoDiv.InnerHtml = myObjModifyDB.ExecuteScalar("SELECT MEMO FROM TBL_TASK_MISSION WHERE ID="+ Request.QueryString["id"]).ToString();
        }
    }
}