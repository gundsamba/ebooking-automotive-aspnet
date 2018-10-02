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
    public partial class calendardocumentmodal : System.Web.UI.Page
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
                    //string strMyVal = "";
                    string strQry0 = "SELECT a.ID as APPOINTMENTID, a.NUM as APPOINTMENTNUM, b.TYPE as PATIENTTYPE, b.NAME as PATIENTNAME, c.NAME as MARKNAME, b.AUTONO, b.TRANSMISSIONTYPE, b.FUELTYPE, a.REQUESTMEMO, a.CHAIRNUM, LEFT(a.STARTTIME,2) as STARTTIME, RIGHT(a.STARTTIME,2) as STARTMINUTE, LEFT(a.ENDTIME,2) as ENDTIME, RIGHT(a.ENDTIME,2) as ENDMINUTE FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_AUTOMARK c ON b.MARK_ID=c.ID WHERE a.ID=" + Request.QueryString["id"];
                    string strQry1 = "SELECT DIAGNOSTICTYPE_ID FROM TBL_APPOINTMENT_DIAGNOSTICTYPE WHERE APPOINTMENT_ID=" + Request.QueryString["id"] + " ORDER BY DIAGNOSTICTYPE_ID";
                    string strQry2 = "SELECT a.DESCRIPTION, LEFT(b.LNAME,1)+'. '+b.FNAME as SENIORMECHNICAL_NAME,  LEFT(c.LNAME,1)+'. '+c.FNAME as SERVICECONSULTANT_NAME, LEFT(d.LNAME,1)+'. '+d.FNAME as MECHNICAL_NAME FROM TBL_APPOINTMENT_DIAGNOSTIC a INNER JOIN TBL_STAFF b ON a.SENIORMECHANICAL_STAFFID=b.ID INNER JOIN TBL_STAFF c ON a.SERVICECONSULTANT_STAFFID=c.ID INNER JOIN TBL_STAFF d ON a.MECHANICAL_STAFFID=d.ID WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"];
                    string strQry3 = "SELECT a.REPAIRTYPE_ID, LEFT(b.LNAME,1)+'. '+b.FNAME as MECHNICAL_NAME, LEFT(c.LNAME,1)+'. '+c.FNAME as SENIORMECHNICAL_NAME,  LEFT(d.LNAME,1)+'. '+d.FNAME as SERVICECONSULTANT_NAME FROM TBL_APPOINTMENT_REPAIR a INNER JOIN TBL_STAFF b ON a.MECHANICAL_STAFFID=b.ID INNER JOIN TBL_STAFF c ON a.SENIORMECHANICAL_STAFFID=c.ID INNER JOIN TBL_STAFF d ON a.SERVICECONSULTANT_STAFFID=d.ID WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"];
                    string strQry4 = "SELECT PART_NAME, CNT, DESCRIPTION FROM TBL_APPOINTMENT_PART WHERE APPOINTMENT_ID=" + Request.QueryString["id"];
                    ds = myObjModifyDB.ExecuteDataSet(strQry0 + "     " + strQry1 + "     " + strQry2 + "     " + strQry3 + "     " + strQry4);
                    pModalAppointmentno.InnerHtml = ds.Tables[0].Rows[0]["APPOINTMENTNUM"].ToString();
                    if (ds.Tables[0].Rows[0]["PATIENTTYPE"].ToString() == "1")
                    {
                        pModalPatientType1.InnerHtml = "&#9745;";
                        pModalPatientType0.InnerHtml = "&#9744;";
                    }
                    else if (ds.Tables[0].Rows[0]["PATIENTTYPE"].ToString() == "0")
                    {
                        pModalPatientType1.InnerHtml = "&#9744;";
                        pModalPatientType0.InnerHtml = "&#9745;";
                    }
                    else {
                        pModalPatientType1.InnerHtml = "&#9744;";
                        pModalPatientType0.InnerHtml = "&#9744;";
                    }
                    pModalPatientName.InnerHtml = ds.Tables[0].Rows[0]["PATIENTNAME"].ToString();
                    pModalPatientMarkname.InnerHtml = ds.Tables[0].Rows[0]["MARKNAME"].ToString();
                    pModalPatientAutono.InnerHtml = ds.Tables[0].Rows[0]["AUTONO"].ToString();
                    if (ds.Tables[0].Rows[0]["TRANSMISSIONTYPE"].ToString() == "1")
                    {
                        pModalPatientTransmissiontype1.InnerHtml = "&#9745;";
                        pModalPatientTransmissiontype0.InnerHtml = "&#9744;";
                    }
                    else if (ds.Tables[0].Rows[0]["TRANSMISSIONTYPE"].ToString() == "0")
                    {
                        pModalPatientTransmissiontype1.InnerHtml = "&#9744;";
                        pModalPatientTransmissiontype0.InnerHtml = "&#9745;";
                    }
                    else
                    {
                        pModalPatientTransmissiontype1.InnerHtml = "&#9744;";
                        pModalPatientTransmissiontype0.InnerHtml = "&#9744;";
                    }
                    if (ds.Tables[0].Rows[0]["FUELTYPE"].ToString() == "1")
                    {
                        pModalPatientFueltype1.InnerHtml = "&#9745;";
                        pModalPatientFueltype0.InnerHtml = "&#9744;";
                    }
                    else if (ds.Tables[0].Rows[0]["FUELTYPE"].ToString() == "0")
                    {
                        pModalPatientFueltype1.InnerHtml = "&#9744;";
                        pModalPatientFueltype0.InnerHtml = "&#9745;";
                    }
                    else
                    {
                        pModalPatientFueltype1.InnerHtml = "&#9744;";
                        pModalPatientFueltype0.InnerHtml = "&#9744;";
                    }
                    pModalAppontmentRequestMemo.InnerHtml = myObjGetData.getReplaceDatabaseToDisplay(ds.Tables[0].Rows[0]["REQUESTMEMO"].ToString());
                    pModalAppointmentBeginTime.InnerHtml = ds.Tables[0].Rows[0]["STARTTIME"].ToString();
                    pModalAppointmentBeginMinute.InnerHtml = ds.Tables[0].Rows[0]["STARTMINUTE"].ToString();
                    pModalAppointmentEndTime.InnerHtml = ds.Tables[0].Rows[0]["ENDTIME"].ToString();
                    pModalAppointmentEndMinute.InnerHtml = ds.Tables[0].Rows[0]["ENDMINUTE"].ToString();
                    pModalAppointmentUrgugchnum.InnerHtml = ds.Tables[0].Rows[0]["CHAIRNUM"].ToString();
                    pModalAppointmentBeginTime2.InnerHtml = ds.Tables[0].Rows[0]["STARTTIME"].ToString();
                    pModalAppointmentBeginMinute2.InnerHtml = ds.Tables[0].Rows[0]["STARTMINUTE"].ToString();
                    pModalAppointmentEndTime2.InnerHtml = ds.Tables[0].Rows[0]["ENDTIME"].ToString();
                    pModalAppointmentEndMinute2.InnerHtml = ds.Tables[0].Rows[0]["ENDMINUTE"].ToString();
                    pModalAppointmentUrgugchnum2.InnerHtml = ds.Tables[0].Rows[0]["CHAIRNUM"].ToString();
                    pModalDiagnostictype1.InnerHtml = "&#9744;";
                    pModalDiagnostictype2.InnerHtml = "&#9744;";
                    pModalDiagnostictype3.InnerHtml = "&#9744;";
                    pModalDiagnostictype4.InnerHtml = "&#9744;";
                    if (ds.Tables[1].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[1].Rows)
                        {
                            if (dr["DIAGNOSTICTYPE_ID"].ToString() == "1") pModalDiagnostictype1.InnerHtml = "&#9745;";
                            else if (dr["DIAGNOSTICTYPE_ID"].ToString() == "2") pModalDiagnostictype2.InnerHtml = "&#9745;";
                            else if (dr["DIAGNOSTICTYPE_ID"].ToString() == "3") pModalDiagnostictype3.InnerHtml = "&#9745;";
                            else if (dr["DIAGNOSTICTYPE_ID"].ToString() == "4") pModalDiagnostictype4.InnerHtml = "&#9745;";
                        }
                    }
                    if (ds.Tables[2].Rows.Count != 0)
                    {
                        pModalDiagnosticDescription.InnerHtml = myObjGetData.getReplaceDatabaseToDisplay(ds.Tables[2].Rows[0]["DESCRIPTION"].ToString());
                        pModalSeniorMechanicalName.InnerHtml = ds.Tables[2].Rows[0]["SENIORMECHNICAL_NAME"].ToString();
                        pModalMechanicalName.InnerHtml = ds.Tables[2].Rows[0]["MECHNICAL_NAME"].ToString();
                        pModalServiceConsultantName.InnerHtml = ds.Tables[2].Rows[0]["SERVICECONSULTANT_NAME"].ToString();
                    }                   

                    pModalRepairtype1.InnerHtml = "&#9744;";
                    pModalRepairtype2.InnerHtml = "&#9744;";
                    pModalRepairtype3.InnerHtml = "&#9744;";
                    pModalRepairtype4.InnerHtml = "&#9744;";
                    if (ds.Tables[3].Rows.Count != 0)
                    {
                        if (ds.Tables[3].Rows[0]["REPAIRTYPE_ID"].ToString() == "1") pModalRepairtype1.InnerHtml = "&#9745;";
                        else if (ds.Tables[3].Rows[0]["REPAIRTYPE_ID"].ToString() == "2") pModalRepairtype2.InnerHtml = "&#9745;";
                        else if (ds.Tables[3].Rows[0]["REPAIRTYPE_ID"].ToString() == "3") pModalRepairtype3.InnerHtml = "&#9745;";
                        else if (ds.Tables[3].Rows[0]["REPAIRTYPE_ID"].ToString() == "4") pModalRepairtype4.InnerHtml = "&#9745;";
                        pModalMechanicalName2.InnerHtml = ds.Tables[3].Rows[0]["MECHNICAL_NAME"].ToString();
                        pModalSeniorMechanicalName2.InnerHtml = ds.Tables[3].Rows[0]["SENIORMECHNICAL_NAME"].ToString();
                        pModalServiceConsultantName2.InnerHtml = ds.Tables[3].Rows[0]["SERVICECONSULTANT_NAME"].ToString();
                    }
                        

                    if (ds.Tables[4].Rows.Count != 0)
                    {
                        pModalPartList.InnerHtml = "";
                        foreach (DataRow dr in ds.Tables[4].Rows)
                        {
                            pModalPartList.InnerHtml += "<tr>";
                            pModalPartList.InnerHtml += "<td style=\"padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;\">" + dr["PART_NAME"].ToString() + "</td>";
                            pModalPartList.InnerHtml += "<td style=\"padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;\">" + dr["CNT"].ToString() + "</td>";
                            pModalPartList.InnerHtml += "<td style=\"padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;\">" + dr["DESCRIPTION"].ToString() + "</td>";
                            pModalPartList.InnerHtml += "</tr>";
                        }
                        for (int i = 1; i <= (10 - ds.Tables[4].Rows.Count); i++)
                        {
                            pModalPartList.InnerHtml += "<tr>";
                            pModalPartList.InnerHtml += "<td style=\"padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;\">&nbsp;</td>";
                            pModalPartList.InnerHtml += "<td style=\"padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;\">&nbsp;</td>";
                            pModalPartList.InnerHtml += "<td style=\"padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;\">&nbsp;</td>";
                            pModalPartList.InnerHtml += "</tr>";
                        }
                    }

                    pModalCurrentDate.InnerHtml = DateTime.Now.Date.ToString("yyyy Оны MM Сар dd Өдөр");
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