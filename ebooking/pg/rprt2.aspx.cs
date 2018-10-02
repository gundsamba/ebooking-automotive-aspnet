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
    public partial class rprt2 : System.Web.UI.Page
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
                if (Convert.ToInt32(dtime.ToString("dd")) > 28)
                {
                    rprt2Tab1SelectStartDate1.Value = dtime.ToString("yyyy-MM") + "-01";
                    rprt2Tab1SelectEndDate1.Value = dtime.AddMonths(1).AddDays(-2).ToString("yyyy-MM-dd");
                    rprt2Tab1BeginDate.InnerHtml = dtime.ToString("yyyy-MM") + "-01";
                    rprt2Tab1EndDate.InnerHtml = dtime.AddMonths(1).AddDays(-2).ToString("yyyy-MM-dd");
                    rprt2Tab2SelectStartDate1.Value = dtime.ToString("yyyy-MM") + "-01";
                    rprt2Tab2SelectEndDate1.Value = dtime.AddMonths(1).AddDays(-2).ToString("yyyy-MM-dd");
                    rprt2Tab2BeginDate.InnerHtml = dtime.ToString("yyyy-MM") + "-01";
                    rprt2Tab2EndDate.InnerHtml = dtime.AddMonths(1).AddDays(-2).ToString("yyyy-MM-dd");
                    rprt2Tab4SelectStartDate1.Value = dtime.ToString("yyyy-MM") + "-01";
                    rprt2Tab4SelectEndDate1.Value = dtime.AddMonths(1).AddDays(-2).ToString("yyyy-MM-dd");
                    rprt2Tab4BeginDate.InnerHtml = dtime.ToString("yyyy-MM") + "-01";
                    rprt2Tab4EndDate.InnerHtml = dtime.AddMonths(1).AddDays(-2).ToString("yyyy-MM-dd");
                    rprt2Tab5SelectStartDate1.Value = dtime.ToString("yyyy-MM") + "-01";
                    rprt2Tab5SelectEndDate1.Value = dtime.AddMonths(1).AddDays(-2).ToString("yyyy-MM-dd");
                    rprt2Tab5BeginDate.InnerHtml = dtime.ToString("yyyy-MM") + "-01";
                    rprt2Tab5EndDate.InnerHtml = dtime.AddMonths(1).AddDays(-2).ToString("yyyy-MM-dd");
                }
                else
                {
                    rprt2Tab1SelectStartDate1.Value = dtime.AddMonths(-1).ToString("yyyy-MM-dd");
                    rprt2Tab1SelectEndDate1.Value = dtime.ToString("yyyy-MM-dd");
                    rprt2Tab1BeginDate.InnerHtml = dtime.AddMonths(-1).ToString("yyyy-MM-dd");
                    rprt2Tab1EndDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                    rprt2Tab2SelectStartDate1.Value = dtime.AddMonths(-1).ToString("yyyy-MM-dd");
                    rprt2Tab2SelectEndDate1.Value = dtime.ToString("yyyy-MM-dd");
                    rprt2Tab2BeginDate.InnerHtml = dtime.AddMonths(-1).ToString("yyyy-MM-dd");
                    rprt2Tab2EndDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                    rprt2Tab4SelectStartDate1.Value = dtime.AddMonths(-1).ToString("yyyy-MM-dd");
                    rprt2Tab4SelectEndDate1.Value = dtime.ToString("yyyy-MM-dd");
                    rprt2Tab4BeginDate.InnerHtml = dtime.AddMonths(-1).ToString("yyyy-MM-dd");
                    rprt2Tab4EndDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                    rprt2Tab5SelectStartDate1.Value = dtime.AddMonths(-1).ToString("yyyy-MM-dd");
                    rprt2Tab5SelectEndDate1.Value = dtime.ToString("yyyy-MM-dd");
                    rprt2Tab5BeginDate.InnerHtml = dtime.AddMonths(-1).ToString("yyyy-MM-dd");
                    rprt2Tab5EndDate.InnerHtml = dtime.ToString("yyyy-MM-dd");
                }

                rprt2Tab1SelectStartDate2.Value = dtime.AddYears(-1).ToString("yyyy") + "-" + dtime.ToString("MM");
                rprt2Tab1SelectEndDate2.Value = dtime.ToString("yyyy-MM");
                rprt2Tab2SelectStartDate2.Value = dtime.AddYears(-1).ToString("yyyy") + "-" + dtime.ToString("MM");
                rprt2Tab2SelectEndDate2.Value = dtime.ToString("yyyy-MM");

                string strMyVal = "";
                string strQry0 = "SELECT ROW_NUMBER() OVER(ORDER BY a.CNT DESC, a.MARK_NAME ASC) AS RW, a.MARK_NAME, a.CNT FROM ( SELECT a.MARK_ID, b.NAME as MARK_NAME, COUNT(a.MARK_ID) as CNT FROM TBL_PATIENT a INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") GROUP BY a.MARK_ID, b.NAME ) a";
                ds = myObjModifyDB.ExecuteDataSet(strQry0);
                strMyVal = "";
                strMyVal += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 12px arial, sans-serif; width: 100%;\"><thead style=\"background-color:#C6D9F1; color:#666666;\"><tr><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">#</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Марк</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Тоо</th></tr></thead><tbody>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strMyVal += "<tr><td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + dr["MARK_NAME"].ToString() + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["CNT"].ToString() + "</td></tr>";
                    }
                }
                strMyVal += "</tbody></table>";
                divrprt2Tab3Table.InnerHtml = strMyVal;
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