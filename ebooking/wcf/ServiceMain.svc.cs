using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.Web.Hosting;

namespace ebooking.wcf
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ServiceMain" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ServiceMain.svc or ServiceMain.svc.cs at the Solution Explorer and start debugging.
    public class ServiceMain : IServiceMain
    {
        public void ExecuteNonQuery(string qry)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                myObjModifyDB.ExecuteNonQuery(qry);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string ExecuteScalar(string qry)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                return myObjModifyDB.ExecuteScalar(qry).ToString();
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string ExecuteDataSet(string qry)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(qry);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        public void DeleteFile(string fileurl)
        {
            ModifyDB myObjDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                FileInfo file = new FileInfo(HostingEnvironment.MapPath(fileurl));
                if (file.Exists) file.Delete();
            }
            catch (MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        public void Write_registeredmarkno(string type, string value, string updatevalue)
        {
            string path = HostingEnvironment.ApplicationPhysicalPath + "files\\registeredmarkno.txt";
            if (type == "insert")
            {
                if (!File.Exists(path)) using (StreamWriter sw = File.CreateText(path)) sw.WriteLine(value);
                else using (StreamWriter sw = File.AppendText(path)) sw.WriteLine(value);
            }
            else if (type == "update")
            {
                string text = File.ReadAllText(path);
                text = text.Replace(value, updatevalue);
                File.WriteAllText(path, text);
            }
            else if (type == "delete")
            {
                string text = File.ReadAllText(path);
                text = text.Replace(value + "\r\n", String.Empty);
                File.WriteAllText(path, text);
            }
        }
        public void Write_registeredvinno(string type, string value, string updatevalue)
        {
            string path = HostingEnvironment.ApplicationPhysicalPath + "files\\registeredvinno.txt";
            if (type == "insert")
            {
                if (!File.Exists(path)) using (StreamWriter sw = File.CreateText(path)) sw.WriteLine(value);
                else using (StreamWriter sw = File.AppendText(path)) sw.WriteLine(value);
            }
            else if (type == "update")
            {
                string text = File.ReadAllText(path);
                text = text.Replace(value, updatevalue);
                File.WriteAllText(path, text);
            }
            else if (type == "delete")
            {
                string text = File.ReadAllText(path);
                text = text.Replace(value + "\r\n", String.Empty);
                File.WriteAllText(path, text);
            }
        }
        public void SessionKill()
        {
            HttpContext.Current.Session["eBook_UserID"] = null;
        }

        //*****login.html*****//
        public void Login_checklogin(string username, string password)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
            SqlCommand cmd;
            try
            {
                if (con.State == ConnectionState.Closed) con.Open();
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "EXEC CheckLogin N'" + username + "', N'" + password + "'";
                cmd.Connection = con;
                if (cmd.ExecuteScalar().ToString() == "0") throw new cs.MyException("Нэвтрэх нэр, нууц үг буруу байна!");
                else
                {
                    cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT ID FROM TBL_USER WHERE USERNAME='" + username + "'";
                    cmd.Connection = con;
                    HttpContext.Current.Session["eBook_UserID"] = cmd.ExecuteScalar().ToString();
                }
            }
            catch (NullReferenceException ex) { throw new cs.MyException("Нэвтрэх нэр, нууц үг буруу байна!"); }
            catch (cs.MyException ex) { throw ex; }
            catch (Exception ex) { throw new cs.MyException("Нэвтрэлт амжилтгүй боллоо.", ex); }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        //*****part.aspx*****//
        public string PartTab1Datatable(string parttype, string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (parttype != "") parttype = " AND PART_TYPE_ID=" + parttype;
            else parttype = "";
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, CODE, NAME, [DESCRIPTION], ISNULL(PRICE,0) as PRICE, PART_TYPE_ID FROM TBL_PART WHERE CLINIC_ID=" + clinicid + parttype + " ORDER BY CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PartTab2Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, NAME FROM TBL_PART_TYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PartPartTypeListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(" SELECT ID, NAME FROM TBL_PART_TYPE WHERE CLINIC_ID=" + clinicid + "");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PartTab3Datatable(string parttype, string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (parttype != "") parttype = " AND b.PART_TYPE_ID=" + parttype;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT a.PART_ID, b.PART_TYPE_ID, c.NAME as PART_TYPE, b.CODE + ' | ' + b.NAME as [PART], b.PRICE, a.BEGINDATE + ' - ' + a.ENDDATE as [BETWEENDATE], a.PER, ROUND((ISNULL(b.PRICE, 0) / 100) * ISNULL(a.PER, 0), 0) as DISCPRICE, CASE WHEN d.PART_ID is null THEN 'class=\"danger\"' ELSE null END as ISACTIVE FROM TBL_PARTDISC a INNER JOIN TBL_PART b ON a.PART_ID = b.ID INNER JOIN TBL_PART_TYPE c ON b.PART_TYPE_ID = c.ID AND b.CLINIC_ID = c.CLINIC_ID LEFT JOIN ( SELECT PART_ID FROM TBL_PARTDISC WHERE GETDATE() BETWEEN CONVERT(datetime, BEGINDATE) AND CONVERT(datetime, ENDDATE) ) d ON a.PART_ID = d.PART_ID WHERE b.CLINIC_ID = " + clinicid + parttype + " ORDER BY b.PART_TYPE_ID, b.CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PartPartListForDDL(string parttype, string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, CODE + ' | ' + NAME as [PART] FROM TBL_PART WHERE CLINIC_ID = " + clinicid + " AND PART_TYPE_ID = " + parttype + " ORDER BY CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PartTab4Datatable(string parttype, string startdate, string enddate, string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string strDayList = "";
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                for (var day = new DateTime(Int32.Parse(startdate.Split('-')[0]), Int32.Parse(startdate.Split('-')[1]), Int32.Parse(startdate.Split('-')[2])); day <= new DateTime(Int32.Parse(enddate.Split('-')[0]), Int32.Parse(enddate.Split('-')[1]), Int32.Parse(enddate.Split('-')[2])); day = day.AddDays(1)) {
                    if (strDayList != "") strDayList += ", \""+day.ToString("yyyy-MM-dd")+"\"";
                    else strDayList += "\"" + day.ToString("yyyy-MM-dd") + "\"";
                }
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"declare @date_from datetime, @date_to datetime
set @date_from = '"+ startdate + @"'
set @date_to = '" + enddate + @"'
;with dates as(
    select @date_from as dt
    union all
    select DATEADD(d,1,dt) from dates where dt<@date_to
)
SELECT * 
FROM (
	SELECT a.ID, a.CODE, a.NAME, a.DT, ISNULL(b.CNT,0) as CNT
	FROM
	(
		SELECT a.ID, a.CODE, a.NAME, b.DT
		FROM TBL_PART a,
		(
			SELECT CONVERT(nvarchar(10), dt, 121) as DT FROM dates
		) b
		WHERE a.PART_TYPE_ID="+ parttype + @"
	) a
	LEFT JOIN TBL_PART_DEMAND b ON a.ID=b.PART_ID AND a.DT=b.DT
) src
PIVOT(
	SUM(CNT)
	FOR DT IN ("+ strDayList + @")
) PIV");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PartqExcelBulkUpload(string clinicid, string typeid)
        {
            ModifyDB myObj = new ModifyDB();
            GetData myObjGetData = new GetData();
            DataSet ds = null;
            ds = new DataSet();
            string xConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~") + "files\\part\\PartTemp.xls;Extended Properties=Excel 8.0;";
            int intRownum = 1, intSuccessRowCount = 0;
            string strErrMsg = "", strQry = "";
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                using (OleDbConnection connection = new OleDbConnection(xConnStr))
                {
                    OleDbCommand command = new OleDbCommand("SELECT * FROM [Sheet1$]", connection);
                    connection.Open();
                    using (OleDbDataAdapter adapter = new OleDbDataAdapter(command))
                    {
                        adapter.Fill(ds);
                    }
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        intRownum = 1; intSuccessRowCount = 0;
                        strErrMsg = "";
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            try
                            {
                                intRownum++;
                                if (myObj.ExecuteScalar("SELECT COUNT(1) as CNT FROM TBL_PART WHERE CLINIC_ID=" + clinicid + " AND CODE=N'" + myObjGetData.getReplaceDisplayToDatabase(dr["CODE"].ToString()) + "'").ToString() == "0")
                                    strQry = "INSERT INTO TBL_PART (CLINIC_ID, CODE, NAME, DESCRIPTION, PRICE, PART_TYPE_ID) VALUES (" + clinicid + ", N'" + myObjGetData.getReplaceDisplayToDatabase(dr["CODE"].ToString()) + "', N'" + myObjGetData.getReplaceDisplayToDatabase(dr["NAME"].ToString()) + "', N'" + myObjGetData.getReplaceDisplayToDatabase(dr["DESCRIPTION"].ToString()) + "', " + dr["PRICE"].ToString().Split('.')[0].Replace(",", "") + ", " + typeid + ")";
                                else
                                    strQry = "UPDATE TBL_PART SET NAME=N'" + myObjGetData.getReplaceDisplayToDatabase(dr["NAME"].ToString()) + "', DESCRIPTION=N'" + myObjGetData.getReplaceDisplayToDatabase(dr["DESCRIPTION"].ToString()) + "', PRICE=" + dr["PRICE"].ToString().Split('.')[0].Replace(",", "") + ", PART_TYPE_ID=" + typeid + " WHERE CLINIC_ID=" + clinicid + " AND CODE=N'" + myObjGetData.getReplaceDisplayToDatabase(dr["CODE"].ToString()) + "'";
                                myObj.ExecuteNonQuery(strQry);
                                intSuccessRowCount++;
                            }
                            catch (Exception ex)
                            {
                                if (strErrMsg != "") strErrMsg += ", ";
                                strErrMsg += intRownum.ToString();
                            }

                        }
                    }
                }
                return "Нийт " + ds.Tables[0].Rows.Count.ToString() + " мөрнөөс " + intSuccessRowCount.ToString() + " амжилттай хадгалагдлаа. Алдаатай мөрийн дугаар: " + strErrMsg;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }

        }

        //*****patient.aspx*****//
        public string PatientDatatableFilterByAutoNo(string clinicid, string autono)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT * 
FROM(
    SELECT ROW_NUMBER() OVER(ORDER BY a.CODE DESC) AS RW, a.ID, a.CODE, a.NAME, CASE WHEN a.[TYPE] = 1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as [TYPE], b.NAME as MARK_NAME, a.PRODUCEDYEAR, a.AUTONO, a.VINNO, ISNULL(c.CNT, 0) as APP_CNT, CASE WHEN a.ISMYSOLD=1 THEN 'danger' ELSE null END AS ISMYSOLD, ISNULL(d.ZAALT,0) as ZAALT 
    FROM TBL_PATIENT a
    INNER JOIN TBL_AUTOMARK b ON a.MARK_ID = b.ID
    LEFT JOIN(
        SELECT a.PATIENT_ID, COUNT(a.ID) as CNT
        FROM TBL_APPOINTMENT a
        INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID = b.ID
        WHERE a.CLINIC_ID = " + clinicid + @" AND b.ISACTIVESHOW = 1
        GROUP BY a.PATIENT_ID
    ) c ON a.ID = c.PATIENT_ID
    LEFT JOIN (
        SELECT a.PATIENT_ID, b.MILEAGE as ZAALT
        FROM (
		    SELECT a.PATIENT_ID, MAX(a.ID) as APPID 
		    FROM TBL_APPOINTMENT a 
		    INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID 
		    WHERE a.CLINIC_ID=" + clinicid + @" AND b.ISACTIVESHOW=1
		    GROUP BY a.PATIENT_ID
        ) a
        INNER JOIN TBL_APPOINTMENT b ON a.APPID=b.ID
	) d ON a.ID = d.PATIENT_ID
    WHERE a.CLINIC_ID = " + clinicid + "  AND a.AUTONO LIKE N'%" + autono + @"%'
) a
WHERE RW >= 1 AND RW <= 100");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PatientDatatableFilterByVinNo(string clinicid, string vinno)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT * 
FROM(
    SELECT ROW_NUMBER() OVER(ORDER BY a.CODE DESC) AS RW, a.ID, a.CODE, a.NAME, CASE WHEN a.[TYPE] = 1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as [TYPE], b.NAME as MARK_NAME, a.PRODUCEDYEAR, a.AUTONO, a.VINNO, ISNULL(c.CNT, 0) as APP_CNT, CASE WHEN a.ISMYSOLD=1 THEN 'danger' ELSE null END AS ISMYSOLD, ISNULL(d.ZAALT,0) as ZAALT 
    FROM TBL_PATIENT a
    INNER JOIN TBL_AUTOMARK b ON a.MARK_ID = b.ID
    LEFT JOIN(
        SELECT a.PATIENT_ID, COUNT(a.ID) as CNT
        FROM TBL_APPOINTMENT a
        INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID = b.ID
        WHERE a.CLINIC_ID = " + clinicid + @" AND b.ISACTIVESHOW = 1
        GROUP BY a.PATIENT_ID
    ) c ON a.ID = c.PATIENT_ID
    LEFT JOIN (
        SELECT a.PATIENT_ID, b.MILEAGE as ZAALT
        FROM (
		    SELECT a.PATIENT_ID, MAX(a.ID) as APPID 
		    FROM TBL_APPOINTMENT a 
		    INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID 
		    WHERE a.CLINIC_ID=" + clinicid + @" AND b.ISACTIVESHOW=1
		    GROUP BY a.PATIENT_ID
        ) a
        INNER JOIN TBL_APPOINTMENT b ON a.APPID=b.ID
	) d ON a.ID = d.PATIENT_ID
    WHERE a.CLINIC_ID = " + clinicid + "  AND a.VINNO LIKE N'%" + vinno + @"%'
) a
WHERE RW >= 1 AND RW <= 100");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PatientDatatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT * 
FROM ( 
	SELECT ROW_NUMBER() OVER(ORDER BY a.CODE DESC) AS RW, a.ID, a.CODE, a.NAME, CASE WHEN a.[TYPE]=1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as [TYPE], b.NAME as MARK_NAME, a.PRODUCEDYEAR, a.AUTONO, a.VINNO, ISNULL(c.CNT,0) as APP_CNT, CASE WHEN a.ISMYSOLD=1 THEN 'danger' ELSE null END AS ISMYSOLD, ISNULL(d.ZAALT,0) as ZAALT  
	FROM TBL_PATIENT a 
	INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID 
	LEFT JOIN (
		SELECT a.PATIENT_ID, COUNT(a.ID) as CNT 
		FROM TBL_APPOINTMENT a 
		INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID 
		WHERE a.CLINIC_ID=" + clinicid + @" AND b.ISACTIVESHOW=1
		GROUP BY a.PATIENT_ID
	) c ON a.ID = c.PATIENT_ID
    LEFT JOIN (
        SELECT a.PATIENT_ID, b.MILEAGE as ZAALT
        FROM (
		    SELECT a.PATIENT_ID, MAX(a.ID) as APPID 
		    FROM TBL_APPOINTMENT a 
		    INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID 
		    WHERE a.CLINIC_ID=" + clinicid + @" AND b.ISACTIVESHOW=1
		    GROUP BY a.PATIENT_ID
        ) a
        INNER JOIN TBL_APPOINTMENT b ON a.APPID=b.ID
	) d ON a.ID = d.PATIENT_ID
	WHERE a.CLINIC_ID=" + clinicid + @" 
) a
WHERE RW >= 1 AND RW<= 100");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PatientDatatableFilterByOwnerName(string clinicid, string name)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT * 
FROM(
    SELECT ROW_NUMBER() OVER(ORDER BY a.CODE DESC) AS RW, a.ID, a.CODE, a.NAME, CASE WHEN a.[TYPE] = 1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as [TYPE], b.NAME as MARK_NAME, a.PRODUCEDYEAR, a.AUTONO, a.VINNO, ISNULL(c.CNT, 0) as APP_CNT, CASE WHEN a.ISMYSOLD=1 THEN 'danger' ELSE null END AS ISMYSOLD, ISNULL(d.ZAALT,0) as ZAALT 
    FROM TBL_PATIENT a
    INNER JOIN TBL_AUTOMARK b ON a.MARK_ID = b.ID
    LEFT JOIN(
        SELECT a.PATIENT_ID, COUNT(a.ID) as CNT
        FROM TBL_APPOINTMENT a
        INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID = b.ID
        WHERE a.CLINIC_ID = " + clinicid + @" AND b.ISACTIVESHOW = 1
        GROUP BY a.PATIENT_ID
    ) c ON a.ID = c.PATIENT_ID
    LEFT JOIN (
        SELECT a.PATIENT_ID, b.MILEAGE as ZAALT
        FROM (
		    SELECT a.PATIENT_ID, MAX(a.ID) as APPID 
		    FROM TBL_APPOINTMENT a 
		    INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID 
		    WHERE a.CLINIC_ID=" + clinicid + @" AND b.ISACTIVESHOW=1
		    GROUP BY a.PATIENT_ID
        ) a
        INNER JOIN TBL_APPOINTMENT b ON a.APPID=b.ID
	) d ON a.ID = d.PATIENT_ID
    WHERE a.CLINIC_ID = " + clinicid + "  AND a.NAME LIKE N'%" + name + @"%'
) a
WHERE RW >= 1 AND RW <= 100");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string PatientDatatableFilterByTel(string clinicid, string tel)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT * 
FROM(
    SELECT ROW_NUMBER() OVER(ORDER BY a.CODE DESC) AS RW, a.ID, a.CODE, a.NAME, CASE WHEN a.[TYPE] = 1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as [TYPE], b.NAME as MARK_NAME, a.PRODUCEDYEAR, a.AUTONO, a.VINNO, ISNULL(c.CNT, 0) as APP_CNT, CASE WHEN a.ISMYSOLD=1 THEN 'danger' ELSE null END AS ISMYSOLD, ISNULL(d.ZAALT,0) as ZAALT 
    FROM TBL_PATIENT a
    INNER JOIN TBL_AUTOMARK b ON a.MARK_ID = b.ID
    LEFT JOIN(
        SELECT a.PATIENT_ID, COUNT(a.ID) as CNT
        FROM TBL_APPOINTMENT a
        INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID = b.ID
        WHERE a.CLINIC_ID = " + clinicid + @" AND b.ISACTIVESHOW = 1
        GROUP BY a.PATIENT_ID
    ) c ON a.ID = c.PATIENT_ID
    LEFT JOIN (
        SELECT a.PATIENT_ID, b.MILEAGE as ZAALT
        FROM (
		    SELECT a.PATIENT_ID, MAX(a.ID) as APPID 
		    FROM TBL_APPOINTMENT a 
		    INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID 
		    WHERE a.CLINIC_ID=" + clinicid + @" AND b.ISACTIVESHOW=1
		    GROUP BY a.PATIENT_ID
        ) a
        INNER JOIN TBL_APPOINTMENT b ON a.APPID=b.ID
	) d ON a.ID = d.PATIENT_ID
    WHERE a.CLINIC_ID = " + clinicid + "  AND a.TEL LIKE N'%" + tel + @"%'
) a
WHERE RW >= 1 AND RW <= 100");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****calendar.aspx*****//
        public string CalendarAppointmentTimeListForDLL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string strreturnval = "";
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string struseval = myObjModifyDB.ExecuteScalar("SELECT (SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=" + clinicid + " AND KEYCODE='calendarstarttime')+'~'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=" + clinicid + " AND KEYCODE='calendarendtime')+'~'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=" + clinicid + " AND KEYCODE='calendarinterval')").ToString();
                DateTime dateValueStart = new DateTime(2014, 1, 1, Int32.Parse(struseval.Split('~')[0].Split(':')[0]), Int32.Parse(struseval.Split('~')[0].Split(':')[1]), 0);
                DateTime dateValueEnd = new DateTime(2014, 1, 1, Int32.Parse(struseval.Split('~')[1].Split(':')[0]), Int32.Parse(struseval.Split('~')[1].Split(':')[1]), 0);
                while (dateValueStart < dateValueEnd)
                {
                    strreturnval += "<option>" + dateValueStart.ToString("HH:mm") + "</option>";
                    dateValueStart = dateValueStart.AddMinutes(Int32.Parse(struseval.Split('~')[2]));
                }
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string CalendarAutomarkListForDDL(string automarktype, string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, NAME FROM TBL_AUTOMARK WHERE CLINIC_ID = " + clinicid + " AND AUTOMARK_TYPE_ID=" + automarktype + " ORDER BY NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Appmodaltab3Datatable1(string servicetype)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, CODE+' '+NAME as NAME FROM TBL_SERVICE WHERE SERVICE_TYPE_ID=" + servicetype + " ORDER BY CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Appmodaltab3Datatable2(string appid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, SERVICE_CODE, SERVICE_NAME, CNT, DESCRIPTION FROM TBL_APPOINTMENT_SERVICE WHERE APPOINTMENT_ID=" + appid + " ORDER BY SERVICE_CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Appmodaltab4Datatable1(string parttype)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, CODE+' '+NAME as NAME FROM TBL_PART WHERE PART_TYPE_ID=" + parttype + " ORDER BY CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Appmodaltab4Datatable2(string appid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, PART_CODE, PART_NAME, CNT, DESCRIPTION FROM TBL_APPOINTMENT_PART WHERE APPOINTMENT_ID=" + appid + " ORDER BY PART_CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public void INS_APPOINTMENT(string CLINIC_ID, string ROOM_ID, string CHAIRNUM, string PATIENT_ID, string DT, string STARTTIME, string ENDTIME, string APPOINTMENTTYPE, string REQUESTMEMO, string REQUESTTYPELISTID, string MILEAGE, string ISWASHING, string ISGETPART, string SUBMIT_STAFFID, string STAFFID)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string[] ParamName = new string[15], ParamValue = new string[15];
            try
            {
                //if (Int32.Parse(myObjModifyDB.ExecuteScalar("SELECT COUNT(1) as CNT FROM TBL_APPOINTMENT WHERE DT=N'" + DT + "'").ToString()) >= 10)
                //{
                //    throw new cs.MyException("ӨНӨӨДРИЙН ЗАХИАЛГЫН ХЯЗГААР ДҮҮРСЭН БАЙНА. СИСТЕМИЙН АДМИНТАЙ ХОЛБОО БАРИНА УУ!");
                //}
                //else {
                    ParamName[0] = "@CLINIC_ID";
                    ParamName[1] = "@ROOM_ID";
                    ParamName[2] = "@CHAIRNUM ";
                    ParamName[3] = "@PATIENT_ID";
                    ParamName[4] = "@DT";
                    ParamName[5] = "@STARTTIME";
                    ParamName[6] = "@ENDTIME";
                    ParamName[7] = "@APPOINTMENTTYPE";
                    ParamName[8] = "@REQUESTMEMO";
                    ParamName[9] = "@REQUESTTYPELISTID";
                    ParamName[10] = "@MILEAGE";
                    ParamName[11] = "@ISWASHING";
                    ParamName[12] = "@ISGETPART";
                    ParamName[13] = "@SUBMIT_STAFFID";
                    ParamName[14] = "@STAFFID";
                    ParamValue[0] = CLINIC_ID;
                    ParamValue[1] = ROOM_ID;
                    ParamValue[2] = CHAIRNUM;
                    ParamValue[3] = PATIENT_ID;
                    ParamValue[4] = DT;
                    ParamValue[5] = STARTTIME;
                    ParamValue[6] = ENDTIME;
                    ParamValue[7] = APPOINTMENTTYPE;
                    ParamValue[8] = REQUESTMEMO;
                    ParamValue[9] = REQUESTTYPELISTID;
                    ParamValue[10] = MILEAGE;
                    ParamValue[11] = ISWASHING;
                    ParamValue[12] = ISGETPART;
                    ParamValue[13] = SUBMIT_STAFFID;
                    ParamValue[14] = STAFFID;
                    myObjModifyDB.SP_ExecuteNonQuery("INS_APPOINTMENT", ParamName, ParamValue);
                //}
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public void INSUPD_APPDIAGNOSTIC(string APPOINTMENT_ID, string DIAGNOSTICLISTID, string DIAGNOSTIC_NAME, string SENIORMECHANICAL_STAFFID, string MECHANICAL_STAFFID, string SERVICECONSULTANT_STAFFID, string STAFFID)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string[] ParamName = new string[7], ParamValue = new string[7];
            try
            {
                ParamName[0] = "@APPOINTMENT_ID";
                ParamName[1] = "@DIAGNOSTICLISTID";
                ParamName[2] = "@DIAGNOSTIC_NAME ";
                ParamName[3] = "@SENIORMECHANICAL_STAFFID";
                ParamName[4] = "@MECHANICAL_STAFFID";
                ParamName[5] = "@SERVICECONSULTANT_STAFFID";
                ParamName[6] = "@STAFFID";
                ParamValue[0] = APPOINTMENT_ID;
                ParamValue[1] = DIAGNOSTICLISTID;
                ParamValue[2] = DIAGNOSTIC_NAME;
                ParamValue[3] = SENIORMECHANICAL_STAFFID;
                ParamValue[4] = MECHANICAL_STAFFID;
                ParamValue[5] = SERVICECONSULTANT_STAFFID;
                ParamValue[6] = STAFFID;
                myObjModifyDB.SP_ExecuteNonQuery("INSUPD_APPDIAGNOSTIC", ParamName, ParamValue);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string CalendarActiveWorkedMechanic(string clinicid, string dt) {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT b.FNAME+'.'+LEFT(b.LNAME,1) as MECHANICAL_STAFFNAME
	FROM (
		SELECT DISTINCT a.MECHANICAL_STAFFID
		FROM TBL_APPOINTMENT_REPAIR a
		INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID
		WHERE b.CLINIC_ID="+ clinicid + " AND a.MECHANICAL_STAFFID IS NOT NULL AND b.APPOINTMENT_TYPE_ID<>4 AND b.APPOINTMENT_TYPE_ID<>5 AND b.APPOINTMENT_TYPE_ID<>4 AND b.APPOINTMENT_TYPE_ID<>5 AND b.DT='" + dt + @"'
		GROUP BY a.MECHANICAL_STAFFID
	) a
	INNER JOIN TBL_STAFF b ON a.MECHANICAL_STAFFID=b.ID
	ORDER BY b.FNAME, b.LNAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string CalendarActiveCameMechanic(string clinicid, string dt)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT a.STAFF_ID, b.FNAME+'.'+LEFT(b.LNAME,1) as MECHANICAL_STAFFNAME
FROM (
	SELECT DISTINCT a.STAFF_ID 
	FROM TBL_STAFFTRCDLOG a
	INNER JOIN TBL_STAFF b ON a.STAFF_ID=b.ID 
	WHERE a.CLINIC_ID=" + clinicid + " AND b.STAFF_POSITION_ID IN (SELECT STAFF_POSITION_ID FROM TBL_JOBPOSITION WHERE ID=2) AND a.DT = '"+ dt + @"'
	GROUP BY a.STAFF_ID
) a
INNER JOIN TBL_STAFF b ON a.STAFF_ID=b.ID
ORDER BY b.FNAME, b.LNAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string AutonoAutocomplete(string clinicid, string autono)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT TOP 10 AUTONO FROM TBL_PATIENT WHERE CLINIC_ID=" + clinicid + " AND AUTONO LIKE N'" + autono + "%' ORDER BY AUTONO ASC");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string VinnoAutocomplete(string clinicid, string vinno)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT TOP 10 VINNO FROM TBL_PATIENT WHERE CLINIC_ID=" + clinicid + " AND VINNO LIKE N'" + vinno + "%' ORDER BY VINNO ASC");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string OwnernameAutocomplete(string clinicid, string name)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT TOP 10 NAME FROM TBL_PATIENT WHERE CLINIC_ID=" + clinicid + " AND NAME LIKE N'" + name + "%' ORDER BY NAME ASC");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string TelAutocomplete(string clinicid, string tel)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT TOP 10 TEL FROM TBL_PATIENT WHERE CLINIC_ID=" + clinicid + " AND TEL LIKE N'" + tel + "%' ORDER BY TEL ASC");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****automark.aspx*****//
        public string AutomarkTab1TypeListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, NAME FROM TBL_AUTOMARK_TYPE WHERE CLINIC_ID = " + clinicid + " ORDER BY NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string AutomarkTab1Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT a.ID, ROW_NUMBER() OVER(ORDER BY a.NAME) AS RW, a.NAME, b.ID as AUTOMARK_TYPE_ID, b.NAME as AUTOMARK_TYPE_NAME FROM TBL_AUTOMARK a INNER JOIN TBL_AUTOMARK_TYPE b ON a.AUTOMARK_TYPE_ID=b.ID WHERE a.CLINIC_ID=" + clinicid + " ORDER BY a.NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string AutomarkTab2Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, ROW_NUMBER() OVER(ORDER BY NAME) AS RW, NAME FROM TBL_AUTOMARK_TYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****changepass.aspx*****//
        public void Changepass(string userid, string oldpass, string newpass)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                if (myObjModifyDB.ExecuteScalar("SELECT COUNT(1) FROM TBL_USER WHERE ID=" + userid + " AND convert(varchar(MAX),DecryptByPassPhrase('nirvana', PASSWORD))='" + oldpass + "'").ToString() == "0")
                {
                    throw new cs.MyException("Хуучин нууц үг буруу байна!");
                }
                else
                {
                    myObjModifyDB.ExecuteNonQuery("UPDATE TBL_USER SET PASSWORD=EncryptByPassPhrase('nirvana', '" + newpass + "' ) WHERE ID=" + userid + "");
                }
            }
            catch (cs.MyException ex) { throw ex; }
            catch (Exception ex) { throw new cs.MyException("Хүсэлт амжилтгүй боллоо", ex); }
        }

        //*****service.aspx*****//
        public string ServiceTab1Datatable(string servicetype, string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (servicetype != "") servicetype = " AND SERVICE_TYPE_ID=" + servicetype;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, CODE, NAME, [DESCRIPTION], ISNULL(PRICE,0) as PRICE, SERVICE_TYPE_ID FROM TBL_SERVICE WHERE CLINIC_ID=" + clinicid + servicetype + " ORDER BY CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string ServiceTab2Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, NAME FROM TBL_SERVICE_TYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string ServiceServiceTypeListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(" SELECT ID, NAME FROM TBL_SERVICE_TYPE WHERE CLINIC_ID=" + clinicid + "");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string ServiceTab3Datatable(string servicetype, string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (servicetype != "") servicetype = " AND b.SERVICE_TYPE_ID=" + servicetype;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT a.SERVICE_ID, b.SERVICE_TYPE_ID, c.NAME as SERVICE_TYPE, b.CODE + ' | ' + b.NAME as [SERVICE], b.PRICE, a.BEGINDATE + ' - ' + a.ENDDATE as [BETWEENDATE], a.PER, ROUND((ISNULL(b.PRICE, 0) / 100) * ISNULL(a.PER, 0), 0) as DISCPRICE, CASE WHEN d.SERVICE_ID is null THEN 'class=\"danger\"' ELSE null END as ISACTIVE FROM TBL_SERVICEDISC a INNER JOIN TBL_SERVICE b ON a.SERVICE_ID = b.ID INNER JOIN TBL_SERVICE_TYPE c ON b.SERVICE_TYPE_ID = c.ID AND b.CLINIC_ID = c.CLINIC_ID LEFT JOIN ( SELECT SERVICE_ID FROM TBL_SERVICEDISC WHERE GETDATE() BETWEEN CONVERT(datetime, BEGINDATE) AND CONVERT(datetime, ENDDATE) ) d ON a.SERVICE_ID = d.SERVICE_ID WHERE b.CLINIC_ID = " + clinicid + servicetype + " ORDER BY b.SERVICE_TYPE_ID, b.CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string ServiceServiceListForDDL(string servicetype, string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, CODE + ' | ' + NAME as [SERVICE] FROM TBL_SERVICE WHERE CLINIC_ID = " + clinicid + " AND SERVICE_TYPE_ID = " + servicetype + " ORDER BY CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string ServiceqExcelBulkUpload(string clinicid, string typeid)
        {
            ModifyDB myObj = new ModifyDB();
            GetData myObjGetData = new GetData();
            DataSet ds = null;
            ds = new DataSet();
            string xConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~") + "files\\service\\ServiceTemp.xls;Extended Properties=Excel 8.0;";
            int intRownum = 1, intSuccessRowCount = 0;
            string strErrMsg = "", strQry = "";
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                using (OleDbConnection connection = new OleDbConnection(xConnStr))
                {
                    OleDbCommand command = new OleDbCommand("SELECT * FROM [Sheet1$]", connection);
                    connection.Open();
                    using (OleDbDataAdapter adapter = new OleDbDataAdapter(command))
                    {
                        adapter.Fill(ds);
                    }
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        intRownum = 1; intSuccessRowCount = 0;
                        strErrMsg = "";
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            try
                            {
                                intRownum++;
                                if (myObj.ExecuteScalar("SELECT COUNT(1) as CNT FROM TBL_SERVICE WHERE CLINIC_ID=" + clinicid + " AND CODE=N'" + myObjGetData.getReplaceDisplayToDatabase(dr["CODE"].ToString()) + "'").ToString() == "0")
                                    strQry = "INSERT INTO TBL_SERVICE (CLINIC_ID, CODE, NAME, DESCRIPTION, PRICE, SERVICE_TYPE_ID) VALUES (" + clinicid + ", N'" + myObjGetData.getReplaceDisplayToDatabase(dr["CODE"].ToString()) + "', N'" + myObjGetData.getReplaceDisplayToDatabase(dr["NAME"].ToString()) + "', N'" + myObjGetData.getReplaceDisplayToDatabase(dr["DESCRIPTION"].ToString()) + "', " + dr["PRICE"].ToString().Split('.')[0].Replace(",", "") + ", " + typeid + ")";
                                else
                                    strQry = "UPDATE TBL_SERVICE SET NAME=N'" + myObjGetData.getReplaceDisplayToDatabase(dr["NAME"].ToString()) + "', DESCRIPTION=N'" + myObjGetData.getReplaceDisplayToDatabase(dr["DESCRIPTION"].ToString()) + "', PRICE=" + dr["PRICE"].ToString().Split('.')[0].Replace(",", "") + ", SERVICE_TYPE_ID=" + typeid + " WHERE CLINIC_ID=" + clinicid + " AND CODE=N'" + myObjGetData.getReplaceDisplayToDatabase(dr["CODE"].ToString()) + "'";
                                myObj.ExecuteNonQuery(strQry);
                                intSuccessRowCount++;
                            }
                            catch (Exception ex)
                            {
                                if (strErrMsg != "") strErrMsg += ", ";
                                strErrMsg += intRownum.ToString();
                            }

                        }
                    }
                }
                return "Нийт " + ds.Tables[0].Rows.Count.ToString() + " мөрнөөс " + intSuccessRowCount.ToString() + " амжилттай хадгалагдлаа. Алдаатай мөрийн дугаар: " + strErrMsg;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }

        }

        //*****setup.aspx*****//
        public string SetupTab1Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, ROW_NUMBER() OVER(ORDER BY ID) AS RW, NAME, CHAIRNUM FROM TBL_ROOM WHERE CLINIC_ID=" + clinicid + " ORDER BY ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string SetupTab1s2Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT a.ROOM_ID, b.NAME as ROOM_NAME, a.CHAIR, a.TITLE FROM TBL_ROOMTITLE a INNER JOIN TBL_ROOM b ON a.ROOM_ID=b.ID WHERE b.CLINIC_ID=" + clinicid + " ORDER BY a.ROOM_ID, a.CHAIR");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string SetupTab4Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, ROW_NUMBER() OVER(ORDER BY ID) AS RW, NAME FROM TBL_REQUESTTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string SetupTab6Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, ROW_NUMBER() OVER(ORDER BY ID) AS RW, NAME, PRICE FROM TBL_DIAGNOSTICTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string SetupTab7Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, ROW_NUMBER() OVER(ORDER BY ID) AS RW, NAME, ISPRICE FROM TBL_REPAIRTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****staff.aspx*****//
        public string StaffTab1Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT a.ID, a.CODE, a.IDCARD, a.FNAME, a.LNAME, CASE WHEN a.GENDER=1 THEN N'Эр' ELSE N'Эм' END AS GENDER, ISNULL(a.PICTURE,'male.jpg') as PICTURE, b.NAME as POSITIONNAME, CASE WHEN a.ISACTIVE=1 THEN '<span class=\"label label-success\">ACTIVE</span>' ELSE '<span class=\"label label-default\">OFF</span>' END as TYPE, a.DEPARTMENT_ID, CAST(c.NO as nvarchar)+'. '+c.NAME as DEPARTMENT_NAME FROM TBL_STAFF a INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID LEFT JOIN TBL_DEPARTMENT c ON a.DEPARTMENT_ID=c.ID WHERE a.CLINIC_ID=" + clinicid + " ORDER BY c.NO, a.CODE");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string StaffTab1NegjListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT a.ID, a.NAME
FROM (
	SELECT 
		a.ID, CAST(a.NO as nvarchar)+'. '+a.NAME as NAME
	FROM TBL_DEPARTMENT a
	INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID=b.ID
	LEFT OUTER JOIN (
		SELECT a.FATHER_ID
		FROM TBL_DEPARTMENT a
		INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID=b.ID
		WHERE a.DEPARTMENT_TYPE_ID=2 AND b.CLINIC_ID=" + clinicid + @"
		GROUP BY a.FATHER_ID
	) c ON a.ID=c.FATHER_ID
	WHERE a.DEPARTMENT_TYPE_ID=1 AND b.CLINIC_ID=" + clinicid + @" AND c.FATHER_ID is null
	UNION ALL
	SELECT 
		a.ID, CAST(a.NO as nvarchar)+'. '+a.NAME as NAME
	FROM TBL_DEPARTMENT a
	INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID=b.ID
	LEFT OUTER JOIN (
		SELECT a.FATHER_ID
		FROM TBL_DEPARTMENT a
		INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID=b.ID
		WHERE a.DEPARTMENT_TYPE_ID=3 AND b.CLINIC_ID=" + clinicid + @"
		GROUP BY a.FATHER_ID
	) c ON a.ID=c.FATHER_ID
	WHERE a.DEPARTMENT_TYPE_ID=2 AND b.CLINIC_ID=" + clinicid + @" AND c.FATHER_ID is null
	UNION ALL
	SELECT 
		a.ID, CAST(a.NO as nvarchar)+'. '+a.NAME as NAME
	FROM TBL_DEPARTMENT a
	INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID=b.ID
	WHERE a.DEPARTMENT_TYPE_ID=3 AND b.CLINIC_ID=" + clinicid + @"
) a
ORDER BY a.NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string StaffTab2Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet("SELECT ID, ROW_NUMBER() OVER(ORDER BY ID) AS RW, NAME FROM TBL_STAFF_POSITION WHERE CLINIC_ID=" + clinicid + " ORDER BY ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string StaffTab3s1Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT 
    ROW_NUMBER() OVER(ORDER BY a.NO) AS RW, a.ID, a.NO, a.NAME, a.INITNAME, a.FATHER_ID, a.DEPARTMENT_TYPE_ID
FROM TBL_DEPARTMENT a
INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID = b.ID
WHERE a.DEPARTMENT_TYPE_ID=1 AND b.CLINIC_ID = " + clinicid + @"
ORDER BY a.NO");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string StaffHeltesListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT 
    a.ID, CAST(a.NO as nvarchar) + '. ' + a.NAME as NAME
FROM TBL_DEPARTMENT a
INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID = b.ID
WHERE a.DEPARTMENT_TYPE_ID = 1 AND b.CLINIC_ID = " + clinicid + @"
ORDER BY a.NO");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string StaffTab3s2Datatable(string clinicid, string heltesid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (heltesid != "") heltesid = " AND a.FATHER_ID=" + heltesid;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"
SELECT 
	ROW_NUMBER() OVER(ORDER BY c.NO, a.NO) AS RW, a.ID, a.NO, a.NAME, a.INITNAME, a.FATHER_ID as HELTESID, CASE WHEN a.FATHER_ID is not null THEN CAST(c.NO as nvarchar)+ '. ' +c.NAME ELSE null END as HELTESNAME, a.DEPARTMENT_TYPE_ID
FROM TBL_DEPARTMENT a
INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID=b.ID
LEFT JOIN TBL_DEPARTMENT c ON a.FATHER_ID=c.ID AND c.DEPARTMENT_TYPE_ID=1
WHERE a.DEPARTMENT_TYPE_ID=2 AND b.CLINIC_ID=" + clinicid + heltesid + @"
ORDER BY c.NO, a.NO");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string StaffAlbaListForDDL(string clinicid, string heltesid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT 
	a.ID, CAST(a.NO as nvarchar)+ '. ' +a.NAME as NAME
FROM TBL_DEPARTMENT a
INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID=b.ID
WHERE a.DEPARTMENT_TYPE_ID=2 AND b.CLINIC_ID=" + clinicid + " AND a.FATHER_ID=" + heltesid + @"
ORDER BY a.NO");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string StaffTab3s3Datatable(string clinicid, string heltesid, string albaid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (heltesid != "") heltesid = " AND d.ID=" + heltesid;
            if (albaid != "") albaid = " AND c.ID=" + albaid;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT
    ROW_NUMBER() OVER(ORDER BY c.NO, a.NO) AS RW, a.ID, a.NO, a.NAME, a.INITNAME
    , c.ID as ALBAID
    , CASE WHEN c.ID is not null THEN CAST(c.NO as nvarchar) + '. ' + c.NAME ELSE null END as ALBANAME
    , d.ID as HELTESID
    , CASE WHEN d.ID is not null THEN CAST(d.NO as nvarchar) + '. ' + d.NAME ELSE null END as HELTESNAME
    , a.DEPARTMENT_TYPE_ID
FROM TBL_DEPARTMENT a
INNER JOIN TBL_DEPARTMENT_TYPE b ON a.DEPARTMENT_TYPE_ID = b.ID
LEFT JOIN TBL_DEPARTMENT c ON a.FATHER_ID = c.ID AND c.DEPARTMENT_TYPE_ID = 2
LEFT JOIN TBL_DEPARTMENT d ON c.FATHER_ID = d.ID AND d.DEPARTMENT_TYPE_ID = 1
WHERE a.DEPARTMENT_TYPE_ID = 3 AND b.CLINIC_ID = " + clinicid + heltesid + albaid + @" 
ORDER BY c.NO, a.NO");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****usersetup.aspx*****//
        public string UsersetupTab1Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT a.USER_ID, a.ROLEIDLIST, a.ROLENAMELIST, b.USERNAME, b.EMAIL, b.USERDESCRIPTION, convert(varchar(max),DecryptByPassPhrase('nirvana', b.PASSWORD)) as [PASSWORD], STF.STAFFIDLIST
FROM ( 
    select 
        USER_ID, 
        stuff( ( select ', '+ CAST(a.ROLE_ID as nvarchar) from TBL_USER_ROLE a where a.USER_ID = t.USER_ID for XML path('') ),1,1,'') as ROLEIDLIST, 
        stuff( ( select ','+ CAST(b.NAME as nvarchar) from TBL_USER_ROLE a INNER JOIN TBL_ROLE b ON a.ROLE_ID=b.ID where a.USER_ID = t.USER_ID for XML path('') ),1,1,'') as ROLENAMELIST 
    from ( 
        SELECT DISTINCT ID as USER_ID 
        FROM TBL_USER WHERE CLINIC_ID=" + clinicid + @" 
    )t 
) a 
INNER JOIN (
    select 
        USER_ID, 
        stuff( ( select ','+ CAST(a.STAFF_ID as nvarchar) from TBL_USER_STAFF a where a.USER_ID = t.USER_ID for XML path('') ),1,1,'') as STAFFIDLIST 
    from ( 
        SELECT DISTINCT ID as USER_ID 
        FROM TBL_USER WHERE CLINIC_ID=" + clinicid + @" 
    )t 
) STF ON a.[USER_ID]=STF.[USER_ID]
INNER JOIN TBL_USER b ON a.[USER_ID]=b.ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public void INSUPT_USER(string ISINS, string CLINIC_ID, string USERNAME, string PASSWORD, string EMAIL, string USERDESCRIPTION, string ROLELISTID, string STAFFLISTID)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string[] ParamName = new string[8], ParamValue = new string[8];
            try
            {
                ParamName[0] = "@ISINS";
                ParamName[1] = "@CLINIC_ID";
                ParamName[2] = "@USERNAME ";
                ParamName[3] = "@PASSWORD";
                ParamName[4] = "@EMAIL";
                ParamName[5] = "@USERDESCRIPTION";
                ParamName[6] = "@ROLELISTID";
                ParamName[7] = "@STAFFLISTID";
                ParamValue[0] = ISINS;
                ParamValue[1] = CLINIC_ID;
                ParamValue[2] = USERNAME;
                ParamValue[3] = PASSWORD;
                ParamValue[4] = EMAIL;
                ParamValue[5] = USERDESCRIPTION;
                ParamValue[6] = ROLELISTID;
                ParamValue[7] = STAFFLISTID;
                myObjModifyDB.SP_ExecuteNonQuery("INSUPT_USER", ParamName, ParamValue);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        
        //*****rprt1.aspx*****//
        public string Rprt1Tab1Datatable(string clinicid, string apptype, string begindate, string enddate)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (apptype != "") apptype = " AND a.APPOINTMENT_TYPE_ID=" + apptype;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry0 = @"SELECT ROW_NUMBER() OVER(ORDER BY b.NUM) AS RW, g.NAME, g.COLORCLASS, b.NUM, b.DT, b.STARTTIME+'-'+b.ENDTIME as TM,c.NAME as ROOM_NAME, b.CHAIRNUM, d.CODE as PATIENT_CODE, d.AUTONO, a.DIAGNOSTICLIST, a.SERVICELIST, a.PARTLIST, ISNULL(a.PRICESUM,0) as PRICESUM 
FROM(
    SELECT a.APPOINTMENT_ID, a.PRICESUM, a.DIAGNOSTICLIST, a.SERVICELIST, STUFF(ISNULL((SELECT ', ' + x.PART_CODE FROM TBL_APPOINTMENT_PART x WHERE x.APPOINTMENT_ID = a.APPOINTMENT_ID GROUP BY x.PART_CODE ORDER BY x.PART_CODE ASC FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(max)'), ''), 1, 2, '') as PARTLIST
    FROM(
        SELECT a.APPOINTMENT_ID, a.PRICESUM, a.DIAGNOSTICLIST, STUFF(ISNULL((SELECT ', ' + x.SERVICE_CODE FROM TBL_APPOINTMENT_SERVICE x WHERE x.APPOINTMENT_ID = a.APPOINTMENT_ID GROUP BY x.SERVICE_CODE ORDER BY x.SERVICE_CODE ASC FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(max)'), ''), 1, 2, '') as SERVICELIST
        FROM(
            SELECT a.ID as APPOINTMENT_ID, a.PRICESUM, STUFF(ISNULL((SELECT ', ' + y.NAME FROM TBL_APPOINTMENT_DIAGNOSTICTYPE x INNER JOIN TBL_DIAGNOSTICTYPE y ON x.DIAGNOSTICTYPE_ID = y.ID WHERE x.APPOINTMENT_ID = a.ID GROUP BY y.NAME ORDER BY y.NAME DESC FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(max)'), ''), 1, 2, '') as DIAGNOSTICLIST
            FROM(
                SELECT a.ID, SUM(a.PRICESUM) as PRICESUM
                FROM(
                    SELECT a.ID, ISNULL(SUM(c.PRICE), 0) as PRICESUM
                    FROM TBL_APPOINTMENT a
                    LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE b ON a.ID = b.APPOINTMENT_ID
                    LEFT JOIN TBL_DIAGNOSTICTYPE c ON b.DIAGNOSTICTYPE_ID = c.ID
                    WHERE a.CLINIC_ID = " + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + "'" + apptype + @"
                    GROUP BY a.ID
                    UNION ALL
                    SELECT a.ID, ISNULL(SUM(b.SERVICE_PRICE * b.CNT), 0) as PRICESUM
                    FROM TBL_APPOINTMENT a
                    LEFT JOIN TBL_APPOINTMENT_SERVICE b ON a.ID = b.APPOINTMENT_ID
                    WHERE a.CLINIC_ID = " + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + "'" + apptype + @"
                    GROUP BY a.ID
                    UNION ALL
                    SELECT a.ID, ISNULL(SUM(b.PART_PRICE * b.CNT), 0) as PRICESUM
                    FROM TBL_APPOINTMENT a
                    LEFT JOIN TBL_APPOINTMENT_PART b ON a.ID = b.APPOINTMENT_ID
                    WHERE a.CLINIC_ID = " + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + "'" + apptype + @"
                    GROUP BY a.ID
                ) a
                GROUP BY a.ID
            ) a
            GROUP BY a.ID, a.PRICESUM
		) a
        GROUP BY a.APPOINTMENT_ID, a.PRICESUM, a.DIAGNOSTICLIST
	) a
    GROUP BY a.APPOINTMENT_ID, a.PRICESUM, a.DIAGNOSTICLIST, a.SERVICELIST
) a
INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID = b.ID
INNER JOIN TBL_ROOM c ON b.ROOM_ID = c.ID
INNER JOIN TBL_PATIENT d ON b.PATIENT_ID = d.ID
INNER JOIN TBL_APPOINTMENT_TYPE g ON b.APPOINTMENT_TYPE_ID = g.ID";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt1Tab3Datatable(string clinicid, string begindate, string enddate)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry = @"SELECT a.ID, a.NAME, a.COLORCLASS, SUM(a.CNT) as CNT 
FROM(
    SELECT b.ID, b.NAME, b.COLORCLASS, COUNT(1) as CNT
    FROM TBL_APPOINTMENT a
    INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID
    WHERE a.CLINIC_ID = " + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + @"'
    GROUP BY b.ID, b.NAME, b.COLORCLASS
    UNION ALL
    SELECT ID, NAME, COLORCLASS, 0 as CNT
    FROM TBL_APPOINTMENT_TYPE
) a
GROUP BY a.ID, a.NAME, a.COLORCLASS
ORDER BY a.ID";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt1Tab4Datatable(string clinicid, string begindate, string enddate, string room)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry0 = @"SELECT ROW_NUMBER() OVER(ORDER BY a.USEDTIME DESC) AS RW, a.ROOM_NAME, a.CHAIRNUM, a.USETIME, a.USEDTIME, a.USETIME-a.USEDTIME as FREETIME 
FROM(
    SELECT b.NAME as ROOM_NAME, a.CHAIRNUM, (SELECT DATEDIFF(DAY, CONVERT(datetime, '" + begindate + " 00:00:00', 120), CONVERT(datetime, '" + enddate + " 00:00:00', 120) + 1) * DATEDIFF(MINUTE, CONVERT(datetime, '2015-01-01 ' + (SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID = " + clinicid + " AND KEYCODE = 'calendarstarttime') + ':00', 20), CONVERT(datetime, '2015-01-01 ' + (SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID = " + clinicid + @" AND KEYCODE = 'calendarendtime') + ':00', 20))) as USETIME, DATEDIFF(MINUTE, a.DT + ' ' + a.STARTTIME, a.DT + ' ' + a.ENDTIME) as USEDTIME
    FROM TBL_APPOINTMENT a
    INNER JOIN TBL_ROOM b ON a.ROOM_ID = b.ID
    WHERE a.CLINIC_ID = " + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + @"'
    GROUP BY b.NAME, a.CHAIRNUM, a.DT, a.STARTTIME, a.ENDTIME
) a
ORDER BY a.USEDTIME DESC";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt1Tab5t1Datatable(string clinicid, string begindate, string enddate)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            int total1 = 0;
            int total2 = 0;
            string strreturnval = "";
            int[] arrIntVals = new int[0];
            int dr1I = 0;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry0 = @"DECLARE @cols AS NVARCHAR(MAX), @cols2 AS NVARCHAR(MAX), @cols3 AS NVARCHAR(MAX), @query AS NVARCHAR(MAX); SET @cols = STUFF(( SELECT ',' + QUOTENAME(c.NAME) FROM TBL_DIAGNOSTICTYPE c WHERE c.CLINIC_ID=" + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols2 = STUFF(( SELECT ',SUM(a.' + QUOTENAME(c.NAME)+') as '+QUOTENAME(c.NAME) FROM TBL_DIAGNOSTICTYPE c WHERE c.CLINIC_ID = " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols3 = STUFF(( SELECT ',a.' + QUOTENAME(c.NAME) FROM TBL_DIAGNOSTICTYPE c WHERE c.CLINIC_ID = " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') set @query = 'SELECT ROW_NUMBER() OVER(ORDER BY a.TOTALPRICE DESC) AS RW, a.MARK_ID, a.MARK_NAME, APPOINTMENT_CNT, '+@cols3+', TOTALPRICE FROM ( SELECT a.MARK_ID, a.MARK_NAME, COUNT(a.APPOINTMENT_ID) as APPOINTMENT_CNT, '+@cols2+', SUM(a.TOTALPRICE) as TOTALPRICE FROM ( SELECT a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID, '+@cols2+', SUM(a.TOTALPRICE) as TOTALPRICE FROM ( SELECT MARK_ID, MARK_NAME, APPOINTMENT_ID, ' + @cols + ', TOTALPRICE FROM ( SELECT c.ID as MARK_ID, c.NAME as MARK_NAME, a.ID as APPOINTMENT_ID, f.NAME as DIAGNOSTIC_NAME, ISNULL(d.PRICE,0)*ISNULL(d.CNT,0) as TOTALPRICE FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_AUTOMARK c ON b.MARK_ID=c.ID LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE d ON a.ID=d.APPOINTMENT_ID LEFT JOIN TBL_DIAGNOSTICTYPE f ON d.DIAGNOSTICTYPE_ID=f.ID INNER JOIN TBL_APPOINTMENT_TYPE g ON a.APPOINTMENT_TYPE_ID=g.ID AND g.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN ''" + begindate + "'' AND ''" + enddate + "'' ) x pivot ( COUNT(DIAGNOSTIC_NAME) for DIAGNOSTIC_NAME in (' + @cols + ') ) p ) a GROUP BY a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID ) a GROUP BY a.MARK_ID, a.MARK_NAME ) a ORDER BY a.TOTALPRICE DESC' execute(@query)";
                string strQry1 = "SELECT NAME FROM TBL_DIAGNOSTICTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID";

                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1);

                strreturnval += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                strreturnval += "<thead>";
                strreturnval += "<tr style=\"background-color:#C6D9F1;\">";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center; width:31px;\">#</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Модел</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Захиалгын тоо</th>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    arrIntVals = new int[ds.Tables[1].Rows.Count];
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NAME"].ToString() + "</th>";
                    }
                }
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт төлбөр</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["MARK_NAME"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["APPOINTMENT_CNT"].ToString() + "</td>";
                        if (ds.Tables[1].Rows.Count != 0)
                        {
                            dr1I = 0;
                            foreach (DataRow dr1 in ds.Tables[1].Rows)
                            {
                                arrIntVals[dr1I] += Convert.ToInt32(dr[dr1["NAME"].ToString()].ToString());
                                dr1I++;
                                strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[dr1["NAME"].ToString()].ToString() + "</td>";
                            }
                        }

                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["TOTALPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                        strreturnval += "</tr>";

                        total1 += int.Parse(dr["APPOINTMENT_CNT"].ToString());
                        total2 += int.Parse(dr["TOTALPRICE"].ToString());
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "<tfoot>";
                strreturnval += "<tr>";
                strreturnval += "<th colspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">НИЙТ</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + total1.ToString() + "</th>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    dr1I = 0;
                    foreach (DataRow dr1 in ds.Tables[1].Rows)
                    {
                        strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">"+ arrIntVals[dr1I].ToString() + "</th>";
                        dr1I++;
                    }
                }
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + String.Format("{0:C0}", Convert.ToDecimal(total2.ToString())).Replace("$", String.Empty) + "</th>";
                strreturnval += "</tr>";
                strreturnval += "</tfoot>";
                strreturnval += "</table>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt1Tab5t2Datatable(string clinicid, string begindate, string enddate, string tp)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            int total1 = 0;
            int total2 = 0;
            string strreturnval = "";
            string strQry0 = "", strQry1 = "";
            DataSet ds = null;
            int[] arrIntVals = new int[0];
            int dr1I = 0;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                if (tp == "1")
                {
                    strQry0 = @"DECLARE @cols AS NVARCHAR(MAX), @cols2 AS NVARCHAR(MAX), @cols3 AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX);  SET @cols = STUFF(( SELECT ',' + QUOTENAME(c.NAME) FROM TBL_REPAIRTYPE c WHERE c.CLINIC_ID=" + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols2 = STUFF(( SELECT ',SUM(a.' + QUOTENAME(c.NAME)+') as '+QUOTENAME(c.NAME) FROM TBL_REPAIRTYPE c WHERE c.CLINIC_ID=" + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols3 = STUFF(( SELECT ',a.' + QUOTENAME(c.NAME) FROM TBL_REPAIRTYPE c WHERE c.CLINIC_ID= " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'')  set @query = ' SELECT ROW_NUMBER() OVER(ORDER BY a.MARK_NAME ASC) AS RW, a.MARK_ID, a.MARK_NAME, APPOINTMENT_CNT, '+@cols3+' FROM ( SELECT a.MARK_ID, a.MARK_NAME, COUNT(a.APPOINTMENT_ID) as APPOINTMENT_CNT, '+@cols2+' FROM ( SELECT a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID, '+@cols2+' FROM ( SELECT MARK_ID, MARK_NAME, APPOINTMENT_ID, ' + @cols + ' FROM ( SELECT c.ID as MARK_ID, c.NAME as MARK_NAME, a.ID as APPOINTMENT_ID, f.NAME as REPAIR_NAME FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_AUTOMARK c ON b.MARK_ID=c.ID LEFT JOIN TBL_APPOINTMENT_REPAIR d ON a.ID=d.APPOINTMENT_ID LEFT JOIN TBL_REPAIRTYPE f ON d.REPAIRTYPE_ID=f.ID INNER JOIN TBL_APPOINTMENT_TYPE g ON a.APPOINTMENT_TYPE_ID=g.ID AND g.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN ''" + begindate + "'' AND ''" + begindate + "'' ) x pivot ( COUNT(REPAIR_NAME) for REPAIR_NAME in (' + @cols + ') ) p ) a GROUP BY a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID ) a GROUP BY a.MARK_ID, a.MARK_NAME ) a ORDER BY a.MARK_NAME ASC' execute(@query)";
                    strQry1 = "SELECT NAME FROM TBL_REPAIRTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID";
                    ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1);

                    strreturnval += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                    strreturnval += "<thead>";
                    strreturnval += "<tr style=\"background-color:#C6D9F1;\">";
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center; width:31px;\">#</th>";
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Модел</th>";
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Захиалгын тоо</th>";
                    if (ds.Tables[1].Rows.Count != 0)
                    {
                        arrIntVals = new int[ds.Tables[1].Rows.Count];
                        foreach (DataRow dr in ds.Tables[1].Rows)
                        {
                            strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NAME"].ToString() + "</th>";
                        }
                    }
                    strreturnval += "</tr>";
                    strreturnval += "</thead>";
                    strreturnval += "<tbody>";
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            strreturnval += "<tr>";
                            strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td>";
                            strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["MARK_NAME"].ToString() + "</td>";
                            strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["APPOINTMENT_CNT"].ToString() + "</td>";
                            if (ds.Tables[1].Rows.Count != 0)
                            {
                                dr1I = 0;
                                foreach (DataRow dr1 in ds.Tables[1].Rows)
                                {
                                    arrIntVals[dr1I] += Convert.ToInt32(dr[dr1["NAME"].ToString()].ToString());
                                    dr1I++;
                                    strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[dr1["NAME"].ToString()].ToString() + "</td>";
                                }
                            }

                            strreturnval += "</tr>";

                            total1 += int.Parse(dr["APPOINTMENT_CNT"].ToString());
                        }
                    }
                    strreturnval += "</tbody>";
                    strreturnval += "<tfoot>";
                    strreturnval += "<tr>";
                    strreturnval += "<th colspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">НИЙТ</th>";
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + total1.ToString() + "</th>";
                    if (ds.Tables[1].Rows.Count != 0)
                    {
                        dr1I = 0;
                        foreach (DataRow dr1 in ds.Tables[1].Rows)
                        {
                            strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">"+ arrIntVals[dr1I].ToString() + "</th>";
                            dr1I++;
                        }
                    }
                    strreturnval += "</tr>";
                    strreturnval += "</tfoot>";
                    strreturnval += "</table>";
                }
                else if (tp == "2")
                {
                    strQry0 = @"DECLARE @cols AS NVARCHAR(MAX), @cols2 AS NVARCHAR(MAX), @cols3 AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX);  SET @cols = STUFF(( SELECT ',' + QUOTENAME(c.NAME) FROM TBL_SERVICE_TYPE c WHERE c.CLINIC_ID=" + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols2 = STUFF(( SELECT ',SUM(a.' + QUOTENAME(c.NAME)+') as '+QUOTENAME(c.NAME) FROM TBL_SERVICE_TYPE c WHERE c.CLINIC_ID= " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols3 = STUFF(( SELECT ',a.' + QUOTENAME(c.NAME) FROM TBL_SERVICE_TYPE c WHERE c.CLINIC_ID= " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'')  set @query = ' SELECT ROW_NUMBER() OVER(ORDER BY a.TOTALPRICE DESC) AS RW, a.MARK_ID, a.MARK_NAME, APPOINTMENT_CNT, '+@cols3+', TOTALPRICE FROM ( SELECT a.MARK_ID, a.MARK_NAME, COUNT(a.APPOINTMENT_ID) as APPOINTMENT_CNT, '+@cols2+', SUM(a.TOTALPRICE) as TOTALPRICE FROM ( SELECT a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID, '+@cols2+', SUM(a.TOTALPRICE) as TOTALPRICE FROM ( SELECT MARK_ID, MARK_NAME, APPOINTMENT_ID, ' + @cols + ', TOTALPRICE FROM ( SELECT c.ID as MARK_ID, c.NAME as MARK_NAME, a.ID as APPOINTMENT_ID, g.NAME as SERVICE_TYPE_NAME, ISNULL(d.SERVICE_PRICE,0)*ISNULL(d.CNT,0) as TOTALPRICE FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_AUTOMARK c ON b.MARK_ID=c.ID LEFT JOIN TBL_APPOINTMENT_SERVICE d ON a.ID=d.APPOINTMENT_ID LEFT JOIN TBL_SERVICE f ON d.SERVICE_ID=f.ID LEFT JOIN TBL_SERVICE_TYPE g ON f.SERVICE_TYPE_ID=g.ID INNER JOIN TBL_APPOINTMENT_TYPE h ON a.APPOINTMENT_TYPE_ID=h.ID AND h.ISACTIVESHOW=1 WHERE a.CLINIC_ID= " + clinicid + " AND a.DT BETWEEN ''" + begindate + "'' AND ''" + enddate + "'' ) x pivot ( COUNT(SERVICE_TYPE_NAME) for SERVICE_TYPE_NAME in (' + @cols + ') ) p ) a GROUP BY a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID ) a GROUP BY a.MARK_ID, a.MARK_NAME ) a ORDER BY a.TOTALPRICE DESC'  execute(@query)";
                    strQry1 = "SELECT NAME FROM TBL_SERVICE_TYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID";
                    ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1);

                    strreturnval += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                    strreturnval += "<thead>";
                    strreturnval += "<tr style=\"background-color:#C6D9F1;\">";
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center; width:31px;\">#</th>";
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Модел</th>";
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Захиалгын тоо</th>";
                    if (ds.Tables[1].Rows.Count != 0)
                    {
                        arrIntVals = new int[ds.Tables[1].Rows.Count];
                        foreach (DataRow dr in ds.Tables[1].Rows)
                        {
                            strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NAME"].ToString() + "</th>";
                        }
                    }
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт төлбөр</th>";
                    strreturnval += "</tr>";
                    strreturnval += "</thead>";
                    strreturnval += "<tbody>";
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            strreturnval += "<tr>";
                            strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td>";
                            strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["MARK_NAME"].ToString() + "</td>";
                            strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["APPOINTMENT_CNT"].ToString() + "</td>";
                            if (ds.Tables[1].Rows.Count != 0)
                            {
                                dr1I = 0;
                                foreach (DataRow dr1 in ds.Tables[1].Rows)
                                {
                                    arrIntVals[dr1I] += Convert.ToInt32(dr[dr1["NAME"].ToString()].ToString());
                                    dr1I++;
                                    strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[dr1["NAME"].ToString()].ToString() + "</td>";
                                }
                            }

                            strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["TOTALPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                            strreturnval += "</tr>";

                            total1 += int.Parse(dr["APPOINTMENT_CNT"].ToString());
                            total2 += int.Parse(dr["TOTALPRICE"].ToString());
                        }
                    }
                    strreturnval += "</tbody>";
                    strreturnval += "<tfoot>";
                    strreturnval += "<tr>";
                    strreturnval += "<th colspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">НИЙТ</th>";
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + total1.ToString() + "</th>";
                    if (ds.Tables[1].Rows.Count != 0)
                    {
                        dr1I = 0;
                        foreach (DataRow dr1 in ds.Tables[1].Rows)
                        {
                            strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + arrIntVals[dr1I].ToString() + "</th>";
                            dr1I++;
                        }
                    }
                    strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + String.Format("{0:C0}", Convert.ToDecimal(total2.ToString())).Replace("$", String.Empty) + "</th>";
                    strreturnval += "</tr>";
                    strreturnval += "</tfoot>";
                    strreturnval += "</table>";
                }


                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt1Tab5t3Datatable(string clinicid, string begindate, string enddate)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            int total1 = 0;
            int total2 = 0;
            string strreturnval = "";
            int[] arrIntVals = new int[0];
            int dr1I = 0;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry0 = @"DECLARE @cols AS NVARCHAR(MAX), @cols2 AS NVARCHAR(MAX), @cols3 AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX);  SET @cols = STUFF(( SELECT ',' + QUOTENAME(c.NAME) FROM TBL_PART_TYPE c WHERE c.CLINIC_ID=" + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols2 = STUFF(( SELECT ',SUM(a.' + QUOTENAME(c.NAME)+') as '+QUOTENAME(c.NAME) FROM TBL_PART_TYPE c WHERE c.CLINIC_ID= " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols3 = STUFF(( SELECT ',a.' + QUOTENAME(c.NAME) FROM TBL_PART_TYPE c WHERE c.CLINIC_ID= " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'')  set @query = ' SELECT ROW_NUMBER() OVER(ORDER BY a.TOTALPRICE DESC) AS RW, a.MARK_ID, a.MARK_NAME, APPOINTMENT_CNT, '+@cols3+', TOTALPRICE FROM ( SELECT a.MARK_ID, a.MARK_NAME, COUNT(a.APPOINTMENT_ID) as APPOINTMENT_CNT, '+@cols2+', SUM(a.TOTALPRICE) as TOTALPRICE FROM ( SELECT a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID, '+@cols2+', SUM(a.TOTALPRICE) as TOTALPRICE FROM ( SELECT MARK_ID, MARK_NAME, APPOINTMENT_ID, ' + @cols + ', TOTALPRICE FROM ( SELECT c.ID as MARK_ID, c.NAME as MARK_NAME, a.ID as APPOINTMENT_ID, g.NAME as SERVICE_PART_NAME, ISNULL(d.PART_PRICE,0)*ISNULL(d.CNT,0) as TOTALPRICE FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_AUTOMARK c ON b.MARK_ID=c.ID LEFT JOIN TBL_APPOINTMENT_PART d ON a.ID=d.APPOINTMENT_ID LEFT JOIN TBL_PART f ON d.PART_ID=f.ID LEFT JOIN TBL_PART_TYPE g ON f.PART_TYPE_ID=g.ID INNER JOIN TBL_APPOINTMENT_TYPE h ON a.APPOINTMENT_TYPE_ID=h.ID AND h.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN ''" + begindate + "'' AND ''" + enddate + "'' ) x pivot ( COUNT(SERVICE_PART_NAME) for SERVICE_PART_NAME in (' + @cols + ') ) p ) a GROUP BY a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID ) a GROUP BY a.MARK_ID, a.MARK_NAME ) a ORDER BY a.TOTALPRICE DESC' execute(@query)";
                string strQry1 = "SELECT NAME FROM TBL_PART_TYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID";

                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1);

                strreturnval += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                strreturnval += "<thead>";
                strreturnval += "<tr style=\"background-color:#C6D9F1;\">";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center; width:31px;\">#</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Модел</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Захиалгын тоо</th>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    arrIntVals = new int[ds.Tables[1].Rows.Count];
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NAME"].ToString() + "</th>";
                    }
                }
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт төлбөр</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["MARK_NAME"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["APPOINTMENT_CNT"].ToString() + "</td>";
                        if (ds.Tables[1].Rows.Count != 0)
                        {
                            dr1I = 0;
                            foreach (DataRow dr1 in ds.Tables[1].Rows)
                            {
                                arrIntVals[dr1I] += Convert.ToInt32(dr[dr1["NAME"].ToString()].ToString());
                                dr1I++;
                                strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[dr1["NAME"].ToString()].ToString() + "</td>";
                            }
                        }

                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["TOTALPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                        strreturnval += "</tr>";

                        total1 += int.Parse(dr["APPOINTMENT_CNT"].ToString());
                        total2 += int.Parse(dr["TOTALPRICE"].ToString());
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "<tfoot>";
                strreturnval += "<tr>";
                strreturnval += "<th colspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">НИЙТ</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + total1.ToString() + "</th>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    dr1I = 0;
                    foreach (DataRow dr1 in ds.Tables[1].Rows)
                    {
                        strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + arrIntVals[dr1I].ToString() + "</th>";
                        dr1I++;
                    }
                }
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + String.Format("{0:C0}", Convert.ToDecimal(total2.ToString())).Replace("$", String.Empty) + "</th>";
                strreturnval += "</tr>";
                strreturnval += "</tfoot>";
                strreturnval += "</table>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt1Tab5t4Datatable(string clinicid, string begindate, string enddate)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            int total1 = 0;
            string strreturnval = "";
            int[] arrIntVals = new int[0];
            int dr1I = 0;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry0 = @"DECLARE @cols AS NVARCHAR(MAX), @cols2 AS NVARCHAR(MAX), @cols3 AS NVARCHAR(MAX), @query AS NVARCHAR(MAX); SET @cols = STUFF(( SELECT ',' + QUOTENAME(c.NAME) FROM TBL_REQUESTTYPE c WHERE c.CLINIC_ID="+ clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols2 = STUFF(( SELECT ',SUM(a.' + QUOTENAME(c.NAME)+') as '+QUOTENAME(c.NAME) FROM TBL_REQUESTTYPE c WHERE c.CLINIC_ID = " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') SET @cols3 = STUFF(( SELECT ',a.' + QUOTENAME(c.NAME) FROM TBL_REQUESTTYPE c WHERE c.CLINIC_ID = " + clinicid + " ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') set @query = 'SELECT ROW_NUMBER() OVER(ORDER BY a.MARK_NAME DESC) AS RW, a.MARK_ID, a.MARK_NAME, APPOINTMENT_CNT, '+@cols3+' FROM ( SELECT a.MARK_ID, a.MARK_NAME, COUNT(a.APPOINTMENT_ID) as APPOINTMENT_CNT, '+@cols2+' FROM ( SELECT a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID, '+@cols2+' FROM ( SELECT MARK_ID, MARK_NAME, APPOINTMENT_ID, ' + @cols + ' FROM ( SELECT c.ID as MARK_ID, c.NAME as MARK_NAME, a.ID as APPOINTMENT_ID, f.NAME as REQUEST_NAME FROM TBL_APPOINTMENT a INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID INNER JOIN TBL_AUTOMARK c ON b.MARK_ID=c.ID LEFT JOIN TBL_APPOINTMENT_REQUESTTYPE d ON a.ID=d.APPOINTMENT_ID LEFT JOIN TBL_REQUESTTYPE f ON d.REQUESTTYPE_ID=f.ID INNER JOIN TBL_APPOINTMENT_TYPE g ON a.APPOINTMENT_TYPE_ID=g.ID AND g.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN ''" + begindate+"'' AND ''"+enddate+"'' ) x pivot ( COUNT(REQUEST_NAME) for REQUEST_NAME in (' + @cols + ') ) p ) a GROUP BY a.MARK_ID, a.MARK_NAME, a.APPOINTMENT_ID ) a GROUP BY a.MARK_ID, a.MARK_NAME ) a ORDER BY a.MARK_NAME DESC' execute(@query)";
                string strQry1 = "SELECT NAME FROM TBL_REQUESTTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID";

                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1);

                strreturnval += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                strreturnval += "<thead>";
                strreturnval += "<tr style=\"background-color:#C6D9F1;\">";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center; width:31px;\">#</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Модел</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Захиалгын тоо</th>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    arrIntVals = new int[ds.Tables[1].Rows.Count];
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NAME"].ToString() + "</th>";
                    }
                }
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["MARK_NAME"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["APPOINTMENT_CNT"].ToString() + "</td>";
                        if (ds.Tables[1].Rows.Count != 0)
                        {
                            dr1I = 0;
                            foreach (DataRow dr1 in ds.Tables[1].Rows)
                            {
                                arrIntVals[dr1I] += Convert.ToInt32(dr[dr1["NAME"].ToString()].ToString());
                                dr1I++;
                                strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[dr1["NAME"].ToString()].ToString() + "</td>";
                            }
                        }

                        strreturnval += "</tr>";

                        total1 += int.Parse(dr["APPOINTMENT_CNT"].ToString());
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "<tfoot>";
                strreturnval += "<tr>";
                strreturnval += "<th colspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">НИЙТ</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + total1.ToString() + "</th>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    dr1I = 0;
                    foreach (DataRow dr1 in ds.Tables[1].Rows)
                    {
                        strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + arrIntVals[dr1I].ToString() + "</th>";
                        dr1I++;
                    }
                }
                strreturnval += "</tr>";
                strreturnval += "</tfoot>";
                strreturnval += "</table>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****rprt2.aspx*****//
        public string Rprt2Tab1Datatable(string clinicid, string begindate, string enddate, string type)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string strQry = "";
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                if (type == "1") strQry = "declare @start datetime = '" + begindate + "' declare @end   datetime = '" + enddate + "' ;with amonth(day) as ( select @start as day union all select day + 1 from amonth where day < @end ) select CONVERT(VARCHAR(6),amonth.day,107) as EPOCHDT, SUM(ISNULL(b.SUMPRICE,0)) as SUMPRICE from amonth left join ( SELECT a.DT, COUNT(1) as SUMPRICE FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID AND b.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT ) b ON amonth.day=b.DT group by amonth.day";
                else if (type == "2") strQry = "declare @start datetime = '" + begindate + "-01' declare @end   datetime = CONVERT(varchar(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,'" + enddate + "-01')+1,1)),120) ;with cte as ( SELECT dt = DATEADD(DAY, -(DAY(@start) - 1), @start) union all SELECT DATEADD(MONTH, 1, dt) FROM cte WHERE dt < DATEADD(MONTH, -1, @end) ) SELECT CONVERT(varchar(6),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,CONVERT(varchar(10),cte.dt,120))+1,0)),107) as EPOCHDT, SUM(ISNULL(b.SUMPRICE,0)) as SUMPRICE FROM cte LEFT JOIN ( SELECT a.DT+'-01' as DTT, SUM(a.SUMPRICE) as SUMPRICE FROM ( SELECT CAST(YEAR(a.DT) as varchar)+'-'+RIGHT('0'+CAST(MONTH(a.DT) as varchar),2) as DT, COUNT(1) as SUMPRICE FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID AND b.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT ) a GROUP BY a.DT ) b ON cte.dt=b.DTT GROUP BY cte.dt";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt2Tab1Chart(string clinicid, string begindate, string enddate, string type)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string strreturnval = "", strQry = "";
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                if (type == "1") strQry = "declare @start datetime = '" + begindate + "' declare @end   datetime = '" + enddate + "' ;with amonth(day) as ( select @start as day union all select day + 1 from amonth where day < @end ) select cast(Datediff(s, '1970-01-01', CONVERT(VARCHAR(10),amonth.day,120)) AS bigint)*1000 as EPOCHDT, SUM(ISNULL(b.SUMPRICE,0)) as SUMPRICE from amonth left join ( SELECT a.DT, COUNT(1) as SUMPRICE FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID AND b.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT ) b ON amonth.day=b.DT group by amonth.day";
                else if (type == "2") strQry = "declare @start datetime = '" + begindate + "-01' declare @end   datetime = CONVERT(varchar(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,'" + enddate + "-01')+1,1)),120) ;with cte as ( SELECT dt = DATEADD(DAY, -(DAY(@start) - 1), @start) union all SELECT DATEADD(MONTH, 1, dt) FROM cte WHERE dt < DATEADD(MONTH, -1, @end) ) SELECT cast(Datediff(s, '1970-01-01', CONVERT(varchar(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,CONVERT(varchar(10),cte.dt,120))+1,0)),120)) AS bigint)*1000 as EPOCHDT, SUM(ISNULL(b.SUMPRICE,0)) as SUMPRICE FROM cte LEFT JOIN ( SELECT a.DT+'-01' as DTT, SUM(a.SUMPRICE) as SUMPRICE FROM ( SELECT CAST(YEAR(a.DT) as varchar)+'-'+RIGHT('0'+CAST(MONTH(a.DT) as varchar),2) as DT, COUNT(1) as SUMPRICE FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID AND b.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT ) a GROUP BY a.DT ) b ON cte.dt=b.DTT GROUP BY cte.dt";
                strreturnval = "[";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (strreturnval == "[") strreturnval += "[" + dr["EPOCHDT"].ToString() + "," + dr["SUMPRICE"].ToString() + "]";
                        else strreturnval += ",[" + dr["EPOCHDT"].ToString() + "," + dr["SUMPRICE"].ToString() + "]";
                    }
                }
                strreturnval += "]";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt2Tab2Datatable(string clinicid, string begindate, string enddate, string type)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry = "";
                if (type == "1") strQry = "declare @start datetime = '" + begindate + "' declare @end   datetime = '" + enddate + "' ;with amonth(day) as ( select @start as day union all select day + 1 from amonth where day < @end ) select CONVERT(VARCHAR(6),amonth.day,107) as EPOCHDT, SUM(ISNULL(b.SUMPRICE,0)) as SUMPRICE from amonth left join ( SELECT a.DT, SUM(ISNULL(c.PRICE,0)) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE b ON a.ID=b.APPOINTMENT_ID LEFT JOIN TBL_DIAGNOSTICTYPE c ON b.DIAGNOSTICTYPE_ID=c.ID INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT UNION ALL SELECT a.DT, SUM((ISNULL(b.SERVICE_PRICE,0)*ISNULL(b.CNT,0))) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_SERVICE b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT UNION ALL SELECT a.DT, SUM((ISNULL(b.PART_PRICE,0)*ISNULL(b.CNT,0))) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_PART b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT ) b ON amonth.day=b.DT group by amonth.day";
                else if (type == "2") strQry = "declare @start datetime = '" + begindate + "-01' declare @end   datetime = CONVERT(varchar(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,'" + enddate + "-01')+1,1)),120) ;with cte as ( SELECT dt = DATEADD(DAY, -(DAY(@start) - 1), @start) union all SELECT DATEADD(MONTH, 1, dt) FROM cte WHERE dt < DATEADD(MONTH, -1, @end) ) SELECT CONVERT(varchar(6),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,CONVERT(varchar(10),cte.dt,120))+1,0)),107) as EPOCHDT, SUM(ISNULL(b.SUMPRICE,0)) as SUMPRICE FROM cte LEFT JOIN ( SELECT a.DT+'-01' as DTT, SUM(a.SUMPRICE) as SUMPRICE FROM ( SELECT CAST(YEAR(a.DT) as varchar)+'-'+RIGHT('0'+CAST(MONTH(a.DT) as varchar),2) as DT, SUM(ISNULL(c.PRICE,0)) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE b ON a.ID=b.APPOINTMENT_ID LEFT JOIN TBL_DIAGNOSTICTYPE c ON b.DIAGNOSTICTYPE_ID=c.ID INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT UNION ALL SELECT CAST(YEAR(a.DT) as varchar)+'-'+RIGHT('0'+CAST(MONTH(a.DT) as varchar),2) as DT, SUM(ISNULL(b.SERVICE_PRICE,0)*ISNULL(b.CNT,0)) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_SERVICE b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT UNION ALL SELECT CAST(YEAR(a.DT) as varchar)+'-'+RIGHT('0'+CAST(MONTH(a.DT) as varchar),2) as DT, SUM((ISNULL(b.PART_PRICE,0)*ISNULL(b.CNT,0))) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_PART b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT ) a GROUP BY a.DT ) b ON cte.dt=b.DTT GROUP BY cte.dt";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt2Tab2Chart(string clinicid, string begindate, string enddate, string type)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string strreturnval = "", strQry = "";
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                if (type == "1") strQry = "declare @start datetime = '" + begindate + "' declare @end   datetime = '" + enddate + "' ;with amonth(day) as ( select @start as day union all select day + 1 from amonth where day < @end ) select cast(Datediff(s, '1970-01-01', CONVERT(VARCHAR(10),amonth.day,120)) AS bigint)*1000 as EPOCHDT, SUM(ISNULL(b.SUMPRICE,0)) as SUMPRICE from amonth left join ( SELECT a.DT, SUM(ISNULL(c.PRICE,0)) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE b ON a.ID=b.APPOINTMENT_ID LEFT JOIN TBL_DIAGNOSTICTYPE c ON b.DIAGNOSTICTYPE_ID=c.ID INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT UNION ALL SELECT a.DT, SUM((ISNULL(b.SERVICE_PRICE,0)*ISNULL(b.CNT,0))) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_SERVICE b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT UNION ALL SELECT a.DT, SUM((ISNULL(b.PART_PRICE,0)*ISNULL(b.CNT,0))) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_PART b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT ) b ON amonth.day=b.DT group by amonth.day";
                else if (type == "2") strQry = "declare @start datetime = '" + begindate + "-01' declare @end   datetime = CONVERT(varchar(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,'" + enddate + "-01')+1,1)),120) ;with cte as ( SELECT dt = DATEADD(DAY, -(DAY(@start) - 1), @start) union all SELECT DATEADD(MONTH, 1, dt) FROM cte WHERE dt < DATEADD(MONTH, -1, @end) ) SELECT cast(Datediff(s, '1970-01-01', CONVERT(varchar(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,CONVERT(varchar(10),cte.dt,120))+1,0)),120)) AS bigint)*1000 as EPOCHDT, SUM(ISNULL(b.SUMPRICE,0)) as SUMPRICE FROM cte LEFT JOIN ( SELECT a.DT+'-01' as DTT, SUM(a.SUMPRICE) as SUMPRICE FROM ( SELECT CAST(YEAR(a.DT) as varchar)+'-'+RIGHT('0'+CAST(MONTH(a.DT) as varchar),2) as DT, SUM(ISNULL(c.PRICE,0)) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE b ON a.ID=b.APPOINTMENT_ID LEFT JOIN TBL_DIAGNOSTICTYPE c ON b.DIAGNOSTICTYPE_ID=c.ID INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT UNION ALL SELECT CAST(YEAR(a.DT) as varchar)+'-'+RIGHT('0'+CAST(MONTH(a.DT) as varchar),2) as DT, SUM(ISNULL(b.SERVICE_PRICE,0)*ISNULL(b.CNT,0)) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_SERVICE b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT UNION ALL SELECT CAST(YEAR(a.DT) as varchar)+'-'+RIGHT('0'+CAST(MONTH(a.DT) as varchar),2) as DT, SUM((ISNULL(b.PART_PRICE,0)*ISNULL(b.CNT,0))) as SUMPRICE FROM TBL_APPOINTMENT a LEFT JOIN TBL_APPOINTMENT_PART b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN @start AND @end GROUP BY a.DT ) a GROUP BY a.DT ) b ON cte.dt=b.DTT GROUP BY cte.dt";
                strreturnval = "[";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (strreturnval == "[") strreturnval += "[" + dr["EPOCHDT"].ToString() + "," + dr["SUMPRICE"].ToString() + "]";
                        else strreturnval += ",[" + dr["EPOCHDT"].ToString() + "," + dr["SUMPRICE"].ToString() + "]";
                    }
                }
                strreturnval += "]";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt2Tab4Datatable(string clinicid, string begindate, string enddate, string type)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry = "";
                if (type == "1")
                {
                    strQry = "SELECT ROW_NUMBER() OVER(ORDER BY a.SUMCNT DESC, a.PART_CODE ASC) AS RW, a.PART_TYPE_NAME, a.PART_CODE, a.PART_NAME, a.PART_DESCRIPTION, ISNULL(a.PART_PRICE,0) as PART_PRICE, a.SUMCNT FROM ( SELECT b.PART_TYPE_NAME, b.PART_CODE, b.PART_NAME, b.PART_DESCRIPTION, b.PART_PRICE, SUM(b.CNT) as SUMCNT FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_PART b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + "' GROUP BY b.PART_TYPE_NAME, b.PART_CODE, b.PART_NAME, b.PART_DESCRIPTION, b.PART_PRICE ) a";
                }
                else if (type == "2")
                {
                    strQry = "SELECT ROW_NUMBER() OVER(ORDER BY a.SUMCNT DESC, a.SERVICE_CODE ASC) AS RW, a.SERVICE_TYPE_NAME, a.SERVICE_CODE, a.SERVICE_NAME, a.SERVICE_DESCRIPTION, ISNULL(a.SERVICE_PRICE,0) as SERVICE_PRICE, a.SUMCNT FROM ( SELECT b.SERVICE_TYPE_NAME, b.SERVICE_CODE, b.SERVICE_NAME, b.SERVICE_DESCRIPTION, b.SERVICE_PRICE, SUM(b.CNT) as SUMCNT FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_SERVICE b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + "' GROUP BY b.SERVICE_TYPE_NAME, b.SERVICE_CODE, b.SERVICE_NAME, b.SERVICE_DESCRIPTION, b.SERVICE_PRICE ) a";
                }
                else if (type == "3")
                {
                    strQry = "SELECT ROW_NUMBER() OVER(ORDER BY a.CNT DESC, a.DIAGNOSTICTYPE_NAME ASC) AS RW, a.DIAGNOSTICTYPE_NAME, a.CNT FROM ( SELECT b.DIAGNOSTICTYPE_ID, c.NAME as DIAGNOSTICTYPE_NAME, COUNT(b.DIAGNOSTICTYPE_ID) as CNT FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_DIAGNOSTICTYPE c ON b.DIAGNOSTICTYPE_ID=c.ID INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + "' GROUP BY b.DIAGNOSTICTYPE_ID, c.NAME ) a";
                }
                else if (type == "4")
                {
                    strQry = "SELECT ROW_NUMBER() OVER(ORDER BY a.CNT DESC, a.REQUESTTYPE_NAME ASC) AS RW, a.REQUESTTYPE_NAME, a.CNT FROM ( SELECT b.REQUESTTYPE_ID, c.NAME as REQUESTTYPE_NAME, COUNT(b.REQUESTTYPE_ID) as CNT FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_REQUESTTYPE b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_REQUESTTYPE c ON b.REQUESTTYPE_ID=c.ID INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + "' GROUP BY b.REQUESTTYPE_ID, c.NAME ) a";
                }
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt2Tab5Datatable(string clinicid, string begindate, string enddate, string uzuulelt)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strreturnval = "", strQry = "", strHead = "";
                strQry = @"SELECT ROW_NUMBER() OVER(ORDER BY b.NUM) AS '#'
	, " + uzuulelt + @"
FROM(
    SELECT a.ID as APPOINTMENT_ID
		, STUFF(ISNULL((
			SELECT ', ' + y.NAME 
			FROM TBL_APPOINTMENT_REQUESTTYPE x 
			INNER JOIN TBL_REQUESTTYPE y ON x.REQUESTTYPE_ID = y.ID 
			WHERE x.APPOINTMENT_ID = a.ID 
			GROUP BY y.NAME 
			ORDER BY y.NAME DESC FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(max)'), ''), 1, 2, '') as REQUESTTYPELIST
	FROM TBL_APPOINTMENT a
	WHERE a.CLINIC_ID = " + clinicid + " AND a.DT BETWEEN '" + begindate + "' AND '" + enddate + @"'
    GROUP BY a.ID
) a
INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID = b.ID
INNER JOIN TBL_ROOM c ON b.ROOM_ID = c.ID
INNER JOIN TBL_PATIENT d ON b.PATIENT_ID = d.ID
INNER JOIN TBL_APPOINTMENT_TYPE f ON b.APPOINTMENT_TYPE_ID = f.ID
INNER JOIN TBL_AUTOMARK g ON d.MARK_ID = g.ID
INNER JOIN TBL_AUTOMARK_TYPE h ON g.AUTOMARK_TYPE_ID = h.ID
ORDER BY b.NUM";
                strreturnval = "";
                strHead = "";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry);
                strHead += "<thead><tr style=\"background-color:#C6D9F1; color:#666666;\">";
                foreach (DataColumn col in ds.Tables[0].Columns)
                {

                    strHead += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + col.ColumnName + "</th>";
                }
                strHead += "</tr></thead>";
                strreturnval += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 12px arial, sans-serif; width: 100%;\">" + strHead;
                strreturnval += "<tbody>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr>";
                        for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
                        {
                            strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + dr[i].ToString() + "</td>";
                        }
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody></table>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****forgotpassword.html*****//
        public string Forgotpassword_checkemail(string email)
        {
            GetData myObjGetData = new GetData();
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                SqlCommand cmd;
                try
                {
                    if (con.State == ConnectionState.Closed) con.Open();
                    cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT USERNAME FROM TBL_USER WHERE EMAIL='" + email + "'";
                    cmd.Connection = con;
                    return cmd.ExecuteScalar().ToString();
                }
                catch (NullReferenceException ex) { throw new cs.MyException("Бүртгэлгүй имэйл хаяг байна!"); }
                catch (cs.MyException ex) { throw ex; }
                catch (Exception ex) { throw new cs.MyException("Хүсэлт амжилтгүй боллоо", ex); }
                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }            
        }
        public string Forgotpassword_resetpassword(string email)
        {
            GetData myObjGetData = new GetData();
            try
            {
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                var random = new Random();
                var result = new string(
                    Enumerable.Repeat(chars, 8)
                              .Select(s => s[random.Next(s.Length)])
                              .ToArray());

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                SqlCommand cmd;
                try
                {
                    if (con.State == ConnectionState.Closed) con.Open();
                    cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE TBL_USER SET PASSWORD=EncryptByPassPhrase('nirvana', '" + result + "' ) WHERE EMAIL='" + email + "'";
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    return result;
                }
                catch (NullReferenceException ex) { throw new cs.MyException("Бүртгэлгүй имэйл хаяг байна!"); }
                catch (cs.MyException ex) { throw ex; }
                catch (Exception ex) { throw new cs.MyException("Хүсэлт амжилтгүй боллоо", ex); }
                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****dealersettings.aspx*****//
        public string DealersettingsTab1Datatable(string clinicid, string mark, string marktype)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (mark != "") mark = " AND a.MARK_ID="+mark;
            if (marktype != "") marktype = " AND b.AUTOMARK_TYPE_ID=" + marktype;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT
    ROW_NUMBER() OVER(ORDER BY c.NAME, b.NAME, a.NAME) AS RW, 
	a.ID, 
	a.NAME,
	a.MARK_ID, 
	b.NAME as MARK_NAME,
	b.AUTOMARK_TYPE_ID,
	c.NAME as AUTOMARK_TYPE_NAME
FROM TBL_SPECTYPE a
INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID AND a.CLINIC_ID=b.CLINIC_ID
INNER JOIN TBL_AUTOMARK_TYPE c ON b.AUTOMARK_TYPE_ID=c.ID AND b.CLINIC_ID=c.CLINIC_ID
WHERE a.CLINIC_ID=" + clinicid+mark+marktype+@"
ORDER BY c.NAME, b.NAME, a.NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealersettingsTab1AutomarkListForDDL(string clinicid, string marktype)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (marktype != "") marktype = " AND a.AUTOMARK_TYPE_ID="+marktype;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT a.AUTOMARK_TYPE_ID, b.NAME as AUTOMARK_TYPE_NAME, a.ID, a.NAME 
FROM TBL_AUTOMARK a
INNER JOIN TBL_AUTOMARK_TYPE b ON a.AUTOMARK_TYPE_ID = b.ID AND a.CLINIC_ID = b.CLINIC_ID
WHERE a.CLINIC_ID = "+clinicid+ marktype + @"
ORDER BY b.NAME, a.NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealersettingsTab2Datatable(string clinicid, string colortype)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ROW_NUMBER() OVER(ORDER BY NAME) AS RW, ID, CODE, NAME, HTMLCODE
FROM TBL_CARCOLOR 
WHERE CLINIC_ID=" + clinicid + " AND CARCOLORTYPE_ID=" + colortype + @"
ORDER BY NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealersettingsTab3Datatable(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT
	ROW_NUMBER() OVER(ORDER BY NAME) AS RW,  
	ID, NAME
FROM TBL_SELLCARSPAYMENTTYPE 
WHERE CLINIC_ID="+clinicid+@"
ORDER BY NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****dealer.aspx*****//
        public string DealerTab1MarkListForDDL(string clinicid, string marktype)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT b.AUTOMARK_TYPE_ID, c.NAME as AUTOMARK_TYPE_NAME, b.ID, b.NAME
FROM (
	SELECT a.MARK_ID FROM TBL_SPECTYPE a WHERE a.CLINIC_ID="+clinicid+@"
    GROUP BY a.MARK_ID
) a
INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID
INNER JOIN TBL_AUTOMARK_TYPE c ON b.AUTOMARK_TYPE_ID=c.ID
WHERE b.AUTOMARK_TYPE_ID="+marktype+@"
ORDER BY c.NAME, b.NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab1SpectypeListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT a.MARK_ID, c.NAME+' - '+b.NAME as MARK_NAME, a.ID, a.NAME
FROM TBL_SPECTYPE a
INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID AND a.CLINIC_ID=b.CLINIC_ID
INNER JOIN TBL_AUTOMARK_TYPE c ON b.AUTOMARK_TYPE_ID=c.ID AND b.CLINIC_ID=c.CLINIC_ID
WHERE a.CLINIC_ID="+ clinicid + @"
ORDER BY c.NAME, b.NAME, a.NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab1SpectypeListForDDL2(string clinicid, string mark)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT a.ID, a.NAME
FROM TBL_SPECTYPE a
WHERE a.CLINIC_ID=" + clinicid + " AND a.MARK_ID="+mark+@"
ORDER BY a.NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab1UsedMarkListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT b.AUTOMARK_TYPE_ID, c.NAME as AUTOMARK_TYPE_NAME, a.MARK_ID, b.NAME as MARK_NAME
FROM (
	SELECT MARK_ID, CLINIC_ID FROM TBL_SELLCARS WHERE CLINIC_ID="+clinicid+@" GROUP BY MARK_ID, CLINIC_ID
) a
INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID AND a.CLINIC_ID=b.CLINIC_ID
INNER JOIN TBL_AUTOMARK_TYPE c ON b.AUTOMARK_TYPE_ID=c.ID AND b.CLINIC_ID=c.CLINIC_ID
ORDER BY c.NAME, b.NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab1Datatable(string clinicid, string extcolor, string intcolor, string spectype, string mark)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (extcolor != "") extcolor = " AND a.EXTCOLOR_ID=" + extcolor;
            if (intcolor != "") intcolor = " AND a.INTCOLOR_ID=" + intcolor;
            if (spectype != "") spectype = " AND a.SPECTYPE_ID=" + spectype;
            if (mark != "") mark = " AND a.MARK_ID=" + mark;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT 
    ROW_NUMBER() OVER(ORDER BY a.GETDT DESC) AS RW
	, a.ID
    , b.AUTOMARK_TYPE_ID
	, a.MARK_ID
	, c.NAME + ' - '+b.NAME as MARK_NAME
	, a.PRODUCEDYEAR
	, a.VINNO
	, a.FUELTYPE_ID
	, d.NAME as FUELTYPE_NAME
	, a.TRANSMISSIONTYPE_ID
	, f.NAME as TRANSMISSIONTYPE_NAME
	, a.ZAALTTYPE_ID
	, g.NAME as ZAALTTYPE_NAME
	, a.SPECTYPE_ID
	, h.NAME as SPECTYPE_NAME
	, a.EXTCOLOR_ID
	, i.CODE as EXTCOLORCODE
	, i.NAME as EXTCOLORNAME
	, i.HTMLCODE as EXTCOLORHTMLCODE
	, a.INTCOLOR_ID
	, j.CODE as INTCOLORCODE
	, j.NAME as INTCOLORNAME
	, j.HTMLCODE as INTCOLORHTMLCODE
	, a.GETDT
	, a.PRICE
	, CASE WHEN k.SELLCARS_ID is not null THEN 'success' ELSE null END as ISSELLCARS
FROM TBL_SELLCARS a
INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID AND a.CLINIC_ID=b.CLINIC_ID
INNER JOIN TBL_AUTOMARK_TYPE c ON b.AUTOMARK_TYPE_ID=c.ID AND b.CLINIC_ID=c.CLINIC_ID
INNER JOIN TBL_FUELTYPE d ON a.FUELTYPE_ID=d.ID AND a.CLINIC_ID=d.CLINIC_ID
INNER JOIN TBL_TRANSMISSIONTYPE f ON a.TRANSMISSIONTYPE_ID=f.ID AND a.CLINIC_ID=f.CLINIC_ID
INNER JOIN TBL_ZAALTTYPE g ON a.ZAALTTYPE_ID=g.ID AND a.CLINIC_ID=g.CLINIC_ID
INNER JOIN TBL_SPECTYPE h ON a.SPECTYPE_ID=h.ID AND a.CLINIC_ID=h.CLINIC_ID
INNER JOIN TBL_CARCOLOR i ON a.EXTCOLOR_ID=i.ID AND a.CLINIC_ID=i.CLINIC_ID
INNER JOIN TBL_CARCOLOR j ON a.INTCOLOR_ID=j.ID AND a.CLINIC_ID=j.CLINIC_ID
LEFT JOIN TBL_SOLDCARCUSTOMER_SELLCARS k ON a.ID=k.SELLCARS_ID
WHERE a.CLINIC_ID=" + clinicid+extcolor+intcolor+spectype+mark+ @" AND CONVERT(datetime, a.GETDT) <= GETDATE() AND (k.SELLCARS_ID is null OR k.ISSUBMIT<>1)
ORDER BY a.GETDT DESC");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab1ColorListForDDL(string clinicid, string type)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ID, CODE, NAME, HTMLCODE 
FROM TBL_CARCOLOR
WHERE CLINIC_ID="+clinicid+" AND CARCOLORTYPE_ID="+type+@"
ORDER BY NAME");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab2Datatable(string clinicid, string extcolor, string intcolor, string spectype, string mark)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (extcolor != "") extcolor = " AND a.EXTCOLOR_ID=" + extcolor;
            if (intcolor != "") intcolor = " AND a.INTCOLOR_ID=" + intcolor;
            if (spectype != "") spectype = " AND a.SPECTYPE_ID=" + spectype;
            if (mark != "") mark = " AND a.MARK_ID=" + mark;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT 
    ROW_NUMBER() OVER(ORDER BY a.GETDT DESC) AS RW
	, a.ID
    , b.AUTOMARK_TYPE_ID
	, a.MARK_ID
	, c.NAME + ' - '+b.NAME as MARK_NAME
	, a.PRODUCEDYEAR
	, a.VINNO
	, a.FUELTYPE_ID
	, d.NAME as FUELTYPE_NAME
	, a.TRANSMISSIONTYPE_ID
	, f.NAME as TRANSMISSIONTYPE_NAME
	, a.ZAALTTYPE_ID
	, g.NAME as ZAALTTYPE_NAME
	, a.SPECTYPE_ID
	, h.NAME as SPECTYPE_NAME
	, a.EXTCOLOR_ID
	, i.CODE as EXTCOLORCODE
	, i.NAME as EXTCOLORNAME
	, i.HTMLCODE as EXTCOLORHTMLCODE
	, a.INTCOLOR_ID
	, j.CODE as INTCOLORCODE
	, j.NAME as INTCOLORNAME
	, j.HTMLCODE as INTCOLORHTMLCODE
	, a.GETDT
	, a.PRICE
	, CASE WHEN k.SELLCARS_ID is not null THEN 'success' ELSE null END as ISSELLCARS
FROM TBL_SELLCARS a
INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID AND a.CLINIC_ID=b.CLINIC_ID
INNER JOIN TBL_AUTOMARK_TYPE c ON b.AUTOMARK_TYPE_ID=c.ID AND b.CLINIC_ID=c.CLINIC_ID
INNER JOIN TBL_FUELTYPE d ON a.FUELTYPE_ID=d.ID AND a.CLINIC_ID=d.CLINIC_ID
INNER JOIN TBL_TRANSMISSIONTYPE f ON a.TRANSMISSIONTYPE_ID=f.ID AND a.CLINIC_ID=f.CLINIC_ID
INNER JOIN TBL_ZAALTTYPE g ON a.ZAALTTYPE_ID=g.ID AND a.CLINIC_ID=g.CLINIC_ID
INNER JOIN TBL_SPECTYPE h ON a.SPECTYPE_ID=h.ID AND a.CLINIC_ID=h.CLINIC_ID
INNER JOIN TBL_CARCOLOR i ON a.EXTCOLOR_ID=i.ID AND a.CLINIC_ID=i.CLINIC_ID
INNER JOIN TBL_CARCOLOR j ON a.INTCOLOR_ID=j.ID AND a.CLINIC_ID=j.CLINIC_ID
LEFT JOIN TBL_SOLDCARCUSTOMER_SELLCARS k ON a.ID=k.SELLCARS_ID
WHERE a.CLINIC_ID=" + clinicid + extcolor + intcolor + spectype + mark + @" AND CONVERT(datetime, a.GETDT) > GETDATE() AND (k.SELLCARS_ID is null OR k.ISSUBMIT<>1)
ORDER BY a.GETDT ASC");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab2OrderTypeListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT ID, NAME, BGCOLOR 
FROM TBL_SELLCARSORDERTYPE
WHERE CLINIC_ID=" + clinicid + @"
ORDER BY ID");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab3Datatable(string clinicid, string extcolor, string intcolor, string spectype, string ordertype)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (extcolor != "") extcolor = " AND a.EXTCOLOR_ID=" + extcolor;
            if (intcolor != "") intcolor = " AND a.INTCOLOR_ID=" + intcolor;
            if (spectype != "") spectype = " AND a.SPECTYPE_ID=" + spectype;
            if (ordertype != "") ordertype = " AND a.SELLCARSORDERTYPE_ID=" + ordertype;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT 
    ROW_NUMBER() OVER(ORDER BY a.CREATED_DATE DESC) AS RW, 
	a.ID, 
	a.CUSTOMERNAME, 
	a.CUSTOMERTYPE_ID, 
	b.NAME as CUSTOMERTYPE_NAME, 
	a.CUSTOMERTEL, 
	a.CUSTOMERTEL2, 
	a.CUSTOMEREMAIL, 
	a.CUSTOMERADDRESS, 
	a.MARK_ID, 
	c.NAME as MARK_NAME, 
	a.PRODUCEDYEAR, 
	a.FUELTYPE_ID, 
	d.NAME as FULETYPE_NAME, 
	a.TRANSMISSIONTYPE_ID, 
	f.NAME as TRANSMISSIONTYPE_NAME, 
	a.ZAALTTYPE_ID, 
	g.NAME as ZAALTTYPE_NAME, 
	a.SPECTYPE_ID, 
	h.NAME as SPECTYPE_NAME, 
	a.EXTCOLOR_ID, 
	i.CODE as EXTCOLORCODE, 
	i.NAME as EXTCOLORNAME, 
	i.HTMLCODE as EXTCOLORHTMLCODE, 
	a.INTCOLOR_ID, 
	j.CODE as INTCOLORCODE, 
	j.NAME as INTCOLORNAME, 
	j.HTMLCODE as INTCOLORHTMLCODE, 
	a.GETDT, 
	a.PRICE, 
	a.SELLCARSORDERTYPE_ID, 
	k.NAME as SELLCARSORDERTYPE_NAME, 
	k.BGCOLOR as SELLCARSORDERTYPE_BGCOLOR
FROM TBL_SOLDCARCUSTOMER_ORDER a
INNER JOIN TBL_CUSTOMERTYPE b ON a.CUSTOMERTYPE_ID=b.ID
INNER JOIN TBL_FUELTYPE d ON a.FUELTYPE_ID=d.ID
INNER JOIN TBL_TRANSMISSIONTYPE f ON a.TRANSMISSIONTYPE_ID=f.ID
INNER JOIN TBL_ZAALTTYPE g ON a.ZAALTTYPE_ID=g.ID
INNER JOIN TBL_SPECTYPE h ON a.SPECTYPE_ID=h.ID
INNER JOIN TBL_AUTOMARK c ON h.MARK_ID=c.ID
INNER JOIN TBL_AUTOMARK_TYPE l ON c.AUTOMARK_TYPE_ID=l.ID
INNER JOIN TBL_CARCOLOR i ON a.EXTCOLOR_ID=i.ID
INNER JOIN TBL_CARCOLOR j ON a.INTCOLOR_ID=j.ID
INNER JOIN TBL_SELLCARSORDERTYPE k ON a.SELLCARSORDERTYPE_ID=k.ID
WHERE a.CLINIC_ID=" + clinicid + extcolor + intcolor + spectype + ordertype + @"
ORDER BY a.CREATED_DATE DESC");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string DealerTab4Datatable(string clinicid, string paymenttp, string spectype, string yr, string mnth)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (paymenttp != "") paymenttp = " AND a.SELLCARSPAYMENTTYPE_ID=" + paymenttp;
            if (spectype != "") spectype = " AND c.SPECTYPE_ID=" + spectype;
            if (yr != "") yr = " AND YEAR(CONVERT(datetime, a.PAYDT))=" + yr;
            if (mnth != "") mnth = " AND MONTH(CONVERT(datetime, a.PAYDT))=" + mnth;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT 
    ROW_NUMBER() OVER(ORDER BY a.PAYDT DESC, a.ID DESC) AS RW, 
	a.ID, 
	a.SOLDCARCUSTOMER_ID, 
	b.RD as CUSTOMERRD,
	b.NAME as CUSTOMERNAME, 
	b.TEL as CUSTOMERTEL, 
	b.TEL2 as CUSTOMERTEL2, 
	a.SELLCARS_ID, 
	g.NAME as AUTOMARK_TYPE_NAME,
	f.NAME as AUTOMARK_NAME, 
	d.NAME as SPECTYPE_NAME, 
	c.VINNO, 
	a.AGGREEMENTNO, 
	a.SELLCARSPAYMENTTYPE_ID, 
	h.NAME as SELLCARSPAYMENTTYPE_NAME, 
	a.PAYDT, 
	a.ISRESOLD,
	a.AGREEMENTATTACH
FROM TBL_SOLDCARCUSTOMER_SELLCARS a
INNER JOIN TBL_SOLDCARCUSTOMER b ON a.SOLDCARCUSTOMER_ID=b.ID
INNER JOIN TBL_SELLCARS c ON a.SELLCARS_ID=c.ID
INNER JOIN TBL_SPECTYPE d ON c.SPECTYPE_ID=d.ID
INNER JOIN TBL_AUTOMARK f ON d.MARK_ID=f.ID
INNER JOIN TBL_AUTOMARK_TYPE g ON f.AUTOMARK_TYPE_ID=g.ID
INNER JOIN TBL_SELLCARSPAYMENTTYPE h ON a.SELLCARSPAYMENTTYPE_ID=h.ID
WHERE a.ISSUBMIT=1 AND b.CLINIC_ID=" + clinicid + paymenttp + spectype+yr+mnth + @"
ORDER BY a.PAYDT DESC, a.ID DESC");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public void INS_DEALERSELL(string CLINIC_ID, string SOLDCARCUSTOMER_ID, string SOLDCARCUSTOMER_RD, string SOLDCARCUSTOMER_NAME, string SOLDCARCUSTOMER_CUSTOMERTYPE_ID, string SOLDCARCUSTOMER_TEL, string SOLDCARCUSTOMER_TEL2, string SOLDCARCUSTOMER_EMAIL, string SOLDCARCUSTOMER_ADDRESS, string SELLCARS_ID, string AGGREEMENTNO, string SELLCARSPAYMENTTYPE_ID, string PAYDT, string AGREEMENTATTACH, string ISRESOLD, string USERID, string SOLDCARCUSTOMER_SELLCARS_ID, string ISSUBMIT, string SOLDCAR_STAFFID)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string[] ParamName = new string[19], ParamValue = new string[19];
            try
            {
                ParamName[0] = "@CLINIC_ID";
                ParamName[1] = "@SOLDCARCUSTOMER_ID";
                ParamName[2] = "@SOLDCARCUSTOMER_RD ";
                ParamName[3] = "@SOLDCARCUSTOMER_NAME";
                ParamName[4] = "@SOLDCARCUSTOMER_CUSTOMERTYPE_ID";
                ParamName[5] = "@SOLDCARCUSTOMER_TEL";
                ParamName[6] = "@SOLDCARCUSTOMER_TEL2";
                ParamName[7] = "@SOLDCARCUSTOMER_EMAIL";
                ParamName[8] = "@SOLDCARCUSTOMER_ADDRESS";
                ParamName[9] = "@SELLCARS_ID";
                ParamName[10] = "@AGGREEMENTNO";
                ParamName[11] = "@SELLCARSPAYMENTTYPE_ID";
                ParamName[12] = "@PAYDT";
                ParamName[13] = "@AGREEMENTATTACH";
                ParamName[14] = "@ISRESOLD";
                ParamName[15] = "@USERID";
                ParamName[16] = "@SOLDCARCUSTOMER_SELLCARS_ID";
                ParamName[17] = "@ISSUBMIT";
                ParamName[18] = "@SOLDCAR_STAFFID";
                ParamValue[0] = CLINIC_ID;
                ParamValue[1] = SOLDCARCUSTOMER_ID;
                ParamValue[2] = SOLDCARCUSTOMER_RD;
                ParamValue[3] = SOLDCARCUSTOMER_NAME;
                ParamValue[4] = SOLDCARCUSTOMER_CUSTOMERTYPE_ID;
                ParamValue[5] = SOLDCARCUSTOMER_TEL;
                ParamValue[6] = SOLDCARCUSTOMER_TEL2;
                ParamValue[7] = SOLDCARCUSTOMER_EMAIL;
                ParamValue[8] = SOLDCARCUSTOMER_ADDRESS;
                ParamValue[9] = SELLCARS_ID;
                ParamValue[10] = AGGREEMENTNO;
                ParamValue[11] = SELLCARSPAYMENTTYPE_ID;
                ParamValue[12] = PAYDT;
                ParamValue[13] = AGREEMENTATTACH;
                ParamValue[14] = ISRESOLD;
                ParamValue[15] = USERID;
                ParamValue[16] = SOLDCARCUSTOMER_SELLCARS_ID;
                ParamValue[17] = ISSUBMIT;
                ParamValue[18] = SOLDCAR_STAFFID;
                myObjModifyDB.SP_ExecuteNonQuery("INS_DEALERSELL", ParamName, ParamValue);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****rprt3.aspx*****//
        public string Rprt3Tab1Datatable(string clinicid, string begindate, string enddate, string ismysold)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (ismysold != "")
            {
                if(ismysold != "1") ismysold = " WHERE (b.ISMYSOLD = 0 OR b.ISMYSOLD is null)";
                else ismysold = " WHERE b.ISMYSOLD=" + ismysold;
            }
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry0 = @"SELECT 
	ROW_NUMBER() OVER(ORDER BY b.CODE DESC) AS RW, 
	b.ID, 
	b.CODE, 
	b.NAME, 
	CASE WHEN b.[TYPE] = 1 THEN N'Хувь хүн' ELSE N'Байгууллага' END as [TYPE], 
	c.NAME as MARK_NAME, 
	b.PRODUCEDYEAR, 
	b.AUTONO, 
	b.VINNO,
	a.APPOINTMENTCNT 
FROM (
	SELECT a.PATIENT_ID, COUNT(a.ID) as APPOINTMENTCNT
	FROM TBL_APPOINTMENT a
	INNER JOIN TBL_APPOINTMENT_TYPE b ON a.APPOINTMENT_TYPE_ID=b.ID
	WHERE a.CLINIC_ID="+ clinicid + " AND b.ISACTIVESHOW=1 AND a.DT BETWEEN '"+ begindate + "' AND '"+enddate+@"'
	GROUP BY a.PATIENT_ID
) a
INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID
INNER JOIN TBL_AUTOMARK c ON b.MARK_ID=c.ID " + ismysold;
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt3Tab2Datatable(string clinicid, string yr, string mnth, string ismysold)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            DataSet ds = null;
            int iLastDay= DateTime.DaysInMonth(Int32.Parse(yr), Int32.Parse(mnth));
            string strRequestIdList="", strRequestNameList = "", strRequest = "", strRequestA = "";
            string strDateList = "", strDateListA = "";
            string valData = "";
            string strFullMnth = "";
            if (Int32.Parse(mnth) < 10) strFullMnth = "0" + mnth;
            else strFullMnth = mnth;
            string strFullI = "";
            if (ismysold != "")
            {
                if (ismysold != "1") ismysold = " WHERE (b.ISMYSOLD = 0 OR b.ISMYSOLD is null)";
                else ismysold = " WHERE b.ISMYSOLD=" + ismysold;
            }
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry0 = @"SELECT ID, NAME FROM TBL_REQUESTTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID";
                ds = myObjModifyDB.ExecuteDataSet(strQry0);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (strRequestIdList != "") strRequestIdList += ",";
                        strRequestIdList += dr["ID"].ToString();
                        if (strRequestNameList != "") strRequestNameList += ",";
                        strRequestNameList += dr["NAME"].ToString();
                        if (strRequest != "") strRequest += ", ";
                        strRequest += "[" + dr["ID"].ToString() + "]";
                        if (strRequestA != "") strRequestA += ", ";
                        strRequestA += "a.[" + dr["ID"].ToString() + "]";
                    }
                }
                for (int i = 1; i <= iLastDay; i++) {
                    if (i < 10) strFullI = "0" + i.ToString();
                    else strFullI = i.ToString();
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            if (strDateList != "") strDateList += ", ";
                            strDateList += "["+yr+"-"+ strFullMnth + "-"+ strFullI + "_"+dr["ID"].ToString()+"]";
                            if (strDateListA != "") strDateListA += ", ";
                            strDateListA += "CASE WHEN ISNULL(a.[" + yr + "-" + strFullMnth + "-" + strFullI + "_" + dr["ID"].ToString() + "],0)=0 THEN '-' ELSE CAST(ISNULL(a.[" + yr + "-" + strFullMnth + "-" + strFullI + "_" + dr["ID"].ToString() + "],0) as varchar) END AS [" + yr + "-" + strFullMnth + "-" + strFullI + "_" + dr["ID"].ToString() + "]";
                        }
                    }
                    if (strDateList != "") strDateList += ", ";
                    strDateList += "[" + yr + "-" + strFullMnth + "-" + strFullI + "_9911], [" + yr + "-" + strFullMnth + "-" + strFullI + "_9922]";
                    if (strDateListA != "") strDateListA += ", ";
                    strDateListA += "CASE WHEN ISNULL(a.[" + yr + "-" + strFullMnth + "-" + strFullI + "_9911],0)=0 THEN '-' ELSE CAST(ISNULL(a.[" + yr + "-" + strFullMnth + "-" + strFullI + "_9911],0) as varchar) END AS [" + yr + "-" + strFullMnth + "-" + strFullI + "_9911], CASE WHEN ISNULL(a.[" + yr + "-" + strFullMnth + "-" + strFullI + "_9922],0)=0 THEN '-' ELSE CAST(ISNULL(a.[" + yr + "-" + strFullMnth + "-" + strFullI + "_9922],0) as varchar) END AS [" + yr + "-" + strFullMnth + "-" + strFullI + "_9922]";
                }
                string strQry1 = @"SELECT
	ROW_NUMBER() OVER(ORDER BY b.NAME ASC) AS RW, 
	a.MARK_ID, 
	b.NAME as MARK_NAME, 
	"+ strDateListA + @"
FROM (
	SELECT 
		MARK_ID, 
		"+ strDateList + @"
	FROM (
		SELECT 
			MARK_ID, 
			DT+'_'+COL as COL, 
			VALUE
		FROM (
			
			SELECT 
				a.MARK_ID, a.DT, "+ strRequestA + @", a.[9911], a.[9922]
			FROM (
				SELECT 
					MARK_ID, DT, "+ strRequest + @", [9911], [9922]
				FROM (
					SELECT 
						a.MARK_ID, a.REQUESTTYPE_ID, a.DT, 1 as VAL
					FROM (
						SELECT 
							a.ID, 
							b.MARK_ID, 
							c.REQUESTTYPE_ID, 
							datepart(day, datediff(day, 0, CONVERT(datetime, a.DT+' 00:00:01', 120))/7 * 7)/7 + 1 as NUMOFWK, 
							a.DT
						FROM TBL_APPOINTMENT a 
						INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID
						INNER JOIN TBL_APPOINTMENT_REQUESTTYPE c ON a.ID=c.APPOINTMENT_ID 
						INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID
						WHERE d.ISACTIVESHOW=1 AND a.CLINIC_ID = " + clinicid + @" AND YEAR(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + yr+ @" AND MONTH(CONVERT(datetime, a.DT+' 00:00:01', 120))="+mnth+@" "+ ismysold.Replace("WHERE","AND") + @"
					) a
					UNION ALL
					SELECT
						a.MARK_ID, 9911 as REQUESTTYPE_ID, a.DT, a.PRICESUM as VAL
					FROM (
						SELECT
							c.MARK_ID, b.DT, SUM(a.PRICESUM) as PRICESUM
						FROM (
							SELECT a.ID, SUM(a.PRICESUM) as PRICESUM
							FROM(
								SELECT a.ID, ISNULL(SUM(c.PRICE), 0) as PRICESUM
								FROM TBL_APPOINTMENT a
								INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID
								LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE b ON a.ID = b.APPOINTMENT_ID
								LEFT JOIN TBL_DIAGNOSTICTYPE c ON b.DIAGNOSTICTYPE_ID = c.ID
								WHERE d.ISACTIVESHOW=1 AND a.CLINIC_ID = "+clinicid+@" AND YEAR(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + yr + @" AND MONTH(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + mnth + @"
								GROUP BY a.ID
								UNION ALL
								SELECT a.ID, ISNULL(SUM(b.SERVICE_PRICE * b.CNT), 0) as PRICESUM
								FROM TBL_APPOINTMENT a
								INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID
								LEFT JOIN TBL_APPOINTMENT_SERVICE b ON a.ID = b.APPOINTMENT_ID
								WHERE d.ISACTIVESHOW=1 AND a.CLINIC_ID = " + clinicid + @" AND YEAR(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + yr + @" AND MONTH(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + mnth + @"
								GROUP BY a.ID
								UNION ALL
								SELECT a.ID, ISNULL(SUM(b.PART_PRICE * b.CNT), 0) as PRICESUM
								FROM TBL_APPOINTMENT a
								INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID
								LEFT JOIN TBL_APPOINTMENT_PART b ON a.ID = b.APPOINTMENT_ID
								WHERE d.ISACTIVESHOW=1 AND a.CLINIC_ID = " + clinicid + @" AND YEAR(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + yr + @" AND MONTH(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + mnth + @"
								GROUP BY a.ID
							) a
							GROUP BY a.ID
						) a 
						INNER JOIN TBL_APPOINTMENT b ON a.ID=b.ID
						INNER JOIN TBL_PATIENT c ON b.PATIENT_ID=c.ID " + ismysold.Replace("b.","c.") + @"
						GROUP BY c.MARK_ID, b.DT
					) a
					UNION ALL
					SELECT
						a.MARK_ID, 9922 as REQUESTTYPE_ID, a.DT, a.CNTTP as VAL
					FROM (
						SELECT 
							b.MARK_ID, 
							a.DT, 
							COUNT(c.REQUESTTYPE_ID) as CNTTP
						FROM TBL_APPOINTMENT a 
						INNER JOIN TBL_PATIENT b ON a.PATIENT_ID=b.ID
						INNER JOIN TBL_APPOINTMENT_REQUESTTYPE c ON a.ID=c.APPOINTMENT_ID 
						INNER JOIN TBL_APPOINTMENT_TYPE d ON a.APPOINTMENT_TYPE_ID=d.ID
						WHERE d.ISACTIVESHOW=1 AND a.CLINIC_ID = " + clinicid + @" AND YEAR(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + yr + @" AND MONTH(CONVERT(datetime, a.DT+' 00:00:01', 120))=" + mnth + @" " + ismysold.Replace("WHERE", "AND") + @"
						GROUP BY b.MARK_ID, a.DT
					) a

				) a
				PIVOT (
					SUM(VAL) 
					FOR REQUESTTYPE_ID IN (" + strRequest + @", [9911], [9922])
				) as SUMD
			) a
			
		) src
		UNPIVOT
		(
			VALUE FOR COL IN (" + strRequest + @", [9911], [9922])
		) unpiv
	) a
	PIVOT (
		SUM(VALUE)
		FOR COL IN (" + strDateList + @")
	) as PIV
) a
INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID
ORDER BY b.NAME";
                ds = myObjModifyDB.ExecuteDataSet(strQry1);
                valData = "";
                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;\">";
                valData += "<tbody>";
                valData += "<tr style=\"background-color:#C6D9F1;\">";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">#</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Модел</th>";
                for (int i = 1; i <= iLastDay; i++)
                {
                    valData += "<th colspan=\"" + (strRequestIdList.Split(',').Length + 2).ToString() + "\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">" + yr + "-" + strFullMnth + "-" + i.ToString() + "</th>";
                }
                valData += "</tr>";
                valData += "<tr style=\"background-color:#C6D9F1;\">";
                for (int i = 1; i <= iLastDay; i++)
                {
                    for (int y = 1; y <= strRequestIdList.Split(',').Length; y++)
                    {
                        valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">" + strRequestNameList.Split(',')[y-1] + "</th>";
                    }
                    valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт</th>";
                    valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Төлбөр</th>";
                }
                valData += "</tr>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        valData += "<tr>";
                        valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td>";
                        valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["MARK_NAME"].ToString() + "</td>";
                        for (int i = 1; i <= iLastDay; i++)
                        {
                            if (i < 10) strFullI = "0" + i.ToString();
                            else strFullI = i.ToString();
                            for (int y = 1; y <= strRequestIdList.Split(',').Length; y++)
                            {
                                valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[yr+"-"+ strFullMnth + "-"+ strFullI + "_"+ strRequestIdList.Split(',')[y-1]].ToString() + "</td>";
                            }
                            valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[yr + "-" + strFullMnth + "-" + strFullI + "_9922"].ToString() + "</td>";
                            if(dr[yr + "-" + strFullMnth + "-" + strFullI + "_9911"].ToString() != "-") valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + String.Format("{0:C0}", Convert.ToDecimal(dr[yr + "-" + strFullMnth + "-" + strFullI + "_9911"].ToString())).Replace("$", String.Empty) + "</td>";
                            else valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + dr[yr + "-" + strFullMnth + "-" + strFullI + "_9911"].ToString() + "</td>";
                        }
                        valData += "</tr>";
                    }
                }
                return valData;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt3TabsStaffListForDDL(string clinicid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                DataSet ds = myObjModifyDB.ExecuteDataSet(@"SELECT
	a.ID, a.STAFF_POSITION_ID, b.NAME as STAFF_POSITION_NAME, a.FNAME+'. '+LEFT(a.LNAME,1) as STAFFNAME
FROM TBL_STAFF a 
INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID
WHERE a.CLINIC_ID="+ clinicid + @" AND a.STAFF_POSITION_ID IN (SELECT STAFF_POSITION_ID FROM TBL_JOBPOSITION WHERE STAFF_POSITION_ID IS NOT NULL)
ORDER BY b.NAME, a.FNAME+'. '+LEFT(a.LNAME,1)");
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt3Tab3Datatable(string clinicid, string begindate, string enddate, string staffid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string strreturnval = "";
            string strQry0 = "", strQry1 = "";
            DataSet ds = null;
            int[] arrIntVals = new int[0];
            int dr1I = 0;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                strQry0 = @"DECLARE @cols AS NVARCHAR(MAX), @cols2 AS NVARCHAR(MAX), @cols3 AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX);  
SET @cols = STUFF(( SELECT ',' + QUOTENAME(c.NAME) 
FROM TBL_REPAIRTYPE c 
WHERE c.CLINIC_ID="+ clinicid + @" 
ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') 
SET @cols2 = STUFF(( SELECT ',SUM(a.' + QUOTENAME(c.NAME)+') as '+QUOTENAME(c.NAME) 
FROM TBL_REPAIRTYPE c 
WHERE c.CLINIC_ID=" + clinicid + @" 
ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') 
SET @cols3 = STUFF(( SELECT ',a.' + QUOTENAME(c.NAME) 
FROM TBL_REPAIRTYPE c 
WHERE c.CLINIC_ID= " + clinicid + @" 
ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'')  
set @query = 'SELECT ROW_NUMBER() OVER(ORDER BY  a.STAFF_POSITION_NAME, a.STAFFNAME ASC) AS RW, a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME, a.APPOINTMENT_CNT, a.SUMCNT, a.SUMPRICE, '+@cols3+' FROM ( SELECT a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME, COUNT(a.APPOINTMENT_ID) as APPOINTMENT_CNT, SUM(a.SUMCNT) as SUMCNT, SUM(a.SUMPRICE) as SUMPRICE, '+@cols2+' FROM ( SELECT a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME, a.APPOINTMENT_ID, a.SUMCNT, a.SUMPRICE, '+@cols2+' FROM ( SELECT STAFF_ID, STAFF_POSITION_ID, STAFF_POSITION_NAME, STAFFNAME, APPOINTMENT_ID, SUMCNT, SUMPRICE, ' + @cols + ' FROM ( SELECT a.STAFF_ID, b.STAFF_POSITION_ID, c.NAME as STAFF_POSITION_NAME, b.FNAME+''. ''+LEFT(b.LNAME,1) as STAFFNAME, a.APPOINTMENT_ID, a.SUMCNT, a.SUMPRICE, f.NAME as REPAIR_NAME FROM ( SELECT a.STAFF_ID, a.APPOINTMENT_ID, SUM(c.CNT) as SUMCNT, SUM((ISNULL(c.SERVICE_PRICE,0)*ISNULL(c.CNT,0))) as SUMPRICE FROM ( SELECT a.ID as APPOINTMENT_ID, " + staffid + @" as STAFF_ID FROM TBL_APPOINTMENT a INNER JOIN TBL_APPOINTMENT_REPAIR b ON a.ID=b.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 WHERE a.CLINIC_ID=" + clinicid + @"  AND a.DT BETWEEN ''" + begindate + @"'' AND ''" + enddate + @"'' AND (b.MECHANICAL_STAFFID="+staffid+ @" OR b.SENIORMECHANICAL_STAFFID=" + staffid + @" OR b.SERVICECONSULTANT_STAFFID=" + staffid + @") GROUP BY a.ID ) a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID LEFT JOIN TBL_APPOINTMENT_SERVICE c ON a.APPOINTMENT_ID=c.APPOINTMENT_ID INNER JOIN TBL_APPOINTMENT_TYPE d ON b.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 GROUP BY a.STAFF_ID, a.APPOINTMENT_ID ) a INNER JOIN TBL_STAFF b ON a.STAFF_ID=b.ID INNER JOIN TBL_STAFF_POSITION c ON b.STAFF_POSITION_ID=c.ID LEFT JOIN TBL_APPOINTMENT_REPAIR d ON a.APPOINTMENT_ID=d.APPOINTMENT_ID LEFT JOIN TBL_REPAIRTYPE f ON d.REPAIRTYPE_ID=f.ID ) x pivot ( COUNT(REPAIR_NAME) for REPAIR_NAME in (' + @cols + ') ) p ) a GROUP BY a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME, a.APPOINTMENT_ID, a.SUMCNT, a.SUMPRICE ) a GROUP BY a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME ) a ORDER BY a.STAFF_POSITION_NAME, a.STAFFNAME ASC' execute(@query)
";
                strQry1 = "SELECT NAME FROM TBL_REPAIRTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID";
                ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1);
                strreturnval += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                strreturnval += "<thead>";
                strreturnval += "<tr style=\"background-color:#C6D9F1;\">";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center; width:31px;\">#</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Албан тушаал</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нэр</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Захиалгын тоо</th>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    arrIntVals = new int[ds.Tables[1].Rows.Count];
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NAME"].ToString() + "</th>";
                    }
                }
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт засвар үйлчилгээний тоо</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт дүн</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["STAFF_POSITION_NAME"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["STAFFNAME"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["APPOINTMENT_CNT"].ToString() + "</td>";
                        if (ds.Tables[1].Rows.Count != 0)
                        {
                            dr1I = 0;
                            foreach (DataRow dr1 in ds.Tables[1].Rows)
                            {
                                arrIntVals[dr1I] += Convert.ToInt32(dr[dr1["NAME"].ToString()].ToString());
                                dr1I++;
                                strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[dr1["NAME"].ToString()].ToString() + "</td>";
                            }
                        }
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["SUMCNT"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["SUMPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
        public string Rprt3Tab4Datatable(string clinicid, string begindate, string enddate, string staffid)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            string strreturnval = "";
            string strQry0 = "", strQry1 = "";
            DataSet ds = null;
            int[] arrIntVals = new int[0];
            int dr1I = 0;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                strQry0 = @"DECLARE @cols AS NVARCHAR(MAX), @cols2 AS NVARCHAR(MAX), @cols3 AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX);  
SET @cols = STUFF(( SELECT ',' + QUOTENAME(c.NAME) 
FROM TBL_DIAGNOSTICTYPE c 
WHERE c.CLINIC_ID=" + clinicid + @"  
ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') 
SET @cols2 = STUFF(( SELECT ',SUM(a.' + QUOTENAME(c.NAME)+') as '+QUOTENAME(c.NAME) 
FROM TBL_DIAGNOSTICTYPE c 
WHERE c.CLINIC_ID=" + clinicid + @"  
ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'') 
SET @cols3 = STUFF(( SELECT ',a.' + QUOTENAME(c.NAME) 
FROM TBL_DIAGNOSTICTYPE c 
WHERE c.CLINIC_ID= " + clinicid + @"  
ORDER BY c.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)') ,1,1,'')  
set @query = 'SELECT ROW_NUMBER() OVER(ORDER BY  a.STAFF_POSITION_NAME, a.STAFFNAME ASC) AS RW, a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME, a.APPOINTMENT_CNT, a.SUMCNT, a.SUMPRICE, '+@cols3+' 
FROM ( 
	SELECT a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME, COUNT(a.APPOINTMENT_ID) as APPOINTMENT_CNT, SUM(a.SUMCNT) as SUMCNT, SUM(a.SUMPRICE) as SUMPRICE, '+@cols2+' 
	FROM ( 
		SELECT a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME, a.APPOINTMENT_ID, a.SUMCNT, a.SUMPRICE, '+@cols2+' 
		FROM ( 
			SELECT STAFF_ID, STAFF_POSITION_ID, STAFF_POSITION_NAME, STAFFNAME, APPOINTMENT_ID, SUMCNT, SUMPRICE, ' + @cols + ' 
			FROM ( 

				SELECT a.STAFF_ID, b.STAFF_POSITION_ID, c.NAME as STAFF_POSITION_NAME, b.FNAME+''. ''+LEFT(b.LNAME,1) as STAFFNAME, a.APPOINTMENT_ID, a.SUMCNT, a.SUMPRICE, f.NAME as DIAGNOSTICTYPE_NAME
				FROM (
					SELECT a.STAFF_ID, a.APPOINTMENT_ID, SUM(c.CNT) as SUMCNT, SUM((ISNULL(c.PRICE,0)*ISNULL(c.CNT,0))) as SUMPRICE 
					FROM (
						SELECT a.ID as APPOINTMENT_ID, " + staffid + @" as STAFF_ID
						FROM TBL_APPOINTMENT a 
						INNER JOIN TBL_APPOINTMENT_DIAGNOSTIC b ON a.ID=b.APPOINTMENT_ID 
						INNER JOIN TBL_APPOINTMENT_TYPE c ON a.APPOINTMENT_TYPE_ID=c.ID AND c.ISACTIVESHOW=1 
						WHERE a.CLINIC_ID=" + clinicid + @" AND a.DT BETWEEN ''"+ begindate + @"'' AND ''"+ enddate + @"'' AND (b.MECHANICAL_STAFFID="+staffid+ @" OR b.SENIORMECHANICAL_STAFFID=" + staffid + @" OR b.SERVICECONSULTANT_STAFFID=" + staffid + @")
						GROUP BY a.ID
					) a 
					INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID
					LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE c ON a.APPOINTMENT_ID=c.APPOINTMENT_ID
					INNER JOIN TBL_APPOINTMENT_TYPE d ON b.APPOINTMENT_TYPE_ID=d.ID AND d.ISACTIVESHOW=1 
					GROUP BY a.STAFF_ID, a.APPOINTMENT_ID
				) a
				INNER JOIN TBL_STAFF b ON a.STAFF_ID=b.ID
				INNER JOIN TBL_STAFF_POSITION c ON b.STAFF_POSITION_ID=c.ID
				LEFT JOIN TBL_APPOINTMENT_DIAGNOSTICTYPE d ON a.APPOINTMENT_ID=d.APPOINTMENT_ID 
				LEFT JOIN TBL_DIAGNOSTICTYPE f ON d.DIAGNOSTICTYPE_ID=f.ID 

			) x pivot ( 
				COUNT(DIAGNOSTICTYPE_NAME) 
				for DIAGNOSTICTYPE_NAME in (' + @cols + ') 
			) p 
		) a 
		GROUP BY a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME, a.APPOINTMENT_ID, a.SUMCNT, a.SUMPRICE 
	) a 
	GROUP BY a.STAFF_ID, a.STAFF_POSITION_ID, a.STAFF_POSITION_NAME, a.STAFFNAME 
) a 
ORDER BY a.STAFF_POSITION_NAME, a.STAFFNAME ASC' execute(@query)";
                strQry1 = "SELECT NAME FROM TBL_DIAGNOSTICTYPE WHERE CLINIC_ID=" + clinicid + " ORDER BY ID";
                ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1);
                strreturnval += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                strreturnval += "<thead>";
                strreturnval += "<tr style=\"background-color:#C6D9F1;\">";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center; width:31px;\">#</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Албан тушаал</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нэр</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Захиалгын тоо</th>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    arrIntVals = new int[ds.Tables[1].Rows.Count];
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NAME"].ToString() + "</th>";
                    }
                }
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт оношлогооны тоо</th>";
                strreturnval += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт дүн</th>";
                strreturnval += "</tr>";
                strreturnval += "</thead>";
                strreturnval += "<tbody>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strreturnval += "<tr>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["RW"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["STAFF_POSITION_NAME"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + dr["STAFFNAME"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["APPOINTMENT_CNT"].ToString() + "</td>";
                        if (ds.Tables[1].Rows.Count != 0)
                        {
                            dr1I = 0;
                            foreach (DataRow dr1 in ds.Tables[1].Rows)
                            {
                                arrIntVals[dr1I] += Convert.ToInt32(dr[dr1["NAME"].ToString()].ToString());
                                dr1I++;
                                strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr[dr1["NAME"].ToString()].ToString() + "</td>";
                            }
                        }
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["SUMCNT"].ToString() + "</td>";
                        strreturnval += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">₮" + String.Format("{0:C0}", Convert.ToDecimal(dr["SUMPRICE"].ToString())).Replace("$", String.Empty) + "</td>";
                        strreturnval += "</tr>";
                    }
                }
                strreturnval += "</tbody>";
                strreturnval += "</table>";
                return strreturnval;
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }

        //*****dealerrprt.aspx*****//
        public string DealerrprtTab1Datatable(string clinicid, string tp)
        {
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            if (tp != "")
            {
                if (tp == "1") tp = " AND CONVERT(datetime, a.GETDT) <= GETDATE() AND (k.SELLCARS_ID is null OR k.ISSUBMIT<>1)";
                else tp = " AND CONVERT(datetime, a.GETDT) > GETDATE() AND (k.SELLCARS_ID is null OR k.ISSUBMIT<>1)";
            }
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                string strQry0 = @"SELECT 
    ROW_NUMBER() OVER(ORDER BY a.GETDT DESC) AS RW
	, a.ID
    , b.AUTOMARK_TYPE_ID
	, a.MARK_ID
	, c.NAME + ' - '+b.NAME as MARK_NAME
	, a.PRODUCEDYEAR
	, a.VINNO
	, a.FUELTYPE_ID
	, d.NAME as FUELTYPE_NAME
	, a.TRANSMISSIONTYPE_ID
	, f.NAME as TRANSMISSIONTYPE_NAME
	, a.ZAALTTYPE_ID
	, g.NAME as ZAALTTYPE_NAME
	, a.SPECTYPE_ID
	, h.NAME as SPECTYPE_NAME
	, a.EXTCOLOR_ID
	, i.CODE as EXTCOLORCODE
	, i.NAME as EXTCOLORNAME
	, i.HTMLCODE as EXTCOLORHTMLCODE
	, a.INTCOLOR_ID
	, j.CODE as INTCOLORCODE
	, j.NAME as INTCOLORNAME
	, j.HTMLCODE as INTCOLORHTMLCODE
	, a.GETDT
	, a.PRICE
	, CAST(ROUND(a.PRICE/1000000,1) as numeric(36,1)) as PRICE_MLN
	, CASE WHEN k.SELLCARS_ID is not null THEN N'Захиалгатай' ELSE null END as ISSELLCARS
FROM TBL_SELLCARS a
INNER JOIN TBL_AUTOMARK b ON a.MARK_ID=b.ID AND a.CLINIC_ID=b.CLINIC_ID
INNER JOIN TBL_AUTOMARK_TYPE c ON b.AUTOMARK_TYPE_ID=c.ID AND b.CLINIC_ID=c.CLINIC_ID
INNER JOIN TBL_FUELTYPE d ON a.FUELTYPE_ID=d.ID AND a.CLINIC_ID=d.CLINIC_ID
INNER JOIN TBL_TRANSMISSIONTYPE f ON a.TRANSMISSIONTYPE_ID=f.ID AND a.CLINIC_ID=f.CLINIC_ID
INNER JOIN TBL_ZAALTTYPE g ON a.ZAALTTYPE_ID=g.ID AND a.CLINIC_ID=g.CLINIC_ID
INNER JOIN TBL_SPECTYPE h ON a.SPECTYPE_ID=h.ID AND a.CLINIC_ID=h.CLINIC_ID
INNER JOIN TBL_CARCOLOR i ON a.EXTCOLOR_ID=i.ID AND a.CLINIC_ID=i.CLINIC_ID
INNER JOIN TBL_CARCOLOR j ON a.INTCOLOR_ID=j.ID AND a.CLINIC_ID=j.CLINIC_ID
LEFT JOIN TBL_SOLDCARCUSTOMER_SELLCARS k ON a.ID=k.SELLCARS_ID
WHERE a.CLINIC_ID=" + clinicid + tp + @"
ORDER BY c.NAME, b.NAME, a.GETDT DESC";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0);
                return myObjGetData.DataTableToJson(ds.Tables[0]);
            }
            catch (cs.MyException ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetData.exeptionMethod(ex);
                throw ex;
            }
        }
    }
}
