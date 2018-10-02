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
    public partial class dealersettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eBook_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                string strQry0 = "SELECT '' as ID, N'- Бүгд -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_AUTOMARK_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID="+ Session["eBook_UserID"].ToString() + ")";
                string strQry1 = "SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_CARCOLORTYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0+"     "+strQry1);
                //bind auto mark ddl
                pTab1SelectMarktype.DataSource = ds.Tables[0];
                pTab1SelectMarktype.DataTextField = "NAME";
                pTab1SelectMarktype.DataValueField = "ID";
                pTab1SelectMarktype.DataBind();
                pTab1ModalSelectMarktype.DataSource = ds.Tables[0];
                pTab1ModalSelectMarktype.DataTextField = "NAME";
                pTab1ModalSelectMarktype.DataValueField = "ID";
                pTab1ModalSelectMarktype.DataBind();
                pTab2ModalSelectColortype.DataSource = ds.Tables[1];
                pTab2ModalSelectColortype.DataTextField = "NAME";
                pTab2ModalSelectColortype.DataValueField = "ID";
                pTab2ModalSelectColortype.DataBind();

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