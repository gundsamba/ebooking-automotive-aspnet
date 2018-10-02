using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking.pg
{
    public partial class calendar : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        //SqlDataReader rdr;
        DataSet ds;
        string strreturnval = "", strreturnval2="";
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
                string strQry0 = "SELECT 1";
                string strQry1 = "SELECT ID, NAME FROM TBL_REQUESTTYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ORDER BY ID";
                string strQry2 = "SELECT a.ID, a.AUTONO, a.NAME, b.NAME as MARK_NAME, a.PRODUCEDYEAR FROM TBL_PATIENT a  INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID WHERE a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ORDER BY a.CODE";
                string strQry3 = "SELECT ID, NAME, CHAIRNUM FROM TBL_ROOM WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ORDER BY ID";
                string strQry4 = "SELECT (SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") AND KEYCODE='calendarstarttime')+'~'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") AND KEYCODE='calendarendtime')+'~'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") AND KEYCODE='calendarinterval')+'~'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") AND KEYCODE='calendarlunchstarttime')+'~'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") AND KEYCODE='calendarlunchendtime')";
                string strQry5 = "SELECT a.ID, a.NAME FROM ( SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_AUTOMARK WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ) a ORDER BY a.NAME";
                string strQry6 = "SELECT a.ID, a.NAME FROM ( SELECT '' as ID, N'- Заал сонго -' as NAME UNION ALL SELECT CAST(ID as varchar) as ID, NAME FROM TBL_ROOM WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ) a ORDER BY a.ID";
                string strQry7 = @"SELECT a.ID, a.NAME 
FROM ( 
    SELECT '' as ID, N'- Сонго -' as NAME 
    UNION ALL 
    SELECT CAST(a.ID as varchar) as ID, a.FNAME+'.'+LEFT(a.LNAME,1)+' | '+b.NAME as NAME 
    FROM TBL_STAFF a 
    INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID 
    WHERE 
        a.ISACTIVE=1 
        AND a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + @") 
        AND a.ID IN (SELECT a.STAFF_ID
FROM TBL_USER_STAFF a 
INNER JOIN TBL_USER b ON a.[USER_ID]=b.ID
INNER JOIN TBL_USER_ROLE c ON b.ID=c.[USER_ID]
WHERE c.ROLE_ID = 2)
) a ORDER BY a.NAME";
                string strQry8 = "SELECT ID, NAME FROM TBL_DIAGNOSTICTYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ORDER BY ID";
                string strQry9 = "SELECT ID, NAME FROM TBL_REPAIRTYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ORDER BY ID";
                string strQry10 = "SELECT ID, NAME FROM TBL_SERVICE_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                string strQry11 = "SELECT ID, CODE+' '+NAME as NAME FROM TBL_SERVICE WHERE SERVICE_TYPE_ID=(SELECT MIN(ID) FROM TBL_SERVICE_TYPE WHERE ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")) ORDER BY CODE";
                string strQry12 = "SELECT ID, NAME FROM TBL_PART_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                string strQry13 = "SELECT ID, CODE+' '+NAME as NAME FROM TBL_PART WHERE PART_TYPE_ID=(SELECT MIN(ID) FROM TBL_SERVICE_TYPE WHERE ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")) ORDER BY CODE";
                string strQry14 = "SELECT ROOM_ID, CHAIR, TITLE FROM TBL_ROOMTITLE ORDER BY ROOM_ID, CHAIR";
                string strQry15 = "SELECT a.ID, a.NAME FROM ( SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_AUTOMARK_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ) a ORDER BY a.NAME";

                //ahlah mehanik
                string strQry16 = @"SELECT a.ID, a.NAME 
FROM ( 
	SELECT '' as ID, N'- Сонго -' as NAME 
	UNION ALL 
	SELECT CAST(a.ID as varchar) as ID, a.FNAME+'.'+LEFT(a.LNAME,1)+' | '+b.NAME as NAME 
	FROM TBL_STAFF a 
	INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID 
	WHERE a.ISACTIVE=1 AND a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + @") AND a.STAFF_POSITION_ID IN (SELECT STAFF_POSITION_ID FROM TBL_JOBPOSITION WHERE ID=1)
) a 
ORDER BY a.NAME";
                //mehanik
                string strQry17 = @"SELECT a.ID, a.NAME 
FROM ( 
	SELECT '' as ID, N'- Сонго -' as NAME 
	UNION ALL 
	SELECT CAST(a.ID as varchar) as ID, a.FNAME+'.'+LEFT(a.LNAME,1)+' | '+b.NAME as NAME 
	FROM TBL_STAFF a 
	INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID 
	WHERE a.ISACTIVE=1 AND a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + @") AND a.STAFF_POSITION_ID IN (SELECT STAFF_POSITION_ID FROM TBL_JOBPOSITION WHERE ID=2)
) a 
ORDER BY a.NAME";
                //uilchilgeenii zuwluh
                string strQry18 = @"SELECT a.ID, a.NAME 
FROM ( 
	SELECT '' as ID, N'- Сонго -' as NAME 
	UNION ALL 
	SELECT CAST(a.ID as varchar) as ID, a.FNAME+'.'+LEFT(a.LNAME,1)+' | '+b.NAME as NAME 
	FROM TBL_STAFF a 
	INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID 
	WHERE a.ISACTIVE=1 AND a.CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + @") AND a.STAFF_POSITION_ID IN (SELECT STAFF_POSITION_ID FROM TBL_JOBPOSITION WHERE ID=3)
) a 
ORDER BY a.NAME";
                //Patient discount list
                string strQry19 = @"SELECT ID, VALUE, NAME, PER FROM TBL_PATIENTDISCOUNT ORDER BY PER";


                strreturnval = "<div class=\"inline-group\">";
                ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1 + "     " + strQry2 + "     " + strQry3 + "     " + strQry4 + "     " + strQry5 + "     " + strQry6 + "     " + strQry7 + "     " + strQry8 + "     " + strQry9 + "    " + strQry10 + "     " + strQry11 + "     " + strQry12 + "     " + strQry13 + "     " + strQry14 + "     " + strQry15 + "     " + strQry16 + "     " + strQry17 + "     " + strQry18 + "     " + strQry19);
                if (ds.Tables[1].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        strreturnval += "<label class=\"checkbox margin-right-5 font-sm\"><input id=\"calendarInputRequest" + dr["ID"].ToString() + "\" name=\"calendarInputRequest\" type=\"checkbox\" value=\"" + dr["ID"].ToString() + "\"><i></i><span>" + dr["NAME"].ToString() + "</span></label>";
                        strreturnval2 += "<label class=\"checkbox margin-right-5 font-sm\"><input id=\"calendarAppointmentModalInputRequest" + dr["ID"].ToString() + "\" name=\"calendarAppointmentModalInputRequest\" type=\"checkbox\" value=\"" + dr["ID"].ToString() + "\"><i></i><span>" + dr["NAME"].ToString() + "</span></label>";
                    }
                    strreturnval += "</div>";
                    calendarAppInsertRequestsDiv.InnerHtml = strreturnval;
                    calendarAppModalRequestsDiv.InnerHtml = strreturnval2;
                }
                //draw calendar patient datatable
                strreturnval = "";
                //draw block header
                calendarBlockHeaderListDiv.InnerHtml = "<ul class=\"nav nav-tabs pull-right in\">";
                if (ds.Tables[3].Rows.Count != 0)
                {
                    string strcalendarCurrentRoomChiarNumArr = "";
                    string strChairTitle = "";
                    foreach (DataRow dr in ds.Tables[3].Rows)
                    {
                        strcalendarCurrentRoomChiarNumArr = "[";
                        strChairTitle = "";
                        DataRow[] drS;
                        for (int i = 1; i <= Int32.Parse(dr["CHAIRNUM"].ToString()); i++) {
                            if (strcalendarCurrentRoomChiarNumArr != "[") strcalendarCurrentRoomChiarNumArr += ",";
                            strChairTitle = "";
                            drS = ds.Tables[14].Select("ROOM_ID=" + dr["ID"].ToString() + " AND CHAIR=" + i.ToString());
                            if (drS != null && drS.Length > 0) strChairTitle = " "+drS[0]["TITLE"].ToString();
                            strcalendarCurrentRoomChiarNumArr += "{ \"id\": \"" + i.ToString() + "\", \"title\": \"" + i.ToString() + " " + strChairTitle + "\" }";
                        }
                        strcalendarCurrentRoomChiarNumArr += "]";
                        if (calendarBlockHeaderListDiv.InnerHtml == "<ul class=\"nav nav-tabs pull-right in\">")
                        {
                            calendarCurrentRoomId.InnerHtml = dr["ID"].ToString();
                            calendarBlockHeaderListDiv.InnerHtml += "<li class=\"active\"><a data-toggle=\"tab\" href=\"\" data-roomid=\"" + dr["ID"].ToString() + "\" class=\"calendarBlockClick\"><span class=\"hide\">" + strcalendarCurrentRoomChiarNumArr + "</span><i class=\"fa fa-desktop\"></i> " + dr["NAME"].ToString() + " (" + dr["CHAIRNUM"].ToString() + ")</a></li>";
                            calendarCurrentRoomChiarNumArr.InnerHtml = strcalendarCurrentRoomChiarNumArr;
                        }
                        else calendarBlockHeaderListDiv.InnerHtml += "<li><a data-toggle=\"tab\" href=\"\" data-roomid=\"" + dr["ID"].ToString() + "\" class=\"calendarBlockClick\"><span class=\"hide\">" + strcalendarCurrentRoomChiarNumArr + "</span><i class=\"fa fa-desktop\"></i> " + dr["NAME"].ToString() + " (" + dr["CHAIRNUM"].ToString() + ")</a></li>";
                    }
                }
                calendarBlockHeaderListDiv.InnerHtml += "</ul>";
                //set settings
                calendarSettings.InnerHtml = ds.Tables[4].Rows[0][0].ToString();
                //insert appointment modal automark
                calendarSelectAutomarkType.DataSource = ds.Tables[15];
                calendarSelectAutomarkType.DataTextField = "NAME";
                calendarSelectAutomarkType.DataValueField = "ID";
                calendarSelectAutomarkType.DataBind();
                patientModalSelectAutomarkType.DataSource = ds.Tables[15];
                patientModalSelectAutomarkType.DataTextField = "NAME";
                patientModalSelectAutomarkType.DataValueField = "ID";
                patientModalSelectAutomarkType.DataBind();
                if (ds.Tables[15].Rows.Count > 2)
                {
                    calendarSelectAutomarkType.SelectedIndex = 0;
                    calendarSelectAutomarkType.Disabled = false;
                    calendarSelectAutomark.Disabled = true;

                    patientModalSelectAutomarkType.SelectedIndex = 0;
                    patientModalSelectAutomarkType.Disabled = false;
                    patientModalSelectAutomark.Disabled = true;
                }
                else if (ds.Tables[15].Rows.Count == 2)
                {
                    calendarSelectAutomarkType.SelectedIndex = 1;
                    calendarSelectAutomarkType.Disabled = true;
                    calendarSelectAutomark.Disabled = false;

                    patientModalSelectAutomarkType.SelectedIndex = 1;
                    patientModalSelectAutomarkType.Disabled = true;
                    patientModalSelectAutomark.Disabled = false;

                    calendarSelectAutomark.DataSource = ds.Tables[5];
                    calendarSelectAutomark.DataTextField = "NAME";
                    calendarSelectAutomark.DataValueField = "ID";
                    calendarSelectAutomark.DataBind();

                    patientModalSelectAutomark.DataSource = ds.Tables[5];
                    patientModalSelectAutomark.DataTextField = "NAME";
                    patientModalSelectAutomark.DataValueField = "ID";
                    patientModalSelectAutomark.DataBind();
                }
                calendarSelectSubmitStaff.DataSource = ds.Tables[7];
                calendarSelectSubmitStaff.DataTextField = "NAME";
                calendarSelectSubmitStaff.DataValueField = "ID";
                calendarSelectSubmitStaff.DataBind();
                //tab1
                int highyr = DateTime.Now.Year;
                int lowyr = DateTime.Now.Year - 100;
                for (highyr = DateTime.Now.Year; highyr >= lowyr; highyr--)
                {
                    calendarSelectAutoYear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                    //tab1
                    patientModalSelectAutoYear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                }
                calendarSelectRoom.DataSource = ds.Tables[6];
                calendarSelectRoom.DataTextField = "NAME";
                calendarSelectRoom.DataValueField = "ID";
                calendarSelectRoom.DataBind();
                calendarAppointmentModalSelectRoom.DataSource = ds.Tables[6];
                calendarAppointmentModalSelectRoom.DataTextField = "NAME";
                calendarAppointmentModalSelectRoom.DataValueField = "ID";
                calendarAppointmentModalSelectRoom.DataBind();

                //tab2
                appmodaltab2SelectSeniorMechanical.DataSource = ds.Tables[16];
                appmodaltab2SelectSeniorMechanical.DataTextField = "NAME";
                appmodaltab2SelectSeniorMechanical.DataValueField = "ID";
                appmodaltab2SelectSeniorMechanical.DataBind();
                appmodaltab2SelectMechanical.DataSource = ds.Tables[17];
                appmodaltab2SelectMechanical.DataTextField = "NAME";
                appmodaltab2SelectMechanical.DataValueField = "ID";
                appmodaltab2SelectMechanical.DataBind();
                appmodaltab2SelectServiceConsultant.DataSource = ds.Tables[18];
                appmodaltab2SelectServiceConsultant.DataTextField = "NAME";
                appmodaltab2SelectServiceConsultant.DataValueField = "ID";
                appmodaltab2SelectServiceConsultant.DataBind();
                //tab3
                appmodaltab3SelectMechanical.DataSource = ds.Tables[17];
                appmodaltab3SelectMechanical.DataTextField = "NAME";
                appmodaltab3SelectMechanical.DataValueField = "ID";
                appmodaltab3SelectMechanical.DataBind();
                appmodaltab3SelectSeniorMechanical.DataSource = ds.Tables[16];
                appmodaltab3SelectSeniorMechanical.DataTextField = "NAME";
                appmodaltab3SelectSeniorMechanical.DataValueField = "ID";
                appmodaltab3SelectSeniorMechanical.DataBind();
                appmodaltab3SelectServiceConsultant.DataSource = ds.Tables[18];
                appmodaltab3SelectServiceConsultant.DataTextField = "NAME";
                appmodaltab3SelectServiceConsultant.DataValueField = "ID";
                appmodaltab3SelectServiceConsultant.DataBind();

                //tab2
                strreturnval = "<div class=\"inline-group\">";
                if (ds.Tables[8].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[8].Rows)
                    {
                        strreturnval += "<label class=\"checkbox font-sm\"><input id=\"appmodaltab2CheckDiagnostic" + dr["ID"].ToString() + "\" name=\"appmodaltab2CheckDiagnostic\" type=\"checkbox\"value=\"" + dr["ID"].ToString() + "\"><i></i><span>" + dr["NAME"].ToString() + "</span></label>";
                    }
                    strreturnval += "</div>";
                    appmodaltab2DiagnosticsDiv.InnerHtml = strreturnval;
                }
                //tab3
                strreturnval = "";
                if (ds.Tables[9].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[9].Rows)
                    {
                        strreturnval += "<label class=\"radio radio-inline no-margin font-sm\"><input id=\"appmodaltab3CheckRepair" + dr["ID"].ToString() + "\" name=\"appmodaltab3CheckRepair\" type=\"radio\" class=\"radiobox\" value=\"" + dr["ID"].ToString() + "\"><span>" + dr["NAME"].ToString() + "</span></label>";
                    }
                    appmodaltab3RepairsDiv.InnerHtml = strreturnval;
                }
                //tab3
                appmodaltab3SelectServiceType.DataSource = ds.Tables[10];
                appmodaltab3SelectServiceType.DataTextField = "NAME";
                appmodaltab3SelectServiceType.DataValueField = "ID";
                appmodaltab3SelectServiceType.DataBind();
                //tab3
                strreturnval = "";
                if (ds.Tables[11].Rows.Count != 0)
                {
                    strreturnval += "<table id=\"appmodaltab3ServiceListTable\" class=\"table table-hover\"><thead class=\"hide\"><tr><th>&nbsp;</th><th>&nbsp;</th></tr></thead><tbody>";
                    foreach (DataRow dr in ds.Tables[11].Rows)
                    {
                        if (dr["NAME"].ToString().Length > 35) strreturnval += "<tr><td><a href=\"javascript:void(0);\" class=\"btn btn-link btn-xs font-sm txt-color-blueDark no-padding no-margin\" rel=\"popover-hover\" data-placement=\"bottom\" data-content=\"" + dr["NAME"].ToString() + "\">" + dr["NAME"].ToString().Substring(0, 35) + "...</a></td><td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Сонгох\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + dr["ID"].ToString() + "\" data-toggle=\"modal\" data-target=\"#appmodaltab3AddServiceModal\" onclick=\"appModaltab3ShowAddTab1(this)\"><i class=\"fa fa-plus\"></i></a></td></tr>";
                        else strreturnval += "<tr><td class=\"font-sm\">" + dr["NAME"].ToString() + "</td><td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Сонгох\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + dr["ID"].ToString() + "\" data-toggle=\"modal\" data-target=\"#appmodaltab3AddServiceModal\" onclick=\"appModaltab3ShowAddTab1(this)\"><i class=\"fa fa-plus\"></i></a></td></tr>";
                    }
                    strreturnval += "</tbody></table>";
                    strreturnval += "<script>var responsiveHelper_appmodaltab3ServiceListTable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#appmodaltab3ServiceListTable').dataTable({\"bLengthChange\" : false, \"iDisplayLength\": \"All\", \"paging\": false, \"ordering\": false, \"info\": false, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_appmodaltab3ServiceListTable) {responsiveHelper_appmodaltab3ServiceListTable = new ResponsiveDatatablesHelper($('#appmodaltab3ServiceListTable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_appmodaltab3ServiceListTable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_appmodaltab3ServiceListTable.respond();}}); $('#appmodaltab3ServiceListDiv').find('.dt-toolbar').find('div:eq(0)').attr('class','col-xs-12 col-sm-12');</script>";
                }
                else strreturnval += "<i>Мэдээлэл олдсонгүй</i>";
                appmodaltab3ServiceListDiv.InnerHtml = strreturnval;

                //tab4
                appmodaltab4SelectPartType.DataSource = ds.Tables[12];
                appmodaltab4SelectPartType.DataTextField = "NAME";
                appmodaltab4SelectPartType.DataValueField = "ID";
                appmodaltab4SelectPartType.DataBind();
                //tab4
                strreturnval = "";
                if (ds.Tables[13].Rows.Count != 0)
                {
                    strreturnval += "<table id=\"appmodaltab4PartListTable\" class=\"table table-hover\"><thead class=\"hide\"><tr><th>&nbsp;</th><th>&nbsp;</th></tr></thead><tbody>";
                    foreach (DataRow dr in ds.Tables[13].Rows)
                    {
                        if (dr["NAME"].ToString().Length > 35) strreturnval += "<tr><td><a href=\"javascript:void(0);\" class=\"btn btn-link btn-xs font-sm txt-color-blueDark no-padding no-margin\" rel=\"popover-hover\" data-placement=\"bottom\" data-content=\"" + dr["NAME"].ToString() + "\">" + dr["NAME"].ToString().Substring(0, 35) + "...</a></td><td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Сонгох\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + dr["ID"].ToString() + "\" data-toggle=\"modal\" data-target=\"#appmodaltab4AddPartModal\" onclick=\"appModaltab4ShowAddTab1(this)\"><i class=\"fa fa-plus\"></i></a></td></tr>";
                        else strreturnval += "<tr><td class=\"font-sm\">" + dr["NAME"].ToString() + "</td><td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Сонгох\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + dr["ID"].ToString() + "\" data-toggle=\"modal\" data-target=\"#appmodaltab4AddPartModal\" onclick=\"appModaltab4ShowAddTab1(this)\"><i class=\"fa fa-plus\"></i></a></td></tr>";
                    }
                    strreturnval += "</tbody></table>";
                    strreturnval += "<script>var responsiveHelper_appmodaltab4PartListTable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#appmodaltab4PartListTable').dataTable({\"bLengthChange\" : false, \"iDisplayLength\": \"All\", \"paging\": false, \"ordering\": false, \"info\": false, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_appmodaltab4PartListTable) {responsiveHelper_appmodaltab4PartListTable = new ResponsiveDatatablesHelper($('#appmodaltab4PartListTable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_appmodaltab4PartListTable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_appmodaltab4PartListTable.respond();}}); $('#appmodaltab4PartListDiv').find('.dt-toolbar').find('div:eq(0)').attr('class','col-xs-12 col-sm-12');</script>";
                }
                else strreturnval += "<i>Мэдээлэл олдсонгүй</i>";
                appmodaltab4PartListDiv.InnerHtml = strreturnval;

                //calendarActiveMechanicalList
                strreturnval = "";
                if (ds.Tables[17].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[17].Rows)
                    {
                        if (dr["ID"].ToString() != "") {
                            //strreturnval += "<div class=\"checkbox\">";
                            strreturnval += "<label class=\"checkbox\">";
                            strreturnval += "<input id=\"calendarActiveMechanicModalSelectStaff" + dr["ID"].ToString() + "\" name=\"calendarActiveMechanicModalSelectStaff\" type=\"checkbox\" value=\"" + dr["ID"].ToString() + "\"><i></i><span>" + dr["NAME"].ToString() + "</span>";
                            strreturnval += "</label>";
                            //strreturnval += "</div>";
                        }
                    }
                    calendarActiveMechanicModalDivStaffList.InnerHtml = strreturnval;
                }

                myObjModifyDB.DBDisconnectSql();

                //patient discount list
                strreturnval = "<label class=\"label\" lang=\"mn\">*Хөнглөлт/карт</label><div class=\"inline-group\">";
                if (ds.Tables[19].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[19].Rows)
                    {
                        strreturnval += "<label class=\"radio margin-right-5 font-sm\"><input id=\"calendarInputDiscount" + dr["ID"].ToString() + "\" name=\"calendarInputDiscount\" type=\"radio\" value=\"" + dr["ID"].ToString() + "\"><i></i><span>" + dr["NAME"].ToString() + "</span></label>";
                    }
                    strreturnval += "</div>";
                    calendarDiscountsDiv.InnerHtml = strreturnval;
                }

                //patient discount list
                strreturnval = "<label class=\"label font-sm\" lang=\"mn\">*Хөнглөлт/карт</label><div class=\"inline-group\">";
                if (ds.Tables[19].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[19].Rows)
                    {
                        strreturnval += "<label class=\"radio margin-right-5 font-sm\"><input id=\"patientModalInputDiscount" + dr["ID"].ToString() + "\" name=\"patientModalInputDiscount\" type=\"radio\" value=\"" + dr["ID"].ToString() + "\" class=\"input-sm\"><i></i><span>" + dr["NAME"].ToString() + "</span></label>";
                    }
                    strreturnval += "</div>";
                    patientModalDiscountsDiv.InnerHtml = strreturnval;
                }

                //limit
                applmtmsg.Value = "ӨНӨӨДРИЙН ЗАХИАЛГЫН ХЯЗГААР ДҮҮРСЭН БАЙНА. СИСТЕМИЙН АДМИНТАЙ ХОЛБОО БАРИНА УУ!";
                applmtnm.Value = "10";
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