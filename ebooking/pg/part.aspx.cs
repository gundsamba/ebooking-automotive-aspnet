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
    public partial class part : System.Web.UI.Page
    {
        DataSet ds = null;
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
                ds = myObjModifyDB.ExecuteDataSet("SELECT a.ID, a.NAME FROM ( SELECT CAST(ID as varchar) as ID, NAME FROM TBL_PART_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ) a ORDER BY a.ID");
                partTab1SelectPartType.DataSource = ds.Tables[0];
                partTab1SelectPartType.DataTextField = "NAME";
                partTab1SelectPartType.DataValueField = "ID";
                partTab1SelectPartType.DataBind();
                partTab1ModalSelectPartType.DataSource = ds.Tables[0];
                partTab1ModalSelectPartType.DataTextField = "NAME";
                partTab1ModalSelectPartType.DataValueField = "ID";
                partTab1ModalSelectPartType.DataBind();
                partTab3SelectPartType.DataSource = ds.Tables[0];
                partTab3SelectPartType.DataTextField = "NAME";
                partTab3SelectPartType.DataValueField = "ID";
                partTab3SelectPartType.DataBind();
                partTab4SelectPartType.DataSource = ds.Tables[0];
                partTab4SelectPartType.DataTextField = "NAME";
                partTab4SelectPartType.DataValueField = "ID";
                partTab4SelectPartType.DataBind();
                partTab3ModalSelectPartType.DataSource = ds.Tables[0];
                partTab3ModalSelectPartType.DataTextField = "NAME";
                partTab3ModalSelectPartType.DataValueField = "ID";
                partTab3ModalSelectPartType.DataBind();
                partTab1ModalExcelSelectPartType.DataSource = ds.Tables[0];
                partTab1ModalExcelSelectPartType.DataTextField = "NAME";
                partTab1ModalExcelSelectPartType.DataValueField = "ID";
                partTab1ModalExcelSelectPartType.DataBind();
                partTab4SelectStartDate.Value = DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 1).ToString("yyyy-MM-dd");
                partTab4SelectEndDate.Value = DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 7).ToString("yyyy-MM-dd");
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