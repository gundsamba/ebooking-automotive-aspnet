using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking
{
    public partial class index : System.Web.UI.Page
    {
        string strreturnval = "";
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
                string strQry0 = "SELECT ID, NAME FROM TBL_CLINIC WHERE ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                string strQry1 = "select USER_ID, USERNAME, stuff( ( select ','+ CAST(ROLE_ID as varchar) from TBL_USER_ROLE where USER_ID = t.USER_ID for XML path('') ),1,1,'') as LISTDATA from ( SELECT DISTINCT ID as USER_ID, USERNAME FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + " )t";
                string strQry2 = "SELECT ID, NAME FROM TBL_TASK_MISSIONTYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ORDER BY ID";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1 + "    " + strQry2);
                indexStaffId.InnerHtml = Session["eBook_UserID"].ToString();
                indexClinicId.InnerHtml = ds.Tables[0].Rows[0]["ID"].ToString();
                indexClinicName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString();
                indexUserName.InnerHtml = ds.Tables[1].Rows[0]["USERNAME"].ToString();
                indexUserRolesId.InnerHtml = ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim();
                indexSessionID.InnerHtml = Session.SessionID;
                bool boolPatient = false, boolStaff = false, boolService = false, boolPart = false, boolSetup = false, boolReport = false;
                for (int i = 0; i < ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim().Split(',').Length; i++) {
                    if (ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim().Split(',')[i] == "1") {
                        boolPatient = true; boolStaff = true; boolService = true; boolPart = true; boolSetup = true; boolReport = true;
                        break;
                    }
                    else if (ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim().Split(',')[i] == "2") {
                        boolPatient = true;
                    }
                    else if (ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim().Split(',')[i] == "7")
                    {
                        boolStaff = true;
                    }
                    else if (ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim().Split(',')[i] == "8")
                    {
                        boolService = true;
                    }
                    else if (ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim().Split(',')[i] == "9")
                    {
                        boolPart = true;
                    }
                    else if (ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim().Split(',')[i] == "10")
                    {
                        boolSetup = true;
                    }
                    else if (ds.Tables[1].Rows[0]["LISTDATA"].ToString().Trim().Split(',')[i] == "11")
                    {
                        boolReport = true;
                    }
                }
                if (!boolPatient) indexMenuPatient.Attributes.Add("class", "hide");
                if (!boolStaff) indexMenuStaff.Attributes.Add("class", "hide");
                if (!boolService) indexMenuService.Attributes.Add("class", "hide");
                if (!boolPart) indexMenuPart.Attributes.Add("class", "hide");
                if (!boolSetup) indexMenuSetup.Attributes.Add("class", "hide");
                if (!boolReport) indexMenuReport.Attributes.Add("class", "hide");

                //taskmission
                strreturnval = "<li><a href = \"pg/taskstat.aspx\" lang=\"mn\" ><i class=\"fa fa-globe\"></i> Статистик</a></li>";
                if (ds.Tables[2].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[2].Rows)
                    {
                        strreturnval += "<li><a href = \"pg/taskmission.aspx?id="+dr["ID"].ToString()+ "\" lang = \"mn\" ><i class=\"fa fa-globe\"></i> " + dr["NAME"].ToString() + "</a></li>";
                    }
                }
                strreturnval += "<li><a href = \"pg/tasknews.aspx\" lang=\"mn\" ><i class=\"fa fa-globe\"></i> Мэдээ мэдээлэл</a></li>";
                indexTaskUl.InnerHtml = strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
    }
}