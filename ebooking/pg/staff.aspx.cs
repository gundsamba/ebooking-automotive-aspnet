using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking.pg
{
    public partial class staff : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eBook_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas(); 

        }
        protected void setDatas()
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT a.ID, a.NAME FROM ( SELECT '' as ID, N'-Албан тушаал-' as NAME UNION ALL SELECT CAST(ID as varchar) as ID, NAME FROM TBL_STAFF_POSITION WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ) a ORDER BY a.ID");
                staffTab1ModalSelectRole.DataSource = ds.Tables[0];
                staffTab1ModalSelectRole.DataTextField = "NAME";
                staffTab1ModalSelectRole.DataValueField = "ID";
                staffTab1ModalSelectRole.DataBind();
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
        }
    }
}