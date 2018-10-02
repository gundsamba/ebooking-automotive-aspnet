<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendarappdocumentmodal.aspx.cs" Inherits="ebooking.pg.calendarappdocumentmodal" %>
<div class="modal-body">
    <div class="row">
        <div class="col-sm-12">
            <div id="calendarappdocumentmodaldiv" class="widget-body no-padding">
                <div class="padding-10">
                    <table style="width:100%;">
                        <tbody>
                            <tr style="border-bottom:1px solid #DDD;">
                                <td style="width:50%; text-align:left; padding-bottom:5px;">
                                    <img src="../files/cliniclogo/clinic1logo2.png" height="27" alt="logo1" style="height:27px;">
                                </td>
                                <td style="width:50%; text-align:right; padding-bottom:5px;">
                                    <img src="../files/cliniclogo/clinic1logo1.png" alt="invoice icon" style="height:27px;">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:center; font-weight:bold; padding:5px 0;">ЗАХИАЛГА БҮРТГЭЛИЙН ХУУДАС №: <span id="pModalAppointmentno" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="text-align:left; padding:1px 5px; border:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact;">&nbsp;&nbsp;&nbsp;Захиалга бүртгэл</th>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:87px; border-right: 1px solid #000;">Захиалгын төрөл:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:132px; border-right: 1px solid #000;">Биечлэн:&nbsp;<span id="pModalAppointmentType1" runat="server" style="border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;Утсаар:&nbsp;<span id="pModalAppointmentType2" runat="server" style="border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span></td>
                                                <td style="padding:5px 2px; text-align:left; vertical-align:middle; font-size:8px;" id="pModalRequest" runat="server"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:123px;">Захиалга өгсөн огноо:</td>
                                                <td style="padding:5px 5px 5px 0; text-align:left; vertical-align:middle;"><span id="pModalCreatedYear" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">9999</span>&nbsp;он&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="pModalCreatedMonth" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">99</span>&nbsp;сар&nbsp;&nbsp;<span id="pModalCreatedDay" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">99</span>&nbsp;өдөр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;цаг:&nbsp;<span id="pModalCreatedHour" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">99</span>&nbsp;:&nbsp;<span id="pModalCreatedMinute" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">99</span>&nbsp;минут</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:123px;">ЗҮ-нд орох огноо:</td>
                                                <td style="padding:5px 5px 5px 0; text-align:left; vertical-align:middle;"><span id="pModalYear" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">9999</span>&nbsp;он&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="pModalMonth" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">99</span>&nbsp;сар&nbsp;&nbsp;<span id="pModalDay" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">99</span>&nbsp;өдөр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;цаг:&nbsp;<span id="pModalHour" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">99</span>&nbsp;:&nbsp;<span id="pModalMinute" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">99</span>&nbsp;минут&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Хүлээлгэн өгөх хугацаа:&nbsp;<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; margin-left:1px">&nbsp;&nbsp;&nbsp;</span>&nbsp;өдөр&nbsp;&nbsp;<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; margin-left:1px">&nbsp;&nbsp;&nbsp;</span>&nbsp;цаг&nbsp;&nbsp;<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; margin-left:1px">&nbsp;&nbsp;&nbsp;</span>&nbsp;минут</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:left; padding:1px 5px; border:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact;">&nbsp;&nbsp;Үйлчлүүлэгчийн мэдээлэл</th>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:10%; border-right:1px solid #000; border-bottom:1px solid #000;">Овог, нэр:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:40%; border-right:1px solid #000; border-bottom:1px solid #000;"><span id="pModalOwnername" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:20%; border-right:1px solid #000; border-bottom:1px solid #000;">Утас:&nbsp;<span id="pModalTel" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:30%; border-bottom:1px solid #000;">Эзэмшигч:&nbsp;&nbsp;Хувь хүн:&nbsp;<span id="pModalType1" runat="server" style="border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;</span>&nbsp;&nbsp;Байгууллага:&nbsp;<span id="pModalType2" runat="server" style="border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;</span></td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:10%; border-right:1px solid #000; border-bottom:1px solid #000;">Хаяг:</td>
                                                <td colspan="3" style="padding:5px; text-align:left; vertical-align:middle; border-bottom:1px solid #000;"><span id="pModalAddress" runat="server" style="font-weight:bold; font-style:italic;">.............................................................................................................................................................................................................................</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" style="padding:2px; text-align:right; vertical-align:middle; width:12%; border-right:1px solid #000; line-height:10px;">Үйлчлүүлэгчийн хүсэлт</td>
                                                <td rowspan="2" style="padding:5px; text-align:left; vertical-align:top; width:69%; border-right: 1px solid #000;">
                                                    <span id="pModalRequestMemo" runat="server" style="font-weight:bold; font-style:italic;">.....................................................................................................................<br />.....................................................................................................................</span>
                                                </td>
                                                <td style="padding:2px 5px; text-align:center; vertical-align:middle; border-bottom: 1px solid #000; font-size: 8px;">Хөнгөлөлтийн карт</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:center; vertical-align:middle;" id="pModalDiscount" runat="server"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:left; padding:1px 5px; border:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact;">&nbsp;&nbsp;Автомашины мэдээлэл</th>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:10%; border-right:1px solid #000; border-bottom:1px solid #000; line-height: 10px;">Автомашины загвар:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:30%; border-right:1px solid #000; border-bottom:1px solid #000;"><span id="pModalMarkname" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:8%; border-right:1px solid #000; border-bottom:1px solid #000; line-height: 10px;">Аралын дугаар:</td>
                                                <td colspan="3" style="padding:5px; text-align:left; vertical-align:middle; width:30%; border-right:1px solid #000; border-bottom:1px solid #000;"><span id="pModalVinno" runat="server" style="font-weight:bold; font-style:italic;">......................................................................</span></td>
                                                <td style="padding:0 5px; text-align:center; vertical-align:top; border-bottom:1px solid #000; line-height: 14px;">Автомат:<br /><span id="pModalTransmissionType1" runat="server" style="border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&#9744;</span></td>
                                                <td style="padding:0 5px; text-align:center; vertical-align:top; border-bottom:1px solid #000; line-height: 14px;">Механик:<br /><span id="pModalTransmissionType2" runat="server" style="border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&#9744;</span></td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:10%; border-right:1px solid #000; line-height: 10px;">Улсын дугаар:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:30%; border-right:1px solid #000;"><span id="pModalAutono" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:8%; border-right:1px solid #000; line-height: 10px;">КМ-ийн заалт:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:15%; border-right:1px solid #000;"><span id="pModalMileage" runat="server" style="font-weight:bold; font-style:italic;">..................................................</span></td>
                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:10%; border-right:1px solid #000; line-height: 10px;">Үйлдвэрлэсэн он:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:15%; border-right:1px solid #000;"><span id="pModalProducedyear" runat="server" style="font-weight:bold; font-style:italic;">........</span></td>
                                                <td style="padding:0 5px; text-align:center; vertical-align:top; line-height: 14px;">Бензин:<br /><span id="pModalFuelType1" runat="server" style="border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&#9744;</span></td>
                                                <td style="padding:0 5px; text-align:center; vertical-align:top; line-height: 14px;">Дизель:<br /><span id="pModalFuelType2" runat="server" style="border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&#9744;</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left; padding:5px; border:1px solid #000;"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Захиалга авсан ажилтаны нэр: <span id="pModalSubmitStaff" runat="server" style="font-weight:bold; font-style:italic;">............................................................</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Гарын үсэг:&nbsp;<span style="color:grey;">.........................................................</span></td>
                            </tr>
                            <tr>
                                <th style="text-align:left; padding:1px 5px; border:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Утсаар захиалга авсан үед нэмэлтээр бөглөх хэсэг:</th>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:30%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Баталгаажуулалтын огноо:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:47%;">20<span id="pModalSubmitPhoneYear" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><span id="pModalSubmitPhoneYear2" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; margin-left:1px;">&nbsp;&nbsp;&nbsp;</span>&nbsp;он&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="pModalSubmitPhoneMonth" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><span id="pModalSubmitPhoneMonth2" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; margin-left:1px;">&nbsp;&nbsp;&nbsp;</span>&nbsp;сар&nbsp;&nbsp;<span id="pModalSubmitPhoneDay" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><span id="pModalSubmitPhoneDay2" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; margin-left:1px;">&nbsp;&nbsp;&nbsp;</span>&nbsp;өдөр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;цаг:&nbsp;<span id="pModalSubmitPhoneHour" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><span id="pModalSubmitPhoneHour2" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; margin-left:1px;">&nbsp;&nbsp;&nbsp;</span>&nbsp;:&nbsp;<span id="pModalSubmitPhoneMinnute" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><span id="pModalSubmitPhoneMinnute2" runat="server" style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span>&nbsp;минут</td>
                                                <td style="padding:2px 10px; text-align:right; vertical-align:middle; border-left:1px solid #000; line-height:16px;" rowspan="3">
                                                    Сэлбэгийн нөөц байгаа эсэх:<br />
                                                    Нөөц байгаа <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><br />
                                                    Захиалсан <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span><br />
                                                    Ирсэн <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px;">&nbsp;&nbsp;&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding:5px; text-align:left; vertical-align:middle;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Захиалга өөрчлөлтийн тэмдэглэл:&nbsp;&nbsp;<span id="pModalSubmitPhoneMemo" runat="server" style="color:grey;">............................................................................................................................</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding:5px; text-align:left; vertical-align:middle;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Баталгаажуулсан ажилтны нэр, гарын үсэг: <span id="pModalSubmitPhoneStaff" runat="server" style="color:grey;">..............................................................................................................</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="border:1px solid #000; padding:0; background:#D6D6D6; -webkit-print-color-adjust: exact; height:30px;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:55%; font-weight:bold;">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Урьдчилсан үнийн дүн:&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    &nbsp;Төгрөг
                                                </td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:45%; font-weight:bold;">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Нийц зарцуулах хугацаа:&nbsp;&nbsp;цаг
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    :
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    минут
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <th style="text-align:left; padding:1px 5px; border-right:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; height:46%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Автомашин бүрэн бүтэн байдал:</th>
                                                <td style="text-align:center; padding:1px 5px; border-right:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; height:27%; font-size:8px;">Хянах самбарын тэмдэглэгээ:</td>
                                                <td style="text-align:center; padding:1px 5px; background:#D6D6D6; -webkit-print-color-adjust: exact; height:27%; font-size:8px;">Сүүлд засварласан засвар үйлчилгээний түүх</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="3" style="padding:5px; text-align:center; vertical-align:middle; width:46%; border-right:1px solid #000; border-bottom:1px solid #D6D6D6;">
                                                    <img src="../files/Delgees.png" alt="Дэлгээс зураг" style="height:175px;" />
                                                </td>
                                                <td style="padding:5px; text-align:center; vertical-align:top; border-right:1px solid #000; line-height:15px; color:grey;">....................................................................<br />....................................................................<br />....................................................................</td>
                                                <td id="pModalLastResult" runat="server" rowspan="3" style="padding:5px; text-align:left; vertical-align:top; font-size:8px;"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center; padding:1px 5px; border-right:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">Тэмдэглэгээ:</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:center; vertical-align:top; border-right:1px solid #000; line-height:15px; color:grey;">....................................................................<br />...................................................................<br />...................................................................<br />...................................................................<br />...................................................................<br />...................................................................<br />...................................................................</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <%--<tr>
                                <td style="text-align:left; padding:5px; border:1px solid #000; -webkit-print-color-adjust: exact; line-height: 20px;">
                                    Дотор болон гадна цэвэрлэгээ:&nbsp;<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;
                                    Цаг болон радио тохиргоо:&nbsp;<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;
                                    ЗҮТ-ийн хучлага авсан эсэх:&nbsp;<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;
                                    Толь болон суудлын тохиргоо:&nbsp;<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                </td>
                            </tr>--%>
                            <tr>
                                <td style="text-align:left; padding:5px; border:1px solid #000; -webkit-print-color-adjust: exact; line-height: 20px;">
                                    &nbsp;&nbsp;Хүлээн авсан үйлчилгээний зөвлөхийн нэр, гарын үсэг: .................................................................................&nbsp;/...................................................................../
                                    <br />
                                    &nbsp;&nbsp;Үйлчлүүлэгч би үйлчилгээний хугацаа, засвар үйлчилгээ болон сэлбэгийн үнийг зөвшөөрч баталгаажуулав.&nbsp;&nbsp;/................................................................../
                                </td>
                            </tr>
                            <tr>
                                <td style="border-bottom:1px dashed grey; font-size:5px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-size:5px;">&nbsp;</td>
                            </tr>
                            <tr>
                                <th style="text-align:left; padding:5px; border:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Засварын дараах сэтгэл ханамжийн судалгааны хэсэг:</th>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:0;">
                                    <table style="width:100%; font: 8px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; width:9%; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">
                                                    ЗДСХС авах хугацаа:
                                                </td>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; width:41%; border-right:1px solid #000; border-bottom:1px solid #000; font-size:8px;">
                                                    20
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    он&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    сар&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    өдөр&nbsp;&nbsp;&nbsp;&nbsp;
                                                    цаг:<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    :
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    минут

                                                </td>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; width:9%; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">
                                                    Улсын дугаар:
                                                </td>
                                                <td id="pModalAutono2" runat="server" style="padding:5px; text-align:center; vertical-align:middle; width:41%; border-bottom:1px solid #000; font-size:10px; font-weight:bold; font-style:italic;"></td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">
                                                    ЗДСХС авсан огноо:
                                                </td>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; border-right:1px solid #000; border-bottom:1px solid #000; line-height:8px; font-size:8px;">
                                                    20
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    он&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    сар&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    өдөр&nbsp;&nbsp;&nbsp;&nbsp;
                                                    цаг:<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    :
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    минут
                                                </td>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">
                                                    ЗДСХС үр дүн:
                                                </td>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; border-bottom:1px solid #000; font-size:10px;">
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    &nbsp;Засагдсан
                                                    &nbsp;&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    &nbsp;Засагдаагүй
                                                    &nbsp;&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    &nbsp;Холбогдох боломжгүй
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">
                                                    Холбоо барих:
                                                </td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-right:1px solid #000; border-bottom:1px solid #000; font-size:8px;">
                                                    Утас:&nbsp;
                                                    <span id="pModalTel2" runat="server" style="font-weight:bold; font-style:italic; font-size:10px;"></span>
                                                </td>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">
                                                    Дахин холбогдох:
                                                </td>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; border-bottom:1px solid #000; font-size:8px;">
                                                    20
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    он&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    сар&nbsp;
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    өдөр&nbsp;&nbsp;&nbsp;&nbsp;
                                                    цаг:<span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    :
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff;">&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="font-weight:bold; font-style:italic; border: 1px solid #000; border-radius: 3px; padding: 1px 3px; background-color:#fff; margin-left: -2px;">&nbsp;&nbsp;&nbsp;</span>
                                                    минут
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; line-height:8px; font-size:8px;">
                                                    Үйлчүүлэгчийн сэтгэгдэл:
                                                </td>
                                                <td colspan="3" style="padding:5px; text-align:center; vertical-align:middle; border-bottom:1px solid #000; line-height:15px; font-size:8px; color:grey;">
                                                    . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br />
                                                    . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br />
                                                    . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding:1px 5px; text-align:center; vertical-align:middle; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">
                                                    Судалгаа авсан ажилтаны нэр
                                                </td>
                                                <td colspan="2" style="padding:1px 5px; text-align:center; vertical-align:middle; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:8px;">
                                                    Хянасан ЗҮАлбаны дарга
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding:5px; text-align:center; vertical-align:middle; border-right:1px solid #000; font-size:8px; color:grey;">
                                                    <br />......................................................................................................................
                                                </td>
                                                <td colspan="2" style="padding:5px; text-align:center; vertical-align:middle; font-size:8px; color:grey;">
                                                    <br />......................................................................................................................
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td rowspan="3" style="padding:5px; text-align:right; vertical-align:middle; width:10%; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; line-height:8px; font-size:7pt;">Холбоо барих:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:40%; border-right:1px solid #000; line-height:8px; font-size:7pt;">&#9744;&nbsp;...................................................... / гэр / ажил / гар утас /</td>
                                                <td rowspan="3" style="padding:5px; text-align:right; vertical-align:middle; width:10%; border-right:1px solid #000; border-bottom:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; line-height:8px; font-size:7pt;">ЗДСХС үр дүн:</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:40%; line-height:8px; font-size:7pt;">&#9744;&nbsp;Засагдсан</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:40%; border-right:1px solid #000; line-height:8px; font-size:7pt;">&#9744;&nbsp;Email ......................................................</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:40%; line-height:8px; font-size:7pt;">&#9744;&nbsp;Засагдаагүй&nbsp;&nbsp;........&nbsp;он&nbsp;&nbsp;&nbsp;&nbsp;....&nbsp;сар&nbsp;&nbsp;....&nbsp;өдөр&nbsp;&nbsp;&nbsp;&nbsp;цаг:&nbsp;....&nbsp;:&nbsp;....&nbsp;минут</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:40%; border-right:1px solid #000; border-bottom:1px solid #000; line-height:8px; font-size:7pt;">&#9744;&nbsp;Other ......................................................</td>
                                                <td style="padding:5px; text-align:left; vertical-align:middle; width:40%; line-height:8px; font-size:7pt;">&#9744;&nbsp;Дахин холбогдох&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;........&nbsp;он&nbsp;&nbsp;&nbsp;&nbsp;....&nbsp;сар&nbsp;&nbsp;....&nbsp;өдөр&nbsp;&nbsp;&nbsp;&nbsp;цаг:&nbsp;....&nbsp;:&nbsp;....&nbsp;минут</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:10%; border-right:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; line-height:8px; font-size:7pt;">ЗДСХС авсан огноо:</td>
                                                <td style="padding:5px; text-align:center; vertical-align:middle; width:40%; border-right:1px solid #000; font-size:7pt;">........&nbsp;он&nbsp;&nbsp;&nbsp;&nbsp;....&nbsp;сар&nbsp;&nbsp;....&nbsp;өдөр&nbsp;&nbsp;&nbsp;&nbsp;цаг:&nbsp;....&nbsp;:&nbsp;....&nbsp;минут</td>
                                                <td colspan="2" style="width:50%; vertical-align:top;">
                                                    <table style="width:100%; font: 7px arial, sans-serif; border-collapse:collapse;">
                                                        <tbody>
                                                            <tr>
                                                                <td style="padding:5px; text-align:center; vertical-align:middle; width:50%; border-right:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:7pt; border-bottom:1px solid #000;">Ажилтаны нэр</td>
                                                                <td style="padding:5px; text-align:center; vertical-align:middle; width:50%; background:#D6D6D6; -webkit-print-color-adjust: exact; font-size:7pt; border-bottom:1px solid #000;">Хянасан ЗҮАлбаны дарга</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:5px; text-align:center; vertical-align:middle; width:50%; border-right:1px solid #000; font-size:7pt;">..................................................</td>
                                                                <td style="padding:5px; text-align:center; vertical-align:middle; width:50%; font-size:7pt;">..................................................</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>--%>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>                    
                </div>
            </div>
        </div>
    </div>
</div>

