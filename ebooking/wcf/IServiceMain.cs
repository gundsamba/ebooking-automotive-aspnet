using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace ebooking.wcf
{
    [ServiceContract]
    public interface IServiceMain
    {
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void ExecuteNonQuery(string qry);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ExecuteScalar(string qry);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ExecuteDataSet(string qry);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void DeleteFile(string fileurl);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void Write_registeredmarkno(string type, string value, string updatevalue);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void Write_registeredvinno(string type, string value, string updatevalue);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void SessionKill();

        //*****login.html*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void Login_checklogin(string username, string password);

        //*****part.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PartTab1Datatable(string parttype, string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PartTab2Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PartPartTypeListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PartTab3Datatable(string parttype, string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PartPartListForDDL(string parttype, string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PartTab4Datatable(string parttype, string startdate, string enddate, string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PartqExcelBulkUpload(string clinicid, string typeid);

        //*****patient.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PatientDatatableFilterByAutoNo(string clinicid, string autono);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PatientDatatableFilterByVinNo(string clinicid, string vinno);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PatientDatatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PatientDatatableFilterByOwnerName(string clinicid, string vinno);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PatientDatatableFilterByTel(string clinicid, string vinno);

        //*****calendar.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string CalendarAppointmentTimeListForDLL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string CalendarAutomarkListForDDL(string automarktype, string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Appmodaltab3Datatable1(string servicetype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Appmodaltab3Datatable2(string appid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Appmodaltab4Datatable1(string parttype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Appmodaltab4Datatable2(string appid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void INS_APPOINTMENT(string CLINIC_ID, string ROOM_ID, string CHAIRNUM, string PATIENT_ID, string DT, string STARTTIME, string ENDTIME, string APPOINTMENTTYPE, string REQUESTMEMO, string REQUESTTYPELISTID, string MILEAGE, string ISWASHING, string ISGETPART, string SUBMIT_STAFFID, string STAFFID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void INSUPD_APPDIAGNOSTIC(string APPOINTMENT_ID, string DIAGNOSTICLISTID, string DIAGNOSTIC_NAME, string SENIORMECHANICAL_STAFFID, string MECHANICAL_STAFFID, string SERVICECONSULTANT_STAFFID, string STAFFID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string CalendarActiveWorkedMechanic(string clinicid, string dt);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string CalendarActiveCameMechanic(string clinicid, string dt);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string AutonoAutocomplete(string clinicid, string autono);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string VinnoAutocomplete(string clinicid, string vinno);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string OwnernameAutocomplete(string clinicid, string name);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string TelAutocomplete(string clinicid, string tel);

        //*****automark.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string AutomarkTab1TypeListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string AutomarkTab1Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string AutomarkTab2Datatable(string clinicid);

        //*****changepass.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void Changepass(string userid, string oldpass, string newpass);

        //*****service.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ServiceTab1Datatable(string servicetype, string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ServiceTab2Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ServiceServiceTypeListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ServiceTab3Datatable(string servicetype, string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ServiceServiceListForDDL(string servicetype, string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ServiceqExcelBulkUpload(string clinicid, string typeid);

        //*****setup.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SetupTab1Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SetupTab1s2Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SetupTab4Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SetupTab6Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SetupTab7Datatable(string clinicid);

        //*****staff.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffTab1Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffTab1NegjListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffTab2Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffTab3s1Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffHeltesListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffTab3s2Datatable(string clinicid, string heltesid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffAlbaListForDDL(string clinicid, string heltesid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffTab3s3Datatable(string clinicid, string heltesid, string albaid);

        //*****usersetup.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string UsersetupTab1Datatable(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void INSUPT_USER(string ISINS, string CLINIC_ID, string USERNAME, string PASSWORD, string EMAIL, string USERDESCRIPTION, string ROLELISTID, string STAFFLISTID);

        //*****rprt1.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt1Tab1Datatable(string clinicid, string apptype, string begindate, string enddate);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt1Tab3Datatable(string clinicid, string begindate, string enddate);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt1Tab4Datatable(string clinicid, string begindate, string enddate, string room);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt1Tab5t1Datatable(string clinicid, string begindate, string enddate);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt1Tab5t2Datatable(string clinicid, string begindate, string enddate, string tp);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt1Tab5t3Datatable(string clinicid, string begindate, string enddate);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt1Tab5t4Datatable(string clinicid, string begindate, string enddate);

        //*****rprt2.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt2Tab1Datatable(string clinicid, string begindate, string enddate, string type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt2Tab1Chart(string clinicid, string begindate, string enddate, string type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt2Tab2Datatable(string clinicid, string begindate, string enddate, string type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt2Tab2Chart(string clinicid, string begindate, string enddate, string type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt2Tab4Datatable(string clinicid, string begindate, string enddate, string type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt2Tab5Datatable(string clinicid, string begindate, string enddate, string uzuulelt);

        //*****forgotpassword.html*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Forgotpassword_checkemail(string email);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Forgotpassword_resetpassword(string email);

        //*****dealersettings.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealersettingsTab1Datatable(string clinicid, string mark, string marktype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealersettingsTab1AutomarkListForDDL(string clinicid, string marktype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealersettingsTab2Datatable(string clinicid, string colortype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealersettingsTab3Datatable(string clinicid);

        //*****dealer.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab1MarkListForDDL(string clinicid, string marktype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab1SpectypeListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab1SpectypeListForDDL2(string clinicid, string mark);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab1UsedMarkListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab1Datatable(string clinicid, string extcolor, string intcolor, string spectype, string mark);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab1ColorListForDDL(string clinicid, string type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab2Datatable(string clinicid, string extcolor, string intcolor, string spectype, string mark);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab2OrderTypeListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab3Datatable(string clinicid, string extcolor, string intcolor, string spectype, string ordertype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerTab4Datatable(string clinicid, string paymenttp, string spectype, string yr, string mnth);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void INS_DEALERSELL(string CLINIC_ID, string SOLDCARCUSTOMER_ID, string SOLDCARCUSTOMER_RD, string SOLDCARCUSTOMER_NAME, string SOLDCARCUSTOMER_CUSTOMERTYPE_ID, string SOLDCARCUSTOMER_TEL, string SOLDCARCUSTOMER_TEL2, string SOLDCARCUSTOMER_EMAIL, string SOLDCARCUSTOMER_ADDRESS, string SELLCARS_ID, string AGGREEMENTNO, string SELLCARSPAYMENTTYPE_ID, string PAYDT, string AGREEMENTATTACH, string ISRESOLD, string USERID, string SOLDCARCUSTOMER_SELLCARS_ID, string ISSUBMIT, string SOLDCAR_STAFFID);

        //*****rprt3.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt3Tab1Datatable(string clinicid, string begindate, string enddate, string ismysold);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt3Tab2Datatable(string clinicid, string yr, string mnth, string ismysold);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt3TabsStaffListForDDL(string clinicid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt3Tab3Datatable(string clinicid, string begindate, string enddate, string staffid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt3Tab4Datatable(string clinicid, string begindate, string enddate, string staffid);

        //*****dealerrprt.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DealerrprtTab1Datatable(string clinicid, string tp);
    }
}
