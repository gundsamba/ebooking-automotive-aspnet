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
    public partial class calendarservicemodal : System.Web.UI.Page
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
                    string strMyVal = "";
                    string strQry0 = "SELECT a.NUM as APPOINTMENT_NUM, b.CODE as PATIENT_CODE, b.NAME as PATIENT_NAME, b.AUTONO as PATIENT_AUTONO, a.DT as APPOINTMENT_DT, a.STARTTIME as APPOINTMENT_STARTTIME, a.ENDTIME as APPOINTMENT_ENDTIME, c.NAME as ROOM_NAME, a.CHAIRNUM, d.ADDR as CLINIC_ADDR, CASE WHEN d.TEL2 is not null THEN CAST(d.TEL as varchar)+', '+CAST(d.TEL2 as varchar) ELSE CAST(d.TEL as varchar) END as CLINIC_TEL, d.EMAIL as CLINIC_EMAIL, d.WEB as CLINIC_WEB FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_ROOM c ON a.ROOM_ID=c.ID INNER JOIN TBL_CLINIC d ON a.CLINIC_ID=d.ID WHERE a.ID=" + Request.QueryString["id"];
                    string strQry1 = "SELECT a.NAME as REQUESTTYPE_NAME, CASE WHEN b.REQUESTTYPE_ID is null THEN null ELSE '&#x2713' END as ISCHECK FROM TBL_REQUESTTYPE a LEFT JOIN TBL_APPOINTMENT_REQUESTTYPE b ON a.ID=b.REQUESTTYPE_ID AND b.APPOINTMENT_ID=" + Request.QueryString["id"] + " WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"] + ")";
                    string strQry2 = "SELECT a.NAME, a.PRICE, a.CNT, a.PRICE*a.CNT as TOTALPRICE, ISNULL(a.DISCPER, 0) as DISCPER, CEILING(((a.PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0)) as DISCPRICE, (a.PRICE*a.CNT)-(CEILING(((a.PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as PAYPRICE FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"] + " ORDER BY a.DIAGNOSTICTYPE_ID";
                    string strQry3 = "SELECT a.SERVICE_NAME as NAME, ISNULL(a.SERVICE_PRICE,0) as PRICE, a.CNT, ISNULL(a.SERVICE_PRICE*a.CNT,0) as TOTALPRICE, ISNULL(a.DISCPER, 0) as DISCPER, ISNULL(CEILING(((a.SERVICE_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0)),0) as DISCPRICE, ISNULL((a.SERVICE_PRICE*a.CNT)-(CEILING(((a.SERVICE_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))),0) as PAYPRICE FROM TBL_APPOINTMENT_SERVICE a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"];
                    string strQry4 = "SELECT a.PART_NAME as NAME, ISNULL(a.PART_PRICE,0) as PRICE, a.CNT, ISNULL(a.PART_PRICE*a.CNT,0) as TOTALPRICE, ISNULL(a.DISCPER, 0) as DISCPER, ISNULL(CEILING(((a.PART_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0)),0) as DISCPRICE, ISNULL((a.PART_PRICE*a.CNT)-(CEILING(((a.PART_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))),0) as PAYPRICE FROM TBL_APPOINTMENT_PART a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"];
                    string strQry5 = "SELECT ISNULL(SUM(a.TOTALPRICE),0) as TOTALPRICE FROM ( SELECT (a.PRICE*a.CNT)-(CEILING(((a.PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"] + " UNION ALL SELECT (a.SERVICE_PRICE*a.CNT)-(CEILING(((a.SERVICE_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_SERVICE a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"] + " UNION ALL SELECT (a.PART_PRICE*a.CNT)-(CEILING(((a.PART_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_PART a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"] + " ) a";
                    string strQry6 = "SELECT ISNULL(SUM(a.DISCOUNT),0) as DISCOUNT FROM ( SELECT CEILING(((a.PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0)) as DISCOUNT FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"] + " UNION ALL SELECT (CEILING(((a.SERVICE_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as DISCOUNT FROM TBL_APPOINTMENT_SERVICE a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"] + " UNION ALL SELECT (CEILING(((a.PART_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as DISCOUNT FROM TBL_APPOINTMENT_PART a WHERE a.APPOINTMENT_ID=" + Request.QueryString["id"] + " UNION ALL SELECT ISNULL(DISCOUNT,0) as DISCOUNT FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"]+" ) a";
                    //string strQry6 = "SELECT ISNULL(SUM(a.DISCOUNT),0) as DISCOUNT FROM ( SELECT ISNULL(DISCOUNT,0) as DISCOUNT FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"] + " ) a";
                    string strQry7 = "SELECT ISNULL(SUM(a.ULDEGDEL),0) as ULDEGDEL FROM ( SELECT a.APPOINTMENT_ID, (a.TOTALPRICE-ISNULL(b.DISCOUNT,0))-ISNULL(b.PAID,0) as ULDEGDEL FROM ( SELECT a.APPOINTMENT_ID, SUM(a.TOTALPRICE) as TOTALPRICE FROM ( SELECT a.APPOINTMENT_ID, (a.PRICE*a.CNT)-(CEILING(((a.PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID AND b.PATIENT_ID=(SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"] + ") WHERE a.APPOINTMENT_ID<>" + Request.QueryString["id"] + " AND CONVERT(datetime, b.DT) < CONVERT(datetime, (SELECT DT FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"] + ")) UNION ALL SELECT a.APPOINTMENT_ID, (a.SERVICE_PRICE*a.CNT)-(CEILING(((a.SERVICE_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_SERVICE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID AND b.PATIENT_ID=(SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"] + ") WHERE a.APPOINTMENT_ID<>" + Request.QueryString["id"] + " AND CONVERT(datetime, b.DT) < CONVERT(datetime, (SELECT DT FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"] + ")) UNION ALL SELECT a.APPOINTMENT_ID,(a.PART_PRICE*a.CNT)-(CEILING(((a.PART_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_PART a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID AND b.PATIENT_ID=(SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"] + ") WHERE a.APPOINTMENT_ID<>" + Request.QueryString["id"] + " AND CONVERT(datetime, b.DT) < CONVERT(datetime, (SELECT DT FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"] + ")) ) a GROUP BY a.APPOINTMENT_ID ) a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID ) a";
                    string strQry8 = "SELECT ISNULL(PAID,0) as PAID FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"];
                    string strQry9 = "SELECT ISNULL(WAGE,0) as WAGE FROM TBL_APPOINTMENT WHERE ID=" + Request.QueryString["id"];
                    int intTuluhDun = 0, intTulugduuguiDun = 0;
                    ds = myObjModifyDB.ExecuteDataSet(strQry0 + "     " + strQry1 + "     " + strQry2 + "     " + strQry3 + "     " + strQry4 + "     " + strQry5 + "     " + strQry6 + "     " + strQry7 + "     " + strQry8 + "     " + strQry9);
                    pAppointmentCode.InnerHtml = ds.Tables[0].Rows[0]["APPOINTMENT_NUM"].ToString();
                    pPatientCode.InnerHtml = ds.Tables[0].Rows[0]["PATIENT_CODE"].ToString();
                    pPatientName.InnerHtml = ds.Tables[0].Rows[0]["PATIENT_NAME"].ToString();
                    pAutoNo.InnerHtml = ds.Tables[0].Rows[0]["PATIENT_AUTONO"].ToString();
                    pAppointmentDate.InnerHtml = ds.Tables[0].Rows[0]["APPOINTMENT_DT"].ToString();
                    pAppointmentStartTime.InnerHtml = ds.Tables[0].Rows[0]["APPOINTMENT_STARTTIME"].ToString();
                    pAppointmentEndTime.InnerHtml = ds.Tables[0].Rows[0]["APPOINTMENT_ENDTIME"].ToString();
                    pClinicAddr.InnerHtml = ds.Tables[0].Rows[0]["CLINIC_ADDR"].ToString();
                    pClinicTel.InnerHtml = ds.Tables[0].Rows[0]["CLINIC_TEL"].ToString();
                    pClinicEmail.InnerHtml = ds.Tables[0].Rows[0]["CLINIC_EMAIL"].ToString();
                    pClinicWeb.InnerHtml = ds.Tables[0].Rows[0]["CLINIC_WEB"].ToString();
                    strMyVal = "";
                    //if (ds.Tables[1].Rows.Count != 0)
                    //{
                    //    foreach (DataRow dr in ds.Tables[1].Rows)
                    //    {
                    //        strMyVal += "<tr>";
                    //        strMyVal += "<td style=\"width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px;\">" + dr["REQUESTTYPE_NAME"].ToString() + "</td>";
                    //        strMyVal += "<td style=\"width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">" + dr["ISCHECK"].ToString() + "</td>";
                    //        strMyVal += "</tr>";
                    //    }
                    //    //pAppointmentRequestList.InnerHtml = strMyVal;
                    //}
                    //total services
                    strMyVal = "";
                    if (ds.Tables[2].Rows.Count != 0)
                    {
                        strMyVal += "<tr><th colspan=\"6\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Оношлогоо</th></tr>";
                        foreach (DataRow dr in ds.Tables[2].Rows)
                        {
                            strMyVal += "<tr>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px;\">" + dr["NAME"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["PRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">" + dr["CNT"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["TOTALPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">" + dr["DISCPER"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["PAYPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "</tr>";
                        }
                    }
                    if (ds.Tables[3].Rows.Count != 0)
                    {
                        strMyVal += "<tr><th colspan=\"6\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Засвар үйлчилгээ</th></tr>";
                        foreach (DataRow dr in ds.Tables[3].Rows)
                        {
                            strMyVal += "<tr>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px;\">" + dr["NAME"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["PRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">" + dr["CNT"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["TOTALPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">" + dr["DISCPER"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["PAYPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "</tr>";
                        }
                    }
                    if (ds.Tables[4].Rows.Count != 0)
                    {
                        strMyVal += "<tr><th colspan=\"6\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Солисон сэлбэг</th></tr>";
                        foreach (DataRow dr in ds.Tables[4].Rows)
                        {
                            strMyVal += "<tr>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px;\">" + dr["NAME"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["PRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">" + dr["CNT"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["TOTALPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">" + dr["DISCPER"].ToString() + "</td>";
                            strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["PAYPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strMyVal += "</tr>";
                        }
                    }
                    strMyVal += "<tr>";
                    strMyVal += "<th colspan=\"5\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Нийт</th>";
                    strMyVal += "<th style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(ds.Tables[5].Rows[0]["TOTALPRICE"].ToString())).Replace("$", String.Empty) + "</th>";
                    strMyVal += "</tr>";
                    intTuluhDun = Int32.Parse(ds.Tables[5].Rows[0]["TOTALPRICE"].ToString());
                    strMyVal += "<tr>";
                    strMyVal += "<td colspan=\"5\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Ажлын хөлс</td>";
                    strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(ds.Tables[9].Rows[0]["WAGE"].ToString())).Replace("$", String.Empty) + "</td>";
                    strMyVal += "</tr>";
                    intTuluhDun += Int32.Parse(ds.Tables[9].Rows[0]["WAGE"].ToString());
                    //strMyVal += "<tr><td colspan=\"6\">&nbsp;</td></tr>";
                    //strMyVal += "<tr>";
                    //strMyVal += "<td colspan=\"5\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Хөнглөлт</td>";
                    //strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(ds.Tables[6].Rows[0]["DISCOUNT"].ToString())).Replace("$", String.Empty) + "</td>";
                    //strMyVal += "</tr>";
                    //intTuluhDun -= Int32.Parse(ds.Tables[6].Rows[0]["DISCOUNT"].ToString());
                    strMyVal += "<tr>";
                    strMyVal += "<td colspan=\"5\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Өмнөх үлдэгдэл</td>";
                    strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(ds.Tables[7].Rows[0]["ULDEGDEL"].ToString())).Replace("$", String.Empty) + "</td>";
                    strMyVal += "</tr>";
                    intTuluhDun += Int32.Parse(ds.Tables[7].Rows[0]["ULDEGDEL"].ToString());
                    strMyVal += "<tr>";
                    strMyVal += "<th colspan=\"5\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Төлөх дүн</th>";
                    strMyVal += "<th style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(intTuluhDun.ToString())).Replace("$", String.Empty) + "</th>";
                    strMyVal += "</tr>";
                    strMyVal += "<tr>";
                    strMyVal += "<td colspan=\"5\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Төлсөн дүн</td>";
                    strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(ds.Tables[8].Rows[0]["PAID"].ToString())).Replace("$", String.Empty) + "</td>";
                    strMyVal += "</tr>";
                    intTulugduuguiDun = intTuluhDun - Int32.Parse(ds.Tables[8].Rows[0]["PAID"].ToString());
                    strMyVal += "<tr>";
                    strMyVal += "<td colspan=\"5\" style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;\">Төлөгдөөгүй дүн</td>";
                    strMyVal += "<td style=\"padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(intTulugduuguiDun.ToString())).Replace("$", String.Empty) + "</td>";
                    strMyVal += "</tr>";
                    pAppointmentServicesList.InnerHtml = strMyVal;
                }
                else Response.Redirect("~/#pg/patient.aspx");
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