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
    public partial class usersetup : System.Web.UI.Page
    {
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
                string strQry0 = @"SELECT ID, NAME FROM TBL_ROLE ORDER BY ID";
                string strQry1 = @"SELECT CAST(a.ID as varchar) as ID, a.FNAME+'.'+LEFT(a.LNAME,1)+' | '+b.NAME as NAME 
FROM TBL_STAFF a 
INNER JOIN TBL_STAFF_POSITION b ON a.STAFF_POSITION_ID=b.ID 
WHERE a.ISACTIVE=1 AND a.CLINIC_ID = (SELECT CLINIC_ID FROM TBL_USER WHERE ID=" + Session["eBook_UserID"].ToString() + @")
ORDER BY a.FNAME+'.'+LEFT(a.LNAME,1)";
                DataSet ds = myObjModifyDB.ExecuteDataSet(strQry0 + "    " + strQry1);
                roleListDiv.InnerHtml = "<label class=\"label\" lang=\"mn\">*Модулын эрх</label>";
                if (ds.Tables[0].Rows.Count != 0)
                {
                    int valIndex = 0;
                    roleListDiv.InnerHtml += "<div class=\"row\">";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (valIndex % 10 == 0)
                        {
                            if (valIndex != 0) roleListDiv.InnerHtml += "</div>";
                            roleListDiv.InnerHtml += "<div class=\"col col-6\">";
                        }
                        roleListDiv.InnerHtml += "<label class=\"checkbox\"><input id=\"usersetupModalInputRole" + dr["ID"].ToString() + "\" name=\"usersetupModalInputRole\" type=\"checkbox\" value=\"" + dr["ID"].ToString() + "\"><i></i><span lang=\"mn\">" + dr["NAME"].ToString() + "</span></label>";
                        valIndex++;
                    }
                    roleListDiv.InnerHtml += "</div>";
                }
                else roleListDiv.InnerHtml += "Мэдээлэл олдсонгүй...";

                staffListDiv.InnerHtml = "<label class=\"label\" lang=\"mn\">*Хамрах ажилтан</label>";
                if (ds.Tables[1].Rows.Count != 0)
                {
                    staffListDiv.InnerHtml += "<label class=\"select\">";
                    staffListDiv.InnerHtml += "<select id=\"usersetupModalSelectStaffs\" name=\"usersetupModalSelectStaffs\" multiple style=\"width: 100%\" class=\"select2\">";
                    foreach (DataRow dr in ds.Tables[1].Rows)
                    {
                        staffListDiv.InnerHtml += "<option value=\"" + dr["ID"].ToString() + "\">" + dr["NAME"].ToString() + "</option>";
                    }
                    staffListDiv.InnerHtml += "</select>";
                    staffListDiv.InnerHtml += "</label>";
                }
                else staffListDiv.InnerHtml += "Мэдээлэл олдсонгүй...";
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