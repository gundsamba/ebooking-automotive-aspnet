<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendardocumentmodal.aspx.cs" Inherits="ebooking.pg.calendardocumentmodal" %>
<div class="modal-body">
    <div class="row">
        <div class="col-sm-12">
            <div id="calendardocumentmodaldiv" class="widget-body no-padding">
                <div class="padding-10">
                    <table style="width:100%;">
                        <tbody>
                            <tr style="border-bottom:1px solid #DDD;">
                                <td style="width:50%; text-align:left; padding-bottom:5px;">
                                    <img src="../files/cliniclogo/clinic1logo2.png" height="32" alt="logo1" style="height:32px;">
                                </td>
                                <td style="width:50%; text-align:right; padding-bottom:5px;">
                                    <img src="../files/cliniclogo/clinic1logo1.png" alt="invoice icon" style="height:32px;">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:center; font-weight:bold; padding-top:5px;">ОНОШЛОГОО ЗАСВАР ҮЙЛЧИЛГЭЭНИЙ ХУУДАС №: <span id="pModalAppointmentno" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:right; font-size:10px;">Огноо: <span id="pModalCurrentDate" runat="server" style="font-weight:bold; font-style:italic;">2015 Оны 09 Сар 15 Өдөр</span></td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="text-align:left; padding:5px; border:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Мэдээлэл:</th>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:2px 2px 2px 0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:11%;">Эзэмшигчийн нэр</td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:27%;">Хувь хүн:&nbsp;&nbsp;&nbsp;<span id="pModalPatientType1" runat="server">&#9744;</span></td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:26%;">Байгууллага:&nbsp;&nbsp;&nbsp;<span id="pModalPatientType0" runat="server">&#9744;</span></td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:18%;" colspan="2">Машин угаалга</td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:18%;" colspan="2">Солигдох сэлбэг авах</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:left; vertical-align:top;" colspan="2"><span id="pModalPatientName" runat="server" style="font-weight:bold; font-style:italic;">...</span></td>
                                                <td style="padding:5px 3px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:9%;"><span>Тийм:&nbsp;&#9744;</span></td>
                                                <td style="padding:5px 3px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:9%;"><span>Үгүй:&nbsp;&#9744;</span></td>
                                                <td style="padding:5px 3px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:9%;"><span>Тийм:&nbsp;&#9744;</span></td>
                                                <td style="padding:5px 3px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:9%;"><span>Үгүй:&nbsp;&#9744;</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; margin-top:2px;">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:11%;">Автомашиний мэдээлэл:</td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; background:#D6D6D6; -webkit-print-color-adjust: exact; width:27%;">Загвар</td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; background:#D6D6D6; -webkit-print-color-adjust: exact; width:26%;">Улсын дугаар</td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; background:#D6D6D6; -webkit-print-color-adjust: exact; width:18%;" colspan="2">Хурдны хайрцаг</td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; background:#D6D6D6; -webkit-print-color-adjust: exact; width:18%;" colspan="2">Шатахууны төрөл</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:left; vertical-align:middle;"><span id="pModalPatientMarkname" runat="server" style="font-weight:bold; font-style:italic;">...</span></td>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle;"><span id="pModalPatientAutono" runat="server" style="font-weight:bold; font-style:italic;">06-66 УНТ</span></td>
                                                <td style="padding:5px 3px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:9%;">Автомат:&nbsp;<span id="pModalPatientTransmissiontype1" runat="server">&#9744;</span></td>
                                                <td style="padding:5px 3px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:9%;">Механик:&nbsp;<span id="pModalPatientTransmissiontype0" runat="server">&#9745;</span></td>
                                                <td style="padding:5px 3px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:9%;">Бензин:&nbsp;<span id="pModalPatientFueltype1" runat="server">&#9744;</span></td>
                                                <td style="padding:5px 3px; border:1px solid #D6D6D6; text-align:center; vertical-align:middle; width:9%;">Дизель:&nbsp;<span id="pModalPatientFueltype0" runat="server">&#9744;</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; margin-top:2px;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; border:1px solid #D6D6D6; text-align:left;">Үйлчлүүлэгчийн хүсэлт: <span id="pModalAppontmentRequestMemo" runat="server" style="font-weight:bold; font-style:italic;"></span>....</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:left; padding:5px; border:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Оношлогооны хэсэг:</th>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:2px 2px 2px 0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="width:64%; padding-right:1px;">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6; height:60px;">
                                                        <tbody>
                                                            <tr style="border-bottom:1px solid #DDD;">
                                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:150px; border-right:none;">Хөдөлгүүр оношлогоо:</td>
                                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-left:none;">&nbsp;&nbsp;&nbsp;<span id="pModalDiagnostictype1" runat="server"></span></td>
                                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:170px; border-right:none;">Явах эд ангийн оношлогоо:</td>
                                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-left:none;">&nbsp;&nbsp;&nbsp;<span id="pModalDiagnostictype2" runat="server"></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:150px; border-right:none;">Компьютер оношлогоо:</td>
                                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-left:none;">&nbsp;&nbsp;&nbsp;<span id="pModalDiagnostictype3" runat="server"></span></td>
                                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:170px; border-right:none;">Цахилгаан оношлогоо:</td>
                                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-left:none;">&nbsp;&nbsp;&nbsp;<span id="pModalDiagnostictype4" runat="server"></span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td style="padding-left:1px;">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6; height:60px;">
                                                        <tbody>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:200px; border:1px solid #D6D6D6; border-bottom-color:#000;">Эхлэх хугацаа:</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:60px; border:1px solid #D6D6D6; border-bottom-color:#000;">Цаг</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:60px; border:1px solid #D6D6D6; border-bottom-color:#000;">Минут</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">Эхлэх:</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;"><span id="pModalAppointmentBeginTime" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;"><span id="pModalAppointmentBeginMinute" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">Дуусах:</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;"><span id="pModalAppointmentEndTime" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;"><span id="pModalAppointmentEndMinute" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">Өргөгчийн дугаар:</td>
                                                                <td colspan="2" style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">№: <span id="pModalAppointmentUrgugchnum" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right:1px; padding-top:1px; vertical-align:top;">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6; height:200px;">
                                                        <tbody>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:200px; border:1px solid #D6D6D6; height:14px;">Оношлогооны дүгнэлт:</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:top; border:1px solid #D6D6D6;"><span id="pModalDiagnosticDescription" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td style="padding-left:1px; padding-top:1px;">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6; height:200px;">
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="2" style="padding:1px 5px; text-align:center; vertical-align:middle; width:200px; border:1px solid #D6D6D6;">Компьютер оношлогоо</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6; width:30%;">DTC</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6; width:70%;">Тайлбар</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-top:2px;">Оношлогооны дүгнэлт гаргасан:</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6;">
                                                        <tbody>
                                                            <tr style="border-bottom-color:#D6D6D6; border-bottom-style:solid; border-bottom-width:1px;">
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%;">Ахлах механикийн нэр: <span id="pModalSeniorMechanicalName" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%;">Гарын үсэг: ..........</td>
                                                            </tr>
                                                            <tr style="border-bottom-color:#D6D6D6; border-bottom-style:solid; border-bottom-width:1px;">
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%;">Механикийн нэр: <span id="pModalMechanicalName" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%;">Гарын үсэг: ..........</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%;">Үйлчилгээний зөвлөхийн нэр: <span id="pModalServiceConsultantName" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%;">Гарын үсэг: ..........</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:left; padding:5px; border:1px solid #000; background:#D6D6D6; -webkit-print-color-adjust: exact;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Засвар үйлчилгээний хэсэг:</th>
                            </tr>
                            <tr>
                                <td style=" border:1px solid #000; padding:2px 2px 2px 0;">
                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="width:64%; padding-right:1px;">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6; height:60px;">
                                                        <tbody>
                                                            <tr style="border-bottom:1px solid #DDD;">
                                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:150px; border-right:none;">Хуваарьт:</td>
                                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-left:none;">&nbsp;&nbsp;&nbsp;<span id="pModalRepairtype1" runat="server"></span></td>
                                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:170px; border-right:none;">Дотоодын:</td>
                                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-left:none;">&nbsp;&nbsp;&nbsp;<span id="pModalRepairtype2" runat="server"></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:150px; border-right:none;">Баталгаат:</td>
                                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-left:none;">&nbsp;&nbsp;&nbsp;<span id="pModalRepairtype3" runat="server"></span></td>
                                                                <td style="padding:5px; text-align:right; vertical-align:middle; width:170px; border-right:none;">Оношлогоот:</td>
                                                                <td style="padding:5px; text-align:left; vertical-align:middle; border-left:none;">&nbsp;&nbsp;&nbsp;<span id="pModalRepairtype4" runat="server"></span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td style="padding-left:1px;">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6; height:60px;">
                                                        <tbody>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:200px; border:1px solid #D6D6D6; border-bottom-color:#000;">Эхлэх хугацаа:</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:60px; border:1px solid #D6D6D6; border-bottom-color:#000;">Цаг</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:60px; border:1px solid #D6D6D6; border-bottom-color:#000;">Минут</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">Эхлэх:</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;"><span id="pModalAppointmentBeginTime2" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;"><span id="pModalAppointmentBeginMinute2" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">Дуусах:</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;"><span id="pModalAppointmentEndTime2" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;"><span id="pModalAppointmentEndMinute2" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">Өргөгчийн дугаар:</td>
                                                                <td colspan="2" style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">№: <span id="pModalAppointmentUrgugchnum2" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-top:1px;">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6; height:60px;">
                                                        <thead>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:64%; border:1px solid #D6D6D6;">Солигдох сэлбэгийн жагсаалт</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:10%; border:1px solid #D6D6D6;">Тоо/хэм</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; width:26%; border:1px solid #D6D6D6;">Тайлбар</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="pModalPartList" runat="server">
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                                <td style="padding:1px 5px; text-align:center; vertical-align:middle; border:1px solid #D6D6D6;">&nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-top:1px;">
                                                    <table style="width:100%; font: 10px arial, sans-serif; border-collapse:collapse; border:1px solid #D6D6D6; height:60px;">
                                                        <tbody>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%; border:1px solid #D6D6D6;">Механикийн нэр: <span id="pModalMechanicalName2" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%; border:1px solid #D6D6D6;">Ахлах механикийн нэр: <span id="pModalSeniorMechanicalName2" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%; border:1px solid #D6D6D6;">Гарын үсэг: ..........</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%; border:1px solid #D6D6D6;">Гарын үсэг: ..........</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%; border:1px solid #D6D6D6;">Үйлчилгээний зөвлөхийн нэр: <span id="pModalServiceConsultantName2" runat="server" style="font-weight:bold; font-style:italic;"></span></td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%; border:1px solid #D6D6D6;">Нэмэлт засвар үйлчилгээ байгаа эсэх:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Тийм:&nbsp;&#9744;&nbsp;&nbsp;&nbsp;Үгүй:&nbsp;&#9744;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%; border:1px solid #D6D6D6;">Гарын үсэг: ..........</td>
                                                                <td style="padding:1px 5px; text-align:left; vertical-align:middle; width:50%; border:1px solid #D6D6D6;">Бүртгэлийн хуудасны дугаар:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;№ ...</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top:10px; border:none; font-weight:bold;">Үйлчлүүлэгч би автомашинд хийгдсэн засвар үйлчилгээ, үр дүнг хүлээн зөвшөөрч баталгаажуулав.  Гарын үсэг: ..........................</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
