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
    public partial class dealerTab4ClientShowModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            GetData myObjGetData = new GetData();
            DataSet ds = null;
            try
            {
                ds = myObj.ExecuteDataSet(@"SELECT 
	a.ID, 
	a.SELLCARS_ID, 
	g.NAME as AUTOMARK_TYPE_NAME,
	f.NAME as AUTOMARK_NAME, 
	d.NAME as SPECTYPE_NAME, 
	c.PRODUCEDYEAR, 
	c.VINNO, 
	i.NAME as FUELTYPE_NAME, 
	j.NAME as TRANSMISSIONTYPE_NAME, 
	k.NAME as ZAALTTYPE_NAME, 
	l.CODE as EXTCOLOR_CODE, 
	l.NAME as EXTCOLOR_NAME, 
	l.HTMLCODE as EXTCOLOR_HTMLCODE, 
	m.CODE as INTCOLOR_CODE, 
	m.NAME as INTCOLOR_NAME, 
	m.HTMLCODE as INTCOLOR_HTMLCODE, 
	c.GETDT, 
	c.PRICE, 
    N'Үүсгэсэн: ' + CONVERT(VARCHAR(19),a.CREATED_DATE, 120) + N'lt;br/gt;Сүүлд засварласан: ' + CONVERT(VARCHAR(19),ISNULL(a.UPDATED_DATE,a.CREATED_DATE), 120) as MODIFIEDCAR, 
	b.RD as CUSTOMERRD, 
	b.NAME as CUSTOMERNAME, 
	CASE WHEN b.TEL2 is null THEN b.TEL ELSE b.TEL+', '+b.TEL2 END as CUSTOMERTEL, 
	b.EMAIL as CUSTOMEREMAIL, 
	b.ADDRESS as CUSTOMERADDRESS, 
	n.NAME as CUSTOMERTYPENAME
FROM TBL_SOLDCARCUSTOMER_SELLCARS a
INNER JOIN TBL_SOLDCARCUSTOMER b ON a.SOLDCARCUSTOMER_ID=b.ID
INNER JOIN TBL_SELLCARS c ON a.SELLCARS_ID=c.ID
INNER JOIN TBL_SPECTYPE d ON c.SPECTYPE_ID=d.ID
INNER JOIN TBL_AUTOMARK f ON d.MARK_ID=f.ID
INNER JOIN TBL_AUTOMARK_TYPE g ON f.AUTOMARK_TYPE_ID=g.ID
INNER JOIN TBL_SELLCARSPAYMENTTYPE h ON a.SELLCARSPAYMENTTYPE_ID=h.ID
INNER JOIN TBL_FUELTYPE i ON c.FUELTYPE_ID=i.ID
INNER JOIN TBL_TRANSMISSIONTYPE j ON c.TRANSMISSIONTYPE_ID=j.ID
INNER JOIN TBL_ZAALTTYPE k ON c.ZAALTTYPE_ID=k.ID
INNER JOIN TBL_CARCOLOR l ON c.EXTCOLOR_ID=l.ID
INNER JOIN TBL_CARCOLOR m ON c.INTCOLOR_ID=m.ID
INNER JOIN TBL_CUSTOMERTYPE n ON b.CUSTOMERTYPE_ID=n.ID
WHERE a.ID=" + Request.QueryString["id"]);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dealerTab4ClientShowModalDivRd.InnerHtml = ds.Tables[0].Rows[0]["CUSTOMERRD"].ToString();
                    dealerTab4ClientShowModalDivName.InnerHtml = ds.Tables[0].Rows[0]["CUSTOMERNAME"].ToString();
                    dealerTab4ClientShowModalDivType.InnerHtml = ds.Tables[0].Rows[0]["CUSTOMERTYPENAME"].ToString();
                    dealerTab4ClientShowModalDivTel.InnerHtml = ds.Tables[0].Rows[0]["CUSTOMERTEL"].ToString();
                    dealerTab4ClientShowModalDivAddress.InnerHtml = ds.Tables[0].Rows[0]["CUSTOMERADDRESS"].ToString();
                    dealerTab4ClientShowModalDivEmail.InnerHtml = ds.Tables[0].Rows[0]["CUSTOMEREMAIL"].ToString();
                    dealerTab4ClientShowModalModifyDescription.InnerHtml = myObjGetData.getReplaceDatabaseToDisplay(ds.Tables[0].Rows[0]["MODIFIEDCAR"].ToString());
                }
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