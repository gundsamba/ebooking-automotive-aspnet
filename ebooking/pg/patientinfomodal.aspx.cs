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
    public partial class patientinfomodal : System.Web.UI.Page
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
                    string strQry0 = "SELECT a.CODE, a.NAME, CASE WHEN a.TYPE=1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as TYPE, a.TEL, a.TEL2, a.EMAIL, a.ADDRESS, b.NAME as MARK_NAME, a.PRODUCEDYEAR, a.AUTONO, a.VINNO, CASE WHEN a.FUELTYPE=1 THEN N'Бензин' ELSE N'Дизель' END as FUELTYPE, CASE WHEN a.TRANSMISSIONTYPE=1 THEN N'Автомат' ELSE N'Механик' END as TRANSMISSIONTYPE, CREATED_STAFFID, CREATED_DATE, UPDATED_STAFFID, UPDATED_DATE, CASE WHEN a.ISMYSOLD=1 THEN N'Тийм' ELSE N'Үгүй' END as ISMYSOLDNAME FROM TBL_PATIENT a INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID WHERE a.ID=" + Request.QueryString["id"];
                    ds = myObjModifyDB.ExecuteDataSet(strQry0);
                    patientCode.InnerHtml = ds.Tables[0].Rows[0]["CODE"].ToString();
                    patientName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString();
                    patientType.InnerHtml = ds.Tables[0].Rows[0]["TYPE"].ToString();
                    patientTel.InnerHtml = ds.Tables[0].Rows[0]["TEL"].ToString();
                    patientTel2.InnerHtml = ds.Tables[0].Rows[0]["TEL2"].ToString();
                    patientEmail.InnerHtml = ds.Tables[0].Rows[0]["EMAIL"].ToString();
                    patientAddress.InnerHtml = ds.Tables[0].Rows[0]["ADDRESS"].ToString();
                    patientAutoMark.InnerHtml = ds.Tables[0].Rows[0]["MARK_NAME"].ToString();
                    patientAutoYear.InnerHtml = ds.Tables[0].Rows[0]["PRODUCEDYEAR"].ToString();
                    patientAutoNo.InnerHtml = ds.Tables[0].Rows[0]["AUTONO"].ToString();
                    patientAutoVinNo.InnerHtml = ds.Tables[0].Rows[0]["VINNO"].ToString();
                    patientFuelType.InnerHtml = ds.Tables[0].Rows[0]["FUELTYPE"].ToString();
                    patientTransmission.InnerHtml = ds.Tables[0].Rows[0]["TRANSMISSIONTYPE"].ToString();
                    createdInfo.InnerHtml = ds.Tables[0].Rows[0]["CREATED_STAFFID"].ToString() + " " + ds.Tables[0].Rows[0]["CREATED_DATE"].ToString();
                    updatedInfo.InnerHtml = ds.Tables[0].Rows[0]["UPDATED_STAFFID"].ToString() + " " + ds.Tables[0].Rows[0]["UPDATED_DATE"].ToString();
                    patientIsMySold.InnerHtml = ds.Tables[0].Rows[0]["ISMYSOLDNAME"].ToString();
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