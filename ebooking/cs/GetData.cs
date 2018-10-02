using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace ebooking.cs
{
    public class GetData
    {
        public string DataTableToJson(DataTable dt) {
            List<Dictionary<string, string>> ListRows = new List<Dictionary<string, string>>();
            Dictionary<string, string> DicRow;
            if (dt.Rows.Count != 0) {
                foreach (DataRow dr in dt.Rows) {
                    DicRow = new Dictionary<string, string>();
                    foreach (DataColumn col in dt.Columns) {
                        DicRow.Add(col.ColumnName, dr[col].ToString());
                    }
                    ListRows.Add(DicRow);
                }
            }
            return (new JavaScriptSerializer().Serialize(ListRows));
        }
        public void exeptionMethod(Exception ex) {
            HttpContext.Current.Session["errorMessage"] = ex.Message;
            HttpContext.Current.Session["errorStackTrace"] = ex.StackTrace;
            HttpContext.Current.Session["error500"] = "Message: "+ex.Message+"<br>StrackTrace"+ex.StackTrace;
        }
        public bool checkUserSession()
        {
            if (HttpContext.Current.Session["eBook_UserID"] != null) return true;
            else return false;
        }
        public string getReplaceDatabaseToDisplay(string val)
        {
            try
            {
                ModifyDB myObj = new ModifyDB();
                return val.Replace("lt;", "<").Replace("gt;", ">").Replace("quot;", "\"").Replace("apos;", "'").Replace("amp;", "&").Replace("bsol;", "\\").Replace("none", "");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string getReplaceDisplayToDatabase(string val)
        {
            try
            {
                ModifyDB myObj = new ModifyDB();
                return val.Replace("<", "lt;").Replace(">", "gt;").Replace("\"", "quot;").Replace("'", "apos;").Replace("&", "amp;").Replace("\\", "bsol;");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //task
        //taskstat
        public string taskstatTab1Datatable(string clinicid, string typeid, string yr, string mnth)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "";
                if (typeid != "") typeid = " AND a.TASK_STAT_TYPE_ID=" + typeid;
                strreturnval += "<table id=\"pTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                strreturnval += "<thead>";
                strreturnval += "<tr>";
                strreturnval += "<th lang=\"mn\">#</th>";
                strreturnval += "<th data-class=\"expand\" lang=\"mn\">Нэр</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Алба</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Ажилтан</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Нэгж төрөл</th>";
                strreturnval += "<th lang=\"mn\">Төлөвлөгөө</th>";
                strreturnval += "<th lang=\"mn\">Гүйцэтгэл</th>";
                strreturnval += "<th lang=\"mn\">Биелэлт</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Сүүлд засварласан</th>";
                strreturnval += "<th>&nbsp;</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ROW_NUMBER() OVER(ORDER BY b.NO, a.NO, a.ID) AS RW
    , a.ID
    , a.TASK_STAT_TYPE_ID
    , CAST(b.NO as varchar)+'. '+b.NAME as TASK_STAT_TYPE_NAME
    , CAST(a.NO as varchar)+'. '+a.NAME as TASK_STAT_NAME
    , a.STAFFNAME
    , a.MNTTYPE_ID
    , c.NAME as MNTTYPE_NAME
    , ISNULL(d.PLANCRY,0) as PLANCRY
    , ISNULL(d.PERFCRY,0) as PERFCRY
    , CAST(ROUND((CAST(ISNULL(d.PERFCRY,0) as decimal)/CAST(CASE WHEN ISNULL(d.PLANCRY,0)=0 THEN 1 ELSE ISNULL(d.PLANCRY,0) END as decimal))*100,1) as numeric(18,1)) as IMPLPER
    , CONVERT(VARCHAR(24), d.LAST_UPDATE, 20) as LAST_UPDATE
    , CASE WHEN CAST(ROUND((CAST(ISNULL(d.PERFCRY,0) as decimal)/CAST(CASE WHEN ISNULL(d.PLANCRY,0)=0 THEN 1 ELSE ISNULL(d.PLANCRY,0) END as decimal))*100,0) as smallint)<50 THEN 'bg-color-red' ELSE CASE WHEN CAST(ROUND((CAST(ISNULL(d.PERFCRY,0) as decimal)/CAST(CASE WHEN ISNULL(d.PLANCRY,0)=0 THEN 1 ELSE ISNULL(d.PLANCRY,0) END as decimal))*100,0) as smallint)>49 AND CAST(ROUND((CAST(ISNULL(d.PERFCRY,0) as decimal)/CAST(CASE WHEN ISNULL(d.PLANCRY,0)=0 THEN 1 ELSE ISNULL(d.PLANCRY,0) END as decimal))*100,0) as smallint)<80 THEN 'bg-color-orangeDark' ELSE CASE WHEN CAST(ROUND((CAST(ISNULL(d.PERFCRY,0) as decimal)/CAST(CASE WHEN ISNULL(d.PLANCRY,0)=0 THEN 1 ELSE ISNULL(d.PLANCRY,0) END as decimal))*100,0) as smallint)>79 THEN 'bg-color-greenDark' END END END as PERCOLOR
FROM TBL_TASK_STAT a
INNER JOIN TBL_TASK_STAT_TYPE b ON a.TASK_STAT_TYPE_ID = b.ID AND b.CLINIC_ID = a.CLINIC_ID
INNER JOIN TBL_MNTTYPE c ON a.MNTTYPE_ID = c.ID AND c.CLINIC_ID = a.CLINIC_ID
LEFT JOIN TBL_TASK_STAT_VAL d ON a.ID=d.TASK_STAT_ID AND d.YR="+yr+" AND d.MNTH="+mnth+@"
WHERE a.CLINIC_ID = " + clinicid +typeid+ @"
ORDER BY b.NO, a.NO");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr data-id=\""+dr["ID"].ToString()+"\">";
                        strreturnval += "<td>" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["TASK_STAT_NAME"].ToString() + "</td>";
                        strreturnval += "<td data-id=\"" + dr["TASK_STAT_TYPE_ID"].ToString() + "\">" + dr["TASK_STAT_TYPE_NAME"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["STAFFNAME"].ToString() + "</td>";
                        strreturnval += "<td data-id=\"" + dr["MNTTYPE_ID"].ToString() + "\">" + dr["MNTTYPE_NAME"].ToString() + "</td>";
                        strreturnval += "<td class=\"text-right cry\" onclick=\"funcTab1Cry(this);\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["PLANCRY"].ToString())).Replace("$", String.Empty) + "</td>";
                        strreturnval += "<td class=\"text-right cry\" onclick=\"funcTab1Cry(this);\">" + String.Format("{0:C0}", Convert.ToDecimal(dr["PERFCRY"].ToString())).Replace("$", String.Empty) + "</td>";
                        strreturnval += "<td class=\"text-right\"><span class=\"font-sm label " + dr["PERCOLOR"].ToString() + "\">" + dr["IMPLPER"].ToString() + " %</span></td>";
                        strreturnval += "<td>" + dr["LAST_UPDATE"].ToString() + "</td>";
                        strreturnval += "<td></td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                strreturnval += "<script>var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },null, null, null, { \"sWidth\": \"70px\" }, null, null, { \"sWidth\": \"50px\" }, { \"sWidth\": \"120px\", \"sClass\": \"text-center\" },{ \"sWidth\": \"25px\", \"sClass\": \"text-center\", \"bSortable\": false }]});</script>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
        public string taskstatTab2Datatable(string clinicid, string typeid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "";
                if (typeid != "") typeid = " AND a.TASK_STAT_TYPE_ID=" + typeid;
                strreturnval += "<table id=\"pTab2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                strreturnval += "<thead>";
                strreturnval += "<tr>";
                strreturnval += "<th lang=\"mn\">#</th>";
                strreturnval += "<th lang=\"mn\">Дугаар</th>";
                strreturnval += "<th data-class=\"expand\" lang=\"mn\">Нэр</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Алба</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Ажилтан</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Нэгж төрөл</th>";
                strreturnval += "<th>&nbsp;</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ROW_NUMBER() OVER(ORDER BY b.NO, a.NO, a.ID) AS RW
    , a.ID
    , a.TASK_STAT_TYPE_ID
    , CAST(b.NO as varchar)+'. '+b.NAME as TASK_STAT_TYPE_NAME
    , a.NO as TASK_STAT_NO
    , a.NAME as TASK_STAT_NAME
    , a.STAFFNAME
    , a.MNTTYPE_ID
    , c.NAME as MNTTYPE_NAME
FROM TBL_TASK_STAT a
INNER JOIN TBL_TASK_STAT_TYPE b ON a.TASK_STAT_TYPE_ID = b.ID AND b.CLINIC_ID = a.CLINIC_ID
INNER JOIN TBL_MNTTYPE c ON a.MNTTYPE_ID = c.ID AND c.CLINIC_ID = a.CLINIC_ID
WHERE a.CLINIC_ID = " + clinicid + typeid + @"
ORDER BY b.NO, a.NO");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr data-id=\"" + dr["ID"].ToString() + "\">";
                        strreturnval += "<td>" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["TASK_STAT_NO"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["TASK_STAT_NAME"].ToString() + "</td>";
                        strreturnval += "<td data-id=\"" + dr["TASK_STAT_TYPE_ID"].ToString() + "\">" + dr["TASK_STAT_TYPE_NAME"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["STAFFNAME"].ToString() + "</td>";
                        strreturnval += "<td data-id=\"" + dr["MNTTYPE_ID"].ToString() + "\">" + dr["MNTTYPE_NAME"].ToString() + "</td>";
                        strreturnval += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab2Modal\" onclick=\"showAddEditTab2(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab2(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                strreturnval += "<script>var responsiveHelper_pTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab2Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab2Datatable) {responsiveHelper_pTab2Datatable = new ResponsiveDatatablesHelper($('#pTab2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab2Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\" },null, null, null, { \"sWidth\": \"70px\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});</script>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
        public string taskstatTab3Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "";
                strreturnval += "<table id=\"pTab3Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                strreturnval += "<thead>";
                strreturnval += "<tr>";
                strreturnval += "<th lang=\"mn\">#</th>";
                strreturnval += "<th lang=\"mn\">Дугаар</th>";
                strreturnval += "<th data-class=\"expand\" lang=\"mn\">Нэр</th>";
                strreturnval += "<th>&nbsp;</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ROW_NUMBER() OVER(ORDER BY NO, ID) AS RW
	, ID
    , NO
	, NAME
FROM TBL_TASK_STAT_TYPE 
WHERE CLINIC_ID="+clinicid+@"
ORDER BY NO, ID");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr data-id=\"" + dr["ID"].ToString() + "\">";
                        strreturnval += "<td>" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["NO"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["NAME"].ToString() + "</td>";
                        strreturnval += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab3Modal\" onclick=\"showAddEditTab3(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab3(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                strreturnval += "<script>var responsiveHelper_pTab3Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab3Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab3Datatable) {responsiveHelper_pTab3Datatable = new ResponsiveDatatablesHelper($('#pTab3Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab3Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab3Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\" },null,{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});</script>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
        public string taskstatTab4Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "";
                strreturnval += "<table id=\"pTab4Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                strreturnval += "<thead>";
                strreturnval += "<tr>";
                strreturnval += "<th lang=\"mn\">#</th>";
                strreturnval += "<th data-class=\"expand\" lang=\"mn\">Нэр</th>";
                strreturnval += "<th style=\"width:40px;\">&nbsp;</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ROW_NUMBER() OVER(ORDER BY NAME, ID) AS RW
	, ID
	, NAME
FROM TBL_MNTTYPE 
WHERE CLINIC_ID=" + clinicid + @"
ORDER BY NAME, ID");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr data-id=\"" + dr["ID"].ToString() + "\">";
                        strreturnval += "<td>" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["NAME"].ToString() + "</td>";
                        strreturnval += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab4Modal\" onclick=\"showAddEditTab4(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab4(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                strreturnval += "<script>var responsiveHelper_pTab4Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab4Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab4Datatable) {responsiveHelper_pTab4Datatable = new ResponsiveDatatablesHelper($('#pTab4Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab4Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab4Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },null,{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});</script>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
        public string taskstatTypeListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "";
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, CAST(NO as varchar)+'. '+NAME as NAME FROM TBL_TASK_STAT_TYPE WHERE CLINIC_ID=" + clinicid+" ORDER BY NO");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<option value=\"" + dr["ID"].ToString() + "\">" + dr["NAME"].ToString() + "</option>";
                    }
                }
                myObjModifyDB.DBDisconnectSql();
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
        public string taskstatMnttypeListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "";
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, NAME FROM TBL_MNTTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY NAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<option value=\"" + dr["ID"].ToString() + "\">" + dr["NAME"].ToString() + "</option>";
                    }
                }
                myObjModifyDB.DBDisconnectSql();
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }

        //taskmission
        public string taskmissionTab1Datatable(string clinicid, string typeid, string curruserid, string albaid, string evaltypeid, string createdstaffid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "";
                if (albaid != "") albaid = " AND b.TASK_STAT_TYPE_ID=" + albaid;
                if (evaltypeid != "") evaltypeid = " AND b.TASK_MISSIONEVALTYPE_ID=" + evaltypeid;
                if (createdstaffid != "") createdstaffid = " AND b.CREATEDSTAFFID=" + createdstaffid;
                strreturnval += "<table id=\"pTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                strreturnval += "<thead>";
                strreturnval += "<tr>";
                strreturnval += "<th lang=\"mn\">#</th>";
                strreturnval += "<th lang=\"mn\">Дугаар</th>";
                strreturnval += "<th data-class=\"expand\" lang=\"mn\">Нэр</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Алба</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Үүсгэсэн<br>огноо</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Дуусгах<br>огноо</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Үүсгэсэн ажилтан</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Хариуцах ажилтан</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Тайлбар</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\"><i class=\"fa fa-paperclip\"></i></th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Үр дүн</th>";
                strreturnval += "<th>&nbsp;</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                string strQry = @"SELECT
	 ROW_NUMBER() OVER(ORDER BY c.NO, b.NO, a.ID) AS RW
	, a.ID
	, b.NO
	, b.NAME
	, b.TASK_STAT_TYPE_ID
	, CAST(c.NO as varchar)+'. '+c.NAME as TASK_STAT_TYPE_NAME
	, b.MEMO
	, b.CREATEDDATE
	, b.DT
	, b.CREATEDSTAFFID
	, LEFT(d.LNAME,1)+'.'+d.FNAME as CREATEDSTAFFNAME
	, a.STAFFIDLIST
	, a.STAFFNAMELIST
	, a.USERIDLIST
    , b.CREATEDUSERID
	, b.TASK_MISSIONEVALTYPE_ID
    , ISNULL(f.COLOR,'bg-color-red') as COLOR
    , b.[FILENAME]
FROM (
	SELECT 
		a.ID
		, a.STAFFIDLIST
		, a.STAFFNAMELIST 
		, STUFF((SELECT ','+CAST(c.[ID] as varchar) 
			FROM TBL_TASK_MISSION_VIEWUSER b
			INNER JOIN TBL_USER c ON b.[USER_ID]=c.ID
			INNER JOIN TBL_TASK_MISSION d ON b.TASK_MISSION_ID=d.ID
			WHERE d.MISSIONTYPE_ID=" + typeid + albaid.Replace("b.", "d.") + evaltypeid.Replace("b.", "d.") + createdstaffid.Replace("b.", "d.") + @" AND a.ID=b.TASK_MISSION_ID
			FOR XML PATH('')), 1, 1, '') as USERIDLIST
	FROM (
		SELECT 
			a.ID
			, STUFF((SELECT ', '+LEFT(c.LNAME,1)+'.'+c.FNAME 
				FROM TBL_TASK_MISSION_STAFF b
				INNER JOIN TBL_STAFF c ON b.STAFF_ID=c.ID
				INNER JOIN TBL_TASK_MISSION d ON b.TASK_MISSION_ID=d.ID 
				WHERE d.MISSIONTYPE_ID=" + typeid + albaid.Replace("b.", "d.") + evaltypeid.Replace("b.", "d.") + createdstaffid.Replace("b.", "d.") + @" AND a.ID=b.TASK_MISSION_ID
				FOR XML PATH('')), 1, 1, '') as STAFFNAMELIST
			, STUFF((SELECT ','+CAST(b.STAFF_ID as varchar) 
				FROM TBL_TASK_MISSION_STAFF b
				INNER JOIN TBL_STAFF c ON b.STAFF_ID=c.ID
				INNER JOIN TBL_TASK_MISSION d ON b.TASK_MISSION_ID=d.ID 
				WHERE d.MISSIONTYPE_ID=" + typeid + albaid.Replace("b.", "d.") + evaltypeid.Replace("b.", "d.") + createdstaffid.Replace("b.", "d.") + @" AND a.ID=b.TASK_MISSION_ID
				FOR XML PATH('')), 1, 1, '') as STAFFIDLIST
		FROM (
			SELECT a.ID
			FROM TBL_TASK_MISSION a
			INNER JOIN TBL_TASK_MISSION_VIEWUSER b ON a.ID=b.TASK_MISSION_ID
			WHERE (b.[USER_ID]=" + curruserid + " OR a.CREATEDUSERID=" + curruserid + ") AND a.MISSIONTYPE_ID=" + typeid + albaid.Replace("b.", "a.") + evaltypeid.Replace("b.", "a.") + createdstaffid.Replace("b.", "a.") + @"
			GROUP BY a.ID
		) a
	) a
) a
INNER JOIN TBL_TASK_MISSION b ON a.ID=b.ID
INNER JOIN TBL_TASK_STAT_TYPE c ON b.TASK_STAT_TYPE_ID=c.ID
INNER JOIN TBL_STAFF d ON b.CREATEDSTAFFID=d.ID
LEFT JOIN TBL_TASK_MISSIONEVALTYPE f ON b.TASK_MISSIONEVALTYPE_ID=f.ID
ORDER BY c.NO, b.NO, a.ID";
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT
	 ROW_NUMBER() OVER(ORDER BY c.NO, b.NO, a.ID) AS RW
	, a.ID
	, b.NO
	, b.NAME
	, b.TASK_STAT_TYPE_ID
	, CAST(c.NO as varchar)+'. '+c.NAME as TASK_STAT_TYPE_NAME
	, b.MEMO
	, b.CREATEDDATE
	, b.DT
	, b.CREATEDSTAFFID
	, LEFT(d.LNAME,1)+'.'+d.FNAME as CREATEDSTAFFNAME
	, a.STAFFIDLIST
	, a.STAFFNAMELIST
	, a.USERIDLIST
    , b.CREATEDUSERID
	, b.TASK_MISSIONEVALTYPE_ID
    , ISNULL(f.COLOR,'bg-color-red') as COLOR
    , b.[FILENAME]
FROM (
	SELECT 
		a.ID
		, a.STAFFIDLIST
		, a.STAFFNAMELIST 
		, STUFF((SELECT ','+CAST(c.[ID] as varchar) 
			FROM TBL_TASK_MISSION_VIEWUSER b
			INNER JOIN TBL_USER c ON b.[USER_ID]=c.ID
			INNER JOIN TBL_TASK_MISSION d ON b.TASK_MISSION_ID=d.ID
			WHERE d.MISSIONTYPE_ID=" + typeid + albaid.Replace("b.", "d.") + evaltypeid.Replace("b.", "d.") + createdstaffid.Replace("b.", "d.") + @" AND a.ID=b.TASK_MISSION_ID
			FOR XML PATH('')), 1, 1, '') as USERIDLIST
	FROM (
		SELECT 
			a.ID
			, STUFF((SELECT ', '+LEFT(c.LNAME,1)+'.'+c.FNAME 
				FROM TBL_TASK_MISSION_STAFF b
				INNER JOIN TBL_STAFF c ON b.STAFF_ID=c.ID
				INNER JOIN TBL_TASK_MISSION d ON b.TASK_MISSION_ID=d.ID 
				WHERE d.MISSIONTYPE_ID=" + typeid + albaid.Replace("b.", "d.") + evaltypeid.Replace("b.", "d.") + createdstaffid.Replace("b.", "d.") + @" AND a.ID=b.TASK_MISSION_ID
				FOR XML PATH('')), 1, 1, '') as STAFFNAMELIST
			, STUFF((SELECT ','+CAST(b.STAFF_ID as varchar) 
				FROM TBL_TASK_MISSION_STAFF b
				INNER JOIN TBL_STAFF c ON b.STAFF_ID=c.ID
				INNER JOIN TBL_TASK_MISSION d ON b.TASK_MISSION_ID=d.ID 
				WHERE d.MISSIONTYPE_ID=" + typeid + albaid.Replace("b.", "d.") + evaltypeid.Replace("b.", "d.") + createdstaffid.Replace("b.", "d.") + @" AND a.ID=b.TASK_MISSION_ID
				FOR XML PATH('')), 1, 1, '') as STAFFIDLIST
		FROM (
			SELECT a.ID
			FROM TBL_TASK_MISSION a
			INNER JOIN TBL_TASK_MISSION_VIEWUSER b ON a.ID=b.TASK_MISSION_ID
			WHERE (b.[USER_ID]=" + curruserid + " OR a.CREATEDUSERID=" + curruserid + ") AND a.MISSIONTYPE_ID=" + typeid + albaid.Replace("b.", "a.") + evaltypeid.Replace("b.", "a.") + createdstaffid.Replace("b.", "a.") + @"
			GROUP BY a.ID
		) a
	) a
) a
INNER JOIN TBL_TASK_MISSION b ON a.ID=b.ID
INNER JOIN TBL_TASK_STAT_TYPE c ON b.TASK_STAT_TYPE_ID=c.ID
INNER JOIN TBL_STAFF d ON b.CREATEDSTAFFID=d.ID
LEFT JOIN TBL_TASK_MISSIONEVALTYPE f ON b.TASK_MISSIONEVALTYPE_ID=f.ID
ORDER BY c.NO, b.NO, a.ID");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr data-id=\"" + dr["ID"].ToString() + "\" data-useridlist=\"" + dr["USERIDLIST"].ToString() + "\">";
                        strreturnval += "<td>" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["NO"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["NAME"].ToString() + "</td>";
                        strreturnval += "<td data-id=\"" + dr["TASK_STAT_TYPE_ID"].ToString() + "\">" + dr["TASK_STAT_TYPE_NAME"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["CREATEDDATE"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["DT"].ToString() + "</td>";
                        strreturnval += "<td data-id=\"" + dr["CREATEDSTAFFID"].ToString() + "\">" + dr["CREATEDSTAFFNAME"].ToString() + "</td>";
                        strreturnval += "<td data-id=\"" + dr["STAFFIDLIST"].ToString() + "\">" + dr["STAFFNAMELIST"].ToString() + "</td>";
                        strreturnval += "<td><a class=\"btn btn-default btn-xs\" href=\"../pg/taskmissionmemomodal.aspx?id=" + dr["ID"].ToString() + "\" data-toggle=\"modal\" data-target=\"#pTab1MemoModal\"><i class=\"fa fa-eye\"></i> <span lang=\"mn\">харах</span></a></td>";
                        strreturnval += "<td>";
                        if (dr["FILENAME"].ToString() != "") strreturnval += "<a href=\"../files/task/"+ dr["FILENAME"].ToString() + "\" class=\"btn btn-link btn-xs\" style=\"padding: 0px; border: none;\" download=\"\" title=\"Хавсаргасан файл татах\"><i class=\"fa fa-paperclip fa-lg\"></i></a>";
                        strreturnval += "</td>";
                        strreturnval += "<td><select class=\"form-control " + dr["COLOR"].ToString() + "\" style=\"color:#fff; font-weight:bold; border:none; height:21px;width: 100px;padding: 0px;\" onchange=\"saveEval(this);\">";
                        if (dr["TASK_MISSIONEVALTYPE_ID"].ToString() == "" || dr["TASK_MISSIONEVALTYPE_ID"].ToString() == "1")
                        {
                            strreturnval += "<option value=\"1\" class=\"bg-color-red\" style\"color:#fff; font-weight:bold\" selected=\"selected\">Биелээгүй</option>";
                            strreturnval += "<option value=\"2\" class=\"bg-color-orangeDark\" style\"color:#fff; font-weight:bold\">Хэрэгжиж байгаа</option>";
                            strreturnval += "<option value=\"3\" class=\"bg-color-greenDark\" style\"color:#fff; font-weight:bold\">Биелсэн</option>";
                        }
                        else if (dr["TASK_MISSIONEVALTYPE_ID"].ToString() == "2")
                        {
                            strreturnval += "<option value=\"1\" class=\"bg-color-red\" style\"color:#fff; font-weight:bold\">Биелээгүй</option>";
                            strreturnval += "<option value=\"2\" class=\"bg-color-orangeDark\" style\"color:#fff; font-weight:bold\" selected=\"selected\">Хэрэгжиж байгаа</option>";
                            strreturnval += "<option value=\"3\" class=\"bg-color-greenDark\" style\"color:#fff; font-weight:bold\">Биелсэн</option>";
                        }
                        else if (dr["TASK_MISSIONEVALTYPE_ID"].ToString() == "3")
                        {
                            strreturnval += "<option value=\"1\" class=\"bg-color-red\" style\"color:#fff; font-weight:bold\">Биелээгүй</option>";
                            strreturnval += "<option value=\"2\" class=\"bg-color-orangeDark\" style\"color:#fff; font-weight:bold\">Хэрэгжиж байгаа</option>";
                            strreturnval += "<option value=\"3\" class=\"bg-color-greenDark\" style\"color:#fff; font-weight:bold\" selected=\"selected\">Биелсэн</option>";
                        }
                        else 
                        {
                            strreturnval += "<option value=\"1\" class=\"bg-color-red\" style\"color:#fff; font-weight:bold\" selected=\"selected\">Биелээгүй</option>";
                            strreturnval += "<option value=\"2\" class=\"bg-color-orangeDark\" style\"color:#fff; font-weight:bold\">Хэрэгжиж байгаа</option>";
                            strreturnval += "<option value=\"3\" class=\"bg-color-greenDark\" style\"color:#fff; font-weight:bold\">Биелсэн</option>";
                        }
                        strreturnval += "</select></td>";
                        strreturnval += "<td>";
                        if(dr["CREATEDUSERID"].ToString() == curruserid) strreturnval += "<button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab1Modal\" onclick=\"showAddEditTab1(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></button>";
                        strreturnval += "</td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                strreturnval += "<script>var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\" },null, null, { \"sWidth\": \"65px\" }, { \"sWidth\": \"65px\" }, null, null, { \"sWidth\": \"100px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"5px\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});</script>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
        public string taskmissionTab1StaffListForSelect2(string clinicid, string selectedidlist) {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "", strIsSelected = "";
                strreturnval = "<select id=\"pTab1ModalSelect2Staff\" name=\"pTab1ModalSelect2Staff\" multiple style=\"width: 100%;\">";
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT
    a.ID
    ,  a.FNAME+'. '+LEFT(a.LNAME, 1) + ' | ' + b.NAME as NAME
FROM TBL_STAFF a
INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID = b.ID
WHERE a.CLINIC_ID = " + clinicid + @" AND a.ISACTIVE = 1
ORDER BY LEFT(a.LNAME, 1) + '.' + a.FNAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        for (int i = 0; i < selectedidlist.Split(',').Length; i++) {
                            if (dr["ID"].ToString() == selectedidlist.Split(',')[i]) strIsSelected = " selected=\"selected\"";
                        }                        
                        strreturnval += "<option"+ strIsSelected + " value=\"" + dr["ID"].ToString() + "\">" + dr["NAME"].ToString() + "</option>";
                        strIsSelected = "";
                    }
                }
                strreturnval += "</select><script>$(\"#pTab1ModalSelect2Staff\").select2();</script>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
        public string taskmissionTab1UserListForSelect2(string clinicid, string selectedidlist)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "", strIsSelected = "";
                strreturnval = "<select id=\"pTab1ModalSelect2User\" name=\"pTab1ModalSelect2User\" multiple style=\"width: 100%;\" place-holder=\"Хэрэглэгч сонго\">";
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ID, USERNAME+' | '+USERDESCRIPTION as NAME FROM TBL_USER WHERE CLINIC_ID="+clinicid+" ORDER BY USERNAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        for (int i = 0; i < selectedidlist.Split(',').Length; i++)
                        {
                            if (dr["ID"].ToString() == selectedidlist.Split(',')[i]) strIsSelected = " selected=\"selected\"";
                        }
                        strreturnval += "<option" + strIsSelected + " value=\"" + dr["ID"].ToString() + "\">" + dr["NAME"].ToString() + "</option>";
                        strIsSelected = "";
                    }
                }
                strreturnval += "</select><script>$(\"#pTab1ModalSelect2User\").select2();</script>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }

        //tasknews
        public string tasknewsTab1Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            try
            {
                if (!checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "";
                strreturnval += "<table id=\"pTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                strreturnval += "<thead>";
                strreturnval += "<tr>";
                strreturnval += "<th lang=\"mn\">#</th>";
                strreturnval += "<th data-hide=\"phone\" lang=\"mn\">Огноо</th>";
                strreturnval += "<th data-class=\"expand\" lang=\"mn\">Гарчиг</th>";
                strreturnval += "<th lang=\"mn\">Нэр</th>";
                strreturnval += "<th>&nbsp;</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ROW_NUMBER() OVER(ORDER BY CREATEDDATE DESC) AS RW, ID, CREATEDDATE, TITLE, NAME FROM TBL_TASK_NEWS WHERE CLINIC_ID=1 ORDER BY CREATEDDATE DESC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr data-id=\"" + dr["ID"].ToString() + "\">";
                        strreturnval += "<td>" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["CREATEDDATE"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["TITLE"].ToString() + "</td>";
                        strreturnval += "<td>" + dr["NAME"].ToString() + "</td>";
                        strreturnval += "<td>";
                        strreturnval += "<button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab1Modal\" onclick=\"showAddEditTab1(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></button>";
                        strreturnval += "</td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                strreturnval += "<script>var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\" },null, null, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});</script>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
    }
}