using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking.pg
{
    public partial class calendarjson : System.Web.UI.Page
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/json; charset=utf-8";
            Response.Write(GetAppointCalendar());
            Response.End();
        }
        public string GetAppointCalendar()
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            if (Session["eBook_UserID"] != null)
            {
                string userid = Session["eBook_UserID"].ToString(), strreturnval = "[", strQry = "";
                StringBuilder JSON = new StringBuilder();
                try
                {
                    if (Request.QueryString["tp"] == "timelineDay") strQry = @"SELECT a.ID, a.CHAIRNUM, b.AUTONO, b.TEL, a.DT, a.STARTTIME, a.ENDTIME, a.APPOINTMENT_TYPE_ID, c.COLORCLASS, a.PATIENT_ID, a.APPOINTMENTTYPE, CONVERT(varchar, a.STARTDATETIME, 120) as STARTDATETIME, CONVERT(varchar, a.ENDDATETIME, 120) as ENDDATETIME, CONVERT(varchar, a.FIRST_STARTDATETIME, 120) as FIRST_STARTDATETIME, CONVERT(varchar, a.FIRST_ENDDATETIME, 120) as FIRST_ENDDATETIME, CASE 
		WHEN a.FIRST_ENDDATETIME < a.ENDDATETIME AND a.STARTDATETIME < a.FIRST_ENDDATETIME 
		THEN 100-(100*ROUND(CAST(DATEDIFF(MINUTE, a.STARTDATETIME, a.FIRST_ENDDATETIME) as float)/CAST(DATEDIFF(MINUTE, a.STARTDATETIME, a.ENDDATETIME) as float),4)) 
		ELSE 0 
	END as EXTEND_PER FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + userid + ") AND a.DT BETWEEN '" + Request.QueryString["start"] + "' AND '" + Request.QueryString["start"] + "' AND a.ROOM_ID=" + Request.QueryString["room"];
                    else if (Request.QueryString["tp"] == "agendaWeek") strQry = "SELECT a.ID, a.CHAIRNUM, b.AUTONO, b.TEL, a.DT, a.STARTTIME, a.ENDTIME, a.APPOINTMENT_TYPE_ID, c.COLORCLASS, a.PATIENT_ID, a.APPOINTMENTTYPE FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + userid + ") AND a.DT BETWEEN '" + Request.QueryString["start"] + "' AND '" + Request.QueryString["end"] + "' AND a.ROOM_ID=" + Request.QueryString["room"];
                    else if (Request.QueryString["tp"] == "month") strQry = "SELECT a.DT, c.NAME, c.COLORCLASS, COUNT(a.ID) as CNT FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + userid + ") AND a.DT BETWEEN '" + Request.QueryString["start"] + "' AND '" + Request.QueryString["end"] + "' AND a.ROOM_ID=" + Request.QueryString["room"] + " GROUP BY a.DT, c.NAME, c.COLORCLASS";
                    strreturnval = "[";

                    ds = myObjModifyDB.ExecuteDataSet(strQry);
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            if (strreturnval == "[") strreturnval += "{";
                            else strreturnval += ",{";
                            if (Request.QueryString["tp"] == "timelineDay")
                            {
                                strreturnval += "\"appointmentid\":\"" + dr["ID"].ToString() + "\",";
                                strreturnval += "\"resourceId\":\"" + dr["CHAIRNUM"].ToString() + "\",";
                                strreturnval += "\"title\":\"" + dr["AUTONO"].ToString() + " /" + dr["TEL"].ToString() + "/\",";
                                strreturnval += "\"start\":\"" + dr["DT"].ToString() + "T" + dr["STARTTIME"].ToString() + ":00\",";
                                strreturnval += "\"end\":\"" + dr["DT"].ToString() + "T" + dr["ENDTIME"].ToString() + ":00\",";
                                strreturnval += "\"appointmenttype\":\"" + dr["APPOINTMENT_TYPE_ID"].ToString() + "\",";
                                strreturnval += "\"className\":[\"event\", \"" + dr["COLORCLASS"].ToString() + "\"],";
                                strreturnval += "\"patientid\":\"" + dr["PATIENT_ID"].ToString() + "\",";
                                strreturnval += "\"apptype\":\""+dr["APPOINTMENTTYPE"].ToString()+"\",";
                                strreturnval += "\"extend_per\":\"" + dr["EXTEND_PER"].ToString() + "\"";
                            }
                            else if (Request.QueryString["tp"] == "agendaWeek")
                            {
                                strreturnval += "\"appointmentid\":\"" + dr["ID"].ToString() + "\",";
                                strreturnval += "\"resourceId\":\"" + dr["CHAIRNUM"].ToString() + "\",";
                                strreturnval += "\"title\":\"" + dr["AUTONO"].ToString() + " /" + dr["TEL"].ToString() + "/\",";
                                strreturnval += "\"start\":\"" + dr["DT"].ToString() + "T" + dr["STARTTIME"].ToString() + ":00\",";
                                strreturnval += "\"end\":\"" + dr["DT"].ToString() + "T" + dr["ENDTIME"].ToString() + ":00\",";
                                strreturnval += "\"appointmenttype\":\"" + dr["APPOINTMENT_TYPE_ID"].ToString() + "\",";
                                strreturnval += "\"className\":[\"event\", \"" + dr["COLORCLASS"].ToString() + "\"],";
                                strreturnval += "\"patientid\":\"" + dr["PATIENT_ID"].ToString() + "\",";
                                strreturnval += "\"apptype\":\"" + dr["APPOINTMENTTYPE"].ToString() + "\"";
                            }
                            else if (Request.QueryString["tp"] == "month")
                            {
                                strreturnval += "\"title\":\"" + dr["NAME"].ToString() + " (" + dr["CNT"].ToString() + ")\",";
                                strreturnval += "\"className\":[\"event\", \"" + dr["COLORCLASS"].ToString() + "\"],";
                                strreturnval += "\"start\":\"" + dr["DT"].ToString() + "\",";
                                strreturnval += "\"end\":\"" + dr["DT"].ToString() + "\"";
                            }

                            strreturnval += "}";
                        }
                    }
                }
                catch (NullReferenceException ex)
                {

                }
                catch (InvalidOperationException ex)
                {

                }
                finally
                {
                    myObjModifyDB.DBDisconnectSql();
                }

                strreturnval += "]";
                JSON.Append(strreturnval);
                return JSON.ToString();
            }
            else
            {
                throw new cs.MyException("SessionDied");
            }
        }
    }
}