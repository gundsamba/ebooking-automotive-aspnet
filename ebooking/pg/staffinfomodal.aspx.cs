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
    public partial class staffinfomodal : System.Web.UI.Page
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
                GetData myObjGetData = new GetData();
                try
                {
                    string strQry0 = "SELECT a.ID, a.CODE, a.IDCARD, a.FNAME, a.LNAME, a.MNAME, a.BIRTHDATE, a.TEL, a.TEL2, a.EMAIL, a.ADDRESS, CASE WHEN a.GENDER=1 THEN N'Эр' ELSE N'Эм' END AS GENDER, ISNULL(a.PICTURE,'male.jpg') as PICTURE, b.NAME as POSITIONNAME, CASE WHEN a.ISACTIVE=1 THEN '<span class=\"label label-success\">ACTIVE</span>' ELSE '<span class=\"label label-default\">OFF</span>' END as TYPE FROM TBL_STAFF a INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID WHERE a.ID=" + Request.QueryString["id"] + " ORDER BY CODE";
                    ds = myObjModifyDB.ExecuteDataSet(strQry0);
                    if (ds.Tables[0].Rows[0]["PICTURE"].ToString() == "") staffImage.Src = "../img/staff/male.jpg";
                    else staffImage.Src = "../img/staff/"+ds.Tables[0].Rows[0]["PICTURE"].ToString();
                    staffDetail.InnerHtml = ds.Tables[0].Rows[0]["TYPE"].ToString() + "<br><br><span lang=\"mn\">Код:</span> " + ds.Tables[0].Rows[0]["CODE"].ToString() + "<br><br><span lang=\"mn\">" + ds.Tables[0].Rows[0]["GENDER"].ToString() + "</span>";
                    staffNamePosition.InnerHtml = ds.Tables[0].Rows[0]["LNAME"].ToString() + " <span class=\"semi-bold\">" + ds.Tables[0].Rows[0]["FNAME"].ToString() + "</span><br><small>" + ds.Tables[0].Rows[0]["POSITIONNAME"].ToString() + "</small>";
                    staffMname.InnerHtml = ds.Tables[0].Rows[0]["MNAME"].ToString();
                    staffIDCard.InnerHtml = ds.Tables[0].Rows[0]["IDCARD"].ToString();
                    staffBirthday.InnerHtml = ds.Tables[0].Rows[0]["BIRTHDATE"].ToString();
                    staffPhone.InnerHtml = ds.Tables[0].Rows[0]["TEL"].ToString() + " " + ds.Tables[0].Rows[0]["TEL2"].ToString();
                    staffEmail.InnerHtml = ds.Tables[0].Rows[0]["EMAIL"].ToString();
                    staffAddress.InnerHtml = ds.Tables[0].Rows[0]["ADDRESS"].ToString();
                    //createdInfo.InnerHtml = ds.Tables[0].Rows[0]["CREATED_STAFFID"].ToString() + " " + ds.Tables[0].Rows[0]["CREATED_DATE"].ToString();
                    //updatedInfo.InnerHtml = ds.Tables[0].Rows[0]["UPDATED_STAFFID"].ToString() + " " + ds.Tables[0].Rows[0]["UPDATED_DATE"].ToString();
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
}