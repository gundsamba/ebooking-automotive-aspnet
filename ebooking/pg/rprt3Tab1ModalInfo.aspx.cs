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
    public partial class rprt3Tab1ModalInfo : System.Web.UI.Page
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
                    string strQry0 = "SELECT a.CODE, a.NAME, CASE WHEN a.TYPE=1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as TYPE, a.TEL, a.TEL2, a.EMAIL, a.ADDRESS, b.NAME as MARK_NAME, a.PRODUCEDYEAR, a.AUTONO, a.VINNO, CASE WHEN a.FUELTYPE=1 THEN N'Бензин' ELSE N'Дизель' END as FUELTYPE, CASE WHEN a.TRANSMISSIONTYPE=1 THEN N'Автомат' ELSE N'Механик' END as TRANSMISSIONTYPE FROM TBL_PATIENT a INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID WHERE a.ID=" + Request.QueryString["id"];
                    string strQry1 = "SELECT a.ID, a.DT, a.STARTTIME, a.ENDTIME, b.NAME as ROOM_NAME, a.CHAIRNUM, a.NUM as APPNO, c.LISTDATA as REQUESTTYPELIST, ISNULL(a.REQUESTMEMO,'-') as REQUESTMEMO, ISNULL(d.DIAGNOSTICSUMPRICE,0) as DIAGNOSTICSUMPRICE, f.LISTDATA as DIAGNOSTICTYPELIST, ISNULL(g.DESCRIPTION,'-') as DIAGNOSTICDESCRIPTION, ISNULL(LEFT(h.LNAME,1)+'.'+h.FNAME,'-') as DIAGNOSTICSENIORMECHANICAL_STAFFNAME, ISNULL(LEFT(i.LNAME,1)+'.'+i.FNAME,'-') as DIAGNOSTICSERVICECONSULTANT_STAFFNAME, ISNULL(j.SERVICESUMPRICE,0) as SERVICESUMPRICE, p.NAME as REPAIRTYPENAME, LEFT(q.LNAME,1)+'.'+q.FNAME as REPAIRMECHANICAL_STAFFNAME, LEFT(r.LNAME,1)+'.'+r.FNAME as REPAIRSENIORMECHANICAL_STAFFNAME, LEFT(s.LNAME,1)+'.'+s.FNAME as REPAIRSERVICECONSULTANT_STAFFNAME, k.LISTDATA as SERVICELIST, ISNULL(l.PARTSUMPRICE,0) as PARTSUMPRICE, m.LISTDATA as PARTLIST, ISNULL(n.SUMPRICE,0) as SUMPRICE FROM TBL_APPOINTMENT a INNER JOIN TBL_ROOM b ON a.ROOM_ID=b.ID INNER JOIN ( select APPOINTMENT_ID, ( select ' <span class=\"label bg-color-blueDark\">'+ ISNULL(b.NAME,'')+'</span>' from TBL_APPOINTMENT_REQUESTTYPE a INNER JOIN TBL_REQUESTTYPE b ON a.REQUESTTYPE_ID=b.ID where a.APPOINTMENT_ID = t.APPOINTMENT_ID for XML path('') ) as LISTDATA from ( SELECT DISTINCT a.APPOINTMENT_ID FROM TBL_APPOINTMENT_REQUESTTYPE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " )t ) c ON a.ID=c.APPOINTMENT_ID LEFT JOIN ( SELECT a.APPOINTMENT_ID, SUM((a.PRICE*CNT)) as DIAGNOSTICSUMPRICE FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " GROUP BY a.APPOINTMENT_ID ) d ON a.ID=d.APPOINTMENT_ID LEFT JOIN ( select APPOINTMENT_ID, ( select ' <span class=\"label bg-color-blueDark\">'+ ISNULL(a.NAME,'') + N' <i>/₮'+REPLACE(CONVERT(varchar, CAST(ISNULL(a.PRICE,0) AS money), 1),'.00','')+'/</i></span>' from TBL_APPOINTMENT_DIAGNOSTICTYPE a where a.APPOINTMENT_ID = t.APPOINTMENT_ID for XML path('') ) as LISTDATA from ( SELECT DISTINCT a.APPOINTMENT_ID FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " )t ) f ON a.ID=f.APPOINTMENT_ID LEFT JOIN TBL_APPOINTMENT_DIAGNOSTIC g ON a.ID=g.APPOINTMENT_ID LEFT JOIN TBL_STAFF h ON g.SENIORMECHANICAL_STAFFID=h.ID LEFT JOIN TBL_STAFF i ON g.SERVICECONSULTANT_STAFFID = i.ID LEFT JOIN ( SELECT a.APPOINTMENT_ID, SUM((a.SERVICE_PRICE*CNT)) as SERVICESUMPRICE FROM TBL_APPOINTMENT_SERVICE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " GROUP BY a.APPOINTMENT_ID ) j ON a.ID=j.APPOINTMENT_ID LEFT JOIN ( select APPOINTMENT_ID, ( select '<tr><td>'+ ISNULL(a.SERVICE_CODE,'')+'</td><td>'+ISNULL(a.SERVICE_NAME,'')+'</td><td>'+ISNULL(a.SERVICE_DESCRIPTION,'')+'</td><td>'+ISNULL(a.DESCRIPTION,'')+'</td><td class=\"text-center\">'+ISNULL(CAST(a.CNT as varchar),'')+N'</td><td class=\"text-right\">₮'+REPLACE(CONVERT(varchar, CAST(ISNULL(a.SERVICE_PRICE,0) AS money), 1),'.00','')+N'</td><td class=\"text-right\">₮'+REPLACE(CONVERT(varchar, CAST((ISNULL(a.SERVICE_PRICE,0)*a.CNT) AS money), 1),'.00','')+'</td></tr>' from TBL_APPOINTMENT_SERVICE a where a.APPOINTMENT_ID = t.APPOINTMENT_ID for XML path('') ) as LISTDATA from ( SELECT DISTINCT a.APPOINTMENT_ID FROM TBL_APPOINTMENT_SERVICE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " )t ) k ON a.ID=k.APPOINTMENT_ID LEFT JOIN ( SELECT a.APPOINTMENT_ID, SUM((a.PART_PRICE*CNT)) as PARTSUMPRICE FROM TBL_APPOINTMENT_PART a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " GROUP BY a.APPOINTMENT_ID ) l ON a.ID=l.APPOINTMENT_ID LEFT JOIN ( select APPOINTMENT_ID, ( select '<tr><td>'+ ISNULL(a.PART_CODE,'')+'</td><td>'+ISNULL(a.PART_NAME,'')+'</td><td>'+ISNULL(a.PART_DESCRIPTION,'')+'</td><td>'+ISNULL(a.DESCRIPTION,'')+'</td><td class=\"text-center\">'+CAST(a.CNT as varchar)+N'</td><td class=\"text-right\">₮'+REPLACE(CONVERT(varchar, CAST(ISNULL(a.PART_PRICE,0) AS money), 1),'.00','')+N'</td><td class=\"text-right\">₮'+REPLACE(CONVERT(varchar, CAST((ISNULL(a.PART_PRICE,0)*a.CNT) AS money), 1),'.00','')+'</td></tr>' from TBL_APPOINTMENT_PART a where a.APPOINTMENT_ID = t.APPOINTMENT_ID for XML path('') ) as LISTDATA from ( SELECT DISTINCT a.APPOINTMENT_ID FROM TBL_APPOINTMENT_PART a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " )t ) m ON a.ID=m.APPOINTMENT_ID LEFT JOIN ( SELECT a.APPOINTMENT_ID, SUM(a.SUMPRICE) as SUMPRICE FROM ( SELECT a.APPOINTMENT_ID, SUM((a.PRICE*CNT)) as SUMPRICE FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " GROUP BY a.APPOINTMENT_ID UNION ALL SELECT a.APPOINTMENT_ID, SUM((a.SERVICE_PRICE*CNT)) as SUMPRICE FROM TBL_APPOINTMENT_SERVICE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " GROUP BY a.APPOINTMENT_ID UNION ALL SELECT a.APPOINTMENT_ID, SUM((a.PART_PRICE*CNT)) as SUMPRICE FROM TBL_APPOINTMENT_PART a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID WHERE b.PATIENT_ID=" + Request.QueryString["id"] + " GROUP BY a.APPOINTMENT_ID ) a GROUP BY a.APPOINTMENT_ID ) n ON a.ID=n.APPOINTMENT_ID LEFT JOIN TBL_APPOINTMENT_REPAIR o ON a.ID=o.APPOINTMENT_ID LEFT JOIN TBL_REPAIRTYPE p ON o.REPAIRTYPE_ID=p.ID LEFT JOIN TBL_STAFF q ON o.MECHANICAL_STAFFID = q.ID LEFT JOIN TBL_STAFF r ON o.SENIORMECHANICAL_STAFFID = r.ID LEFT JOIN TBL_STAFF s ON o.SERVICECONSULTANT_STAFFID = s.ID INNER JOIN TBL_APPOINTMENT_TYPE t ON a.APPOINTMENT_TYPE_ID=t.ID WHERE a.PATIENT_ID=" + Request.QueryString["id"] + " AND a.DT BETWEEN '" + Request.QueryString["begindt"] + "' AND '" + Request.QueryString["enddt"] + "' AND t.ISACTIVESHOW=1 ORDER BY a.DT DESC, a.STARTTIME DESC, a.ENDTIME DESC";
                    ds = myObjModifyDB.ExecuteDataSet(strQry0 + "     " + strQry1);
                    appointmentListUl.InnerHtml = "";
                    if (ds.Tables[1].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[1].Rows)
                        {
                            strMyVal += "<li>";
                            strMyVal += "<div class=\"smart-timeline-icon\"><img src=\"img/staff/male.jpg\" width=\"32\" height=\"32\"></div>";
                            strMyVal += "<div class=\"smart-timeline-time\"><small>" + dr["DT"].ToString() + " " + dr["STARTTIME"].ToString() + "-" + dr["ENDTIME"].ToString() + "</small></div>";
                            strMyVal += "<div class=\"smart-timeline-content\">";
                            strMyVal += "<h3 class=\"margin-top-0\">" + dr["ROOM_NAME"].ToString() + " - <span lang=\"mn\">Өргөгч</span> " + dr["CHAIRNUM"].ToString() + " | <span lang=\"mn\">Захиалгын дугаар</span> #" + dr["APPNO"].ToString() + " | <span lang=\"mn\">Нийт дүн</span>: ₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["SUMPRICE"].ToString())).Replace("$", String.Empty) + "</h3>";
                            strMyVal += "<h4 class=\"text-primary\" lang=\"mn\">Үйлчлүүлэгчийн хүсэлт</h4>";
                            strMyVal += "<p>" + dr["REQUESTTYPELIST"].ToString().Replace("&lt;", "<").Replace("&gt;", ">") + "<br><strong><span lang=\"mn\">Хүсэлтийн тэмдэглэл</span>: </strong> <i>" + dr["REQUESTMEMO"].ToString() + "</i></p>";
                            strMyVal += "<h4 class=\"text-primary\"><span lang=\"mn\">Оношлогоо</span>  <i>/₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["DIAGNOSTICSUMPRICE"].ToString())).Replace("$", String.Empty) + "/</i></h4>";
                            strMyVal += "<p>" + dr["DIAGNOSTICTYPELIST"].ToString().Replace("&lt;", "<").Replace("&gt;", ">") + "<br><strong lang=\"mn\">Дүгнэлт:</strong> <i>" + dr["DIAGNOSTICDESCRIPTION"].ToString() + "</i><br><strong lang=\"mn\">Дүгнэлт гаргасан ахлах механик:</strong> <i>" + dr["DIAGNOSTICSENIORMECHANICAL_STAFFNAME"].ToString() + "</i> <strong lang=\"mn\">Дүгнэлт гаргасан үйлчилгээний зөвлөх:</strong> <i>" + dr["DIAGNOSTICSERVICECONSULTANT_STAFFNAME"].ToString() + "</i></p>";
                            strMyVal += "<h4 class=\"text-primary\"><span lang=\"mn\">Засвар үйлчилгээ</span> <i>/₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["SERVICESUMPRICE"].ToString())).Replace("$", String.Empty) + "/</i></h4>";
                            strMyVal += "<p><span class=\"label bg-color-blueDark\">" + dr["REPAIRTYPENAME"].ToString() + "</span><br><strong lang=\"mn\">Механик:</strong> <i>" + dr["REPAIRMECHANICAL_STAFFNAME"].ToString() + "</i>  <strong lang=\"mn\">Ахлах механик:</strong> <i>" + dr["REPAIRSENIORMECHANICAL_STAFFNAME"].ToString() + "</i>  <strong lang=\"mn\">Үйлчилгээний зөвлөх:</strong> <i>" + dr["REPAIRSERVICECONSULTANT_STAFFNAME"].ToString() + "</i></p>";
                            strMyVal += "<div><table class=\"table table-hover\"><thead><tr><th lang=\"mn\">Код</th><th lang=\"mn\">ЗҮ нэр</th><th lang=\"mn\">ЗҮ тайлбар</th><th lang=\"mn\">ЗҮ авсан тайлбар</th><th class=\"text-center\" lang=\"mn\">/ш/</th><th class=\"text-right\" lang=\"mn\">Нэгж үнэ</th><th class=\"text-right\" lang=\"mn\">Нийт үнэ</th></tr></thead><tbody>" + dr["SERVICELIST"].ToString().Replace("&lt;", "<").Replace("&gt;", ">") + "</tbody></table></div>";
                            strMyVal += "<h4 class=\"text-primary\"><span lang=\"mn\">Солисон сэлбэг</span> <i>/₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["PARTSUMPRICE"].ToString())).Replace("$", String.Empty) + "/</i></h4>";
                            strMyVal += "<div><table class=\"table table-hover\"><thead><tr><th lang=\"mn\">Код</th><th lang=\"mn\">Сэлбэг нэр</th><th lang=\"mn\">Сэлбэг тайлбар</th><th lang=\"mn\">Сэлбэг авсан тайлбар</th><th class=\"text-center\" lang=\"mn\">/ш/</th><th class=\"text-right\" lang=\"mn\">Нэгж үнэ</th><th class=\"text-right\" lang=\"mn\">Нийт үнэ</th></tr></thead><tbody>" + dr["PARTLIST"].ToString().Replace("&lt;", "<").Replace("&gt;", ">") + "</tbody></table></div>";
                            strMyVal += "</div>";
                            strMyVal += "</li>";
                        }
                        appointmentListUl.InnerHtml = strMyVal;
                    }
                }
                else Response.Redirect("~/#pg/error500.aspx");
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