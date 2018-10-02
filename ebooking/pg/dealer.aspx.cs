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
    public partial class dealer : System.Web.UI.Page
    {
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
                string strQry0 = "SELECT '' as ID, N'- Бүгд -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME+' /'+CODE+'/' as NAME FROM TBL_CARCOLOR WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=1) AND CARCOLORTYPE_ID=1 ORDER BY NAME";
                string strQry1 = "SELECT '' as ID, N'- Бүгд -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME+' /'+CODE+'/' as NAME FROM TBL_CARCOLOR WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=1) AND CARCOLORTYPE_ID=2 ORDER BY NAME";
                string strQry2 = "SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_AUTOMARK_TYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                string strQry3 = "SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_SELLCARSORDERTYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                string strQry4 = "SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_SELLCARSPAYMENTTYPE WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                string strQry5 = @"SELECT a.ID, a.NAME, a.POSNAME
FROM ( 
	SELECT '' as ID, N'- Сонго -' as NAME, null as POSNAME 
	UNION ALL 
	SELECT CAST(a.ID as varchar) as ID, a.FNAME+'.'+LEFT(a.LNAME,1)+' | '+b.NAME as NAME, b.NAME as POSNAME
	FROM TBL_STAFF a 
	INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID 
	WHERE a.ISACTIVE=1 AND a.CLINIC_ID=1
) a 
ORDER BY a.POSNAME, a.NAME";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0 + "     " + strQry1 + "     " + strQry2 + "     " + strQry3 + "     " + strQry4 + "     " + strQry5);
                pTab1SelectExtcolor.DataSource = ds.Tables[0];
                pTab1SelectExtcolor.DataTextField = "NAME";
                pTab1SelectExtcolor.DataValueField = "ID";
                pTab1SelectExtcolor.DataBind();
                pTab2SelectExtcolor.DataSource = ds.Tables[0];
                pTab2SelectExtcolor.DataTextField = "NAME";
                pTab2SelectExtcolor.DataValueField = "ID";
                pTab2SelectExtcolor.DataBind();
                pTab1SelectIntcolor.DataSource = ds.Tables[1];
                pTab1SelectIntcolor.DataTextField = "NAME";
                pTab1SelectIntcolor.DataValueField = "ID";
                pTab1SelectIntcolor.DataBind();
                pTab2SelectIntcolor.DataSource = ds.Tables[1];
                pTab2SelectIntcolor.DataTextField = "NAME";
                pTab2SelectIntcolor.DataValueField = "ID";
                pTab2SelectIntcolor.DataBind();
                pTab1ModalSelectMarktype.DataSource = ds.Tables[2];
                pTab1ModalSelectMarktype.DataTextField = "NAME";
                pTab1ModalSelectMarktype.DataValueField = "ID";
                pTab1ModalSelectMarktype.DataBind();
                pTab3ModalSelectOrdertype.DataSource = ds.Tables[3];
                pTab3ModalSelectOrdertype.DataTextField = "NAME";
                pTab3ModalSelectOrdertype.DataValueField = "ID";
                pTab3ModalSelectOrdertype.DataBind();
                pTab1ModalSellSelectPaymenttype.DataSource = ds.Tables[4];
                pTab1ModalSellSelectPaymenttype.DataTextField = "NAME";
                pTab1ModalSellSelectPaymenttype.DataValueField = "ID";
                pTab1ModalSellSelectPaymenttype.DataBind();
                pTab1ModalSellSelectSoldstaff.DataSource = ds.Tables[5];
                pTab1ModalSellSelectSoldstaff.DataTextField = "NAME";
                pTab1ModalSellSelectSoldstaff.DataValueField = "ID";
                pTab1ModalSellSelectSoldstaff.DataBind();

                int highyr = DateTime.Now.Year;
                int lowyr = DateTime.Now.Year - 100;
                for (highyr = DateTime.Now.Year; highyr >= lowyr; highyr--)
                {
                    pTab1ModalSelectProducedyear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                    pTab3ModalSelectProducedyear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                    pTab3SelectYr.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                }
                pTab3SelectYr.SelectedIndex = pTab3SelectYr.Items.IndexOf(pTab3SelectYr.Items.FindByValue(DateTime.Now.Year.ToString()));
                pTab3SelectMnth.SelectedIndex = pTab3SelectMnth.Items.IndexOf(pTab3SelectMnth.Items.FindByValue(DateTime.Now.Month.ToString()));
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