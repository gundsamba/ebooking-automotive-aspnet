<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendarservicemodal.aspx.cs" Inherits="ebooking.pg.calendarservicemodal" %>

<div class="modal-body">
    <div class="row">
        <div class="col-sm-12">
            <div id="calendarservicemodaldiv" class="widget-body no-padding">
                <div class="padding-10">
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td style="width:50%; text-align:left; margin-bottom:10px;">
                                    <img src="../files/cliniclogo/clinic1logo2.png" height="32" alt="logo1" style="height:32px;">
                                </td>
                                <td style="width:50%; text-align:right; margin-bottom:10px;">
                                    <img src="../files/cliniclogo/clinic1logo1.png" alt="invoice icon" style="height:32px;">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="padding:5px 10px 0 0; vertical-align:top;">
                                    <table style="width:100%; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px;">Захиалгын дугаар</td>
                                                <td id="pAppointmentCode" runat="server" style="width:50%; padding:1px 5px; border:1px solid #DDD; text-align:right; font-size:11px;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                    <table style="width:100%; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px;">Бүртгэлийн дугаар</td>
                                                <td id="pPatientCode" runat="server" style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px;">Эзэмшигчийн нэр</td>
                                                <td id="pPatientName" runat="server" style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px;">Улсын дугаар</td>
                                                <td id="pAutoNo" runat="server" style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td style="padding:5px 0 0 10px; vertical-align:top;">
                                    <table style="width:100%; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <th style="padding:1px 5px; border:1px solid #DDD; background:#DDD; font-size:11px; text-align:center;">ТӨЛБӨРИЙН БАРИМТ</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                    <table style="width:100%; border-collapse:collapse;">
                                        <tbody>
                                            <tr>
                                                <td style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px;">Огноо</td>
                                                <td id="pAppointmentDate" runat="server" style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px;">Эхэлсэн цаг</td>
                                                <td id="pAppointmentStartTime" runat="server" style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px;">Дууссан цаг</td>
                                                <td id="pAppointmentEndTime" runat="server" style="width:50%; padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>                                
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                    <table style="width:100%; border-collapse:collapse;">
                                        <thead>
                                            <tr>
                                                <th style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Төлбөрийн ангилал</th>
                                                <th style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Дүн /төг/</th>
                                                <th style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Тоо/ш</th>
                                                <th style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Нийт дүн /төг/</th>
                                                <th style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Хөнглөлт /%/</th>
                                                <th style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Төлөх дүн /төг/</th>
                                            </tr>
                                        </thead>
                                        <tbody id="pAppointmentServicesList" runat="server">
                                            <tr>
                                                <th colspan="4" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Оношлогоо</th>
                                            </tr>
                                            <tr>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px;">Явах эд ангийн оношлогоо</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">12,000</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">1</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">12,000</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px;">Компьютер оношлогоо</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">1</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px;">Цахилгааны оношлогоо</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">1</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</td>
                                            </tr>
                                            <tr>
                                                <th colspan="4" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Засвар үйлчилгээ</th>
                                            </tr>
                                            <tr>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px;">Их биений сальник солих</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">100,000</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">2</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">200,000</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px;">Автомат хурдны хайрцагны тос солих</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">45,000</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">2</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">90,000</td>
                                            </tr>
                                            <tr>
                                                <th colspan="4" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Солисон сэлбэг</th>
                                            </tr>
                                            <tr>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px;">Пар флунжер</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">612,000</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">2</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">1,224,000</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px;">Агаар шүүгч</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">104,000</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">1</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">104,000</td>
                                            </tr>
                                            <tr>
                                                <th colspan="3" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Бүгд</th>
                                                <th style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">1,680,000</th>
                                            </tr>
                                            <tr>
                                                <td colspan="4">&nbsp;</td>
                                            </tr>
                                             <tr>
                                                <td colspan="3" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Хөнглөлт</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</td>
                                            </tr>
                                             <tr>
                                                <td colspan="3" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Өмнөх үлдэгдэл</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</td>
                                            </tr>
                                             <tr>
                                                <th colspan="3" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Төлөх дүн</th>
                                                <th style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</th>
                                            </tr>
                                             <tr>
                                                <td colspan="3" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Төлсөн дүн</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</td>
                                            </tr>
                                             <tr>
                                                <td colspan="3" style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:center;">Төлөгдөөгүй дүн</td>
                                                <td style="padding:1px 5px; border:1px solid #DDD; font-size:11px; text-align:right;">0</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                    <p style="font-size:11px;">
                                        <strong>Хаяг: </strong><span id="pClinicAddr" runat="server"></span><%--Олимпийн гудамж, 1-р хороо, Сүхбаатар дүүрэг, Улаанбаатар хот 14230, Монгол улс--%>
                                        <br />
                                        <strong>Утас: </strong><span id="pClinicTel" runat="server"></span><%--75777878, 75777979--%>
                                        <br />
                                        <strong>Имэйл: </strong><span id="pClinicEmail" runat="server"></span><%--tb@tavanbogd.com--%>
                                        <br />
                                        <strong>Вэб: </strong><span id="pClinicWeb" runat="server"></span><%--http://www.tavanbogdllc.mn--%>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
			    </div>
            </div>
        </div>
    </div>
</div>

