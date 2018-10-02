using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking
{
    public partial class ws : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //login
        [WebMethod]
        public static void WSSessionKill()
        {
            HttpContext.Current.Session["eBook_UserID"] = null;
        }

        //task
        //taskstat
        [WebMethod]
        public static string taskstat_taskstatTab1Datatable(string clinicid, string typeid, string yr, string mnth)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskstatTab1Datatable(clinicid, typeid, yr, mnth);
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
        [WebMethod]
        public static string taskstat_taskstatTab2Datatable(string clinicid, string typeid)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskstatTab2Datatable(clinicid, typeid);
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
        [WebMethod]
        public static string taskstat_taskstatTab3Datatable(string clinicid)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskstatTab3Datatable(clinicid);
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
        [WebMethod]
        public static string taskstat_taskstatTab4Datatable(string clinicid)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskstatTab4Datatable(clinicid);
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
        [WebMethod]
        public static string taskstat_taskstatTypeListForDDL(string clinicid)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskstatTypeListForDDL(clinicid);
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
        [WebMethod]
        public static string taskstat_taskstatMnttypeListForDDL(string clinicid)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskstatMnttypeListForDDL(clinicid);
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
        [WebMethod]
        public static string taskmission_taskmissionTab1Datatable(string clinicid, string typeid, string curruserid, string albaid, string evaltypeid, string createdstaffid)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskmissionTab1Datatable(clinicid, typeid, curruserid, albaid, evaltypeid, createdstaffid);
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
        [WebMethod]
        public static string taskmissionTab1StaffListForSelect2(string clinicid, string selectedidlist)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskmissionTab1StaffListForSelect2(clinicid, selectedidlist);
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
        [WebMethod]
        public static string taskmissionTab1UserListForSelect2(string clinicid, string selectedidlist)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.taskmissionTab1UserListForSelect2(clinicid, selectedidlist);
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
        [WebMethod]
        public static void INS_TASKMISSION(string CLINIC_ID, string MISSIONTYPE_ID, string TASK_STAT_TYPE_ID, string NO, string NAME, string DT, string MEMO, string CREATEDSTAFFID, string CREATEDUSERID, string STAFFLIST, string USERLIST, string FILENAME)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            string[] ParamName = new string[12], ParamValue = new string[12];
            try
            {
                ParamName[0] = "@CLINIC_ID";
                ParamName[1] = "@MISSIONTYPE_ID";
                ParamName[2] = "@TASK_STAT_TYPE_ID ";
                ParamName[3] = "@NO";
                ParamName[4] = "@NAME";
                ParamName[5] = "@DT";
                ParamName[6] = "@MEMO";
                ParamName[7] = "@CREATEDSTAFFID";
                ParamName[8] = "@CREATEDUSERID";
                ParamName[9] = "@STAFFLIST";
                ParamName[10] = "@USERLIST";
                ParamName[11] = "@FILENAME";
                ParamValue[0] = CLINIC_ID;
                ParamValue[1] = MISSIONTYPE_ID;
                ParamValue[2] = TASK_STAT_TYPE_ID;
                ParamValue[3] = NO;
                ParamValue[4] = NAME;
                ParamValue[5] = DT;
                ParamValue[6] = MEMO;
                ParamValue[7] = CREATEDSTAFFID;
                ParamValue[8] = CREATEDUSERID;
                ParamValue[9] = STAFFLIST;
                ParamValue[10] = USERLIST;
                ParamValue[11] = FILENAME;
                myObjModifyDB.SP_ExecuteNonQuery("INS_TASKMISSION", ParamName, ParamValue);
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
        [WebMethod]
        public static void UPT_TASKMISSION(string ID, string MISSIONTYPE_ID, string TASK_STAT_TYPE_ID, string NO, string NAME, string DT, string MEMO, string CREATEDSTAFFID, string CREATEDUSERID, string STAFFLIST, string USERLIST, string FILENAME)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            string[] ParamName = new string[12], ParamValue = new string[12];
            try
            {
                ParamName[0] = "@ID";
                ParamName[1] = "@MISSIONTYPE_ID";
                ParamName[2] = "@TASK_STAT_TYPE_ID ";
                ParamName[3] = "@NO";
                ParamName[4] = "@NAME";
                ParamName[5] = "@DT";
                ParamName[6] = "@MEMO";
                ParamName[7] = "@CREATEDSTAFFID";
                ParamName[8] = "@CREATEDUSERID";
                ParamName[9] = "@STAFFLIST";
                ParamName[10] = "@USERLIST";
                ParamName[11] = "@FILENAME";
                ParamValue[0] = ID;
                ParamValue[1] = MISSIONTYPE_ID;
                ParamValue[2] = TASK_STAT_TYPE_ID;
                ParamValue[3] = NO;
                ParamValue[4] = NAME;
                ParamValue[5] = DT;
                ParamValue[6] = MEMO;
                ParamValue[7] = CREATEDSTAFFID;
                ParamValue[8] = CREATEDUSERID;
                ParamValue[9] = STAFFLIST;
                ParamValue[10] = USERLIST;
                ParamValue[11] = FILENAME;
                myObjModifyDB.SP_ExecuteNonQuery("UPT_TASKMISSION", ParamName, ParamValue);
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
        [WebMethod]
        public static string tasknews_tasknewsTab1Datatable(string clinicid)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjGetData.tasknewsTab1Datatable(clinicid);
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