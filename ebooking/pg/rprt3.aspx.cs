using ebooking.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ebooking.pg
{
    public partial class rprt3 : System.Web.UI.Page
    {
        DateTime dtime = DateTime.UtcNow.Date;
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
                pTab1SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                pTab1SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                pTab3SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                pTab3SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                pTab4SelectStartDate.Value = dtime.ToString("yyyy-MM-dd");
                pTab4SelectEndDate.Value = dtime.ToString("yyyy-MM-dd");
                int highyr = DateTime.Now.Year + 10;
                int lowyr = DateTime.Now.Year - 25;
                for (highyr = DateTime.Now.Year; highyr >= lowyr; highyr--)
                {
                    pTab1SelectYear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                }
                pTab1SelectYear.SelectedIndex = pTab1SelectYear.Items.IndexOf(pTab1SelectYear.Items.FindByValue(DateTime.Now.Year.ToString()));
                pTab1SelectMonth.SelectedIndex = pTab1SelectMonth.Items.IndexOf(pTab1SelectMonth.Items.FindByValue(DateTime.Now.Month.ToString()));
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