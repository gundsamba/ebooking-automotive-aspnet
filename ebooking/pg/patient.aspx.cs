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
    public partial class patient : System.Web.UI.Page
    {
        DataSet ds=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eBook_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas(); 

        }
        public int countPages(int totalRecords, int recordsPerPage)
        {
            if (totalRecords == 0) { return 1; }
            return ((totalRecords - 1) / recordsPerPage) + 1;
        }
        protected void setDatas()
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                int intTotalPg =1, intPg = 1, intBeginRow=1, intEndRow=100; 
                ds = myObjModifyDB.ExecuteDataSet("SELECT COUNT(1) FROM TBL_PATIENT WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")");
                patientTotalResult.InnerHtml = ds.Tables[0].Rows[0][0].ToString();
                intTotalPg = countPages(Int32.Parse(ds.Tables[0].Rows[0][0].ToString()), 100);
                if (Request.QueryString["pg"] != null) {
                    if (System.Text.RegularExpressions.Regex.IsMatch(Request.QueryString["pg"], @"\d"))
                    {
                        if (Int32.Parse(ds.Tables[0].Rows[0][0].ToString()) < (Int32.Parse(Request.QueryString["pg"]) * 100)) intPg = intTotalPg;
                        else intPg = Int32.Parse(Request.QueryString["pg"]);
                        if (intPg != 1) {
                            intBeginRow = (intPg * 100) - 99;
                            intEndRow = (intPg * 100);
                        }
                    }
                    else {
                        HttpContext.Current.Session["error500"] = "БУРУУ ХАНДАЛТ";
                        Response.Redirect("~/#pg/error500.aspx");
                    }
                }
                patientBeginResult.InnerHtml = intBeginRow.ToString();
                patientEndResult.InnerHtml = intEndRow.ToString();
                string strQry0 = "SELECT '' as ID, N'- Ажилтан сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_AUTOMARK";
                string strQry1 = @"SELECT * 
FROM ( 
	SELECT ROW_NUMBER() OVER(ORDER BY a.CODE DESC) AS RW, a.ID, a.CODE, a.NAME, CASE WHEN a.[TYPE]=1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as [TYPE], b.NAME as MARK_NAME, a.PRODUCEDYEAR, a.AUTONO, a.VINNO, ISNULL(c.CNT,0) as APP_CNT, CASE WHEN a.ISMYSOLD=1 THEN 'danger' ELSE null END AS ISMYSOLD, ISNULL(d.ZAALT,0) as ZAALT 
	FROM TBL_PATIENT a 
	INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID
	LEFT JOIN (
		SELECT a.PATIENT_ID, COUNT(a.ID) as CNT 
		FROM TBL_APPOINTMENT a 
		INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID 
		WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + @") AND b.ISACTIVESHOW=1
		GROUP BY a.PATIENT_ID
	) c ON a.ID = c.PATIENT_ID
	LEFT JOIN (
        SELECT a.PATIENT_ID, b.MILEAGE as ZAALT
        FROM (
		    SELECT a.PATIENT_ID, MAX(a.ID) as APPID 
		    FROM TBL_APPOINTMENT a 
		    INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID 
		    WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + @") AND b.ISACTIVESHOW=1
		    GROUP BY a.PATIENT_ID
        ) a
        INNER JOIN TBL_APPOINTMENT b ON a.APPID=b.ID
	) d ON a.ID = d.PATIENT_ID
	WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + @") 
) a 
WHERE RW>=" + intBeginRow.ToString() + " AND RW<="+ intEndRow.ToString();
                string strQry2 = "SELECT a.ID, a.NAME FROM ( SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_AUTOMARK_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ) a ORDER BY a.NAME";
                string strQry3 = "SELECT a.ID, a.NAME FROM ( SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_AUTOMARK WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ) a ORDER BY a.NAME";
                //Patient discount list
                string strQry4 = @"SELECT ID, VALUE, NAME, PER FROM TBL_PATIENTDISCOUNT ORDER BY PER";
                ds = myObjModifyDB.ExecuteDataSet(strQry0 + "     " + strQry1 + "     " + strQry2 + "     " + strQry3 + "     " + strQry4);
                //bind auto mark ddl
                patientModalSelectAutomark.DataSource = ds.Tables[0];
                patientModalSelectAutomark.DataTextField = "NAME";
                patientModalSelectAutomark.DataValueField = "ID";
                patientModalSelectAutomark.DataBind();
                //bind year ddl
                int highyr = DateTime.Now.Year;
                int lowyr = DateTime.Now.Year-100;
                for (highyr = DateTime.Now.Year; highyr >= lowyr; highyr--) patientModalSelectAutoYear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                //bind patient table
                string strreturnval = "";
                strreturnval += "<table id=\"patientDatatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                strreturnval += "<thead>";
                strreturnval += "<tr>";
                strreturnval += "<th>#</th>";
                strreturnval += "<th style=\"width:100px;\" data-class=\"expand\">Арал/дугаар</th>";
                strreturnval += "<th style=\"width:85px;\">У/дугаар</th>";
                strreturnval += "<th>Эзэмшигч/нэр</th>";
                strreturnval += "<th style=\"width:98px;\" data-hide=\"phone,tablet\">Төрөл</th>";
                strreturnval += "<th>Загвар</th>";
                strreturnval += "<th style=\"width:51px;\">Он</th>";
                strreturnval += "<th class=\"text-center\" style=\"width:51px;\" data-hide=\"phone,tablet\">Үйлчлүүлсэн тоо</th>";
                strreturnval += "<th class=\"text-center\" style=\"width:70px;\" data-hide=\"phone,tablet\">КМ заалт</th>";
                strreturnval += "<th style=\"width:85px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                strreturnval += "<th style=\"width:114px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                strreturnval += "<th style=\"width:67px;\">&nbsp;</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        strreturnval += "<tr data-id=\""+ dr["ID"].ToString() + "\" class=\""+ dr["ISMYSOLD"].ToString() + "\">";
                        strreturnval += "<td>" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["VINNO"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["AUTONO"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["NAME"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["TYPE"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["MARK_NAME"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["PRODUCEDYEAR"].ToString() + "</td>";
                        strreturnval += "<td class=\"text-center\">" + dr["APP_CNT"].ToString() + "</td>";
                        strreturnval += "<td class=\"text-center\">" + dr["ZAALT"].ToString() + "</td>";
                        strreturnval += "<td><a class=\"btn btn-info btn-xs\" href=\"#pg/patienttimeline.aspx?id=" + dr["ID"].ToString() + "\"><i class=\"fa fa-archive\"></i> Архив</a></td>";
                        strreturnval += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/patientinfomodal.aspx?id=" + dr["ID"].ToString() + "\" data-toggle=\"modal\" data-target=\"#patientInfoModal\"><i class=\"fa fa-info\"></i> Дэлгэрэнгүй</a></td>";
                        strreturnval += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#patientModal\" onclick=\"patientAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"patientDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                strreturnval += "<script>var responsiveHelper_patientDatatable = undefined; var breakpointDefinition = {  tablet: 1024,  phone: 480 }; $('#patientDatatable').dataTable({\"iDisplayLength\": 100,  \"columns\": [ null,  { \"width\": \"100px\" },  { \"width\": \"85px\" },  null,  { \"width\": \"98px\" },  null,  { \"width\": \"51px\" },  { \"width\": \"51px\" },  { \"width\": \"70px\" },  { \"width\": \"85px\" },  { \"width\": \"114px\" },  { \"width\": \"67px\" } ],  \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",  \"autoWidth\": true,  \"preDrawCallback\": function() {  if (!responsiveHelper_patientDatatable) {  responsiveHelper_patientDatatable = new ResponsiveDatatablesHelper($('#patientDatatable'), breakpointDefinition);  }  },  \"rowCallback\": function(nRow) {  responsiveHelper_patientDatatable.createExpandIcon(nRow);  },  \"drawCallback\": function(oSettings) {  responsiveHelper_patientDatatable.respond();  }, \"paging\": false, \"info\": false });</script>";
                patientDatatableDiv.InnerHtml = strreturnval;
                //bind pagination
                strreturnval = "";
                strreturnval += "<ul class=\"pagination pagination-sm\">";
                if (intPg != 1) strreturnval += "<li><a href=\"#pg/patient.aspx?pg=" + (intPg - 1).ToString() + "\"><i class=\"fa fa-angle-left\"></i></a></li><li><a href=\"~/#pg/patient.aspx?pg=" + (intPg - 1).ToString() + "\">" + (intPg - 1).ToString() + "</a></li>";
                strreturnval += "<li class=\"active\"><a href=\"javascript:void(0);\">"+intPg.ToString()+"</a></li>";
                if (intPg < intTotalPg) strreturnval += "<li><a href=\"#pg/patient.aspx?pg=" + (intPg + 1).ToString() + "\">" + (intPg + 1).ToString() + "</a></li><li><a href=\"~/#pg/patient.aspx?pg=" + (intPg + 1).ToString() + "\"><i class=\"fa fa-angle-right\"></i></a></li>";
                strreturnval += "</ul>";
                patientPagination.InnerHtml = strreturnval;

                //
                patientModalSelectAutomarkType.DataSource = ds.Tables[2];
                patientModalSelectAutomarkType.DataTextField = "NAME";
                patientModalSelectAutomarkType.DataValueField = "ID";
                patientModalSelectAutomarkType.DataBind();
                if (ds.Tables[2].Rows.Count > 2)
                {
                    patientModalSelectAutomarkType.SelectedIndex = 0;
                    patientModalSelectAutomarkType.Disabled = false;
                    patientModalSelectAutomark.Disabled = true;
                }
                else if (ds.Tables[2].Rows.Count == 2)
                {
                    patientModalSelectAutomarkType.SelectedIndex = 1;
                    patientModalSelectAutomarkType.Disabled = true;
                    patientModalSelectAutomark.Disabled = false;

                    patientModalSelectAutomark.DataSource = ds.Tables[3];
                    patientModalSelectAutomark.DataTextField = "NAME";
                    patientModalSelectAutomark.DataValueField = "ID";
                    patientModalSelectAutomark.DataBind();
                }

                //patient discount list
                strreturnval = "<label class=\"control-label\" style=\"display:block;\" lang=\"mn\">Хөнглөлтийн карт</label>";
                if (ds.Tables[4].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[4].Rows)
                    {
                        strreturnval += "<label class=\"radio radio-inline no-margin\"><input id=\"patientModalInputDiscount" + dr["ID"].ToString() + "\" name=\"patientModalInputDiscount\" type=\"radio\" class=\"radiobox\" value=\"" + dr["ID"].ToString() + "\"><span>" + dr["NAME"].ToString() + "</span></label>";
                    }
                    patientModalDiscountsDiv.InnerHtml = strreturnval;
                }
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