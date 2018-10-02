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
    public partial class setup : System.Web.UI.Page
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eBook_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas(); 
        }
        protected void setDatas()
        {
            string strVal = "";
            ModifyDB myObjModifyDB = new ModifyDB();
            GetData myObjGetData = new GetData();
            try 
            {
                string strQry0 = "SELECT ID, CODE, NAME, ADDR, TEL, TEL2, EMAIL, WEB, FB, LOGO FROM TBL_CLINIC WHERE ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ")";
                string strQry1 = "SELECT ID, NAME, STAFF_POSITION_ID FROM TBL_JOBPOSITION WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ORDER BY ID";
                string strQry2 = "SELECT '' as ID, N'- Сонго -' as NAME UNION ALL SELECT  CAST(ID as varchar) as ID, NAME FROM TBL_STAFF_POSITION WHERE CLINIC_ID=(SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + ") ORDER BY NAME";
                ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1 + "    " + strQry2);
                setupTab8Section1InputName.Value = ds.Tables[0].Rows[0]["NAME"].ToString();
                setupTab8Section1InputAddr.Value = ds.Tables[0].Rows[0]["ADDR"].ToString();
                setupTab8Section1InputTel1.Value = ds.Tables[0].Rows[0]["TEL"].ToString();
                setupTab8Section1InputTel2.Value = ds.Tables[0].Rows[0]["TEL2"].ToString();
                setupTab8Section1InputEmail.Value = ds.Tables[0].Rows[0]["EMAIL"].ToString();
                setupTab8Section1InputWeb.Value = ds.Tables[0].Rows[0]["WEB"].ToString();
                setupTab8Section1InputFb.Value = ds.Tables[0].Rows[0]["FB"].ToString();
                if (ds.Tables[0].Rows[0]["LOGO"].ToString() != "") setupTab8Section1ImgLogo.Src = "../files/cliniclogo/"+ds.Tables[0].Rows[0]["LOGO"].ToString();
                //strVal = "";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        if (dr["ID"].ToString() == "1")
                            setupTab3DivJobPosition1Val.Attributes["data-value"] = dr["STAFF_POSITION_ID"].ToString();
                        else if (dr["ID"].ToString() == "2")
                            setupTab3DivJobPosition2Val.Attributes["data-value"] = dr["STAFF_POSITION_ID"].ToString();
                        else if (dr["ID"].ToString() == "3")
                            setupTab3DivJobPosition3Val.Attributes["data-value"] = dr["STAFF_POSITION_ID"].ToString();
                    }
                }

                setupTab3SelectJobPosition1.DataSource = ds.Tables[2];
                setupTab3SelectJobPosition1.DataTextField = "NAME";
                setupTab3SelectJobPosition1.DataValueField = "ID";
                setupTab3SelectJobPosition1.DataBind();
                setupTab3SelectJobPosition2.DataSource = ds.Tables[2];
                setupTab3SelectJobPosition2.DataTextField = "NAME";
                setupTab3SelectJobPosition2.DataValueField = "ID";
                setupTab3SelectJobPosition2.DataBind();
                setupTab3SelectJobPosition3.DataSource = ds.Tables[2];
                setupTab3SelectJobPosition3.DataTextField = "NAME";
                setupTab3SelectJobPosition3.DataValueField = "ID";
                setupTab3SelectJobPosition3.DataBind();
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