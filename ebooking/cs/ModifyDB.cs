using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ebooking.cs
{
    public class ModifyDB
    {
        public SqlConnection consql;
        public SqlCommand cmdsql;
        /////////MSSQL//////////
        public SqlConnection DBConnectSql()
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                consql = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                if (consql.State == ConnectionState.Closed) consql.Open();
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            return consql;
        }
        public void DBDisconnectSql()
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                if (consql.State == ConnectionState.Open)
                {
                    consql.Close();
                    consql.Dispose();
                }
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
        }
        public int ExecuteNonQuery(string strQry)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.Text;
                cmdsql.CommandText = strQry;
                cmdsql.Connection = DBConnectSql();
                return cmdsql.ExecuteNonQuery();
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { DBDisconnectSql(); }
        }
        public object ExecuteScalar(string strQry)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.Text;
                cmdsql.CommandText = strQry;
                cmdsql.Connection = DBConnectSql();
                return cmdsql.ExecuteScalar();
            }
            catch (NullReferenceException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                return "";
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally
            {
                DBDisconnectSql();
            }
        }
        public SqlDataReader ExecuteReader(string strQry)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.Text;
                cmdsql.CommandText = strQry;
                cmdsql.Connection = DBConnectSql();
                return cmdsql.ExecuteReader();
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { }
        }
        public DataSet ExecuteDataSet(string strQry)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dataSet = null;
            try
            {
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.Text;
                cmdsql.CommandText = strQry;
                cmdsql.Connection = DBConnectSql();
                adapter.SelectCommand = cmdsql;
                dataSet = new DataSet();
                adapter.Fill(dataSet);
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
            finally
            {
                DBDisconnectSql();
            }
            return dataSet;
        }
        public SqlCommand SqlCMD(string strQry)
        {
            GetData myObjGetData = new GetData();
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.Text;
                cmdsql.CommandText = strQry;
                cmdsql.Connection = DBConnectSql();
                return cmdsql;
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { }
        }
        public int SP_ExecuteNonQuery(string SPName, string[] Params1, string[] Params2)
        {
            GetData myObjGetData = new GetData();
            SqlCommand cmdsql;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.StoredProcedure;
                cmdsql.CommandText = SPName;
                cmdsql.Connection = DBConnectSql();
                if ((Params1 != null || Params1.Length > 0) && (Params2 != null || Params2.Length > 0))
                {
                    for (int i = 0; i < Params1.Length; i++)
                    {
                        if(Params2[i] == "") cmdsql.Parameters.AddWithValue(Params1[i], DBNull.Value);
                        else cmdsql.Parameters.AddWithValue(Params1[i], Params2[i]);
                    }
                }
                return cmdsql.ExecuteNonQuery();
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { DBDisconnectSql(); }
        }
        public object SP_ExecuteScalar(string SPName, string[] Params1, string[] Params2)
        {
            GetData myObjGetData = new GetData();
            SqlCommand cmdsql;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.StoredProcedure;
                cmdsql.CommandText = SPName;
                cmdsql.Connection = DBConnectSql();
                if ((Params1 != null || Params1.Length > 0) && (Params2 != null || Params2.Length > 0)) for (int i = 0; i < Params1.Length; i++) cmdsql.Parameters.AddWithValue(Params1[i], Params2[i]);
                return cmdsql.ExecuteScalar();
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { DBDisconnectSql(); }
        }
        public SqlDataReader SP_ExecuteReader(string SPName, string[] Params1, string[] Params2)
        {
            GetData myObjGetData = new GetData();
            SqlCommand cmdsql;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.StoredProcedure;
                cmdsql.CommandText = SPName;
                cmdsql.Connection = DBConnectSql();
                if ((Params1 != null || Params1.Length > 0) && (Params2 != null || Params2.Length > 0)) for (int i = 0; i < Params1.Length; i++) cmdsql.Parameters.AddWithValue(Params1[i], Params2[i]);
                return cmdsql.ExecuteReader();
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { DBDisconnectSql(); }
        }
        public SqlCommand SP_CMD(string SPName, string[] Params1, string[] Params2)
        {
            GetData myObjGetData = new GetData();
            SqlCommand cmdsql;
            try
            {
                if (!myObjGetData.checkUserSession()) throw new cs.MyException("SessionDied");
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.StoredProcedure;
                cmdsql.CommandText = SPName;
                cmdsql.Connection = DBConnectSql();
                if ((Params1 != null || Params1.Length > 0) && (Params2 != null || Params2.Length > 0)) for (int i = 0; i < Params1.Length; i++) cmdsql.Parameters.AddWithValue(Params1[i], Params2[i]);
                return cmdsql;
            }
            catch (cs.MyException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { DBDisconnectSql(); }
        }
        public DataSet SP_ExecuteDataSet(string SPName, string[] Params1, string[] Params2)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dataSet = null;
            try
            {
                cmdsql = new SqlCommand();
                cmdsql.CommandType = CommandType.StoredProcedure;
                cmdsql.CommandText = SPName;
                cmdsql.Connection = DBConnectSql();
                if ((Params1 != null || Params1.Length > 0) && (Params2 != null || Params2.Length > 0)) for (int i = 0; i < Params1.Length; i++) cmdsql.Parameters.AddWithValue(Params1[i], Params2[i]);
                adapter.SelectCommand = cmdsql;
                dataSet = new DataSet();
                adapter.Fill(dataSet);
                //return dataSet;
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
            finally
            {
            }
            return dataSet;
        }
    }
}