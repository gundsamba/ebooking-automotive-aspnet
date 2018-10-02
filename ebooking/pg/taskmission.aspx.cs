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
    public partial class taskmission : System.Web.UI.Page
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eBook_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas();
        }
        protected void setDatas()
        {
            if (Request.QueryString["id"] != null)
            {
                ModifyDB myObjModifyDB = new ModifyDB();
                string strQry0 = "SELECT ID, NAME, CLINIC_ID FROM TBL_TASK_MISSIONTYPE WHERE ID=" + Request.QueryString["id"];
                string strQry1 = "SELECT ID, CAST(NO as varchar)+'. '+NAME as NAME FROM TBL_TASK_STAT_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_TASK_MISSIONTYPE WHERE ID=" + Request.QueryString["id"]+") ORDER BY NO";
                string strQry2 = "SELECT ID, NAME, COLOR FROM TBL_TASK_MISSIONEVALTYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_TASK_MISSIONTYPE WHERE ID=" + Request.QueryString["id"] + ") ORDER BY ID";
                string strQry3 = @"SELECT
    a.ID
	, LEFT(a.LNAME, 1) + '.' + a.FNAME + ' | ' + b.NAME as NAME
FROM TBL_STAFF a
INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID = b.ID
WHERE a.CLINIC_ID = (SELECT CLINIC_ID FROM TBL_TASK_MISSIONTYPE WHERE ID=" + Request.QueryString["id"] + @") AND a.ISACTIVE = 1
ORDER BY LEFT(a.LNAME, 1) + '.' + a.FNAME";
                ds = myObjModifyDB.ExecuteDataSet(strQry0+"     "+strQry1 + "     " + strQry2 + "     " + strQry3);
                headTitleName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString().ToUpper();
                modalHeadTitleName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString();

                pTab1SelectType.DataSource = ds.Tables[1];
                pTab1SelectType.DataTextField = "NAME";
                pTab1SelectType.DataValueField = "ID";
                pTab1SelectType.DataBind();
                pTab1ModalSelectType.DataSource = ds.Tables[1];
                pTab1ModalSelectType.DataTextField = "NAME";
                pTab1ModalSelectType.DataValueField = "ID";
                pTab1ModalSelectType.DataBind();

                pTab1SelectMissionType.DataSource = ds.Tables[2];
                pTab1SelectMissionType.DataTextField = "NAME";
                pTab1SelectMissionType.DataValueField = "ID";
                pTab1SelectMissionType.DataBind();

                pTab1SelectStaff.DataSource = ds.Tables[3];
                pTab1SelectStaff.DataTextField = "NAME";
                pTab1SelectStaff.DataValueField = "ID";
                pTab1SelectStaff.DataBind();
                pTab1ModalSelectCreatedStaff.DataSource = ds.Tables[3];
                pTab1ModalSelectCreatedStaff.DataTextField = "NAME";
                pTab1ModalSelectCreatedStaff.DataValueField = "ID";
                pTab1ModalSelectCreatedStaff.DataBind();
            }
            else Response.Redirect("~/");
        }
    }
}