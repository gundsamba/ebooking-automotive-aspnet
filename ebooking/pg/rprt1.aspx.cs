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
    public partial class rprt1 : System.Web.UI.Page
    {
        DataSet ds;
        DateTime dtime = DateTime.UtcNow.Date;
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
                string strQry0 = "SELECT a.ID, a.NAME FROM ( SELECT null as ID, N'- Нийт -' as NAME UNION ALL SELECT ID, NAME FROM TBL_APPOINTMENT_TYPE ) a ORDER BY a.ID";
                string strQry1 = "SELECT '' as ID, N'Бүгд' as NAME UNION ALL SELECT CAST(ID as varchar) as ID, NAME+' ('+CAST(CHAIRNUM as varchar)+')' as NAME FROM TBL_ROOM WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                ds = myObjModifyDB.ExecuteDataSet(strQry0+"     "+strQry1);
                rprt1Tab1SelectAppointmentType.DataSource = ds.Tables[0];
                rprt1Tab1SelectAppointmentType.DataTextField = "NAME";
                rprt1Tab1SelectAppointmentType.DataValueField = "ID";
                rprt1Tab1SelectAppointmentType.DataBind();
                rprt1Tab4SelectRoom.DataSource = ds.Tables[1];
                rprt1Tab4SelectRoom.DataTextField = "NAME";
                rprt1Tab4SelectRoom.DataValueField = "ID";
                rprt1Tab4SelectRoom.DataBind();
                myObjModifyDB.DBDisconnectSql();
                rprt1Tab1SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab1SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab2SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab2SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab3SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab3SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab4SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab4SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab1BeginDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                rprt1Tab1EndDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                rprt1Tab2BeginDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                rprt1Tab2EndDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                rprt1Tab3BeginDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                rprt1Tab3EndDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                rprt1Tab4BeginDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                rprt1Tab4EndDate.InnerHtml = dtime.ToString("yyyy-MM-dd");

                rprt1Tab5t1SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab5t1SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab5t2SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab5t2SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab5t3SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab5t3SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab5t4SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                rprt1Tab5t4SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
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