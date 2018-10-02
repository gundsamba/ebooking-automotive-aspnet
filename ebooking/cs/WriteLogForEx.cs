using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ebooking.cs
{
    public class WriteLogForEx
    {
        public static void WriteLog(Exception myex)
        {
            //if (HttpContext.Current.Session["eBook_UserID"] != null)
            //{
            //    ModifyDB myObjModifyDB = new ModifyDB();
            //    using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath("~/files/exception/myexlogs.txt")))
            //    {
            //        w.WriteLine("Алдаа : {0} {1} - {2}", DateTime.Now.ToLongTimeString(), DateTime.Now.ToLongDateString(), myObjModifyDB.ExecuteScalar("SELECT USERNAME FROM TBL_USER WHERE ID=" + HttpContext.Current.Session["eBook_UserID"]).ToString());
            //        w.Write("  Message:{0}", myex.Message);
            //        w.WriteLine("  StackTrace:{0}", myex.StackTrace);
            //        w.WriteLine("--------------------------------------------------------------------------------");
            //    }
            //}
            //else
            //{
            //    using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath("~/files/exception/iarexlogs.txt")))
            //    {
            //        w.WriteLine("Алдаа : Session Died");
            //        w.WriteLine("--------------------------------------------------------------------------------");
            //    }
            //}
        }
    }
}