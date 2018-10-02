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
    public partial class service : System.Web.UI.Page
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
                ds = myObjModifyDB.ExecuteDataSet("SELECT a.ID, a.NAME FROM ( SELECT CAST(ID as varchar) as ID, NAME FROM TBL_SERVICE_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ) a ORDER BY a.ID");
                serviceTab1SelectServiceType.DataSource = ds.Tables[0];
                serviceTab1SelectServiceType.DataTextField = "NAME";
                serviceTab1SelectServiceType.DataValueField = "ID";
                serviceTab1SelectServiceType.DataBind();
                serviceTab1ModalSelectServiceType.DataSource = ds.Tables[0];
                serviceTab1ModalSelectServiceType.DataTextField = "NAME";
                serviceTab1ModalSelectServiceType.DataValueField = "ID";
                serviceTab1ModalSelectServiceType.DataBind();
                serviceTab3SelectServiceType.DataSource = ds.Tables[0];
                serviceTab3SelectServiceType.DataTextField = "NAME";
                serviceTab3SelectServiceType.DataValueField = "ID";
                serviceTab3SelectServiceType.DataBind();
                serviceTab3ModalSelectServiceType.DataSource = ds.Tables[0];
                serviceTab3ModalSelectServiceType.DataTextField = "NAME";
                serviceTab3ModalSelectServiceType.DataValueField = "ID";
                serviceTab3ModalSelectServiceType.DataBind();
                serviceTab1ModalExcelSelectServiceType.DataSource = ds.Tables[0];
                serviceTab1ModalExcelSelectServiceType.DataTextField = "NAME";
                serviceTab1ModalExcelSelectServiceType.DataValueField = "ID";
                serviceTab1ModalExcelSelectServiceType.DataBind();
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