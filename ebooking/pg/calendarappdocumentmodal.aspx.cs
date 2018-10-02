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
    public partial class calendarappdocumentmodal : System.Web.UI.Page
    {
        DataSet ds;
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
                if (Request.QueryString["id"] != null)
                {
                    int i = 0;
                    string strMyVal = "";
                    string strMyVal2 = "";
                    string strQry0 = "SELECT a.ID as APPOINTMENTID, a.NUM as APPOINTMENTNUM, a.APPOINTMENTTYPE, a.DT, LEFT(a.STARTTIME, 2) as STARTTIME, RIGHT(a.STARTTIME, 2) as STARTMINUTE, b.NAME as PATIENTNAME, CASE WHEN b.TEL2 IS NULL THEN b.TEL ELSE b.TEL + ', ' + b.TEL2 END as TEL, b.TYPE as PATIENTTYPE, b.ADDRESS, b.EMERGENCYTEL, b.EMERGENCYTELTYPE, b.EMERGENCYPERSONNAME, a.REQUESTMEMO, a.ISWASHING, a.ISGETPART, c.NAME as MARKNAME, b.VINNO, b.TRANSMISSIONTYPE, b.AUTONO, a.MILEAGE, b.PRODUCEDYEAR, b.FUELTYPE, LEFT(d.LNAME, 1) + '. ' + d.FNAME as STAFFNAME, CONVERT(VARCHAR(19),a.CREATED_DATE, 120) as CREATED_DATE, b.PATIENTDISCOUNT_ID FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID = b.ID INNER JOIN TBL_AUTOMARK c ON b.MARK_ID = c.ID LEFT JOIN TBL_STAFF d ON a.SUBMIT_STAFFID = d.ID WHERE a.ID = " + Request.QueryString["id"];
                    string strQry1 = "SELECT * FROM TBL_REQUESTTYPE ORDER BY ID";
                    string strQry2 = "SELECT * FROM TBL_APPOINTMENT_REQUESTTYPE WHERE APPOINTMENT_ID = "+ Request.QueryString["id"] + " ORDER BY REQUESTTYPE_ID";
                    //Patient discount list
                    string strQry3 = @"SELECT ID, VALUE, NAME, PER FROM TBL_PATIENTDISCOUNT ORDER BY PER";
                    string strQry4 = @"SELECT 
	a.ID, a.DT, a.MILEAGE, ISNULL(c.NAME,N'Км') as MILEAGE_NAME, a.REQUESTMEMO, d.MEMO as REPAIR_MEMO, f.LISTDATA
FROM TBL_APPOINTMENT a
INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID
LEFT JOIN TBL_ZAALTTYPE c ON b.ZAALTTYPE=c.ID
LEFT JOIN TBL_APPOINTMENT_REPAIR d ON a.ID=d.APPOINTMENT_ID
LEFT JOIN (
	select t.APPOINTMENT_ID, stuff( ( 
		select ','+ CAST(b.NAME as nvarchar) 
		from TBL_APPOINTMENT_REQUESTTYPE a
		inner join TBL_REQUESTTYPE b on a.REQUESTTYPE_ID = b.ID
		where a.APPOINTMENT_ID = t.APPOINTMENT_ID for XML path('') ),1,1,'') as LISTDATA 
	from ( 
		SELECT DISTINCT APPOINTMENT_ID 
		FROM TBL_APPOINTMENT_REQUESTTYPE 
		WHERE APPOINTMENT_ID=(SELECT MAX(ID) AS APPOINTMENT_ID FROM TBL_APPOINTMENT
WHERE PATIENT_ID = (SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID = " + Request.QueryString["id"] + @") AND ID < " + Request.QueryString["id"] + @")
	)t 
) f ON a.ID = f.APPOINTMENT_ID
WHERE a.ID = (SELECT MAX(ID) AS APPOINTMENT_ID FROM TBL_APPOINTMENT
WHERE PATIENT_ID = (SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID = " + Request.QueryString["id"] + ") AND ID < "+ Request.QueryString["id"] + ")";
                    //string strQry1 = "SELECT DIAGNOSTICTYPE_ID FROM TBL_APPOINTMENT_DIAGNOSTICTYPE WHERE APPOINTMENT_ID=" + Request.QueryString["id"] + " ORDER BY DIAGNOSTICTYPE_ID";
                    //string strQry2 = "SELECT a.DESCRIPTION, LEFT(b.LNAME,1)+'. '+b.FNAME as SENIORMECHNICAL_NAME,  LEFT(c.LNAME,1)+'. '+c.FNAME as SERVICECONSULTANT_NAME FROM TBL_APPOINTMENT_DIAGNOSTIC a INNER JOIN TBL_STAFF b ON a.SENIORMECHANICAL_STAFFID=b.ID INNER JOIN TBL_STAFF c ON a.SERVICECONSULTANT_STAFFID=c.ID WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"];
                    //string strQry3 = "SELECT a.REPAIRTYPE_ID, LEFT(b.LNAME,1)+'. '+b.FNAME as MECHNICAL_NAME, LEFT(c.LNAME,1)+'. '+c.FNAME as SENIORMECHNICAL_NAME,  LEFT(d.LNAME,1)+'. '+d.FNAME as SERVICECONSULTANT_NAME FROM TBL_APPOINTMENT_REPAIR a INNER JOIN TBL_STAFF b ON a.MECHANICAL_STAFFID=b.ID INNER JOIN TBL_STAFF c ON a.SENIORMECHANICAL_STAFFID=c.ID INNER JOIN TBL_STAFF d ON a.SERVICECONSULTANT_STAFFID=d.ID WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"];
                    //string strQry4 = "SELECT PART_NAME, CNT, DESCRIPTION FROM TBL_APPOINTMENT_PART WHERE APPOINTMENT_ID=" + Request.QueryString["id"];
                    ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1 + "    " + strQry2 + "    " + strQry3 + "    " + strQry4);

                    strMyVal = "";
                    i=0;
                    if (ds.Tables[1].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[1].Rows)
                        {
                            strMyVal2 = "&nbsp;&nbsp;&nbsp;";
                            foreach (DataRow dr2 in ds.Tables[2].Rows)
                            {
                                if (dr["ID"].ToString() == dr2["REQUESTTYPE_ID"].ToString())
                                {
                                    strMyVal2 = "✔";
                                    break;
                                }
                            }
                            if (i != 0) strMyVal += "&nbsp;&nbsp;";
                            strMyVal += dr["NAME"].ToString() + ":&nbsp;<span style=\"border: 1px solid #000; border-radius: 3px; padding: 1px 3px;\">"+ strMyVal2 + "</span>";
                            i++;
                        }
                        pModalRequest.InnerHtml = strMyVal;
                    }
                    else pModalRequest.InnerHtml = "";

                    strMyVal = "";
                    i = 0;
                    if (ds.Tables[3].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[3].Rows)
                        {
                            strMyVal2 = "&nbsp;&nbsp;&nbsp;";
                            if (dr["ID"].ToString() == ds.Tables[0].Rows[0]["PATIENTDISCOUNT_ID"].ToString())
                            {
                                strMyVal2 = "✔";
                            }
                            if (i != 0) strMyVal += "&nbsp;&nbsp;";
                            strMyVal += dr["NAME"].ToString() + ":&nbsp;<span style=\"border: 1px solid #000; border-radius: 3px; padding: 1px 3px;\">" + strMyVal2 + "</span>";
                            i++;
                        }
                        pModalDiscount.InnerHtml = strMyVal;
                    }
                    else pModalDiscount.InnerHtml = "";

                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        pModalAppointmentno.InnerHtml = ds.Tables[0].Rows[0]["APPOINTMENTNUM"].ToString();
                        pModalAppointmentType1.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        pModalAppointmentType2.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        if (ds.Tables[0].Rows[0]["APPOINTMENTTYPE"].ToString() == "1")
                        {
                            pModalAppointmentType1.InnerHtml = "✔";
                        }
                        else if (ds.Tables[0].Rows[0]["APPOINTMENTTYPE"].ToString() == "0")
                        {
                            pModalAppointmentType2.InnerHtml = "✔";
                        }
                        pModalCreatedYear.InnerHtml = ds.Tables[0].Rows[0]["CREATED_DATE"].ToString().Split(' ')[0].Split('-')[0];
                        pModalCreatedMonth.InnerHtml = ds.Tables[0].Rows[0]["CREATED_DATE"].ToString().Split(' ')[0].Split('-')[1];
                        pModalCreatedDay.InnerHtml = ds.Tables[0].Rows[0]["CREATED_DATE"].ToString().Split(' ')[0].Split('-')[2];
                        pModalCreatedHour.InnerHtml = ds.Tables[0].Rows[0]["CREATED_DATE"].ToString().Split(' ')[1].Split(':')[0];
                        pModalCreatedMinute.InnerHtml = ds.Tables[0].Rows[0]["CREATED_DATE"].ToString().Split(' ')[1].Split(':')[1];
                        pModalYear.InnerHtml = ds.Tables[0].Rows[0]["DT"].ToString().Split('-')[0];
                        pModalMonth.InnerHtml = ds.Tables[0].Rows[0]["DT"].ToString().Split('-')[1];
                        pModalDay.InnerHtml = ds.Tables[0].Rows[0]["DT"].ToString().Split('-')[2];
                        pModalHour.InnerHtml = ds.Tables[0].Rows[0]["STARTTIME"].ToString();
                        pModalMinute.InnerHtml = ds.Tables[0].Rows[0]["STARTMINUTE"].ToString();
                        pModalOwnername.InnerHtml = ds.Tables[0].Rows[0]["PATIENTNAME"].ToString();
                        pModalTel.InnerHtml = ds.Tables[0].Rows[0]["TEL"].ToString();
                        pModalTel2.InnerHtml = ds.Tables[0].Rows[0]["TEL"].ToString();

                        pModalType1.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        pModalType2.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        if (ds.Tables[0].Rows[0]["PATIENTTYPE"].ToString() == "1") pModalType1.InnerHtml = "✔";
                        else if (ds.Tables[0].Rows[0]["PATIENTTYPE"].ToString() == "0") pModalType2.InnerHtml = "✔";
                        
                        if (ds.Tables[0].Rows[0]["ADDRESS"].ToString() == "")
                            pModalAddress.InnerHtml = "";
                        else
                            pModalAddress.InnerHtml = ds.Tables[0].Rows[0]["ADDRESS"].ToString();
                        //if (ds.Tables[0].Rows[0]["EMERGENCYTEL"].ToString() == "")
                        //    pModalTelEmergency.InnerHtml = "...........................................................................";
                        //else
                        //    pModalTelEmergency.InnerHtml = ds.Tables[0].Rows[0]["EMERGENCYTEL"].ToString();
                        //if (ds.Tables[0].Rows[0]["EMERGENCYTELTYPE"].ToString() == "1")
                        //{
                        //    pModalTelEmergencyType1.InnerHtml = "&#9745;";
                        //    pModalTelEmergencyType2.InnerHtml = "&#9744;";
                        //    pModalTelEmergencyType3.InnerHtml = "&#9744;";
                        //}
                        //else if (ds.Tables[0].Rows[0]["EMERGENCYTELTYPE"].ToString() == "2")
                        //{
                        //    pModalTelEmergencyType1.InnerHtml = "&#9744;";
                        //    pModalTelEmergencyType2.InnerHtml = "&#9745;";
                        //    pModalTelEmergencyType3.InnerHtml = "&#9744;";
                        //}
                        //else if (ds.Tables[0].Rows[0]["EMERGENCYTELTYPE"].ToString() == "3")
                        //{
                        //    pModalTelEmergencyType1.InnerHtml = "&#9744;";
                        //    pModalTelEmergencyType2.InnerHtml = "&#9745;";
                        //    pModalTelEmergencyType3.InnerHtml = "&#9745;";
                        //}
                        //else
                        //{
                        //    pModalTelEmergencyType1.InnerHtml = "&#9744;";
                        //    pModalTelEmergencyType2.InnerHtml = "&#9744;";
                        //    pModalTelEmergencyType3.InnerHtml = "&#9744;";
                        //}
                        //if (ds.Tables[0].Rows[0]["EMERGENCYPERSONNAME"].ToString() == "")
                        //    pModalTelEmergencyPersonname.InnerHtml = "...............................................................";
                        //else
                        //    pModalTelEmergencyPersonname.InnerHtml = ds.Tables[0].Rows[0]["EMERGENCYPERSONNAME"].ToString();
                        if (ds.Tables[0].Rows[0]["REQUESTMEMO"].ToString() == "")
                            pModalRequestMemo.InnerHtml = "";
                        else
                            pModalRequestMemo.InnerHtml = myObjGetData.getReplaceDatabaseToDisplay(ds.Tables[0].Rows[0]["REQUESTMEMO"].ToString());
                        //if (ds.Tables[0].Rows[0]["ISWASHING"].ToString() == "1")
                        //{
                        //    pModalIsWashing1.InnerHtml = "&#9745;";
                        //    pModalIsWashing0.InnerHtml = "&#9744;";
                        //}
                        //else if (ds.Tables[0].Rows[0]["ISWASHING"].ToString() == "0")
                        //{
                        //    pModalIsWashing1.InnerHtml = "&#9744;";
                        //    pModalIsWashing0.InnerHtml = "&#9745;";
                        //}
                        //else
                        //{
                        //    pModalIsWashing1.InnerHtml = "&#9744;";
                        //    pModalIsWashing0.InnerHtml = "&#9744;";
                        //}
                        //if (ds.Tables[0].Rows[0]["ISGETPART"].ToString() == "1")
                        //{
                        //    pModalIsGetPart1.InnerHtml = "&#9745;";
                        //    pModalIsGetPart0.InnerHtml = "&#9744;";
                        //}
                        //else if (ds.Tables[0].Rows[0]["ISGETPART"].ToString() == "0")
                        //{
                        //    pModalIsGetPart1.InnerHtml = "&#9744;";
                        //    pModalIsGetPart0.InnerHtml = "&#9745;";
                        //}
                        //else
                        //{
                        //    pModalIsGetPart1.InnerHtml = "&#9744;";
                        //    pModalIsGetPart0.InnerHtml = "&#9744;";
                        //}
                        pModalMarkname.InnerHtml = ds.Tables[0].Rows[0]["MARKNAME"].ToString();
                        if (ds.Tables[0].Rows[0]["VINNO"].ToString() == "")
                            pModalVinno.InnerHtml = "";
                        else
                            pModalVinno.InnerHtml = ds.Tables[0].Rows[0]["VINNO"].ToString();

                        pModalTransmissionType1.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        pModalTransmissionType2.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        if (ds.Tables[0].Rows[0]["TRANSMISSIONTYPE"].ToString() == "1")
                        {
                            pModalTransmissionType1.InnerHtml = "✔";
                        }
                        else if (ds.Tables[0].Rows[0]["TRANSMISSIONTYPE"].ToString() == "0")
                        {
                            pModalTransmissionType2.InnerHtml = "✔";
                        }

                        pModalAutono.InnerHtml = ds.Tables[0].Rows[0]["AUTONO"].ToString();
                        pModalAutono2.InnerHtml = ds.Tables[0].Rows[0]["AUTONO"].ToString();
                        if (ds.Tables[0].Rows[0]["VINNO"].ToString() == "")
                            pModalMileage.InnerHtml = "";
                        else
                            pModalMileage.InnerHtml = ds.Tables[0].Rows[0]["MILEAGE"].ToString();
                        pModalProducedyear.InnerHtml = ds.Tables[0].Rows[0]["PRODUCEDYEAR"].ToString();

                        pModalFuelType1.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        pModalFuelType2.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        if (ds.Tables[0].Rows[0]["FUELTYPE"].ToString() == "1")
                        {
                            pModalFuelType1.InnerHtml = "✔";
                        }
                        else if (ds.Tables[0].Rows[0]["FUELTYPE"].ToString() == "0")
                        {
                            pModalFuelType2.InnerHtml = "✔";
                        }
                        pModalSubmitStaff.InnerHtml = ds.Tables[0].Rows[0]["STAFFNAME"].ToString();
                    }
                    else {
                        pModalAppointmentno.InnerHtml = "......";
                        pModalAppointmentType1.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        pModalAppointmentType2.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        pModalYear.InnerHtml = "";
                        pModalMonth.InnerHtml = "";
                        pModalDay.InnerHtml = "";
                        pModalHour.InnerHtml = "";
                        pModalMinute.InnerHtml = "";
                        pModalOwnername.InnerHtml = "";
                        pModalTel.InnerHtml = "";
                        pModalTel2.InnerHtml = "";
                        pModalType1.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        pModalType2.InnerHtml = "&nbsp;&nbsp;&nbsp;";
                        pModalAddress.InnerHtml = "";
                        //pModalTelEmergency.InnerHtml = "...........................................................................";
                        //pModalTelEmergencyType1.InnerHtml = "&#9744;";
                        //pModalTelEmergencyType2.InnerHtml = "&#9744;";
                        //pModalTelEmergencyType3.InnerHtml = "&#9744;";
                        //pModalTelEmergencyPersonname.InnerHtml = "...............................................................";
                        pModalRequestMemo.InnerHtml = "";
                        //pModalIsWashing1.InnerHtml = "&#9744;";
                        //pModalIsWashing0.InnerHtml = "&#9744;";
                        //pModalIsGetPart1.InnerHtml = "&#9744;";
                        //pModalIsGetPart0.InnerHtml = "&#9744;";
                        pModalMarkname.InnerHtml = "";
                        pModalVinno.InnerHtml = "";
                        pModalTransmissionType1.InnerHtml = "&nbsp;";
                        pModalTransmissionType2.InnerHtml = "&nbsp;";
                        pModalAutono.InnerHtml = "";
                        pModalAutono2.InnerHtml = "";
                        pModalMileage.InnerHtml = "";
                        pModalProducedyear.InnerHtml = "........";
                        pModalFuelType1.InnerHtml = "&nbsp;";
                        pModalFuelType2.InnerHtml = "&nbsp;";
                    }
                    strMyVal = "";
                    i = 0;
                    if (ds.Tables[4].Rows.Count != 0)
                    {
                        strMyVal += "Огноо: "+ds.Tables[4].Rows[0]["DT"].ToString()+ "<br><br>";
                        strMyVal += "Заалт: " + ds.Tables[4].Rows[0]["MILEAGE"].ToString() + " "+ ds.Tables[4].Rows[0]["MILEAGE_NAME"].ToString() + "<br><br>";
                        strMyVal += "Үйлчлүүлэгчийн хүсэлт: " + ds.Tables[4].Rows[0]["LISTDATA"].ToString() + "<br>Тайлбар:" + myObjGetData.getReplaceDatabaseToDisplay(ds.Tables[4].Rows[0]["REQUESTMEMO"].ToString());
                        pModalLastResult.InnerHtml = strMyVal;
                    }
                    else pModalLastResult.InnerHtml = "";
                }
                else Response.Redirect("~/#pg/calendar.aspx");
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