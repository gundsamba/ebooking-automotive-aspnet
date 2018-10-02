<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar.aspx.cs" Inherits="ebooking.pg.calendar" %>
<link href='../js/plugin/fullcalendartimeline/fullcalendar.css' rel='stylesheet' />
<link href='../js/plugin/fullcalendartimeline/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='../js/plugin/fullcalendartimeline/timeline.css' rel='stylesheet' />
<style>
    .jarviswidget .fc-left h2 {
        text-shadow: 0 1px 0 #fff;
        margin-top: -12px;
        margin-left: 10px !important;
        font-size: 14px;
        font-weight: 700;
        margin-bottom: 0;
    }
    .jarviswidget #calendar1 {
      margin-top: -22px;
    }
    .ui-datepicker {
        width:100% !important;
    }
    #ui-datepicker-div {
        width: 200px !important;
    }
    .currentTimeInCal {
        border-right:1px dashed #3276b1 !important;
    }
    .fc-right {
        display:none;
    }
    .fc-center .fc-button-group{
        display:none;
    }
    .calendarswappatient.activate {
        right: 14px !important;
        box-shadow: -11px 12px 23px rgba(0,0,0,.2);
        padding: 5px 10px 10px;
    }
    .calendarswappatient #calendarswappatient-setting + form {
        display: none;
    }
    .calendarswappatient.activate #calendarswappatient-setting + form {
        display: block;
    }
    .calendarswappatient {
        position: absolute;
        top: 45px;
        right: 14px;
        width: 160px;
        z-index: 902;
        background: #F1DA91;
    }
    .calendarswappatient > span {
        position: absolute;
        right: 0;
        top: 0;
        display: block;
        height: 30px;
        width: 30px;
        border-radius: 5px 0 0 5px;
        background: #F1DA91;
        padding: 2px;
        text-align: center;
        line-height: 28px;
        cursor: pointer;
    }
    .calendarswappatient > span i {
        font-size: 17px;
    }
    .calendarswappatient.activate > span i:before {
        content: "\f00d";
    }
    .calendarswappatient.activate > span {
        left: -30px;
    }
    .calendarswappatient > span:hover i {
        color: #333 !important;
    }
    .calendarswappatient form section {
        margin: 0 !important;
    }
    .ui-datepicker-trigger {
        margin: 5px 0 0 5px;
        height: 22px;
        cursor:pointer;
    }
    .fc-today {
	    background: #f9f2f4!important;
    }
    .font-bold {
        font-weight:bold;
    }
</style>
<script src='../js/plugin/moment/moment.min.js'></script>
<script src='../js/plugin/fullcalendartimeline/fullcalendar.min.js'></script>
<script src='../js/plugin/fullcalendartimeline/timeline.min.js'></script>
<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
		<h1 class="page-title txt-color-blueDark" lang="mn"><i class="fa fa-calendar fa-fw "></i> 
			Цаг авалт
		</h1>
	</div>
	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-9">
		<ul id="sparks" class="animated fadeInRight">
			<li class="sparks-info">
				<h5 style="margin:0 10px 0 0; text-align:center;" lang="mn"> Цуцлагдсан <span id="calendarCancelCnt" class="txt-color-red"><i class="fa fa-times-circle"></i>&nbsp;0</span></h5>
                <div class="easy-pie-chart txt-color-red calendarCancelPieChart" data-percent="0" data-pie-size="40">
                    <span class="percent percent-sign">0</span>
                </div>		
			</li>
			<li class="sparks-info">
				<h5 style="margin:0 10px 0 0; text-align:center;" lang="mn">Үйлчлүүлж дууссан <span id="calendarDoneCnt" class="txt-color-greenDark"><i class="fa fa-check-circle"></i>&nbsp;00</span></h5>
                <div class="easy-pie-chart txt-color-greenDark calendarDonePieChart" data-percent="0" data-pie-size="40">
                    <span class="percent percent-sign">0</span>
                </div>		
			</li>
		</ul>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12 animated fadeInDown" data-widget-collapsed="true">
		<div class="jarviswidget margin-bottom-10">
            <header>
                <div id="calendarCurrentRoomId" runat="server" class="hide"></div>
                <div id="calendarCurrentRoomChiarNumArr" runat="server" class="hide"></div>
                <div id="calendarCurrentEventSource" runat="server" class="hide"></div>
                <div id="calendarBlockHeaderListDiv" runat="server"></div>
                <input id="applmtmsg" runat="server" type="hidden" />
                <input id="applmtnm" runat="server" type="hidden" />
                <input id="appCurrentView" runat="server" type="hidden" value="timelineDay" />
                <div class="widget-toolbar">
					<div class="btn-group">
						<button class="btn dropdown-toggle btn-xs btn-info" data-toggle="dropdown" lang="mn">
							Харуулах төрөл <i class="fa fa-caret-down"></i>
						</button>
						<ul class="dropdown-menu js-status-update pull-right">
							<li>
								<a href="javascript:void(0);" id="td" lang="mn">Өдрөөр</a>
							</li>
							<li>
								<a href="javascript:void(0);" id="ag" lang="mn">Долоо хоног</a>
							</li>
							<li>
								<a href="javascript:void(0);" id="mt" lang="mn">Сараар</a>
							</li>
						</ul>
					</div>
				</div>
                <div class="widget-toolbar pull-left">
                    <span class="label bg-color-blueDark" lang="mn">Захиалганд байгаа <i id="calendarAppointmentType1Cnt" style="font-size:15px;">(0)</i></span>
                    <span class="label bg-color-pink" style="margin-left: 3px;" lang="mn">Хүлээлгэнд байгаа <i id="calendarAppointmentType2Cnt" style="font-size:15px;">(0)</i></span>
                    <span class="label bg-color-orange" style="margin-left: 3px;" lang="mn">Үйлчлүүлж байгаа <i id="calendarAppointmentType3Cnt" style="font-size:15px;">(0)</i></span>
                    <span class="label bg-color-greenLight" style="margin-left: 3px;" lang="mn">Үйлчлүүлж дууссан <i id="calendarAppointmentType4Cnt" style="font-size:15px;">(0)</i></span>
				    <span class="label bg-color-red" style="margin-left: 3px;" lang="mn">Цуцлагдсан <i id="calendarAppointmentType5Cnt" style="font-size:15px;">(0)</i></span>
                    <div id="calendarSettings" runat="server" class="hide"></div>
                </div>
			</header>
			<div>
				<div class="widget-body no-padding">
					<div class="widget-body-toolbar">
                        <div id="calendar-buttons">
							<div class="btn-group">
                                <a href="javascript:void(0)" class="btn btn-primary btn-xs" id="btn-today" style="margin-right:7px;" lang="mn"> Өнөөдөр </a>
                                <input type='text' id='btn-calendar' style="display:none;"/>
								<a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-prev"><i class="fa fa-chevron-left"></i></a>
								<a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-next"><i class="fa fa-chevron-right"></i></a>
                                <%--<a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-calendar" style="margin-left:7px;"><i class="fa fa-calendar"></i></a>--%>
							</div>
						</div>
					</div>
                    <div id="loaderCalendar" class="loader-background" style="margin:0;">
                        <img src="../img/loading.gif" />
                        <h2 lang="mn">Уншиж байна...</h2>
                    </div>
					<div id="calendar1"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        <div class="well padding-10">
			<h5 class="margin-top-0"><i class="fa fa-map-marker"></i> Ажилдаа ирсэн механик <a href="javascript:void(0);" class="btn btn-link btn-xs" rel="tooltip" data-placement="bottom" data-original-title="Ирц оруулах" data-toggle="modal" data-target="#calendarActiveMechanicModal" onclick="calendarActiveMechanicList();"><i class="fa fa-plus"></i></a><em><small><span id="CalendarActiveMechanicSpanDate" class="pull-right">0000-00-00</span></small></em></h5>
			<div class="row">
				<div id="CalendarActiveMechanicDiv" class="col-lg-12"></div>
			</div>
		</div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        <div class="well padding-10">
			<h5 class="margin-top-0"><i class="fa fa-user"></i> Одоо ажиллаж байгаа механик<em><small><span id="CalendarActiveWorkedMechanicSpanDate" class="pull-right">0000-00-00</span></small></em></h5>
			<div class="row">
				<div id="CalendarActiveWorkedMechanicDiv" class="col-lg-12"></div>
			</div>
		</div>
    </div>
</div>
<div id="calendarAppointmentInsertModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <span class="modal-title" lang="mn">Захиалга оруулах</span>
                <span id="calendarInsertDate" class="text-primary" style="padding-right:10px; font-style:italic; font-weight:bold;">2015-02-02</span>
		    </div>
            <div class="modal-body no-padding">
                <form id="calendarInsertForm" action="" class="smart-form" novalidate="novalidate">
                    <fieldset>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; background-color:#D6D6D6; margin-bottom: 0;">
                            <div class="row">
                                <section class="col col-12 no-margin" lang="mn">
                                    Захиалгын бүртгэл
                                </section>
                            </div>
                        </div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; border-top:none; margin-bottom: 3px;">
                            <div class="row">
                                <section class="col-xs-6 col-sm-4 col-md-3 col-lg-3" style="margin-left:15px;">
                                    <label class="label font-sm" style="display: block;" lang="mn">*Захиалгын төрөл</label>
                                    <div class="inline-group">
                                        <label class="radio margin-right-5 font-sm">
									        <input id="calendarInputAppointmenttype1" type="radio" name="calendarInputAppointmenttype" value="1">
									        <i></i><span lang="mn">Биечлэн</span>
								        </label>
                                        <label class="radio font-sm">
									        <input id="calendarInputAppointmenttype2" type="radio" name="calendarInputAppointmenttype" value="0">
									        <i></i><span lang="mn">Утсаар</span>
								        </label>
                                    </div>
                                </section>
						        <section class="col-xs-6 col-sm-3 col-md-1 col-lg-1">
                                    <label class="label" lang="mn">*Эхлэх цаг</label>
                                    <label class="select">
                                        <select id="calendarSelectStartTime" name="calendarSelectStartTime" runat="server">
					                        <option value="">- Сонго -</option>
				                        </select>
                                        <i></i>
                                    </label>
                                </section>
						        <section class="col-xs-6 col-sm-3 col-md-1 col-lg-1" style="margin-left:15px;">
                                    <label class="label" lang="mn">*Дуусах цаг</label>
                                    <label class="select">
                                        <select id="calendarSelectEndTime" name="calendarSelectEndTime" runat="server">
					                        <option value="">- Сонго -</option>
				                        </select>
                                        <i></i>
                                    </label>
                                </section>
                                <section class="col-xs-6 col-sm-3 col-md-4 col-lg-4" style="margin-left:15px;">
                                    <label class="label" lang="mn">*Аль зааланд</label>
                                    <label class="select">
                                        <select id="calendarSelectRoom" name="calendarSelectRoom" runat="server">
					                        <option value="">- Сонго -</option>
				                        </select>
                                        <i></i>
                                    </label>
                                </section>
                                <section class="col-xs-6 col-sm-3 col-md-1 col-lg-1" style="margin-left:15px;">
                                    <label class="label" lang="mn">*Өргөгч</label>
                                    <label class="select">
                                        <select id="calendarSelectChair" name="calendarSelectChair" runat="server">
					                        <option value="">- Сонго -</option>
				                        </select>
                                        <i></i>
                                    </label>
                                </section>
                            </div>
                        </div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; background-color:#D6D6D6; margin-bottom: 0;">
                            <div class="row">
                                <section class="col col-12 no-margin" lang="mn">
                                    Автомашиний мэдээлэл
                                </section>
                            </div>
                        </div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; border-top:none; margin-bottom: 3px;">
                            <div class="row" style="margin-bottom:5px;">
                                <div id="patientID" class="hide"></div>
						        <section class="col col-3 no-margin">
                                    <label class="label font-sm" lang="mn">*Улсын дугаар</label>
                                    <label class="input">
                                        <i class="icon-prepend fa fa-search"></i>
                                        <input id="calendarInputAutono" name="calendarInputAutono" type="text" placeholder="0000 УБА" maxlength="8" style="padding-left: 37px;" data-mask="9999 ccc" data-mask-placeholder= "_" class="font-sm"/>
                                        <b class="tooltip tooltip-top-left">
											<i class="fa fa-info txt-color-teal"></i> 
											Улсын дугаар хайх боломжтой
                                        </b>
                                    </label>
                                </section>
                                <section class="col col-3 no-margin">
                                    <label class="label font-sm" lang="mn">*Үйлдвэрлэгч</label>
                                    <label class="select">
                                        <select id="calendarSelectAutomarkType" name="calendarSelectAutomarkType" runat="server" class="font-sm">
								            <option value="">- Сонго -</option>
							            </select>
                                        <i></i>
                                    </label>							
                                </section>
                                <section class="col col-4 no-margin">
                                    <label class="label font-sm" lang="mn">*Автомашины загвар</label>
                                    <label class="select">
                                        <select id="calendarSelectAutomark" name="calendarSelectAutomark" runat="server" style="padding:1px;" class="font-sm">
								            <option value="">- Сонго -</option>
							            </select>
                                        <i></i>
                                    </label>							
                                </section>
                                <section class="col col-2 no-margin">
                                    <label class="label font-sm" lang="mn">*Үйлд/он</label>
                                    <label class="select">
                                        <select id="calendarSelectAutoYear" name="calendarSelectAutoYear" runat="server" class="font-sm">
								            <option value="">- Сонго -</option>
							            </select>
                                        <i></i>
                                    </label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-3 no-margin">
                                    <label class="label font-sm" lang="mn">Аралын дугаар</label>
                                    <label class="input">
                                        <input id="calendarInputVinno" name="calendarInputVinno" type="text" placeholder="Аралын дугаар" maxlength="17" lang="mn" class="font-sm"/>
                                    </label>
                                </section>
                                <section class="col col-2 no-margin">
                                    <label class="label font-sm" lang="mn">*Шат/төрөл</label>
                                    <label class="radio font-sm" style="margin-top:-8px;">
									    <input id="calendarInputFueltype1" type="radio" name="calendarInputFueltype" value="1">
									    <i></i><span lang="mn">Бензин</span>
								    </label>
                                    <label class="radio font-sm" style="margin-top:-8px; margin-left:0;">
									    <input id="calendarInputFueltype2" type="radio" name="calendarInputFueltype" value="0">
									    <i></i><span lang="mn">Дизель</span>
								    </label>
                                </section>
                                <section class="col col-2 no-margin">
                                    <label class="label font-sm" lang="mn">*Хурд/хайрцаг</label>
                                    <label class="radio font-sm" style="margin-top:-8px;">
									    <input id="calendarInputTransmission1" type="radio" name="calendarInputTransmission" value="1">
									    <i></i><span lang="mn">Автомат</span>
								    </label>
                                    <label class="radio font-sm" style="margin-top:-8px; margin-left:0;">
									    <input id="calendarInputTransmission2" type="radio" name="calendarInputTransmission" value="0">
									    <i></i><span lang="mn">Механик</span>
								    </label>
                                </section>
                                <section class="col col-2 no-margin" style="width:115px!important;">
                                    <label class="label font-sm" lang="mn">Заалт</label>
                                    <label class="radio font-sm" style="margin-top:-8px;">
									    <input id="calendarInputZaaltType1" type="radio" name="calendarInputZaaltType" value="1">
									    <i></i><span lang="mn">Мил</span>
								    </label>
                                    <label class="radio font-sm" style="margin-top:-8px; margin-left:0;">
									    <input id="calendarInputZaaltType2" type="radio" name="calendarInputZaaltType" value="2">
									    <i></i><span lang="mn">Км</span>
								    </label>
                                </section>
                                <section class="col col-1 no-margin">
                                    <label class="label font-sm">&nbsp;</label>
                                    <label class="input">
                                        <input id="calendarInputKmzaalt" name="calendarInputKmzaalt" type="text" placeholder="Заалт" style="margin-left: -55px;width: auto;" lang="mn" class="font-sm" />
                                    </label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-12 no-margin">
                                    <label class="label font-sm" lang="mn">Манайхаас худалдан авсан</label>
                                    <label class="checkbox font-sm">
									    <input id="calendarInputIsMySold" type="checkbox" class="checkbox style-0" name="calendarInputIsMySold" value="1">
									    <span lang="mn">Тийм</span>
								    </label>
                                </section>
                            </div>
                        </div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; background-color:#D6D6D6; margin-bottom: 0;">
                            <div class="row">
                                <section class="col col-12 no-margin" lang="mn">
                                    Үйлчлүүлэгчийн мэдээлэл
                                </section>
                            </div>
                        </div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; border-top:none; margin-bottom: 0;">
                            <div class="row" style="margin-bottom:5px;">
                                <section class="col col-5 no-margin">
                                    <label class="label font-sm" lang="mn">*Эзэмшигчийн нэр</label>
                                    <label class="input">
                                        <input id="calendarInputOwnername" name="calendarInputOwnername" type="text" placeholder="Эзэмшигчийн нэр" lang="mn" maxlength="100" class="input-sm"/>
                                    </label>
                                </section>
                                <section class="col col-2 no-margin">
                                    <label class="label font-sm" lang="mn">*Утас 1</label>
                                    <label class="input">
                                        <input id="calendarInputTel" name="calendarInputTel" type="text" placeholder="Утас 1" lang="mn" maxlength="8" class="input-sm" />
                                    </label>
                                </section>
                                <section class="col col-2 no-margin">
                                    <label class="label font-sm" lang="mn">Утас 2</label>
                                    <label class="input">
                                        <input id="calendarInputTel2" name="calendarInputTel2" type="text" placeholder="Утас 2" lang="mn" maxlength="8" />
                                    </label>
                                </section>
                                <section class="col col-3 no-margin">
                                    <label class="label font-sm" lang="mn">*Эзэмшигч</label>
                                    <div class="inline-group">
                                        <label class="radio margin-right-5 font-sm">
									        <input id="calendarInputType1" type="radio" name="calendarInputType" value="1">
									        <i></i><span lang="mn" class="font-xs">Хувь хүн</span>
								        </label>
                                        <label class="radio font-sm">
									        <input id="calendarInputType2" type="radio" name="calendarInputType" value="0">
									        <i></i><span lang="mn" class="font-xs">Байгууллага</span>
								        </label>
                                    </div>
                                </section>
                            </div>
                            <div class="row" style="margin-bottom:5px;">
                                <section class="col col-9 no-margin">
                                    <label class="label font-sm" lang="mn">Хаяг</label>
                                    <label class="textarea">
                                        <textarea id="calendarInputAddress" name="calendarInputAddress" rows="1" placeholder="Хаяг" maxlength="150"></textarea>
                                    </label>
                                </section>
                                <section id="calendarDiscountsDiv" runat="server" class="col col-3 no-margin">

                                </section>
                            </div>
                            <%--<div class="row" style="margin-bottom:5px;">
                                <div class="col-md-5" lang="mn">
                                    Яаралтай үед холбогдох утас
                                </div>
                                <div class="col-md-7" lang="mn">
                                    Таны хэн болох
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <input id="calendarInputTelEmergency" name="calendarInputTelEmergency" type="text" class="form-control" placeholder="Утас" lang="mn" maxlength="8" />
                                </div>
                                <div class="col-md-3">
                                    <label class="radio radio-inline no-margin">
									    <input id="calendarInputTelEmergencyType1" type="radio" class="radiobox" name="calendarInputTelEmergencyType" value="1">
									    <span lang="mn">Ажил</span>
								    </label>
                                    <label class="radio radio-inline no-margin">
									    <input id="calendarInputTelEmergencyType2" type="radio" class="radiobox" name="calendarInputTelEmergencyType" value="2">
									    <span lang="mn">Гэр</span>
								    </label>
                                    <label class="radio radio-inline no-margin">
									    <input id="calendarInputTelEmergencyType3" type="radio" class="radiobox" name="calendarInputTelEmergencyType" value="3">
									    <span lang="mn">Бусад</span>
								    </label>
                                </div>
                                <div class="col-md-7">
                                    <input id="calendarInputTelEmergencyPersonname" name="calendarInputTelEmergencyPersonname" type="text" class="form-control" placeholder="Таны хэн болох" lang="mn" maxlength="100" />
                                </div>
                            </div>--%>
                        </div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; border-top:none; margin-bottom: 3px;">
                            <div class="row" style="margin-bottom: 0;">
                                <section class="col col-3 no-margin">
                                    <label class="label font-sm" lang="mn">*Үйлчлүүлэгчийн хүсэлт:</label>
                                </section>
                                <div id="calendarAppInsertRequestsDiv" runat="server" class="col col-9">
                                </div>
                            </div>
                            <section class="no-margin">
                                <label class="textarea">
                                    <textarea id="calendarInputMemo" name="calendarInputMemo" rows="2" placeholder="Үйлчлүүлэгчийн хүсэлт" lang="mn" maxlength="500"></textarea>
                                </label>
                            </section>
                            <div class="row">
                                <%--<div class="col-md-3">
                                    <label class="control-label" style="display:block;" lang="mn">Автомашин угаалга:</label>
                                    <label class="radio radio-inline no-margin">
									    <input id="calendarInputWashCar1" type="radio" class="radiobox" name="calendarInputWashCar" value="1">
									    <span lang="mn">Тийм</span>
								    </label>
                                    <label class="radio radio-inline no-margin">
									    <input id="calendarInputWashCar0" type="radio" class="radiobox" name="calendarInputWashCar" value="0">
									    <span lang="mn">Үгүй</span>
								    </label>
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label" style="display:block;" lang="mn">Солиулсан сэлбэгээ өөртөө:</label>
                                    <label class="radio radio-inline no-margin">
									    <input id="calendarInputGetPart1" type="radio" class="radiobox" name="calendarInputGetPart" value="1">
									    <span lang="mn">Авна</span>
								    </label>
                                    <label class="radio radio-inline no-margin">
									    <input id="calendarInputGetPart0" type="radio" class="radiobox" name="calendarInputGetPart" value="0">
									    <span lang="mn">Авахгүй</span>
								    </label>
                                </div>
                                <div class="col-md-4 col-md-offset-1">--%>
                                <div class="col col-4 col-offset-8">
                                    <label class="label font-sm" lang="mn">*Бүртгэсэн ажилтан</label>
                                    <label class="select">
                                        <select id="calendarSelectSubmitStaff" name="calendarSelectSubmitStaff" runat="server" class="input-sm">
								            <option value="">- Сонго -</option>
							            </select>
                                        <i></i>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </fieldset>
		            <footer>
			            <button id="calendarBtnSave" type="submit" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
			            <button type="button" class="btn btn-default btn-xs" data-dismiss="modal" lang="mn">Болих</button>
			            <button id="calendarBtnCancel" type="button" class="btn btn-default btn-xs"><i class="fa fa-refresh"></i></button>
		            </footer>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="calendarAppointmentModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" <%--style="width:1000px!important;"--%>>
        <div class="modal-content">
            <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h4 class="modal-title" lang="mn">Захиалгын мэдээлэл</h4>
		    </div>
		    <div class="modal-body">
                <div id="appointmentID" class="hide"></div>
                <div class="row smart-form" style="margin-bottom:10px;">
                    <fieldset class="no-padding">
                        <section class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                            <div class="inline-group">
                                <label class="label font-sm" lang="mn">*Захиалгын төрөл</label>
                                <label class="radio no-margin margin-right-5 state-disabled font-sm">
							        <input id="calendarAppointmentModalAppointmenttype1" type="radio" name="calendarAppointmentModalAppointmenttype" value="1" disabled="disabled">
							        <i></i><span lang="mn">Биечлэн</span>
						        </label>
                                <label class="radio no-margin state-disabled font-sm">
							        <input id="calendarAppointmentModalAppointmenttype2" type="radio" name="calendarAppointmentModalAppointmenttype" value="0" disabled="disabled">
							        <i></i><span lang="mn">Утсаар</span>
						        </label>
                            </div>
                        </section>
                        <section class="col-xs-6 col-sm-4 col-md-2 col-lg-2">
                            <label class="label font-sm" lang="mn">*Огноо</label>
                            <label class="input">
                                <input id="calendarAppointmentModalInputDate" name="calendarAppointmentModalInputDate" class="input-sm" type="text" placeholder="Огноо" lang="mn" style="padding: 1px 2px;">
                            </label>
                        </section>
                        <section class="col-xs-6 col-sm-4 col-md-1 col-lg-1">
                            <label class="label font-sm" lang="mn">*Эхлэх цаг</label>
                            <label class="select" style="margin-left:10px;">
                                <select id="calendarAppointmentModalSelectStartTime" name="calendarAppointmentModalSelectStartTime" runat="server" class="input-sm" style="padding: 1px 2px;">
					                <option value="">- Сонго -</option>
				                </select><i></i>
                            </label>
                        </section>
                        <section class="col-xs-6 col-sm-4 col-md-1 col-lg-1">
                            <label class="label font-sm" lang="mn">*Дуусах цаг</label>
                            <label class="select" style="margin-left:10px;">
                                <select id="calendarAppointmentModalSelectEndTime" name="calendarAppointmentModalSelectEndTime" runat="server" class="input-sm" style="padding: 1px 2px;">
					                <option value="">- Сонго -</option>
				                </select><i></i>
                            </label>
                        </section>
                        <section class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
                            <label class="label font-sm" lang="mn">*Аль зааланд</label>
                            <label class="select" style="margin-left:10px;">
                                <select id="calendarAppointmentModalSelectRoom" name="calendarAppointmentModalSelectRoom" runat="server" class="input-sm" style="padding: 1px 2px;"></select><i></i>
                            </label>
                        </section>
                        <section class="col-xs-6 col-sm-4 col-md-1 col-lg-1">
                            <label class="label font-sm" lang="mn">*Өргөгч</label>
                            <label class="select" style="margin-left:10px;">
                                <select id="calendarAppointmentModalSelectChair" name="calendarAppointmentModalSelectChair" runat="server" class="input-sm"></select><i></i>
                            </label>
                        </section>
                        <%--<section class="col col-2 no-margin" style="padding-left:0; padding-right:0;">
                            <div class="inline-group">
                                <label class="label font-sm" lang="mn">*Захиалгын төрөл</label>
                                <label class="radio no-margin margin-right-5 state-disabled font-sm">
							        <input id="calendarAppointmentModalAppointmenttype1" type="radio" name="calendarAppointmentModalAppointmenttype" value="1" disabled="disabled">
							        <i></i><span lang="mn">Биечлэн</span>
						        </label>
                                <label class="radio no-margin state-disabled font-sm">
							        <input id="calendarAppointmentModalAppointmenttype2" type="radio" name="calendarAppointmentModalAppointmenttype" value="0" disabled="disabled">
							        <i></i><span lang="mn">Утсаар</span>
						        </label>
                            </div>
                        </section>
                        <section class="col col-2 no-margin" style="padding-right:0;">
                            <label class="label font-sm" lang="mn">*Огноо</label>
                            <label class="input">
                                <input id="calendarAppointmentModalInputDate" name="calendarAppointmentModalInputDate" class="input-sm" type="text" placeholder="Огноо" lang="mn" style="padding: 1px 2px;">
                            </label>
                        </section>
                        <section class="col col-2 no-margin" style="width:13%!important; padding-right:0;">
                            <label class="label font-sm" lang="mn">*Эхлэх цаг</label>
                            <label class="select">
                                <select id="calendarAppointmentModalSelectStartTime" name="calendarAppointmentModalSelectStartTime" runat="server" class="input-sm" style="padding: 1px 2px;">
					                <option value="">- Сонго -</option>
				                </select><i></i>
                            </label>
                        </section>
                        <section class="col col-2 no-margin" style="width:13%!important; padding-right:0;">
                            <label class="label font-sm" lang="mn">*Дуусах цаг</label>
                            <label class="select">
                                <select id="calendarAppointmentModalSelectEndTime" name="calendarAppointmentModalSelectEndTime" runat="server" class="input-sm" style="padding: 1px 2px;">
					                <option value="">- Сонго -</option>
				                </select><i></i>
                            </label>
                        </section>
                        <section class="col col-3 no-margin" style="width:27%!important; padding-right:0;">
                            <label class="label font-sm" lang="mn">*Аль зааланд</label>
                            <label class="select">
                                <select id="calendarAppointmentModalSelectRoom" name="calendarAppointmentModalSelectRoom" runat="server" class="input-sm" style="padding: 1px 2px;"></select><i></i>
                            </label>
                        </section>
                        <section class="col col-2 no-margin" style="width:13%!important; padding-right:0;">
                            <label class="label font-sm" lang="mn">*Өргөгч</label>
                            <label class="select">
                                <select id="calendarAppointmentModalSelectChair" name="calendarAppointmentModalSelectChair" runat="server" class="input-sm"></select><i></i>
                            </label>
                        </section>--%>
                    </fieldset>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-color-darken txt-color-white text-center font-sm">
                                Захиалганд байгаа
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 bg-color-pink txt-color-white text-center font-sm">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                Хүлээлгэнд байгаа
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-color-orange txt-color-white text-center font-sm">
                                Үйлчлүүлж байгаа
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-color-greenLight txt-color-white text-center font-sm">
                                Үйлчлүүлж дууссан
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-color-red txt-color-white text-center font-sm">
                                Цуцлагдсан     <span style="color: #a90329;">.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-md-10 col-sm-10 no-padding">
                        <div class="btn-group btn-group-justified btn-select-tick" data-toggle="buttons" style="width:100%;">
							<label class="btn bg-color-darken active" style="width:20%;">
								<input id="calendarAppointmentModalAppointmentType1" name="calendarAppointmentModalAppointmentType" type="radio" value="1" checked="checked">
								<i class="fa fa-check txt-color-white"></i> 
							</label>
							<label class="btn bg-color-pink" style="width:20%;">
								<input id="calendarAppointmentModalAppointmentType2" name="calendarAppointmentModalAppointmentType" type="radio" value="2">
								<i class="fa fa-check txt-color-white"></i> 
							</label>
							<label class="btn bg-color-orange" style="width:20%;">
								<input id="calendarAppointmentModalAppointmentType3" name="calendarAppointmentModalAppointmentType" type="radio" value="3">
								<i class="fa fa-check txt-color-white"></i> 
							</label>
							<label class="btn bg-color-greenLight" style="width:20%;">
								<input id="calendarAppointmentModalAppointmentType4" name="calendarAppointmentModalAppointmentType" type="radio" value="4">
								<i class="fa fa-check txt-color-white"></i> 
							</label>
							<label class="btn bg-color-red" style="width:20%;">
								<input id="calendarAppointmentModalAppointmentType5" name="calendarAppointmentModalAppointmentType" type="radio" value="5">
								<i class="fa fa-check txt-color-white"></i> 
                            </label>
						</div>
                    </div>
                    <div class="col-md-2 no-padding">
                        <a id="calendarAppointmentModalAppointmentType5DescriptionBtn" href="javascript:void(0);" title="Цуцлагдсан тайлбар оруулах" class="btn btn-link btn-xs font-xs" style="line-height: 10px; margin-top: -10px;"data-toggle="modal" data-target="#appmodalCalendarAppType5DescriptionModal" onclick="appmodalCalendarAppType5DescriptionAddEdit('0')"> Цуцлагдсан<br>тайлбар<br>оруулах</a>
				    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 font-sm">
                        <i style="border-bottom: 1px dashed rgba(0,0,0,.2);" lang="mn">Үйлчлүүлэгчийн хүсэлт</i>
                    </div>
                </div>
                <div class="row smart-form" style="padding-bottom: 5px;">
                    <section class="col col-12 no-margin no-padding">
                        <div id="calendarAppModalRequestsDiv" runat="server" class="inline-group text-center">
                        </div>
                    </section>
                </div>
                <div class="row smart-form" style="padding-bottom: 10px;">
                    <section>
                        <label class="textarea">
                            <textarea id="calendarAppointmentModalInputAppointmentMemo" name="calendarAppointmentModalInputAppointmentMemo" placeholder="Үйлчлүүлэгчийн хүсэлт" lang="mn" rows="1"></textarea>
                        </label>
                    </section>
                </div>
                <div class="row" style="padding-bottom: 5px;">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <a id="calendarAppointmentModalInvoiceBtn" href="../pg/calendarservicemodal.aspx" data-toggle="modal" data-target="#calendarservicemodal" class="btn bg-color-blueLight txt-color-white btn-xs pull-left"><i class="fa fa-money"></i> <span lang="mn">Төлбөр харах|хэвлэх</span></a>
                        <a id="calendarAppointmentModalDocumentBtn" href="../pg/calendardocumentmodal.aspx" data-toggle="modal" data-target="#calendardocumentmodal" class="btn bg-color-blueLight txt-color-white btn-xs pull-left" style="margin-left:5px;"><i class="fa fa-file-text-o"></i> <span lang="mn">Оношлогоо, засвар үйлчилгээний хуудас харах|хэвлэх</span></a>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <a id="calendarAppointmentModalAppDocumentBtn" href="../pg/calendarappdocumentmodal.aspx" data-toggle="modal" data-target="#calendarappdocumentmodal" class="btn bg-color-blueLight txt-color-white btn-xs pull-right" style="margin-top:3px;"><i class="fa fa-file-text-o"></i> <span lang="mn">Захиалга бүртгэлийн хуудас харах|хэвлэх</span></a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" id="calendarAppointmentModalTabs">
                        <ul class="nav nav-tabs tabs-pull-right bordered">
						    <li class="pull-left font-sm" data-pgname="appmodaltab5">
							    <a href="#calendarAppointmentModalTabsContent5" data-toggle="tab" lang="mn">Төлбөр</a>
						    </li>
						    <li class="active font-sm" data-pgname="appmodaltab1">
							    <a href="#calendarAppointmentModalTabsContent1" data-toggle="tab" lang="mn">Үйлчлүүлэгч</a>
						    </li>
						    <li class="pull-right font-sm" data-pgname="appmodaltab2">
							    <a href="#calendarAppointmentModalTabsContent2" data-toggle="tab" lang="mn">Оношлогоо</a>
						    </li>
						    <li class="pull-right font-sm" data-pgname="appmodaltab3">
							    <a href="#calendarAppointmentModalTabsContent3" data-toggle="tab"><span lang="mn">Засвар үйлчилгээ</span> (<span id="calendarAppointmentModalTabsContent3Count">0</span>)</a>
						    </li>
						    <li class="pull-right font-sm" data-pgname="appmodaltab4">
							    <a href="#calendarAppointmentModalTabsContent4" data-toggle="tab"><span lang="mn">Солиох сэлбэг</span> (<span id="calendarAppointmentModalTabsContent4Count">0</span>)</a>
						    </li>
					    </ul>
                        <div class="tab-content padding-10">
                            <div class="tab-pane fade in active" id="calendarAppointmentModalTabsContent1">
                                <div id="loaderCalendarTab1" class="loader-background" style="margin:0;">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
							    <div class="widget-body-toolbar bg-color-white no-margin no-padding">
                                    <div class="calendarswappatient">
                                        <span id="calendarswappatient-setting"><i class="fa fa-exchange txt-color-blueDark"></i></span>
                                        <form id="calendarSwapPatientForm">
                                            <legend class="no-padding margin-bottom-10" style="font-size:15px;" lang="mn">Үйлчлүүлэгч солих</legend>
                                            <div class="input-group input-group-md" style="width:145px;">
						                        <div class="icon-addon addon-md">
						                            <input id="calendarSwapPatientInputAutoNoFilter" type="text" placeholder="0000 УБА" class="form-control" maxlength="8" data-mask="9999 ccc" data-mask-placeholder= "_"/>
						                            <label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="" data-original-title="Улсын дугаар"></label>
						                        </div>
						                        <span class="input-group-btn">
						                            <button id="calendarSwapPatientBtnAutoNoFilter" class="btn btn-default" type="button"><i class="fa fa-check"></i></button>
						                        </span>
					                        </div>
                                        </form>
                                    </div>
                                    <form id="patientModalForm" class="smart-form">
                                        <div id="appmodaltab1PatientID" runat="server" class="hide"></div>
                                        <fieldset class="no-padding">
                                            <div class="form-group">
                                                <div class="row">
                                                    <section class="col-lg-2 col-md-3 col-sm-4 col-xs-6" style="margin-left: 15px;">
                                                        <label class="label font-sm" lang="mn">*Код</label>
                                                        <label class="input state-disabled">
                                                            <input id="patientModalInputCode" name="patientModalInputCode" type="text" placeholder="Код" lang="mn" disabled="disabled" class="input-sm"/>
                                                        </label>
                                                    </section>
                                                </div>
                                            </div>
                                            <div class="form-group" style="border: 1px solid grey; padding:5px; background-color:#D6D6D6; margin-bottom: 0;">
                                                <div class="row">
                                                    <section class="col col-12 no-margin" lang="mn">Автомашиний мэдээлэл</section>
                                                </div>
                                            </div>
						                    <div class="form-group" style="border: 1px solid grey; padding:5px; border-top:none; margin-bottom: 3px;">
                                                <div class="row" style="margin-bottom:5px;">
                                                    <section class="col col-3">
                                                        <label class="label font-sm" lang="mn">*Улсын дугаар</label>
                                                        <label class="input state-disabled">
                                                            <input id="patientModalInputAutono" name="patientModalInputAutono" type="text" class="form-control input-sm" placeholder="0000 УБА" data-mask="9999 ccc" data-mask-placeholder= "_"/>
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="label font-sm" lang="mn">*Үйлдвэрлэгч</label>
                                                        <label class="select">
                                                            <select id="patientModalSelectAutomarkType" name="patientModalSelectAutomarkType" runat="server" class="input-sm">
								                                <option value="">- Сонго -</option>
							                                </select><i></i>
                                                        </label>							
                                                    </section>
								                    <section class="col col-4">
                                                        <label class="label font-sm" lang="mn">*Автомашины загвар</label>
                                                        <label class="select">
                                                            <select id="patientModalSelectAutomark" name="patientModalSelectAutomark" runat="server" class="input-sm">
								                                <option value="">- Сонго -</option>
							                                </select><i></i>
                                                        </label>							
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="label font-sm" lang="mn">*Үйлд/он</label>
                                                        <label class="select">
                                                            <select id="patientModalSelectAutoYear" name="patientModalSelectAutoYear" runat="server" class="input-sm">
								                                <option value="">- Сонго -</option>
							                                </select><i></i>
                                                        </label>
                                                    </section>
                                                </div>
                                                <div class="row">
                                                    <section class="col col-3">
                                                        <label class="label font-sm" lang="mn">Аралын дугаар</label>
                                                        <label class="input">
                                                            <input id="patientModalInputVinno" name="patientModalInputVinno" type="text" class="form-control" placeholder="Аралын дугаар" lang="mn" />
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="label font-sm" lang="mn">*Шат/төрөл</label>
                                                        <label class="radio font-sm" style="margin-top:-8px;">
									                        <input id="patientModalInputFueltype1" type="radio" name="patientModalInputFueltype" value="1">
									                        <i></i><span lang="mn">Бензин</span>
								                        </label>
                                                        <label class="radio font-sm" style="margin-top:-8px; margin-left:0;">
									                        <input id="patientModalInputFueltype2" type="radio" name="patientModalInputFueltype" value="0">
									                        <i></i><span lang="mn">Дизель</span>
								                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="label font-sm" lang="mn">*Хурд/хайрцаг</label>
                                                        <label class="radio font-sm" style="margin-top:-8px;">
									                        <input id="patientModalInputTransmission1" type="radio" name="patientModalInputTransmission" value="1">
									                        <i></i><span lang="mn">Автомат</span>
								                        </label>
                                                        <label class="radio font-sm" style="margin-top:-8px; margin-left:0;">
									                        <input id="patientModalInputTransmission2" type="radio" name="patientModalInputTransmission" value="0">
									                        <i></i><span lang="mn">Механик</span>
								                        </label>
                                                    </section>
                                                    <section class="col col-2" <%--style="width:90px!important;"--%>>
                                                        <label class="label font-sm" style="display:block;" lang="mn">Заалт</label>
                                                        <label class="radio font-sm" style="margin-top:-8px;">
									                        <input id="patientModalInputZaaltType1" type="radio" name="patientModalInputZaaltType" value="1">
									                        <i></i><span lang="mn">Мил</span>
								                        </label>
                                                        <label class="radio font-sm" style="margin-top:-8px; margin-left:0;">
									                        <input id="patientModalInputZaaltType2" type="radio" name="patientModalInputZaaltType" value="2">
									                        <i></i><span lang="mn">Км</span>
								                        </label>
                                                    </section>
                                                    <section class="col col-2" style="margin: 25px 0px 0px -25px;">
                                                        <label class="input">
                                                            <input id="patientModalInputKmzaalt" name="patientModalInputKmzaalt" type="text" placeholder="Заалт" style="width: 75%; float: left;" class="input-sm">
                                                            <a id="patientModalButtonKmzaalt" name="patientModalButtonKmzaalt" href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="bottom" data-original-title="Заалт хадгалах" style="width:25%;height: 32px;"><span class="glyphicon glyphicon-floppy-disk" style="padding-top: 8px;"></span></a>
                                                        </label>
                                                        <%--<div class="input-group input-group-md">
						                                    <div class="addon-md">
						                                        <input id="patientModalInputKmzaalt" name="patientModalInputKmzaalt" type="text" placeholder="Заалт">
						                                    </div>
						                                    <span class="input-group-btn">
                                                                <a id="patientModalButtonKmzaalt" name="patientModalButtonKmzaalt" href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="bottom" data-original-title="Заалт хадгалах"><span class="glyphicon glyphicon-floppy-disk"></span></a>
						                                    </span>
						                                </div>--%>
                                                    </section>
                                                </div>
                                                <div class="row">
                                                    <section class="col col-12 no-margin">
                                                        <label class="label font-sm" style="display:block;" lang="mn">Манайхаас худалдан авсан</label>
                                                        <label class="checkbox" style="margin-top:-8px;">
									                        <input id="patientModalInputIsMySold" type="checkbox" name="patientModalInputIsMySold" value="1" class="input-sm">
									                        <i></i><span lang="mn">Тийм</span>
								                        </label>
                                                    </section>
                                                </div>
						                    </div>
                                            <div class="form-group" style="border: 1px solid grey; padding:5px; background-color:#D6D6D6; margin-bottom: 0;">
                                                <div class="row">
                                                    <section class="col col-12 no-margin" lang="mn">
                                                        Үйлчлүүлэгчийн мэдээлэл
                                                    </section>
                                                </div>
                                            </div>
                                            <div class="form-group" style="border: 1px solid grey; padding:5px; border-top:none; margin-bottom: 3px;">
                                                <div class="row" style="margin-bottom:5px;">
                                                    <section class="col col-5">
                                                        <label class="label font-sm" lang="mn">*Эзэмшигчийн нэр</label>
                                                        <label class="input">
                                                            <input id="patientModalInputOwnername" name="patientModalInputOwnername" type="text" placeholder="Эзэмшигчийн нэр" lang="mn" class="input-sm" />
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="label font-sm" lang="mn">*Утас 1</label>
                                                        <label class="input">
                                                            <input id="patientModalInputTel" name="patientModalInputTel" type="text" placeholder="Утас 1" lang="mn" class="input-sm" />
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="label font-sm" lang="mn">Утас 2</label>
                                                        <label class="input">
                                                            <input id="patientModalInputTel2" name="patientModalInputTel2" type="text" placeholder="Утас 2" lang="mn" class="input-sm" />
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="label font-sm" style="display:block;" lang="mn">*Эзэмшигч</label>
                                                        <label class="radio font-sm" style="margin-top:-8px;">
										                    <input id="patientModalInputType1" type="radio" name="patientModalInputType" value="1" class="input-sm">
										                    <i></i><span lang="mn">Хувь хүн</span>
									                    </label>
                                                        <label class="radio font-sm" style="margin-top:-8px; margin-left:0;">
										                    <input id="patientModalInputType2" type="radio" name="patientModalInputType" value="0" class="input-sm">
										                    <i></i><span lang="mn">Байгууллага</span>
									                    </label>
                                                    </section>
                                                </div>
                                                <div class="row" style="margin-bottom:5px;">
                                                    <section class="col col-9">
                                                        <label class="label font-sm" lang="mn">Хаяг</label>
                                                        <label class="textarea">
                                                            <textarea id="patientModalInputAddress" name="patientModalInputAddress" rows="1" placeholder="Хаяг" lang="mn" maxlength="150" class="input-sm"></textarea>
                                                        </label>
                                                    </section>
                                                    <section id="patientModalDiscountsDiv" runat="server" class="col col-3">

                                                    </section>
                                                </div>
                                                <%--<div class="row" style="margin-bottom:5px;">
                                                    <div class="col-md-5" lang="mn">
                                                        Яаралтай үед холбогдох утас
                                                    </div>
                                                    <div class="col-md-7" lang="mn">
                                                        Таны хэн болох
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-bottom:5px;">
                                                    <div class="col-md-2">
                                                        <input id="patientModalInputTelEmergency" name="patientModalInputTelEmergency" type="text" class="form-control" placeholder="Утас" lang="mn" maxlength="8" />
                                                    </div>
                                                    <div class="col-md-3">
                                                        <label class="radio radio-inline no-margin">
									                        <input id="patientModalInputTelEmergencyType1" type="radio" class="radiobox" name="patientModalInputTelEmergencyType" value="1">
									                        <span lang="mn">Ажил</span>
								                        </label>
                                                        <label class="radio radio-inline no-margin">
									                        <input id="patientModalInputTelEmergencyType2" type="radio" class="radiobox" name="patientModalInputTelEmergencyType" value="2">
									                        <span lang="mn">Гэр</span>
								                        </label>
                                                        <label class="radio radio-inline no-margin">
									                        <input id="patientModalInputTelEmergencyType3" type="radio" class="radiobox" name="patientModalInputTelEmergencyType" value="3">
									                        <span lang="mn">Бусад</span>
								                        </label>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <input id="patientModalInputTelEmergencyPersonname" name="patientModalInputTelEmergencyPersonname" type="text" class="form-control" placeholder="Таны хэн болох" lang="mn" maxlength="100" />
                                                    </div>
                                                </div>--%>
                                                <div class="row">
                                                    <section class="col col-3">
                                                        <label class="control font-sm" lang="mn">И-мэйл</label>
                                                        <label class="input">
                                                            <input id="patientModalInputEmail" name="patientModalInputEmail" type="text" placeholder="И-мэйл" lang="mn" class="input-sm" />
                                                        </label>
                                                    </section>
                                                </div>
                                            </div>
					                    </fieldset>
                                        <footer>
                                            <button id="patientModalBtnSave" type="submit" class="btn btn-primary btn-xs pull-right"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Засварлах</span></button>
                                        </footer>
                                    </form>
		                        </div>
						    </div>
                            <div class="tab-pane fade in" id="calendarAppointmentModalTabsContent2">
                                <div id="loaderCalendarTab2" class="loader-background" style="margin:0;">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
							    <div class="widget-body-toolbar bg-color-white no-margin no-padding">
                                    <form id="appmodaltab2Form" class="smart-form">
                                        <fieldset class="no-padding no-margin">
			                               <section id="appmodaltab2DiagnosticsDiv" runat="server"></section>
                                            <section>
                                                <label class="label font-sm" lang="mn">Оношлогооны дүгнэлт</label>
                                                <label class="textarea">
                                                    <textarea id="appmodaltab2InputDescription" runat="server" name="appmodaltab2InputDescription" placeholder="Оношлогооны дүгнэлт" lang="mn" rows="10"></textarea>
                                                </label>
                                            </section>
                                            <section>
                                                <div class="row">
                                                    <div class="col col-4">
                                                        <label class="control-label font-sm" lang="mn">Дүгнэлт гаргасан ахлах механик</label>
                                                        <label class="select">
                                                            <select id="appmodaltab2SelectSeniorMechanical" runat="server" name="appmodaltab2SelectSeniorMechanical" class="input-sm">
							                                    <option value="">- Сонго -</option>
						                                    </select><i></i>
                                                        </label>
                                                    </div>
                                                    <div class="col col-4">
                                                        <label class="control-label font-sm" lang="mn">Дүгнэлт гаргасан механик <span style="color:white;">.</span></label>
                                                        <label class="select">
                                                            <select id="appmodaltab2SelectMechanical" runat="server" name="appmodaltab2SelectMechanical" class="input-sm">
							                                    <option value="">- Сонго -</option>
						                                    </select><i></i>
                                                        </label>
                                                    </div>
                                                    <div class="col col-4">
                                                        <label class="control-label font-sm" lang="mn">Дүгнэлт гаргасан үйлчилгээ/зөвлөх</label>
                                                        <label class="select">
                                                            <select id="appmodaltab2SelectServiceConsultant" runat="server" name="appmodaltab2SelectServiceConsultant" class="input-sm">
							                                    <option value="">- Сонго -</option>
						                                    </select><i></i>
                                                        </label>
                                                    </div>
                                                </div>
                                            </section>
                                            <footer>
                                                <button type="submit" class="btn btn-primary btn-xs pull-right"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
                                            </footer>
                                        </fieldset>
                                    </form>
                                </div>
						    </div>
                            <div class="tab-pane fade in" id="calendarAppointmentModalTabsContent3">
                                <div id="loaderCalendarTab3" class="loader-background" style="margin:0;">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
							    <div class="widget-body-toolbar bg-color-white no-margin">
                                    <form id="appmodaltab3Form">
                                        <fieldset>
			                                <div class="form-group">
                                                <div class="row">
                                                    <div id="appmodaltab3RepairsDiv" runat="server" class="col-sm-12">
                            
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
			                                <div class="form-group">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                        <div class="row">
                                                            <div class="col-sm-2 text-left font-sm" style="padding: 5px 0 0 8px;">Төрөл:</div>
                                                            <div class="col-sm-10 no-padding">
                                                                <select id="appmodaltab3SelectServiceType" name="appmodaltab3SelectServiceType" runat="server" class="form-control input-sm" style="padding:1px;">
                                                                    <option value="">- Бүгд -</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div id="appmodaltab3ServiceListDiv" runat="server" class="col-sm-12 custom-scroll animated fast fadeInDown no-padding font-sm" style="height:209px; overflow-x: hidden;">
                                        
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="appmodaltab3AppointmentServiceListDiv" runat="server" class="col-xs-12 col-sm-12 col-md-8 col-lg-8 custom-scroll animated fast fadeInRight font-sm" style="height:240px; overflow-x: hidden; padding: 0 0 0 5px;">
                                
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
			                                <div class="form-group">
                                                <div class="row" style="border-top: 1px solid #ddd;">
                                                    <div class="col-sm-4">
                                                        <label class="control-label font-sm" lang="mn">Механик</label>
                                                        <select id="appmodaltab3SelectMechanical" runat="server" name="appmodaltab3SelectMechanical" class="form-control input-sm" lang="mn">
							                                <option value="">- Сонго -</option>
						                                </select>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label class="control-label font-sm" lang="mn">Ахлах механик</label>
                                                        <select id="appmodaltab3SelectSeniorMechanical" runat="server" name="appmodaltab3SelectSeniorMechanical" class="form-control input-sm" lang="mn">
							                                <option value="">- Сонго -</option>
						                                </select>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label class="control-label font-sm" lang="mn">Үйлчилгээний зөвлөх</label>
                                                        <select id="appmodaltab3SelectServiceConsultant" runat="server" name="appmodaltab3SelectServiceConsultant" class="form-control input-sm" lang="mn">
							                                <option value="">- Сонго -</option>
						                                </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
			                                <div class="form-group">
                                                <div class="row" style="border-top: 1px solid #ddd;">
                                                    <div class="col-sm-12">
                                                        <label class="control-label font-sm" lang="mn">Засварын үр дүн</label>
                                                        <textarea id="appmodaltab3InputServicememo" class="form-control" rows="3" placeholder="Засварын үр дүн" lang="mn"></textarea>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 10px;">
                                                    <div class="col-sm-12 text-right">
                                                        <a id="appmodaltab3ButtonServiceMemoSave" class="btn btn-primary pull-right" href="javascript:void(0);"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Засварын үр дүн хадгалах</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
						    </div>
                            <div class="tab-pane fade in" id="calendarAppointmentModalTabsContent4">
                                <div id="loaderCalendarTab4" class="loader-background" style="margin:0;">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
                                <div class="widget-body-toolbar bg-color-white no-margin">
                                    <form id="appmodaltab4Form">
                                        <fieldset>
			                                <div class="form-group">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                        <div class="row">
                                                            <div class="col-sm-2 text-left font-sm" style="padding: 5px 0 0 8px;">Төрөл:</div>
                                                            <div class="col-sm-10 no-padding">
                                                                <select id="appmodaltab4SelectPartType" name="appmodaltab4SelectPartType" runat="server" class="form-control input-sm" style="padding:1px;">
                                                                    <option value="">- Бүгд -</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div id="appmodaltab4PartListDiv" runat="server" class="col-sm-12 custom-scroll animated fast fadeInDown no-padding font-sm" style="height:209px; overflow-x: hidden;">
                                        
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="appmodaltab4AppointmentPartListDiv" runat="server" class="col-xs-12 col-sm-12 col-md-8 col-lg-8 custom-scroll animated fast fadeInRight font-sm" style="height:240px; overflow-x: hidden; padding: 0 0 0 5px;">
                                
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade in" id="calendarAppointmentModalTabsContent5">
                                <div id="loaderCalendarTab5" class="loader-background" style="margin:0;">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <form id="appmodaltab5Form" class="smart-form">
                                                <%--<div class="row">
                                                    <label class="control-label col-md-3" for="prepend">Хямдрал</label>
                                                    <div class="col-md-9">
                                                        <div class="input-group input-xs">
													        <span class="input-group-addon">₮</span>
													        <input id="appmodaltab5InputDiscount" name="appmodaltab5InputDiscount" class="form-control" type="text" maxlength="7" style="text-align:right;">
												        </div>
                                                    </div>
                                                </div>--%>
                                                <div class="row" style="margin-bottom:5px;">
                                                    <label class="control-label col col-3" for="prepend">Ажлын хөлс</label>
                                                    <div class="col-md-9">
                                                        <div class="input-group input-xs no-padding">
													        <span class="input-group-addon">₮</span>
                                                            <label class="input">
													            <input id="appmodaltab5InputWage" name="appmodaltab5InputWage" type="text" maxlength="8" style="text-align:right;">
                                                            </label>
												        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="control-label col col-3" for="prepend">Төлбөр төлсөн</label>
                                                    <div class="col-md-9">
                                                        <div class="input-group input-xs no-padding">
													        <span class="input-group-addon">₮</span>
                                                            <label class="input">
													            <input id="appmodaltab5InputPaid" name="appmodaltab5InputPaid" type="text" maxlength="8" style="text-align:right;">
                                                            </label>
												        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top:10px;">
                                                    <div class="col-md-12">
                                                        <button id="appmodaltab5ButtonSave" type="submit" class="btn btn-primary btn-xs pull-right"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <table class="table table-bordered font-xs">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center">Төлбөрийн ангилал</th>
                                                        <th class="text-center">Дүн /төг/</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th>Нийт төлбөр</th>
                                                        <th id="appmodaltab5ValTotalPrice" class="text-right">0</th>
                                                    </tr>
                                                    <tr>
                                                        <td>Ажлын хөлс</td>
                                                        <td id="appmodaltab5ValWage" class="text-right">0</td>
                                                    </tr>
                                                    <%--<tr>
                                                        <td>Хөнглөлт</td>
                                                        <td id="appmodaltab5ValDiscount" class="text-right">0</td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td>Өмнөх үлдэгдэл</td>
                                                        <td id="appmodaltab5ValUldegdel" class="text-right">0</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Төлөх дүн</th>
                                                        <th id="appmodaltab5ValTuluhDun" class="text-right">0</th>
                                                    </tr>
                                                    <tr>
                                                        <td>Төлсөн дүн</td>
                                                        <td id="appmodaltab5ValTulsunDun" class="text-right">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Төлөгдөөгүй дүн</td>
                                                        <td id="appmodaltab5ValTulugduuguiDun" class="text-right">0</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
				                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
		    </div>
        </div>
	</div>
</div>
<div id="appmodaltab3AddServiceModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="z-index:1051;">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
			    <button id="appmodaltab3AddServiceModalClose" type="button" class="close" data-dismiss="modal">×</button>
			    <h4 class="modal-title">Засвар үйлчилгээ нэмэх</h4>
		    </div>
            <div class="modal-body no-padding">
                <form id="appmodaltab3AddServiceModalForm" class="smart-form">
                    <div id="appmodaltab3ServiceID" class="hide"></div>
                    <fieldset>
						<section id="appmodaltab3AddServiceModalDivService"></section>
                    </fieldset>
                    <fieldset>
						<section class="col col-3">
                            <label class="label">*Тоо</label>
                            <%--<label class="input">--%>
                                <input class="form-control spinner spinner-both" id="appmodaltab3AddServiceModalInputCnt" name="appmodaltab3AddServiceModalInputCnt" value="1" style="height:18px;">
                            <%--</label>--%>
                        </section>
                        <section class="col col-9">
                            <label class="label">Тайлбар</label>
                            <label class="input">
                                <input id="appmodaltab3AddServiceModalInputDescription" name="appmodaltab3AddServiceModalInputDescription" type="text" placeholder="Тайлбар" lang="mn"/>
                            </label>
                        </section>
                    </fieldset>
                    <footer>
			            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
			            <button id="appmodaltab3AddServiceModalCancel" type="button" class="btn btn-default">Болих</button>
		            </footer>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="appmodaltab4AddPartModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="z-index:1051;">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
			    <button id="appmodaltab4AddPartModalClose" type="button" class="close" data-dismiss="modal">×</button>
			    <h4 class="modal-title">Солигдох сэлбэг нэмэх</h4>
		    </div>
            <div class="modal-body no-padding">
                <form id="appmodaltab4AddPartModalForm" class="smart-form">
                    <div id="appmodaltab4PartID" class="hide"></div>
                    <fieldset>
						<section id="appmodaltab4AddPartModalDivPart"></section>
                    </fieldset>
                    <fieldset>
						<section class="col col-3">
                            <label class="label">*Тоо</label>
                            <input class="form-control spinner spinner-both" id="appmodaltab4AddPartModalInputCnt" name="appmodaltab4AddPartModalInputCnt" value="1" style="height:18px;">
                        </section>
                        <section class="col col-9">
                            <label class="label">Тайлбар</label>
                            <label class="input">
                                <input id="appmodaltab4AddPartModalInputDescription" name="appmodaltab4AddPartModalInputDescription" type="text" placeholder="Тайлбар" lang="mn"/>
                            </label>
                        </section>
                    </fieldset>
		            <footer>
			            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
			            <button id="appmodaltab4AddPartModalCancel" type="button" class="btn btn-default">Болих</button>
		            </footer>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="calendarservicemodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="z-index:1051;">
	<div class="modal-dialog modal-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group pull-right">
                    <a href="javascript:void(0);" class="btn btn-default" data-dismiss="modal" aria-hidden="true" rel="tooltip" data-placement="top" data-original-title="Хаах">x</a>
                </div>
                <div class="btn-group pull-right">
		            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#calendarservicemodaldiv')"><i class="fa fa-print"></i></a>
	            </div>
            </div>
        </div>
        <div class="modal-content">

        </div>
    </div>
</div>
<div id="calendardocumentmodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="z-index:1051;">
	<div class="modal-dialog modal-lg" <%--style="width:210mm;"--%>>
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group pull-right">
                    <a href="javascript:void(0);" class="btn btn-default" data-dismiss="modal" aria-hidden="true" rel="tooltip" data-placement="top" data-original-title="Хаах">x</a>
                </div>
                <div class="btn-group pull-right">
		            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#calendardocumentmodaldiv')"><i class="fa fa-print"></i></a>
	            </div>
            </div>
        </div>
        <div class="modal-content">

        </div>
    </div>
</div>
<div id="calendarappdocumentmodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="z-index:1051;">
	<div class="modal-dialog modal-lg" <%--style="width:210mm;"--%>>
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group pull-right">
                    <a href="javascript:void(0);" class="btn btn-default" data-dismiss="modal" aria-hidden="true" rel="tooltip" data-placement="top" data-original-title="Хаах">x</a>
                </div>
                <div class="btn-group pull-right">
		            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#calendarappdocumentmodaldiv')"><i class="fa fa-print"></i></a>
	            </div>
            </div>
        </div>
        <div class="modal-content">

        </div>
    </div>
</div>
<div id="calendarActiveMechanicModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <span class="modal-title" lang="mn">Ирц оруулах</span>
                <span id="calendarActiveMechanicModalDate" class="text-primary" style="padding-right:10px; font-style:italic; font-weight:bold;">0000-00-00</span>
		    </div>
            <div class="modal-body no-padding">
                <form id="calendarActiveMechanicModalForm" class="smart-form">
                    <fieldset>
                        <section id="calendarActiveMechanicModalDivStaffList" runat="server"></section>
                    </fieldset>
                    <footer>
			            <button type="submit" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
			            <button type="button" class="btn btn-default btn-xs" data-dismiss="modal" lang="mn">Болих</button>
		            </footer>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="appmodalCalendarAppType5DescriptionModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="z-index:1051;">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal">×</button>
			    <h4 class="modal-title"><span lang="mn">Захиалга цуцлагдсан тайлбар</span>&nbsp;<span id="appmodalCalendarAppType5DescriptionModalHeaderLabel" lang="mn"></span></h4>
		    </div>
            <div class="modal-body no-padding">
                <form id="appmodalCalendarAppType5DescriptionModalForm" class="smart-form">
                    <div id="appmodalCalendarAppType5DescriptionModalIsSetAppType5" class="hide"></div>
                    <fieldset>
						<section>
                            <label class="label">*Тайлбар</label>
                            <label class="textarea">
                                <textarea id="appmodalCalendarAppType5DescriptionModalTextareaDesc" name="appmodalCalendarAppType5DescriptionModalTextareaDesc" rows="5" placeholder="Тайлбар"></textarea>
                            </label>
                        </section>
                    </fieldset>
		            <footer>
			            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
			            <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
		            </footer>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- end row -->

<script type="text/javascript" src="../js/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
<%--<script src="/Scripts/jquery.signalR-2.0.0.js"></script>
<script src="/signalr/hubs"></script>--%>
<script type="text/javascript">
    //var chat = $.connection.appHub;
    //$(function () {
    //    chat.client.broadcastMessage = function (sessionid) {
    //        if ($.trim($('#indexSessionID').html()) != sessionid) {
    //            //reloadCalendar();
    //            $('#calendar1').fullCalendar('refetchEvents');
    //        }
    //    };
    //});

    pageSetUp();
    var globalAjaxVar = null;
    var calendarSource = '';
    var pagefunction = function () {
        //$.get('../files/registeredmarkno.txt', function (txtFile) {
        //    var mymark = txtFile.split("\n");
        //    $("#calendarInputAutono").autocomplete({
        //        source: mymark,
        //        select: function (a, b) {
        //            $("#calendarInputAutono").change();
        //        }
        //    });
        //    $("#calendarInputAutono").autocomplete("option", "appendTo", "#calendarInsertForm");
        //    $("#calendarSwapPatientInputAutoNoFilter").autocomplete({
        //        source: mymark
        //    });
        //    $("#calendarSwapPatientInputAutoNoFilter").autocomplete("option", "appendTo", "#calendarSwapPatientForm");
        //});
        $("#calendarInputAutono").autocomplete({
            source: function (request, response) {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/AutonoAutocomplete",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '", "autono":"' + $.trim($("#calendarInputAutono").val()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var values = [];
                        $($.parseJSON(data.d)).each(function (index, value) {
                            values.push(value.AUTONO);
                        });
                        response(values);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            },
            select: function (a, b) {
                $("#calendarInputAutono").change();
            }
        });
        $("#calendarInputAutono").autocomplete("option", "appendTo", "#calendarInsertForm");

        var currdate = new Date();
        $('#calendarInsertDate').text(replace2Char(currdate.getFullYear()) + '-' + replace2Char((currdate.getMonth() + 1)) + '-' + replace2Char(currdate.getDate()));
        bindTimeList();
        if ($('#calendarBlockHeaderListDiv').find('ul').html() == '') {
            alert('Заал болон хаалганы тохиргоо оруулна уу!');
            $(location).attr('href', '#pg/setup.aspx');
        }
        else {
            bindCalendar();
            drawActiveWorkedMechanic();
        }
        $('#calendarAppointmentModalSelectRoom').html($('#calendarAppointmentModalSelectRoom').html().replace('<option value="">- Заал сонго -</option>', ''));

        var vartime = '', hr = '', mnt = '';
        setInterval(function () {
            if ($.trim($('#currentdatetime').text()).substring(0, 10) == $('#calendarInsertDate').text()) {
                $(".fc-timeline-event.fc-h-event.fc-event.fc-start.fc-end.event.bg-color-orange.fc-draggable.fc-resizable").toggleClass("bg-color-orangeDark").toggleClass("font-bold");
                $(".fc-timeline-event.fc-h-event.fc-event.fc-start.fc-end.event.bg-color-pink.fc-draggable.fc-resizable").toggleClass("bg-color-magenta").toggleClass("font-bold");

                var currDate1 = new Date();
                //var currDateyyyy = currDate1.getFullYear().toString();
                //var currDatemm = (currDate1.getMonth() + 1).toString(); // getMonth() is zero-based
                //var currDatedd = currDate1.getDate().toString();
                //var currDateMyFormat = currDateyyyy+'-' + (currDatemm[1] ? currDatemm : "0" + currDatemm[0])+'-' + (currDatedd[1] ? currDatedd : "0" + currDatedd[0]);

                var myMinutes = '';
                if ($('#calendarSettings').html().split('~')[2] == '15') {
                    if (currDate1.getMinutes() < 16) { myMinutes = '00'; }
                    else if (currDate1.getMinutes() > 15 && currDate1.getMinutes() < 31) { myMinutes = '15'; }
                    else if (currDate1.getMinutes() > 30 && currDate1.getMinutes() < 46) { myMinutes = '30'; }
                    else if (currDate1.getMinutes() > 45) { myMinutes = '45'; }
                }
                else if ($('#calendarSettings').html().split('~')[2] == '20') {
                    if (currDate1.getMinutes() < 21) { myMinutes = '00'; }
                    else if (currDate1.getMinutes() > 20 && currDate1.getMinutes() < 41) { myMinutes = '20'; }
                    else if (currDate1.getMinutes() > 40) { myMinutes = '40'; }
                }
                else if ($('#calendarSettings').html().split('~')[2] == '30') {
                    if (currDate1.getMinutes() < 31) { myMinutes = '00'; }
                    else if (currDate1.getMinutes() > 30) { myMinutes = '30'; }
                }
                else if ($('#calendarSettings').html().split('~')[2] == '60') {
                    myMinutes = '00';
                }
                $('[data-date="' + $('#calendarInsertDate').text() + 'T' + currDate1.getHours() + ':' + myMinutes + ':00"]').toggleClass('fc-today');

                //if (currDateMyFormat == $('#calendarInsertDate').text()) {
                //    var valEvent = $(".fc-timeline-event.fc-h-event.fc-event.fc-start.fc-end.event.bg-color-blueDark.fc-draggable.fc-resizable");
                //    var valEventTimeHour = valEvent.find('.fc-title').attr('data-start').split('T')[1].split(':')[0];
                //    var valEventTimeMin = valEvent.find('.fc-title').attr('data-start').split('T')[1].split(':')[1];
                //    var valEventTimeSec = valEvent.find('.fc-title').attr('data-start').split('T')[1].split(':')[2];
                //    var valEventDate = new Date($('#calendarInsertDate').text().split('-')[0], ($('#calendarInsertDate').text().split('-')[1] - 1), $('#calendarInsertDate').text().split('-')[2], valEventTimeHour, valEventTimeMin, valEventTimeSec);
                //    if (currDate1 >= valEventDate) {
                //        valEvent.toggleClass("bg-color-darken");
                //    }
                //}
                
            }
        }, 700)

        $('.fc-right, .fc-center').hide();
        $('#calendar-buttons #btn-prev').click(function () {
            $('.fc-prev-button').click();
            //var view = $('#calendar1').fullCalendar('getView');
            //reloadCalendar();
            date = $("#calendar1").fullCalendar('getDate');
            $('#calendarInsertDate').html(date.format());
            drawActiveWorkedMechanic();
            return false;
        });
        $('#calendar-buttons #btn-next').click(function () {
            $('.fc-next-button').click();
            //var view = $('#calendar1').fullCalendar('getView');
            //reloadCalendar();
            date = $("#calendar1").fullCalendar('getDate');
            $('#calendarInsertDate').html(date.format());
            drawActiveWorkedMechanic();
            return false;
        });
        $('#calendar-buttons #btn-today').click(function () {
            $('.fc-today-button').click();
            $('#calendarInsertDate').text(replace2Char(currdate.getFullYear()) + '-' + replace2Char((currdate.getMonth() + 1)) + '-' + replace2Char(currdate.getDate()));
            //reloadCalendar();
            //$('#calendar1').fullCalendar('refetchEvents');
            drawActiveWorkedMechanic();
            return false;
        });
        $('#mt').click(function () {
            $('#calendar1').fullCalendar('changeView', 'month');
            $('#appCurrentView').val('month');
            $('#calendar1').fullCalendar('refetchEvents');
            //reloadCalendar();
        });
        $('#ag').click(function () {
            $('#calendar1').fullCalendar('changeView', 'agendaWeek');
            $('#appCurrentView').val('agendaWeek');
            $('#calendar1').fullCalendar('refetchEvents');
            //reloadCalendar();
        });
        $('#td').click(function () {
            $('#calendar1').fullCalendar('changeView', 'timelineDay');
            $('#appCurrentView').val('timelineDay');
            var view = $('#calendar1').fullCalendar('getView');
            $('#calendarInsertDate').text(view.start.format().split('T')[0]);
            //reloadCalendar();
            $('#calendar1').fullCalendar('refetchEvents');
            drawActiveWorkedMechanic();
        });
        $("[rel=tooltip]").tooltip();
        $("[rel=popover]").popover();
        $("[rel=popover-hover]").popover({ trigger: "hover" });
        $("#appmodaltab3AddServiceModalInputCnt, #appmodaltab4AddPartModalInputCnt").spinner({
            min: 1,
            max: 50,
            step: 1,
            start: 1000,
            numberFormat: "C"
        });
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();

    function bindTimeList() {
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/CalendarAppointmentTimeListForDLL",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = data.d;
                $('#calendarSelectStartTime').html('<option value="" lang="mn">- Сонго -</option>' + valData);
                $('#calendarSelectEndTime').html('<option value="" lang="mn">- Сонго -</option>' + valData);
                $('#calendarAppointmentModalSelectStartTime').html(valData);
                $('#calendarAppointmentModalSelectEndTime').html(valData);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function bindCalendar() {
        $('#calendar1').html('');
        calendarSource = '/pg/calendarjson.aspx?tp=timelineDay&dtbegin=' + $('#calendarInsertDate').text() + '&dtend=' + $('#calendarInsertDate').text() + '&room=' + $('#calendarCurrentRoomId').text();
        var valStartTime = $('#calendarSettings').text().split('~')[0];
        var valEndTime = $('#calendarSettings').text().split('~')[1];
        var valTimeInterval = $('#calendarSettings').text().split('~')[2];
        var valNowDate=$.trim($('#calendarInsertDate').text());
        var hdr = {
            left: 'title',
            center: 'timelineDay,agendaWeek,month',
            right: 'prev,today,next'
        };
        $('#calendar1').fullCalendar({
            now: valNowDate,
            header: hdr,
            defaultView: 'timelineDay',
            buttons: false,
            axisFormat: 'HH:mm',
            timeFormat: {
                agenda: 'HH:mm'
            },
            slotDuration: '00:' + valTimeInterval + ':00',
            minTime: valStartTime + ':00',
            maxTime: valEndTime + ':00',
            editable: {
                month: false,
                agendaWeek: false,
                timelineDay: true
            },
            droppable: {
                month: false,
                agendaWeek: false,
                timelineDay: true
            },
            selectable: {
                month: false,
                agendaWeek: false,
                timelineDay: true
            },
            aspectRatio: 2.0,
            //views: {
            //    timelineThreeDays: {
            //        type: 'timeline',
            //        duration: { days: 7 }
            //    }
            //},
            allDaySlot:false,
            resourceAreaWidth: '7%',
            resourceLabelText: 'Өргөгч',
            resources: JSON.parse($('#calendarCurrentRoomChiarNumArr').html()),
            //events: calendarSource,
            events: {
                url: '/pg/calendarjson.aspx',
                data: function () { 
                    return {
                        tp: $('#appCurrentView').val(),
                        dtbegin: $('#calendarInsertDate').text(),
                        dtend: $('#calendarInsertDate').text(),
                        room: $('#calendarCurrentRoomId').text()
                    };

                }
            },
            eventRender: function (event, element, icon) {
                if (event.apptype == "0") {
                    element.find('.fc-content').append('<i class="air air-top-right fa fa-phone" style="padding-right: 1px;"></i>');
                }
                //    element.find('.fc-title').attr('data-start', event.start.format());
                //    element.find('.fc-title').attr('data-end', event.end.format());
                if (event.extend_per != "0") {
                    element.find('.fc-content').append('<span class="air air-top-right" style="width: ' + event.extend_per + '%; background: rgba(255,255,255,.3)!important; height: 100%;"></span>');
                }
            },
            windowResize: function (event, ui) {
                $('#calendar').fullCalendar('render');
            },
            select: function (start, end, jsEvent, view, resourceId) {
                //if (JSON.parse($('#calendarCurrentRoomChiarNumArr').html()).length >= parseInt($.trim($('#applmtnm').val()))) {
                    //alert($.trim($('#applmtmsg').val()));
                //}
                //else {
                    if (!funcIsRole('1,2')) {
                        alert('Таньд захиалга бүртгэх эрх байхгүй байна!');
                    }
                    else {
                        $('input[name=calendarInputAppointmenttype]').prop('checked', false);
                        $('#calendarAppointmentInsertModal #calendarSelectStartTime').val(start.format().split('T')[1].substring(0, 5));
                        $('#calendarAppointmentInsertModal #calendarSelectEndTime').val(end.format().split('T')[1].substring(0, 5));
                        $('#calendarAppointmentInsertModal #calendarSelectRoom').val($('#calendarCurrentRoomId').text());
                        $('#calendarBlockHeaderListDiv').find('ul > li').each(function (index) {
                            if ($('a', this).attr('data-roomid') == $('#calendarCurrentRoomId').text()) {
                                $('#calendarSelectChair').html('<option value="">- Сонго -</option>');
                                for (var i = 1; i <= parseInt($('a', this).text().split('(')[1].split(')')[0]) ; i++) $('#calendarSelectChair').append('<option>' + i.toString() + '</option>');
                            }
                        });
                        $('#calendarSelectChair').val((parseInt($('.fc-highlight').closest('tr').index()) + 1));
                        $('#calendarAppointmentInsertModal #calendarSelectStartTime').prop('disabled', true);
                        $('#calendarAppointmentInsertModal #calendarSelectEndTime').prop('disabled', true);
                        $('#calendarAppointmentInsertModal #calendarSelectRoom').prop('disabled', true);
                        $('#calendarSelectChair').prop('disabled', true);
                        $('#patientID').html('');
                        $('#calendarInputAutono').val('');
                        if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val('');
                        else {
                            $('#calendarSelectAutomarkType').val('');
                            $('#calendarSelectAutomark').val('');
                            $('#calendarSelectAutomark').prop('disabled',true);
                        }
                        $('#calendarSelectAutoYear').val('');
                        $('input[name=calendarInputFueltype]').prop('checked', false);
                        $('input[name=calendarInputTransmission]').prop('checked', false);
                        $('#calendarInputVinno').val('');
                        $('input[name=calendarInputZaaltType]').prop('checked', false);
                        $('#calendarInputKmzaalt').val('');
                        $('#calendarInputIsMySold').prop('checked', false);
                        $('#calendarInputOwnername').val('');
                        $('#calendarInputTel').val('');
                        $('#calendarInputTel2').val('');
                        $('input[name=calendarInputType]').prop('checked', false);
                        $('#calendarInputAddress').val('');
                        //$('#calendarInputTelEmergency').val('');
                        //$('input[name=calendarInputTelEmergencyType]').prop('checked', false);
                        //$('#calendarInputTelEmergencyPersonname').val('');
                        $('input[name=calendarInputRequest]').prop('checked', false);
                        $('#calendarInputMemo').val('');
                        //$('input[name=calendarInputWashCar]').prop('checked', false);
                        //$('input[name=calendarInputGetPart]').prop('checked', false);
                        $('#calendarSelectSubmitStaff').val('');
                        $('input[name=calendarInputDiscount]').prop('checked', false);
                        $('#calendarBtnSave').prop('disabled', false);
                        $('#calendarAppointmentInsertModal').modal('show');
                    }
                //}
            },
            eventClick: function (event, jsEvent) {
                var valData = '';
                $('#appointmentID').text(event.appointmentid);
                $('#calendarAppointmentModalAppointmentType1').removeAttr('checked');
                $('#calendarAppointmentModalAppointmentType2').removeAttr('checked');
                $('#calendarAppointmentModalAppointmentType3').removeAttr('checked');
                $('#calendarAppointmentModalAppointmentType4').removeAttr('checked');
                $('#calendarAppointmentModalAppointmentType5').removeAttr('checked');
                $('#calendarAppointmentModalAppointmentType1').parent().removeClass("active");
                $('#calendarAppointmentModalAppointmentType2').parent().removeClass("active");
                $('#calendarAppointmentModalAppointmentType3').parent().removeClass("active");
                $('#calendarAppointmentModalAppointmentType4').parent().removeClass("active");
                $('#calendarAppointmentModalAppointmentType5').parent().removeClass("active");
                $('#calendarAppointmentModalAppointmentType' + event.appointmenttype).prop('checked', true);
                $('#calendarAppointmentModalAppointmentType' + event.appointmenttype).parent().addClass("active");

                $('input[name=calendarAppointmentModalAppointmenttype]').prop('checked', false);
                if (event.apptype == '1') $('#calendarAppointmentModalAppointmenttype1').prop('checked', true);
                else if (event.apptype == '0') $('#calendarAppointmentModalAppointmenttype2').prop('checked', true);
                $('#calendarAppointmentModalInputDate').val(event.start.format().split('T')[0]);
                $('#calendarAppointmentModalSelectStartTime').val(event.start.format().split('T')[1].substring(0, 5));
                $('#calendarAppointmentModalSelectEndTime').val(event.end.format().split('T')[1].substring(0, 5));
                $('#calendarAppointmentModalSelectRoom').val($('#calendarCurrentRoomId').text());
                $('#calendarBlockHeaderListDiv').find('ul > li').each(function (index) {
                    if ($('a', this).attr('data-roomid') == $('#calendarAppointmentModalSelectRoom option:selected').val()) {
                        $('#calendarAppointmentModalSelectChair').html('<option value="">- Сонго -</option>');
                        for (var i = 1; i <= parseInt($('a', this).text().split('(')[1].split(')')[0]) ; i++) $('#calendarAppointmentModalSelectChair').append('<option>' + i.toString() + '</option>');
                        $('#calendarAppointmentModalSelectChair').val(event.resourceId);
                    }
                });

                //$('#calendarAppointmentModalTabsContent').load('../pg/appmodal/' + $('#calendarAppointmentModalTabs').find('ul').find('li.active').attr('data-pgname') + '.aspx?appid=' + $('#appointmentID').text());
                $('input[name=calendarAppointmentModalInputRequest]').prop('checked', false);
                showLoader('loaderCalendarTab1');
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteScalar",
                    data: '{"qry":"SELECT b.LISTDATA+\'~\'+ISNULL(a.REQUESTMEMO,\'\')+\'~\'+ISNULL(CAST(a.MILEAGE as NVARCHAR(18)),\'\') FROM TBL_APPOINTMENT a INNER JOIN( select APPOINTMENT_ID, stuff( ( select \',\'+ CAST(REQUESTTYPE_ID as varchar) from TBL_APPOINTMENT_REQUESTTYPE where APPOINTMENT_ID = t.APPOINTMENT_ID for XML path(\'\') ),1,1,\'\') as LISTDATA from ( SELECT DISTINCT APPOINTMENT_ID FROM TBL_APPOINTMENT_REQUESTTYPE WHERE APPOINTMENT_ID=' + event.appointmentid + ' )t ) b ON a.ID=b.APPOINTMENT_ID WHERE a.ID=' + event.appointmentid + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        for (var i = 0; i < msg.d.split('~')[0].split(',').length; i++) {
                            $('#calendarAppointmentModalInputRequest' + msg.d.split('~')[0].split(',')[i]).prop('checked',true);
                        }
                        $('#calendarAppointmentModalInputAppointmentMemo').val(replaceDatabaseToDisplay(msg.d.split('~')[1]).replace(/<br>/g, '\n'));
                        $('#patientModalInputKmzaalt').val(msg.d.split('~')[2]);

                        //showLoader('loaderCalendarTab1');
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteScalar",
                            data: '{"qry":"SELECT ISNULL(CAST(ID as VARCHAR),\'\')+\'~\'+ISNULL(CODE,\'\')+\'~\'+ISNULL(NAME,\'\')+\'~\'+ISNULL(CAST(TYPE as VARCHAR),\'\')+\'~\'+ISNULL(TEL,\'\')+\'~\'+ISNULL(TEL2,\'\')+\'~\'+ISNULL(EMAIL,\'\')+\'~\'+ISNULL(ADDRESS,\'\')+\'~\'+ISNULL(CAST(MARK_ID as VARCHAR),\'\')+\'~\'+ISNULL(CAST(PRODUCEDYEAR as VARCHAR),\'\')+\'~\'+ISNULL(AUTONO,\'\')+\'~\'+ISNULL(VINNO,\'\')+\'~\'+ISNULL(CAST(FUELTYPE as VARCHAR),\'\')+\'~\'+ISNULL(CAST(TRANSMISSIONTYPE as VARCHAR),\'\')+\'~\'+ISNULL(CAST(EMERGENCYTEL as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYTELTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYPERSONNAME as varchar),\'\')+\'~\'+ISNULL(CAST(ZAALTTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(ISMYSOLD as varchar),\'\')+\'~\'+ISNULL(CAST(PATIENTDISCOUNT_ID as varchar),\'\') FROM TBL_PATIENT WHERE ID=(SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID=' + event.appointmentid + ')"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                $('#appmodaltab1PatientID').html(msg.d.split('~')[0]);
                                $('#patientModalInputCode').val(msg.d.split('~')[1]);
                                $('#patientModalInputOwnername').val(msg.d.split('~')[2]);
                                $('input[name=patientModalInputType]').prop('checked', false);
                                if (msg.d.split('~')[3] == '1') $('#patientModalInputType1').prop('checked', true);
                                else if (msg.d.split('~')[3] == '0') $('#patientModalInputType2').prop('checked', true);
                                $('#patientModalInputTel').val(msg.d.split('~')[4]);
                                $('#patientModalInputTel2').val(msg.d.split('~')[5]);
                                $('#patientModalInputEmail').val(msg.d.split('~')[6]);
                                $('#patientModalInputAddress').val(msg.d.split('~')[7]);
                                var valAutomarkId = msg.d.split('~')[8];
                                $('#patientModalSelectAutomarkType').prop('disabled', false);
                                if ($('#patientModalSelectAutomarkType').is(':disabled')) {
                                    $('#patientModalSelectAutomark').val(valAutomarkId);
                                    setEditable_Appointment(event.end.format());
                                }
                                else {
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "../wcf/ServiceMain.svc/ExecuteScalar",
                                        data: '{"qry":"SELECT AUTOMARK_TYPE_ID FROM TBL_AUTOMARK WHERE ID = ' + valAutomarkId + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (msg) {
                                            $('#patientModalSelectAutomarkType').val(msg.d);
                                            globalAjaxVar = $.ajax({
                                                type: "POST",
                                                url: "../wcf/ServiceMain.svc/CalendarAutomarkListForDDL",
                                                data: '{"automarktype":"' + $('#patientModalSelectAutomarkType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (data) {
                                                    valData = '';
                                                    $($.parseJSON(data.d)).each(function (index, value) {
                                                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                                                    });
                                                    $('#patientModalSelectAutomark').html('<option value="" lang="mn">- Сонго -</option>' + valData);
                                                    $('#patientModalSelectAutomark').val(valAutomarkId);
                                                    $('#patientModalSelectAutomark').prop('disabled', false);
                                                    setEditable_Appointment(event.end.format());
                                                },
                                                failure: function (response) {
                                                    alert('FAILURE: ' + response.d);
                                                },
                                                error: function (xhr, status, error) {
                                                    window.location = '../#pg/error500.aspx';
                                                }
                                            });
                                        },
                                        failure: function (response) {
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                }
                                $('#patientModalSelectAutoYear').val(msg.d.split('~')[9]);
                                $('#patientModalInputAutono').val(msg.d.split('~')[10]);
                                $('#patientModalInputVinno').val(msg.d.split('~')[11]);
                                $('input[name=patientModalInputZaaltType]').prop('checked', false);
                                if (msg.d.split('~')[17] == '1') $('#patientModalInputZaaltType1').prop('checked', true);
                                else if (msg.d.split('~')[17] == '2') $('#patientModalInputZaaltType2').prop('checked', true);
                                $('input[name=patientModalInputFueltype]').prop('checked', false);
                                if (msg.d.split('~')[12] == '1') $('#patientModalInputFueltype1').prop('checked', true);
                                else if (msg.d.split('~')[12] == '0') $('#patientModalInputFueltype2').prop('checked', true);
                                $('input[name=patientModalInputTransmission]').prop('checked', false);
                                if (msg.d.split('~')[13] == '1') $('#patientModalInputTransmission1').prop('checked', true);
                                else if (msg.d.split('~')[13] == '0') $('#patientModalInputTransmission2').prop('checked', true);
                                //$('#patientModalInputTelEmergency').val(msg.d.split('~')[14]);
                                //$('input[name="patientModalInputTelEmergencyType"]').prop('checked', false);
                                //if (msg.d.split('~')[15] == '1') $('#patientModalInputTelEmergencyType1').prop('checked', true);
                                //else if (msg.d.split('~')[15] == '2') $('#patientModalInputTelEmergencyType2').prop('checked', true);
                                //else if (msg.d.split('~')[15] == '3') $('#patientModalInputTelEmergencyType3').prop('checked', true);
                                //$('#patientModalInputTelEmergencyPersonname').val(msg.d.split('~')[16]);
                                $('input[name=patientModalInputIsMySold]').prop('checked', false);
                                if (msg.d.split('~')[18] == '1') $('#patientModalInputIsMySold').prop('checked', true);
                                $('input[name=patientModalInputDiscount]').prop('checked', false);
                                if (msg.d.split('~')[19] != '') $('#patientModalInputDiscount' + msg.d.split('~')[19]).prop('checked', true);
                                hideLoader('loaderCalendarTab1');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
    
                showLoader('loaderCalendarTab2');
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteScalar",
                    data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT_DIAGNOSTIC a INNER JOIN( select APPOINTMENT_ID, stuff( ( select \',\'+ CAST(DIAGNOSTICTYPE_ID as varchar) from TBL_APPOINTMENT_DIAGNOSTICTYPE where APPOINTMENT_ID = t.APPOINTMENT_ID for XML path(\'\') ),1,1,\'\') as LISTDATA from ( SELECT DISTINCT APPOINTMENT_ID FROM TBL_APPOINTMENT_DIAGNOSTICTYPE WHERE APPOINTMENT_ID=' + event.appointmentid + ' )t ) b ON a.APPOINTMENT_ID=b.APPOINTMENT_ID WHERE a.APPOINTMENT_ID=' + event.appointmentid + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == '0') {
                            $('input[name=appmodaltab2CheckDiagnostic]').prop('checked', false);
                            $('#appmodaltab2InputDescription').val('');
                            $('#appmodaltab2SelectSeniorMechanical').val('');
                            $('#appmodaltab2SelectMechanical').val('');
                            $('#appmodaltab2SelectServiceConsultant').val('');
                            setEditable_Diagnostic(event.end.format());
                            hideLoader('loaderCalendarTab2');
                        }
                        else {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                                data: '{"qry":"SELECT ISNULL(CAST(b.LISTDATA as VARCHAR),\'\')+\'~\'+ISNULL(CAST(a.DESCRIPTION as NVARCHAR(2000)),\'\')+\'~\'+ISNULL(CAST(a.SENIORMECHANICAL_STAFFID as VARCHAR),\'\')+\'~\'+ISNULL(CAST(a.SERVICECONSULTANT_STAFFID as VARCHAR),\'\')+\'~\'+ISNULL(CAST(a.MECHANICAL_STAFFID as VARCHAR),\'\') FROM TBL_APPOINTMENT_DIAGNOSTIC a INNER JOIN( select APPOINTMENT_ID, stuff( ( select \',\'+ CAST(DIAGNOSTICTYPE_ID as varchar) from TBL_APPOINTMENT_DIAGNOSTICTYPE where APPOINTMENT_ID = t.APPOINTMENT_ID for XML path(\'\') ),1,1,\'\') as LISTDATA from ( SELECT DISTINCT APPOINTMENT_ID FROM TBL_APPOINTMENT_DIAGNOSTICTYPE WHERE APPOINTMENT_ID=' + event.appointmentid + ' )t ) b ON a.APPOINTMENT_ID=b.APPOINTMENT_ID WHERE a.APPOINTMENT_ID=' + event.appointmentid + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    $('input[name=appmodaltab2CheckDiagnostic]').prop('checked', false);
                                    $('#appmodaltab2InputDescription').val('');
                                    $('#appmodaltab2SelectSeniorMechanical').val('');
                                    $('#appmodaltab2SelectServiceConsultant').val('');
                                    for (var i = 0; i < parseInt(msg.d.split('~')[0].split(',').length) ; i++) $('#appmodaltab2CheckDiagnostic' + msg.d.split('~')[0].split(',')[i]).prop('checked', true);
                                    $('#appmodaltab2InputDescription').val(replaceDatabaseToDisplay(msg.d.split('~')[1]).replace(/<br>/g,'\n'));
                                    $('#appmodaltab2SelectSeniorMechanical').val(msg.d.split('~')[2]);
                                    $('#appmodaltab2SelectServiceConsultant').val(msg.d.split('~')[3]);
                                    $('#appmodaltab2SelectMechanical').val(msg.d.split('~')[4]);
                                    setEditable_Diagnostic(event.end.format());
                                    hideLoader('loaderCalendarTab2');
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    var err = eval("(" + xhr.responseText + ")");
                                    if (err.Message == 'SessionDied') window.location = '../login.html';
                                    else if (err.Message == 'Object reference not set to an instance of an object.') {
                                        $('input[name=appmodaltab2CheckDiagnostic]').prop('checked', false);
                                        $('#appmodaltab2InputDescription').val('');
                                        $('#appmodaltab2SelectSeniorMechanical').val('');
                                        $('#appmodaltab2SelectMechanical').val('');
                                        $('#appmodaltab2SelectServiceConsultant').val('');
                                        setEditable_Diagnostic(event.end.format());
                                        hideLoader('loaderCalendarTab2');
                                    }
                                    else window.location = '../#pg/error500.aspx';
                                }
                            });
                        }
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'Object reference not set to an instance of an object.') {
                            $('input[name=appmodaltab2CheckDiagnostic]').prop('checked', false);
                            $('#appmodaltab2InputDescription').val('');
                            $('#appmodaltab2SelectSeniorMechanical').val('');
                            $('#appmodaltab2SelectMechanical').val('');
                            $('#appmodaltab2SelectServiceConsultant').val('');
                            hideLoader('loaderCalendarTab2');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
                showLoader('loaderCalendarTab3');
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteScalar",
                    data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT_REPAIR WHERE APPOINTMENT_ID=' + event.appointmentid + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == '0') {
                            $('input[name=appmodaltab3CheckRepair]').prop('checked', false);
                            $('#appmodaltab3SelectMechanical').val('');
                            $('#appmodaltab3SelectSeniorMechanical').val('');
                            $('#appmodaltab3SelectServiceConsultant').val('');
                            $('#appmodaltab3InputServicememo').val('');
                            dataBindAppmodaltab3Table2();
                            hideLoader('loaderCalendarTab3');
                        }
                        else {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                                data: '{"qry":"SELECT ISNULL(CAST(REPAIRTYPE_ID as VARCHAR),\'\')+\'~\'+ISNULL(CAST(MECHANICAL_STAFFID as VARCHAR),\'\')+\'~\'+ISNULL(CAST(SENIORMECHANICAL_STAFFID as VARCHAR),\'\')+\'~\'+ISNULL(CAST(SERVICECONSULTANT_STAFFID as VARCHAR),\'\')+\'~\'+ISNULL(CAST(ISADDITIONALREPAIR as VARCHAR),\'\')+\'~\'+ISNULL(CAST(MEMO as NVARCHAR(MAX)),\'\') FROM TBL_APPOINTMENT_REPAIR WHERE APPOINTMENT_ID=' + event.appointmentid + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    $('input[name=appmodaltab3CheckRepair]').prop('checked', false);
                                    $('#appmodaltab3CheckRepair' + msg.d.split('~')[0]).prop('checked', true);
                                    $('#appmodaltab3SelectMechanical').val(msg.d.split('~')[1]);
                                    $('#appmodaltab3SelectSeniorMechanical').val(msg.d.split('~')[2]);
                                    $('#appmodaltab3SelectServiceConsultant').val(msg.d.split('~')[3]);
                                    $('#appmodaltab3InputServicememo').val(replaceDatabaseToDisplay(msg.d.split('~')[5]).replace(/<br>/g, '\n'));
                                    dataBindAppmodaltab3Table2();
                                    hideLoader('loaderCalendarTab3');
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    var err = eval("(" + xhr.responseText + ")");
                                    if (err.Message == 'SessionDied') window.location = '../login.html';
                                    else if (err.Message == 'Object reference not set to an instance of an object.') {
                                        $('input[name=appmodaltab3CheckRepair]').prop('checked', false);
                                        $('#appmodaltab3SelectMechanical').val('');
                                        $('#appmodaltab3SelectSeniorMechanical').val('');
                                        $('#appmodaltab3SelectServiceConsultant').val('');
                                        $('#appmodaltab3InputServicememo').val('');
                                        dataBindAppmodaltab3Table2();
                                        hideLoader('loaderCalendarTab3');
                                    }
                                    else window.location = '../#pg/error500.aspx';
                                }
                            });
                        }
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'Object reference not set to an instance of an object.') {
                            hideLoader('loaderCalendarTab3');                            
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
                
                dataBindAppmodaltab4Table2();
                dataBindAppmodaltab5(event.appointmentid);
                $('#calendarAppointmentModalInvoiceBtn').attr('href', '../pg/calendarservicemodal.aspx?id=' + event.appointmentid);
                $('#calendarAppointmentModalDocumentBtn').attr('href', '../pg/calendardocumentmodal.aspx?id=' + event.appointmentid);
                $('#calendarAppointmentModalAppDocumentBtn').attr('href', '../pg/calendarappdocumentmodal.aspx?id=' + event.appointmentid);

                setEditable_Payment(event.end.format());
                $('#calendarAppointmentModal').modal('show');
            },
            eventDrop: function (event) {
                if (!funcIsRole('1,2')) {
                    alert('Таньд захиалга өөрчлөх эрх байхгүй байна!');
                }
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                        data: '{"qry":"UPDATE TBL_APPOINTMENT SET CHAIRNUM=' + strQryIsNull('varchar', event.resourceId) + ', STARTTIME=' + strQryIsNull('varchar', event.start.format().split('T')[1].substring(0, 5)) + ', ENDTIME=' + strQryIsNull('varchar', event.end.format().split('T')[1].substring(0, 5)) + ', STARTDATETIME=cast(DT+\' \'+' + strQryIsNull('varchar', event.start.format().split('T')[1].substring(0, 5)) + ' as datetime), ENDDATETIME=cast(DT+\' \'+' + strQryIsNull('varchar', event.end.format().split('T')[1].substring(0, 5)) + ' as datetime) WHERE ID=' + event.appointmentid + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            smallBox('Захиалга', 'Амжилттай засагдлаа', '#659265');
                            //$.connection.hub.start().done(function () {
                            //    chat.server.send($.trim($('#indexSessionID').html()));
                            //});
                            drawLunchColumns();
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            },
            eventResize: function (event) {
                if (!funcIsRole('1,2')) {
                    alert('Таньд захиалга өөрчлөх эрх байхгүй байна!');
                }
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                        data: '{"qry":"UPDATE TBL_APPOINTMENT SET STARTTIME=' + strQryIsNull('varchar', event.start.format().split('T')[1].substring(0, 5)) + ', ENDTIME=' + strQryIsNull('varchar', event.end.format().split('T')[1].substring(0, 5)) + ', STARTDATETIME=cast(DT+\' \'+' + strQryIsNull('varchar', event.start.format().split('T')[1].substring(0, 5)) + ' as datetime), ENDDATETIME=cast(DT+\' \'+' + strQryIsNull('varchar', event.end.format().split('T')[1].substring(0, 5)) + ' as datetime) WHERE ID=' + event.appointmentid + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            smallBox('Захиалга', 'Амжилттай засагдлаа', '#659265');
                            //$.connection.hub.start().done(function () {
                            //    chat.server.send($.trim($('#indexSessionID').html()));
                            //});
                            drawLunchColumns();
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            },
            loading: function (bool) {
                if (bool) showLoader('loaderCalendar');
                else hideLoader('loaderCalendar');
            },
            eventAfterAllRender: function (view) {  
                var allevents = $('#calendar1').fullCalendar('clientEvents');
                if (allevents.length != 0) {
                    var cValType1Cnt = 0, cValType2Cnt = 0, cValType3Cnt = 0, cValType4Cnt = 0, cValType5Cnt = 0;
                    for (var i = 0; i < allevents.length; i++) {
                        if (allevents[i].appointmenttype == 1) cValType1Cnt++;
                        else if (allevents[i].appointmenttype == 2) cValType2Cnt++;
                        else if (allevents[i].appointmenttype == 3) cValType3Cnt++;
                        else if (allevents[i].appointmenttype == 4) cValType4Cnt++;
                        else if (allevents[i].appointmenttype == 5) cValType5Cnt++;
                    }
                    $('#calendarAppointmentType1Cnt').text(cValType1Cnt);
                    $('#calendarAppointmentType2Cnt').text(cValType2Cnt);
                    $('#calendarAppointmentType3Cnt').text(cValType3Cnt);
                    $('#calendarAppointmentType4Cnt').text(cValType4Cnt);
                    $('#calendarAppointmentType5Cnt').text(cValType5Cnt);
                    $('#calendarCancelCnt').html('<i class="fa fa-times-circle"></i>&nbsp;' + cValType5Cnt);
                    $('#calendarDoneCnt').html('<i class="fa fa-check-circle"></i>&nbsp;' + cValType4Cnt);
                    $('.calendarCancelPieChart').data('easyPieChart').update(Math.round((cValType5Cnt / (cValType1Cnt + cValType2Cnt + cValType3Cnt + cValType4Cnt + cValType5Cnt)) * 100));
                    $('.calendarDonePieChart').data('easyPieChart').update(Math.round((cValType4Cnt / (cValType1Cnt + cValType2Cnt + cValType3Cnt + cValType4Cnt + cValType5Cnt)) * 100));
                }
                else {
                    $('#calendarAppointmentType1Cnt').text(0);
                    $('#calendarAppointmentType2Cnt').text(0);
                    $('#calendarAppointmentType3Cnt').text(0);
                    $('#calendarAppointmentType4Cnt').text(0);
                    $('#calendarAppointmentType5Cnt').text(0);
                    $('#calendarCancelCnt').html('<i class="fa fa-times-circle"></i>&nbsp;' + 0);
                    $('#calendarDoneCnt').html('<i class="fa fa-check-circle"></i>&nbsp;' + 0);
                    $('.calendarCancelPieChart').data('easyPieChart').update(0);
                    $('.calendarDonePieChart').data('easyPieChart').update(0);
                }
                drawLunchColumns();
            }
        });
        /* hide default buttons */
        $('.fc-header-right, .fc-header-center').hide();
    }
    function replaceTwoCharNum(val) {
        if (parseInt(val) < 10) return '0' + val.toString();
        else return val.toString();
    }
    function drawLunchColumns() {
        var lunchStartTime = new Date(1990, 01, 17, parseInt($('#calendarSettings').html().split('~')[3].split(':')[0]), parseInt($('#calendarSettings').html().split('~')[3].split(':')[1]));
        var lunchEndTime = new Date(1990, 01, 17, parseInt($('#calendarSettings').html().split('~')[4].split(':')[0]), parseInt($('#calendarSettings').html().split('~')[4].split(':')[1]));
        for (lunchStartTime; lunchStartTime < lunchEndTime; lunchStartTime.setMinutes(lunchStartTime.getMinutes() + parseInt($('#calendarSettings').html().split('~')[2]))) {
            $('[data-date="' + $('#calendarInsertDate').text() + 'T' + replaceTwoCharNum(lunchStartTime.getHours()) + ':' + replaceTwoCharNum(lunchStartTime.getMinutes()) + ':00"]').toggleClass('fc-lunch');
        }
        var valLunchCol = '';
        for (var i = 0; i < parseInt(JSON.parse($('#calendarCurrentRoomChiarNumArr').html()).length) ; i++) {
            if (i != 0) valLunchCol += '<br>';
            valLunchCol += 'ц/цаг';
        }
        $('.fc-lunch').find('div').html('<span>' + valLunchCol + '</span>');
    }
    function drawActiveWorkedMechanic() {
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/CalendarActiveWorkedMechanic",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "dt":"' + $('#calendarInsertDate').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (valData != '') valData += '<span class="badge badge-info" style="margin-left:2px;">';
                    else valData += '<span class="badge badge-info">';
                    valData +=  value.MECHANICAL_STAFFNAME + '</span>';
                });
                if (valData == '') valData = '<small><em>Мэдээлэл алга...</em></small>';
                $('#CalendarActiveWorkedMechanicDiv').html(valData);
                $('#CalendarActiveWorkedMechanicSpanDate, #CalendarActiveMechanicSpanDate').html($('#calendarInsertDate').text());
                drawActiveCameMechanic();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function drawActiveCameMechanic() {
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/CalendarActiveCameMechanic",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "dt":"' + $('#calendarInsertDate').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (valData != '') valData += '<span class="badge badge-info" style="margin-left:2px;" data-value="'+value.STAFF_ID+'">';
                    else valData += '<span class="badge badge-info" data-value="' + value.STAFF_ID + '">';
                    valData += value.MECHANICAL_STAFFNAME + '</span>';
                });
                if (valData == '') valData = '<small><em>Мэдээлэл алга...</em></small>';
                $('#CalendarActiveMechanicDiv').html(valData);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function calendarActiveMechanicList() {
        $('#calendarActiveMechanicModalDate').html($('#calendarInsertDate').text());
        $('input[name="calendarActiveMechanicModalSelectStaff"]').prop('checked', false);
        for (var i = 0; i <= $('#CalendarActiveMechanicDiv span').length; i++) {
            $('#calendarActiveMechanicModalSelectStaff' + $('#CalendarActiveMechanicDiv').find('span:eq(' + i + ')').attr('data-value')).prop('checked',true);
        }
    }
    function setEditable_Appointment(enddate) {
        //Цаг авалт - Захиалга бүртгэх, үйлчлүүлэгчийн мэдээлэл
        $('#patientModalInputAutono').prop('disabled', true);
        if (!funcIsRole('1,2,13')) {
            doEditable_Appointment(true);
        }
        else {
            if (!funcIsRole('1,13')) {
                doEditable_Appointment(isAppointmentExpired(enddate));
            }
            else {
                doEditable_Appointment(false);
            }
        }
    }
    function doEditable_Appointment(bool) {
        $('#calendarAppointmentModalInputDate').prop('disabled', bool);
        if (bool) $('#calendarAppointmentModalInputDate').parent().addClass('state-disabled');
        else $('#calendarAppointmentModalInputDate').parent().removeClass('state-disabled');
        $('#calendarAppointmentModalSelectStartTime').prop('disabled', bool);
        if (bool) $('#calendarAppointmentModalSelectStartTime').parent().addClass('state-disabled');
        else $('#calendarAppointmentModalSelectStartTime').parent().removeClass('state-disabled');
        $('#calendarAppointmentModalSelectEndTime').prop('disabled', bool);
        if (bool) $('#calendarAppointmentModalSelectEndTime').parent().addClass('state-disabled');
        else $('#calendarAppointmentModalSelectEndTime').parent().removeClass('state-disabled');
        $('#calendarAppointmentModalSelectRoom').prop('disabled', bool);
        if (bool) $('#calendarAppointmentModalSelectRoom').parent().addClass('state-disabled');
        else $('#calendarAppointmentModalSelectRoom').parent().removeClass('state-disabled');
        $('#calendarAppointmentModalSelectChair').prop('disabled', bool);
        if (bool) $('#calendarAppointmentModalSelectChair').parent().addClass('state-disabled');
        else $('#calendarAppointmentModalSelectChair').parent().removeClass('state-disabled');
        if (bool) $('input[name="calendarAppointmentModalAppointmentType"]').parent().addClass('disabled');
        else $('input[name="calendarAppointmentModalAppointmentType"]').parent().removeClass('disabled');
        $('input[name="calendarAppointmentModalInputRequest"]').prop('disabled', bool);
        if (bool) $('#calendarAppointmentModalInputRequest').parent().addClass('state-disabled');
        else $('#calendarAppointmentModalInputRequest').parent().removeClass('state-disabled');
        $('#calendarAppointmentModalInputAppointmentMemo').prop('disabled', bool);
        if (bool) $('#calendarAppointmentModalInputAppointmentMemo').parent().addClass('state-disabled');
        else $('#calendarAppointmentModalInputAppointmentMemo').parent().removeClass('state-disabled');

        $('#calendarSwapPatientBtnAutoNoFilter').prop('disabled', bool);
        if (bool) $('#calendarSwapPatientBtnAutoNoFilter').parent().addClass('state-disabled');
        else $('#calendarSwapPatientBtnAutoNoFilter').parent().removeClass('state-disabled');
        //$('#patientModalInputAutono').prop('disabled', bool);
        $('#patientModalSelectAutomarkType').prop('disabled', bool);
        if (bool) $('#patientModalSelectAutomarkType').parent().addClass('state-disabled');
        else $('#patientModalSelectAutomarkType').parent().removeClass('state-disabled');
        $('#patientModalSelectAutomark').prop('disabled', bool);
        if (bool) $('#patientModalSelectAutomark').parent().addClass('state-disabled');
        else $('#patientModalSelectAutomark').parent().removeClass('state-disabled');
        $('#patientModalSelectAutoYear').prop('disabled', bool);
        if (bool) $('#patientModalSelectAutoYear').parent().addClass('state-disabled');
        else $('#patientModalSelectAutoYear').parent().removeClass('state-disabled');
        $('#patientModalInputVinno').prop('disabled', bool);
        if (bool) $('#patientModalInputVinno').parent().addClass('state-disabled');
        else $('#patientModalInputVinno').parent().removeClass('state-disabled');
        $('input[name="patientModalInputFueltype"]').prop('disabled', bool);
        if (bool) $('input[name="patientModalInputFueltype"]').parent().addClass('state-disabled');
        else $('input[name="patientModalInputFueltype"]').parent().removeClass('state-disabled');
        $('input[name="patientModalInputTransmission"]').prop('disabled', bool);
        if (bool) $('input[name="patientModalInputTransmission"]').parent().addClass('state-disabled');
        else $('input[name="patientModalInputTransmission"]').parent().removeClass('state-disabled');
        $('input[name="patientModalInputZaaltType"]').prop('disabled', bool);
        if (bool) $('input[name="patientModalInputZaaltType"]').parent().addClass('state-disabled');
        else $('input[name="patientModalInputZaaltType"]').parent().removeClass('state-disabled');
        $('#patientModalInputKmzaalt').prop('disabled', bool);
        if (bool) $('#patientModalInputKmzaalt').parent().addClass('state-disabled');
        else $('#patientModalInputKmzaalt').parent().removeClass('state-disabled');
        $('#patientModalButtonKmzaalt').prop('disabled', bool);
        if (bool) $('#patientModalButtonKmzaalt').parent().addClass('state-disabled');
        else $('#patientModalButtonKmzaalt').parent().removeClass('state-disabled');
        $('input[name=patientModalInputIsMySold]').prop('disabled', bool);
        if (bool) $('input[name=patientModalInputIsMySold]').parent().addClass('state-disabled');
        else $('input[name=patientModalInputIsMySold]').parent().removeClass('state-disabled');
        $('#patientModalInputOwnername').prop('disabled', bool);
        if (bool) $('#patientModalInputOwnername').parent().addClass('state-disabled');
        else $('#patientModalInputOwnername').parent().removeClass('state-disabled');
        $('#patientModalInputTel').prop('disabled', bool);
        if (bool) $('#patientModalInputTel').parent().addClass('state-disabled');
        else $('#patientModalInputTel').parent().removeClass('state-disabled');
        $('#patientModalInputTel2').prop('disabled', bool);
        if (bool) $('#patientModalInputTel2').parent().addClass('state-disabled');
        else $('#patientModalInputTel2').parent().removeClass('state-disabled');
        $('input[name="patientModalInputType"]').prop('disabled', bool);
        if (bool) $('input[name="patientModalInputType"]').parent().addClass('state-disabled');
        else $('input[name="patientModalInputType"]').parent().removeClass('state-disabled');
        $('#patientModalInputAddress').prop('disabled', bool);
        if (bool) $('#patientModalInputAddress').parent().addClass('state-disabled');
        else $('#patientModalInputAddress').parent().removeClass('state-disabled');
        $('input[name="patientModalInputDiscount"]').prop('disabled', bool);
        if (bool) $('input[name="patientModalInputDiscount"]').parent().addClass('state-disabled');
        else $('input[name="patientModalInputDiscount"]').parent().removeClass('state-disabled');
        $('#patientModalInputEmail').prop('disabled', bool);
        if (bool) $('#patientModalInputEmail').parent().addClass('state-disabled');
        else $('#patientModalInputEmail').parent().removeClass('state-disabled');
        //$('#patientModalInputTelEmergency').prop('disabled', bool);
        //$('input[name="patientModalInputTelEmergencyType"]').prop('disabled', bool);
        //$('#patientModalInputTelEmergencyPersonname').prop('disabled', bool);
        $('#patientModalBtnSave').prop('disabled', bool);
        if (bool) $('#patientModalBtnSave').parent().addClass('state-disabled');
        else $('#patientModalBtnSave').parent().removeClass('state-disabled');
    }
    function setEditable_Diagnostic(enddate) {
        //Цаг авалт - Оношлогоо оруулах
        if (!funcIsRole('1,3,13')) {
            doEditable_Diagnostic(true);
        }
        else {
            if (!funcIsRole('1,13')) doEditable_Diagnostic(isAppointmentExpired(enddate));
            else doEditable_Diagnostic(false);
        }
    }
    function doEditable_Diagnostic(bool) {
        $('input[name="appmodaltab2CheckDiagnostic"]').prop('disabled', bool);
        if (bool) $('input[name="appmodaltab2CheckDiagnostic"]').parent().addClass('state-disabled');
        else $('input[name="appmodaltab2CheckDiagnostic"]').parent().removeClass('state-disabled');
        $('#appmodaltab2InputDescription').prop('disabled', bool);
        if (bool) $('#appmodaltab2InputDescription').parent().addClass('state-disabled');
        else $('#appmodaltab2InputDescription').parent().removeClass('state-disabled');
        $('#appmodaltab2SelectSeniorMechanical').prop('disabled', bool);
        if (bool) $('#appmodaltab2SelectSeniorMechanical').parent().addClass('state-disabled');
        else $('#appmodaltab2SelectSeniorMechanical').parent().removeClass('state-disabled');
        $('#appmodaltab2SelectMechanical').prop('disabled', bool);
        if (bool) $('#appmodaltab2SelectMechanical').parent().addClass('state-disabled');
        else $('#appmodaltab2SelectMechanical').parent().removeClass('state-disabled');
        $('#appmodaltab2SelectServiceConsultant').prop('disabled', bool);
        if (bool) $('#appmodaltab2SelectServiceConsultant').parent().addClass('state-disabled');
        else $('#appmodaltab2SelectServiceConsultant').parent().removeClass('state-disabled');
    }

    function setEditable_Service(enddate) {
        //Цаг авалт - Засвар оруулах
        if (!funcIsRole('1,4,13')) {
            doEditable_Service(true);
        }
        else {
            if (!funcIsRole('1,13')) {
                doEditable_Service(isAppointmentExpired(enddate));
            }
            else {
                doEditable_Service(false);
            }
        }
    }
    function doEditable_Service(bool) {
        $('input[name="appmodaltab3CheckRepair"]').prop('disabled', bool);
        $('#appmodaltab3SelectServiceType').prop('disabled', bool);
        $('#appmodaltab3ServiceListDiv').find('table tr').each(function () {
            if (bool) $(this).find('td:eq(1)').addClass('hide');
            else $(this).find('td:eq(1)').removeClass('hide');
        });
        $('#appmodaltab3SelectMechanical').prop('disabled', bool);
        $('#appmodaltab3SelectSeniorMechanical').prop('disabled', bool);
        $('#appmodaltab3SelectServiceConsultant').prop('disabled', bool);
        $('#appmodaltab3InputServicememo').prop('disabled', bool);
        $('#appmodaltab3ButtonServiceMemoSave').prop('disabled', bool);
        $('#appmodaltab3AppointmentServiceListDiv').find('table tr').each(function () {
            if (bool) $(this).find('td:eq(4)').addClass('hide');
            else $(this).find('td:eq(4)').removeClass('hide');
        });
    }
    function setEditable_Part(enddate) {
        //Цаг авалт - Солигдох сэлбэг
        if (!funcIsRole('1,5,13')) {
            doEditable_Part(true);
        }
        else {
            if (!funcIsRole('1,13')) doEditable_Part(isAppointmentExpired(enddate));
            else doEditable_Part(false);
        }
    }
    function doEditable_Part(bool) {
        $('#appmodaltab4SelectPartType').prop('disabled', bool);
        $('#appmodaltab4PartListDiv').find('table tr').each(function () {
            if (bool) $(this).find('td:eq(1)').addClass('hide');
            else $(this).find('td:eq(1)').removeClass('hide');
        });
        $('#appmodaltab4AppointmentPartListDiv').find('table tr').each(function () {
            if (bool) $(this).find('td:eq(4)').addClass('hide');
            else $(this).find('td:eq(4)').removeClass('hide');
        });
    }
    function setEditable_Payment(enddate) {
        //Цаг авалт - Төлбөрийн мэдээлэл
        if (!funcIsRole('1,6,13')) {
            doEditable_Payment(true);
        }
        else {
            if (!funcIsRole('1,13')) doEditable_Payment(isAppointmentExpired(enddate));
            else doEditable_Payment(false);
        }
    }
    function doEditable_Payment(bool) {
        $('#appmodaltab5InputDiscount').prop('disabled', bool);
        $('#appmodaltab5InputWage').prop('disabled', bool);
        $('#appmodaltab5InputPaid').prop('disabled', bool);
        $('#appmodaltab5ButtonSave').prop('disabled', bool);
    }
    function isAppointmentExpired(enddate) {
        var dttmDt = new Date();
        var dttm7MinusDt = new Date();
        dttm7MinusDt.setDate(dttm7MinusDt.getDate() - 7);
        var dttmSelectedDt = new Date(parseInt(enddate.split('T')[0].split('-')[0]), parseInt(enddate.split('T')[0].split('-')[1]) - 1, parseInt(enddate.split('T')[0].split('-')[2]));
        return dttmSelectedDt <= dttm7MinusDt;
    }
    //insert appointment
    $("#calendarSelectRoom").change(function () {
        if ($('#calendarSelectRoom option:selected').val() != '') {
            $('#calendarBlockHeaderListDiv').find('ul > li').each(function (index) {
                if ($('a', this).attr('data-roomid') == $('#calendarSelectRoom option:selected').val()) {
                    $('#calendarSelectChair').html('<option value="">- Сонго -</option>');
                    for (var i = 1; i <= parseInt($('a', this).text().split('(')[1].split(')')[0]) ; i++) $('#calendarSelectChair').append('<option>' + i.toString() + '</option>');
                    $('#calendarSelectChair').prop('disabled', false);
                }
            });
        }
        else {
            $('#calendarSelectChair').html('<option value="">- Сонго -</option>');
            $('#calendarSelectChair').prop('disabled', true);
        }
        $('#calendarBtnSave').removeAttr('disabled');
    });
    $("#calendarInputAutono").change(function () {
        var valData = '';
        if ($.trim($("#calendarInputAutono").val()) != '') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT COUNT(1) FROM TBL_PATIENT WHERE AUTONO = N\'' + $.trim($("#calendarInputAutono").val()) + '\'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d != '0') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteScalar",
                            data: '{"qry":"SELECT ISNULL(CAST(ID as varchar),\'\')+\'~\'+ISNULL(NAME,\'\')+\'~\'+ISNULL(CAST(TYPE as varchar),\'\')+\'~\'+ISNULL(TEL,\'\')+\'~\'+ISNULL(TEL2,\'\')+\'~\'+ISNULL(EMAIL,\'\')+\'~\'+ISNULL(ADDRESS,\'\')+\'~\'+ISNULL(CAST(MARK_ID as varchar),\'\')+\'~\'+ISNULL(CAST(PRODUCEDYEAR as varchar),\'\')+\'~\'+ISNULL(AUTONO,\'\')+\'~\'+ISNULL(VINNO,\'\')+\'~\'+ISNULL(CAST(FUELTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(TRANSMISSIONTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYTEL as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYTELTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYPERSONNAME as varchar),\'\')+\'~\'+ISNULL(CAST(ZAALTTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(ISMYSOLD as varchar),\'0\')+\'~\'+ISNULL(CAST(PATIENTDISCOUNT_ID as varchar),\'\') FROM TBL_PATIENT WHERE AUTONO = N\'' + $.trim($("#calendarInputAutono").val()) + '\'"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                $('#patientID').html(msg.d.split('~')[0]);
                                $('#calendarInputOwnername').val(replaceDatabaseToDisplay(msg.d.split('~')[1]));
                                $('input[name="calendarInputType"]').prop('checked', false);
                                if (msg.d.split('~')[2] == '1') $('#calendarInputType1').prop('checked', true);
                                else if (msg.d.split('~')[2] == '0') $('#calendarInputType2').prop('checked', true);
                                $('#calendarInputTel').val(msg.d.split('~')[3]);
                                $('#calendarInputTel2').val(msg.d.split('~')[4]);
                                $('#calendarInputAddress').val(replaceDatabaseToDisplay(msg.d.split('~')[6]));
                                $('#calendarInputVinno').val(msg.d.split('~')[10]);
                                $('input[name=calendarInputZaaltType]').prop('checked', false);
                                if (msg.d.split('~')[16] == '1') $('#calendarInputZaaltType1').prop('checked', true);
                                else if (msg.d.split('~')[16] == '2') $('#calendarInputZaaltType2').prop('checked', true);
                                var valAutomarkId = msg.d.split('~')[7];
                                if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val(valAutomarkId);
                                else {
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "../wcf/ServiceMain.svc/ExecuteScalar",
                                        data: '{"qry":"SELECT AUTOMARK_TYPE_ID FROM TBL_AUTOMARK WHERE ID = ' + valAutomarkId + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (msg) {
                                            $('#calendarSelectAutomarkType').val(msg.d);
                                            globalAjaxVar = $.ajax({
                                                type: "POST",
                                                url: "../wcf/ServiceMain.svc/CalendarAutomarkListForDDL",
                                                data: '{"automarktype":"' + $('#calendarSelectAutomarkType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (data) {
                                                    valData = '';
                                                    $($.parseJSON(data.d)).each(function (index, value) {
                                                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                                                    });
                                                    $('#calendarSelectAutomark').html('<option value="" lang="mn">- Сонго -</option>' + valData);
                                                    $('#calendarSelectAutomark').val(valAutomarkId);
                                                    $('#calendarSelectAutomark').prop('disabled', false);
                                                },
                                                failure: function (response) {
                                                    alert('FAILURE: ' + response.d);
                                                },
                                                error: function (xhr, status, error) {
                                                    window.location = '../#pg/error500.aspx';
                                                }
                                            });
                                        },
                                        failure: function (response) {
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                }
                                $('#calendarSelectAutoYear').val(msg.d.split('~')[8]);
                                $('input[name="calendarInputFueltype"]').prop('checked', false);
                                if (msg.d.split('~')[11] == '1') $('#calendarInputFueltype1').prop('checked', true);
                                else if (msg.d.split('~')[11] == '0') $('#calendarInputFueltype2').prop('checked', true);
                                $('input[name="calendarInputTransmission"]').prop('checked', false);
                                if (msg.d.split('~')[12] == '1') $('#calendarInputTransmission1').prop('checked', true);
                                else if (msg.d.split('~')[12] == '0') $('#calendarInputTransmission2').prop('checked', true);
                                //$('#calendarInputTelEmergency').val(msg.d.split('~')[13]);
                                //$('input[name="calendarInputTelEmergencyType"]').prop('checked', false);
                                //if (msg.d.split('~')[14] == '1') $('#calendarInputTelEmergencyType1').prop('checked', true);
                                //else if (msg.d.split('~')[14] == '2') $('#calendarInputTelEmergencyType2').prop('checked', true);
                                //else if (msg.d.split('~')[14] == '3') $('#calendarInputTelEmergencyType3').prop('checked', true);
                                //$('#calendarInputTelEmergencyPersonname').val(msg.d.split('~')[15]);
                                if (msg.d.split('~')[17] == '1') $('#calendarInputIsMySold').prop('checked', true);
                                else $('#calendarInputIsMySold').prop('checked', false);
                                $('input[name=calendarInputDiscount]').prop('checked', false);
                                if (msg.d.split('~')[18] != '') $('#calendarInputDiscount' + msg.d.split('~')[18]).prop('checked', true);
                                alert('Бүртгэлтэй хэрэглэгч...');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    }
                    else {
                        if ($.trim($('#patientID').html()) != '') {
                            $('#patientID').html('');
                            $('#calendarInputOwnername').val('');
                            $('input[name="calendarInputType"]').prop('checked', false);
                            $('#calendarInputTel').val('');
                            $('#calendarInputTel2').val('');
                            $('#calendarInputVinno').val('');
                            $('input[name=calendarInputZaaltType]').prop('checked', false);
                            if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val('');
                            else {
                                $('#calendarSelectAutomarkType').val('');
                                $('#calendarSelectAutomark').val('');
                                $('#calendarSelectAutomark').prop('disabled', true);
                            }
                            $('#calendarSelectAutoYear').val('');
                            $('input[name="calendarInputFueltype"]').prop('checked', false);
                            $('input[name="calendarInputTransmission"]').prop('checked', false);
                            //$('#calendarInputTelEmergency').val('');
                            //$('input[name="calendarInputTelEmergencyType"]').prop('checked', false);
                            //$('#calendarInputTelEmergencyPersonname').val('');
                            $('#calendarInputIsMySold').prop('checked', false);
                            $('input[name=calendarInputDiscount]').prop('checked', false);
                        }
                    }
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
        else {
            if ($.trim($('#patientID').html()) != '') {
                $('#patientID').html('');
                $('#calendarInputOwnername').val('');
                $('input[name="calendarInputType"]').prop('checked', false);
                $('#calendarInputTel').val('');
                $('#calendarInputTel2').val('');
                $('#calendarInputVinno').val('');
                $('input[name=calendarInputZaaltType]').prop('checked', false);
                if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val('');
                else {
                    $('#calendarSelectAutomarkType').val('');
                    $('#calendarSelectAutomark').val('');
                    $('#calendarSelectAutomark').prop('disabled', true);
                }
                $('#calendarSelectAutoYear').val('');
                $('input[name="calendarInputFueltype"]').prop('checked', false);
                $('input[name="calendarInputTransmission"]').prop('checked', false);
                //$('#calendarInputTelEmergency').val('');
                //$('input[name="calendarInputTelEmergencyType"]').prop('checked', false);
                //$('#calendarInputTelEmergencyPersonname').val('');
            }
        }
    });
    $('#calendarBtnCancel').click(function () {
        $('input[name=calendarInputAppointmenttype]').prop('checked', false);
        //$('#calendarSelectStartTime').val('');
        //$('#calendarSelectEndTime').val('');
        //$('#calendarSelectRoom').val('');
        //$('#calendarSelectChair').val('');
        $('#patientID').html('');
        $('#calendarInputAutono').val('');
        $('#calendarInputOwnername').val('');
        $('input[name=calendarInputType]').prop('checked', false);
        $('#calendarInputTel').val('');
        $('#calendarInputTel2').val('');
        $('#calendarInputVinno').val('');
        $('input[name=calendarInputZaaltType]').prop('checked', false);
        if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val('');
        else {
            $('#calendarSelectAutomarkType').val('');
            $('#calendarSelectAutomark').val('');
            $('#calendarSelectAutomark').prop('disabled', true);
        }
        $('#calendarSelectAutoYear').val('');
        $('input[name=calendarInputFueltype]').prop('checked', false);
        $('input[name=calendarInputTransmission]').prop('checked', false);
        //$('#calendarInputTelEmergency').val('');
        //$('input[name="calendarInputTelEmergencyType"]').prop('checked', false);
        //$('#calendarInputTelEmergencyPersonname').val('');
        $('input[name=calendarInputRequest]').prop('checked', false);
        $('#calendarInputMemo').val('');
        $('input[name=calendarInputDiscount]').prop('checked', false);
    });
    //appointment modal
    $("input[name=calendarAppointmentModalAppointmentType]:radio").change(function () {
        if ($(this).val() == '5') {
            appmodalCalendarAppType5DescriptionAddEdit('1');
            $('#appmodalCalendarAppType5DescriptionModal').modal('show');

        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"UPDATE TBL_APPOINTMENT SET APPOINTMENT_TYPE_ID=' + $(this).val() + ' WHERE ID=' + $('#appointmentID').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    //reloadCalendar();
                    $('#calendar1').fullCalendar('refetchEvents');
                    drawActiveWorkedMechanic();
                    smallBox('Захиалгын төлөв', 'Амжилттай засагдлаа', '#659265');
                    //$.connection.hub.start().done(function () {
                    //    chat.server.send($.trim($('#indexSessionID').html()));
                    //});
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    //$('#calendarAppointmentModalTabs > ul li').click(function (e) {
    //    $('#calendarAppointmentModalTabsContent').load('../pg/appmodal/' + $(this).closest('ul').find('li:eq(' + $(this).index() + ')').attr('data-pgname') + '.aspx?appid=' + $('#appointmentID').text());
    //});
    $('input[name="calendarAppointmentModalAppointmenttype"]').click(function () {
        alert('b');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_APPOINTMENT SET APPOINTMENTTYPE=' + $('input[name="calendarAppointmentModalAppointmenttype"]:checked').val() + ' WHERE ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Захиалгын төрөл', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#calendarAppointmentModalSelectRoom").change(function () {
        $('#calendarBlockHeaderListDiv').find('ul > li').each(function (index) {
            if ($('a', this).attr('data-roomid') == $('#calendarAppointmentModalSelectRoom option:selected').val()) {
                $('#calendarAppointmentModalSelectChair').html('');
                var isFirst = '';
                var isCheck = 'checked="checked"';
                for (var i = 1; i <= parseInt($('a', this).text().split('(')[1].split(')')[0]) ; i++) {
                    $('#calendarAppointmentModalSelectChair').append('<option>' + i + '</option>');
                }
            }
        });
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_APPOINTMENT SET ROOM_ID=' + strQryIsNull('numeric', $.trim($('#calendarAppointmentModalSelectRoom option:selected').val())) + ', CHAIRNUM=1 WHERE ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                //reloadCalendar();
                $('#calendar1').fullCalendar('refetchEvents');
                smallBox('Захиалгын заал', 'Амжилттай хадгалагдлаа', '#659265');
                //$.connection.hub.start().done(function () {
                //    chat.server.send($.trim($('#indexSessionID').html()));
                //});
                drawActiveWorkedMechanic();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#calendarAppointmentModalSelectChair").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_APPOINTMENT SET CHAIRNUM=' + strQryIsNull('numeric', $.trim($('#calendarAppointmentModalSelectChair option:selected').val())) + ' WHERE ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                //reloadCalendar();
                $('#calendar1').fullCalendar('refetchEvents');
                smallBox('Өргөгч', 'Амжилттай хадгалагдлаа', '#659265');
                //$.connection.hub.start().done(function () {
                //    chat.server.send($.trim($('#indexSessionID').html()));
                //});
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    function calendarAppointmentModalInputDateChanged(ev) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_APPOINTMENT SET DT=' + strQryIsNull('varchar', $.trim($('#calendarAppointmentModalInputDate').val())) + ', STARTDATETIME=cast(' + strQryIsNull('varchar', $.trim($('#calendarAppointmentModalInputDate').val())) + '+\' \'+STARTTIME as datetime), ENDDATETIME=cast(' + strQryIsNull('varchar', $.trim($('#calendarAppointmentModalInputDate').val())) + '+\' \'+ENDTIME as datetime) WHERE ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                //reloadCalendar();
                $('#calendar1').fullCalendar('refetchEvents');
                smallBox('Захиалгын огноо', 'Амжилттай хадгалагдлаа', '#659265');
                //$.connection.hub.start().done(function () {
                //    chat.server.send($.trim($('#indexSessionID').html()));
                //});
                drawActiveWorkedMechanic();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#calendarAppointmentModalSelectStartTime").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_APPOINTMENT SET STARTTIME=' + strQryIsNull('varchar', $.trim($('#calendarAppointmentModalSelectStartTime option:selected').val())) + ', STARTDATETIME=cast(DT+\' \'+' + strQryIsNull('varchar', $.trim($('#calendarAppointmentModalSelectStartTime option:selected').val())) + ' as datetime) WHERE ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                //reloadCalendar();
                $('#calendar1').fullCalendar('refetchEvents');
                smallBox('Захиалгын эхлэх цаг', 'Амжилттай хадгалагдлаа', '#659265');
                //$.connection.hub.start().done(function () {
                //    chat.server.send($.trim($('#indexSessionID').html()));
                //});
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#calendarAppointmentModalSelectEndTime").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_APPOINTMENT SET ENDTIME=' + strQryIsNull('varchar', $.trim($('#calendarAppointmentModalSelectEndTime option:selected').val())) + ', ENDDATETIME=cast(DT+\' \'+' + strQryIsNull('varchar', $.trim($('#calendarAppointmentModalSelectEndTime option:selected').val())) + ' as datetime) WHERE ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                //reloadCalendar();
                $('#calendar1').fullCalendar('refetchEvents');
                smallBox('Захиалгын дуусах цаг', 'Амжилттай хадгалагдлаа', '#659265');
                //$.connection.hub.start().done(function () {
                //    chat.server.send($.trim($('#indexSessionID').html()));
                //});
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $('input[name=calendarAppointmentModalInputRequest]').change(function () {
        var allVals = [];
        $('input[name=calendarAppointmentModalInputRequest]:checked').each(function () {
            allVals.push($(this).val());
        });
        if (allVals.length > 0) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"DELETE FROM TBL_APPOINTMENT_REQUESTTYPE WHERE APPOINTMENT_ID=' + $('#appointmentID').text() + '     INSERT INTO TBL_APPOINTMENT_REQUESTTYPE (APPOINTMENT_ID, REQUESTTYPE_ID) SELECT ' + $('#appointmentID').text() + ', CAST(DATA as numeric) FROM dbo.FUNC_SPLIT(\',\',\'' + allVals + '\')"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Үйлчүүлэгчийн хүсэлт', 'Амжилттай хадгалагдлаа', '#659265');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
        else {
            alert('Үйлчлүүлэгчийн хүсэлт заавал сонгоно уу');
            $(this).prop('checked',true);
        }
        
    });
    $('#calendarAppointmentModalInputAppointmentMemo').change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_APPOINTMENT SET REQUESTMEMO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarAppointmentModalInputAppointmentMemo').val()).replace(/\r?\n/g, '<br>'))) + ' WHERE ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Үйлчүүлэгчийн хүсэлт', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $('#patientModalButtonKmzaalt').click(function () {
        if ($.isNumeric($('#patientModalInputKmzaalt').val())) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"UPDATE TBL_APPOINTMENT SET MILEAGE=' + strQryIsNull('numeric', $.trim($('#patientModalInputKmzaalt').val())) + ' WHERE ID=' + $('#appointmentID').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Заалт', 'Амжилттай хадгалагдлаа', '#659265');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
        else alert('Заалт зөвхөн тоо орно');        
    });
    //tab3
    $("#appmodaltab3SelectServiceType").change(function () {
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Appmodaltab3Datatable1",
            data: '{"servicetype":"' + $("#appmodaltab3SelectServiceType option:selected").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"appmodaltab3ServiceListTable\" class=\"table table-hover\"><thead class=\"hide\"><tr><th>&nbsp;</th><th>&nbsp;</th></tr></thead><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (replaceDatabaseToDisplay(value.NAME).length > 35) valData += "<tr><td><a href=\"javascript:void(0);\" class=\"btn btn-link btn-xs font-sm txt-color-blueDark no-padding no-margin\" rel=\"popover-hover\" data-placement=\"bottom\" data-content=\"" + replaceDatabaseToDisplay(value.NAME) + "\">" + replaceDatabaseToDisplay(value.NAME).toString().substring(0, 35) + "...</a></td><td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Сонгох\" lang=\"mn\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + value.ID + "\" data-toggle=\"modal\" data-target=\"#appmodaltab3AddServiceModal\" onclick=\"appModaltab3ShowAddTab1(this)\"><i class=\"fa fa-plus\"></i></a></td></tr>";
                    else valData += "<tr><td class=\"font-sm\">" + replaceDatabaseToDisplay(value.NAME) + "</td><td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Сонгох\" lang=\"mn\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + value.ID + "\" data-toggle=\"modal\" data-target=\"#appmodaltab3AddServiceModal\" onclick=\"appModaltab3ShowAddTab1(this)\"><i class=\"fa fa-plus\"></i></a></td></tr>";
                });
                if (valData == "<table id=\"appmodaltab3ServiceListTable\" class=\"table table-hover\"><thead class=\"hide\"><tr><th>&nbsp;</th><th>&nbsp;</th></tr></thead><tbody>") {
                    valData = '<i>Мэдээлэл олдсонгүй...</i>';
                }
                else {
                    valData += "</tbody></table>";
                    valData += "<script>var responsiveHelper_appmodaltab3ServiceListTable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#appmodaltab3ServiceListTable').dataTable({\"bLengthChange\" : false, \"iDisplayLength\": \"All\", \"paging\": false, \"ordering\": false, \"info\": false, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_appmodaltab3ServiceListTable) {responsiveHelper_appmodaltab3ServiceListTable = new ResponsiveDatatablesHelper($('#appmodaltab3ServiceListTable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_appmodaltab3ServiceListTable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_appmodaltab3ServiceListTable.respond();}}); $('#appmodaltab3ServiceListDiv').find('.dt-toolbar').find('div:eq(0)').attr('class','col-xs-12 col-sm-12');<\/script>";
                }
                $('#appmodaltab3ServiceListDiv').html(valData);
                $('#appmodaltab3ServiceListDiv').append('<script type="text/javascript">$("[rel=popover-hover]").popover({ trigger: "hover" }); $(\'#appmodaltab3ServiceListDiv\').addClass(\'animated fast fadeInDown\');<\/script>');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    function appModaltab3ShowAddTab1(el) {
        $('#appmodaltab3ServiceID').text($(el).attr('data-id'));
        if ($(el).closest('tr').find('td:eq(0)').find('a').length) { $('#appmodaltab3AddServiceModalDivService').html($(el).closest('tr').find('td:eq(0)').find('a').attr('data-content')); }
        else { $('#appmodaltab3AddServiceModalDivService').html($(el).closest('tr').find('td:eq(0)').html()); }
        $('#appmodaltab3AddServiceModalInputCnt').val('1');
        $('#appmodaltab3AddServiceModalInputDescription').val('');
    }
    $("#appmodaltab3AddServiceModalClose, #appmodaltab3AddServiceModalCancel").click(function () {
        $('#appmodaltab3AddServiceModal').modal('hide');
    });
    //$('#appmodaltab3AddServiceModalForm').bootstrapValidator({
    //    fields: {
    //        appmodaltab3AddServiceModalInputCnt: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 2,
    //                    message: 'Уртдаа 2 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Зөвхөн тоон тэмдэгт орно'
    //                }
    //            }
    //        },
    //        appmodaltab3AddServiceModalInputDescription: {
    //            group: '.col-md-9',
    //            validators: {
    //                stringLength: {
    //                    max: 100,
    //                    message: 'Уртдаа 100 тэмдэгт авна'
    //                }
    //            }
    //        }
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        globalAjaxVar = $.ajax({
    //            type: "POST",
    //            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
    //            data: '{"qry":"INSERT INTO TBL_APPOINTMENT_SERVICE (APPOINTMENT_ID, SERVICE_TYPE_NAME, SERVICE_CODE, SERVICE_NAME, SERVICE_DESCRIPTION, DESCRIPTION, SERVICE_PRICE, CNT, SERVICE_ID, DISCPER) VALUES (' + $('#appointmentID').text() + ', (SELECT NAME FROM TBL_SERVICE_TYPE WHERE ID=(SELECT SERVICE_TYPE_ID FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + ')), (SELECT CODE FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + '), (SELECT NAME FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + '), (SELECT DESCRIPTION FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + '), ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#appmodaltab3AddServiceModalInputDescription').val()))) + ', (SELECT PRICE FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + '), ' + $.trim($('#appmodaltab3AddServiceModalInputCnt').val()) + ', ' + $('#appmodaltab3ServiceID').text() + ', (SELECT ISNULL(b.PER,0) as DISCPER FROM TBL_SERVICE a LEFT JOIN ( SELECT SERVICE_ID, PER FROM TBL_SERVICEDISC WHERE GETDATE() BETWEEN CONVERT(datetime, BEGINDATE) AND CONVERT(datetime, ENDDATE) ) b ON a.ID=b.SERVICE_ID WHERE a.ID=' + $('#appmodaltab3ServiceID').text() + '))"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function () {
    //                dataBindAppmodaltab3Table2();
    //                $('#appmodaltab3AddServiceModal').modal('hide');
    //                smallBox('Засвар үйлчилгээ', 'Амжилттай хадгалагдлаа', '#659265');
    //            },
    //            failure: function (response) {
    //                alert('FAILURE: ' + response.d);
    //            },
    //            error: function (xhr, status, error) {
    //                window.location = '../#pg/error500.aspx';
    //            }
    //        });
    //    }
    //});
    $("#appmodaltab3AddServiceModalForm").validate({
        rules: {
            appmodaltab3AddServiceModalInputCnt: {
                required: true,
                maxlength: 2,
                digits: true
            },
            appmodaltab3AddServiceModalInputDescription: {
                maxlength: 100
            }
        },
        // Messages for form validation
        messages: {
            appmodaltab3AddServiceModalInputCnt: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 2 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            appmodaltab3AddServiceModalInputDescription: {
                required: 'Уртдаа 100 тэмдэгт авна'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"INSERT INTO TBL_APPOINTMENT_SERVICE (APPOINTMENT_ID, SERVICE_TYPE_NAME, SERVICE_CODE, SERVICE_NAME, SERVICE_DESCRIPTION, DESCRIPTION, SERVICE_PRICE, CNT, SERVICE_ID, DISCPER) VALUES (' + $('#appointmentID').text() + ', (SELECT NAME FROM TBL_SERVICE_TYPE WHERE ID=(SELECT SERVICE_TYPE_ID FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + ')), (SELECT CODE FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + '), (SELECT NAME FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + '), (SELECT DESCRIPTION FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + '), ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#appmodaltab3AddServiceModalInputDescription').val()))) + ', (SELECT PRICE FROM TBL_SERVICE WHERE ID=' + $('#appmodaltab3ServiceID').text() + '), ' + $.trim($('#appmodaltab3AddServiceModalInputCnt').val()) + ', ' + $('#appmodaltab3ServiceID').text() + ', (SELECT ISNULL(b.PER,0) as DISCPER FROM TBL_SERVICE a LEFT JOIN ( SELECT SERVICE_ID, PER FROM TBL_SERVICEDISC WHERE GETDATE() BETWEEN CONVERT(datetime, BEGINDATE) AND CONVERT(datetime, ENDDATE) ) b ON a.ID=b.SERVICE_ID WHERE a.ID=' + $('#appmodaltab3ServiceID').text() + '))"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    dataBindAppmodaltab3Table2();
                    $('#appmodaltab3AddServiceModal').modal('hide');
                    smallBox('Засвар үйлчилгээ', 'Амжилттай хадгалагдлаа', '#659265');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });

    function dataBindAppmodaltab3Table2() {
        var valData = '';
        //showLoader('loaderAppModalTab3Table2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Appmodaltab3Datatable2",
            data: '{"appid":"' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table class=\"table table-hover\"><thead><tr><th lang=\"mn\">Код</th><th lang=\"mn\">Засвар үйлчилгээний нэр</th><th lang=\"mn\">Тоо</th><th lang=\"mn\">Тайлбар</th><th>&nbsp;</th></tr></thead><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"font-sm\">" + replaceDatabaseToDisplay(value.SERVICE_CODE) + "</td>";
                    valData += "<td class=\"font-sm\">" + replaceDatabaseToDisplay(value.SERVICE_NAME) + "</td>";
                    valData += "<td class=\"font-sm\">" + value.CNT + "</td>";
                    valData += "<td class=\"font-sm\">" + replaceDatabaseToDisplay(value.DESCRIPTION) + "</td>";
                    valData += "<td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Устгах\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + value.ID + "\" onclick=\"appModaltab3ShowDeleteTab2(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                    valData += "</tr>";
                });
                if (valData == "<table class=\"table table-hover\"><thead><tr><th lang=\"mn\">Код</th><th lang=\"mn\">Засвар үйлчилгээний нэр</th><th lang=\"mn\">Тоо</th><th lang=\"mn\">Тайлбар</th><th>&nbsp;</th></tr></thead><tbody>") valData += "<tr><td colspan=\"6\">Мэдээлэл олдсонгүй...</td></tr>";
                valData += "</tbody></table>";
                $("#appmodaltab3AppointmentServiceListDiv").html(valData);
                var valCnt = 0;
                $('#appmodaltab3AppointmentServiceListDiv table tbody tr').each(function () {
                    if ($(this).find('td:eq(0)').attr('colspan') == undefined) valCnt++;
                });
                $('#calendarAppointmentModalTabsContent3Count').html(valCnt);
                setEditable_Service($.trim($('#calendarAppointmentModalInputDate').val()));
                //hideLoader('loaderAppModalTab3Table2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function appModaltab3ShowDeleteTab2(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон засвар үйлчилгээг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_APPOINTMENT_SERVICE WHERE ID=' + $(el).attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindAppmodaltab3Table2();
                        smallBox('Сонгосон засвар үйлчилгээ', 'Амжилттай устлаа', '#659265');
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    $('input[name=appmodaltab3CheckRepair]').change(function () {
        var valSelectedValue = $(this).val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT_REPAIR WHERE APPOINTMENT_ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d == '0') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                        data: '{"qry":"INSERT INTO TBL_APPOINTMENT_REPAIR (APPOINTMENT_ID, REPAIRTYPE_ID, CREATED_STAFFID, CREATED_DATE) VALUES (' + $('#appointmentID').text() + ', ' + valSelectedValue + ', ' + $('#indexStaffId').text() + ', getdate())"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            dataBindAppmodaltab3Table2();
                            smallBox('Засвар үйлчилгээ', 'Амжилттай хадгалагдлаа', '#659265');
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                        data: '{"qry":"UPDATE TBL_APPOINTMENT_REPAIR SET REPAIRTYPE_ID=' + valSelectedValue + ', UPDATED_STAFFID=' + $('#indexStaffId').text() + ', UPDATED_DATE=GETDATE() WHERE APPOINTMENT_ID=' + $('#appointmentID').text() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            smallBox('Засвар үйлчилгээ', 'Амжилттай хадгалагдлаа', '#659265');
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $('#appmodaltab3SelectMechanical, #appmodaltab3SelectSeniorMechanical, #appmodaltab3SelectServiceConsultant').change(function () {
        var valAttrName = $(this).attr('id').split('Select')[1];
        var valSelectedValue = $(this).val();
        if (valSelectedValue == '') valSelectedValue = 'null';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT_REPAIR WHERE APPOINTMENT_ID=' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d == '0') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                        data: '{"qry":"INSERT INTO TBL_APPOINTMENT_REPAIR (APPOINTMENT_ID, ' + valAttrName + '_STAFFID, CREATED_STAFFID, CREATED_DATE) VALUES (' + $('#appointmentID').text() + ', ' + valSelectedValue + ', ' + $('#indexStaffId').text() + ', getdate())"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            dataBindAppmodaltab3Table2();
                            drawActiveWorkedMechanic();
                            smallBox('Засвар үйлчилгээ', 'Амжилттай хадгалагдлаа', '#659265');
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                        data: '{"qry":"UPDATE TBL_APPOINTMENT_REPAIR SET ' + valAttrName + '_STAFFID=' + valSelectedValue + ', UPDATED_STAFFID=' + $('#indexStaffId').text() + ', UPDATED_DATE=GETDATE() WHERE APPOINTMENT_ID=' + $('#appointmentID').text() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            drawActiveWorkedMechanic();
                            smallBox('Засвар үйлчилгээ', 'Амжилттай хадгалагдлаа', '#659265');
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $('#appmodaltab3ButtonServiceMemoSave').click(function () {
        if (replaceDisplayToDatabase($.trim($('#appmodaltab3InputServicememo').val()).replace(/\r?\n/g, '<br>')).length > 750) alert('750-аас бага тэмдэгт оруулна уу');
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT_REPAIR WHERE APPOINTMENT_ID=' + $('#appointmentID').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == '0') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            data: '{"qry":"INSERT INTO TBL_APPOINTMENT_REPAIR (APPOINTMENT_ID, MEMO, CREATED_STAFFID, CREATED_DATE) VALUES (' + $('#appointmentID').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#appmodaltab3InputServicememo').val()).replace(/\r?\n/g, '<br>'))) + ', ' + $('#indexStaffId').text() + ', getdate())"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                smallBox('Засвар үйлчилгээ', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    }
                    else {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            data: '{"qry":"UPDATE TBL_APPOINTMENT_REPAIR SET MEMO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#appmodaltab3InputServicememo').val()).replace(/\r?\n/g, '<br>'))) + ', UPDATED_STAFFID=' + $('#indexStaffId').text() + ', UPDATED_DATE=GETDATE() WHERE APPOINTMENT_ID=' + $('#appointmentID').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                smallBox('Засвар үйлчилгээ', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    }
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    //tab4
    $("#appmodaltab4SelectPartType").change(function () {
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Appmodaltab4Datatable1",
            data: '{"parttype":"' + $("#appmodaltab4SelectPartType option:selected").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"appmodaltab4PartListTable\" class=\"table table-hover\"><thead class=\"hide\"><tr><th>&nbsp;</th><th>&nbsp;</th></tr></thead><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (replaceDatabaseToDisplay(value.NAME).toString().length > 35) valData += "<tr><td><a href=\"javascript:void(0);\" class=\"btn btn-link btn-xs font-sm txt-color-blueDark no-padding no-margin\" rel=\"popover-hover\" data-placement=\"bottom\" data-content=\"" + replaceDatabaseToDisplay(value.NAME) + "\">" + replaceDatabaseToDisplay(value.NAME).toString().substring(0, 35) + "...</a></td><td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Сонгох\" lang=\"mn\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + value.ID + "\" data-toggle=\"modal\" data-target=\"#appmodaltab4AddPartModal\" onclick=\"appModaltab4ShowAddTab1(this)\"><i class=\"fa fa-plus\"></i></a></td></tr>";
                    else valData += "<tr><td class=\"font-sm\">" + replaceDatabaseToDisplay(value.NAME) + "</td><td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Сонгох\" lang=\"mn\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + value.ID + "\" data-toggle=\"modal\" data-target=\"#appmodaltab4AddPartModal\" onclick=\"appModaltab4ShowAddTab1(this)\"><i class=\"fa fa-plus\"></i></a></td></tr>";
                });
                if (valData == "<table id=\"appmodaltab4PartListTable\" class=\"table table-hover\"><thead class=\"hide\"><tr><th>&nbsp;</th><th>&nbsp;</th></tr></thead><tbody>") {
                    valData = '<i>Мэдээлэл олдсонгүй...</i>';
                }
                else {
                    valData += "</tbody></table>";
                    valData += "<script>var responsiveHelper_appmodaltab4PartListTable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#appmodaltab4PartListTable').dataTable({\"bLengthChange\" : false, \"iDisplayLength\": \"All\", \"paging\": false, \"ordering\": false, \"info\": false, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_appmodaltab4PartListTable) {responsiveHelper_appmodaltab4PartListTable = new ResponsiveDatatablesHelper($('#appmodaltab4PartListTable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_appmodaltab4PartListTable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_appmodaltab4PartListTable.respond();}}); $('#appmodaltab4PartListDiv').find('.dt-toolbar').find('div:eq(0)').attr('class','col-xs-12 col-sm-12');<\/script>";
                }
                $('#appmodaltab4PartListDiv').html(valData);
                $('#appmodaltab4PartListDiv').append('<script type="text/javascript">$("[rel=popover-hover]").popover({ trigger: "hover" });<\/script>');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    function appModaltab4ShowAddTab1(el) {
        $('#appmodaltab4PartID').text($(el).attr('data-id'));
        if ($(el).closest('tr').find('td:eq(0)').find('a').length) { $('#appmodaltab4AddPartModalDivPart').html($(el).closest('tr').find('td:eq(0)').find('a').attr('data-content')); }
        else { $('#appmodaltab4AddPartModalDivPart').html($(el).closest('tr').find('td:eq(0)').html()); }
        $('#appmodaltab4AddPartModalInputCnt').val('1');
        $('#appmodaltab4AddPartModalInputDescription').val('');
    }
    $("#appmodaltab4AddPartModalClose, #appmodaltab4AddPartModalCancel").click(function () {
        $('#appmodaltab4AddPartModal').modal('hide');
    });
    //$('#appmodaltab4AddPartModalForm').bootstrapValidator({
    //    fields: {
    //        appmodaltab4AddPartModalInputCnt: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 2,
    //                    message: 'Уртдаа 2 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Зөвхөн тоон тэмдэгт орно'
    //                }
    //            }
    //        },
    //        appmodaltab4AddPartModalInputDescription: {
    //            group: '.col-md-9',
    //            validators: {
    //                stringLength: {
    //                    max: 100,
    //                    message: 'Уртдаа 100 тэмдэгт авна'
    //                }
    //            }
    //        }
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        globalAjaxVar = $.ajax({
    //            type: "POST",
    //            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
    //            data: '{"qry":"INSERT INTO TBL_APPOINTMENT_PART (APPOINTMENT_ID, PART_TYPE_NAME, PART_CODE, PART_NAME, PART_DESCRIPTION, DESCRIPTION, PART_PRICE, CNT, PART_ID, DISCPER) VALUES (' + $('#appointmentID').text() + ', (SELECT NAME FROM TBL_PART_TYPE WHERE ID=(SELECT PART_TYPE_ID FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + ')), (SELECT CODE FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + '), (SELECT NAME FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + '), (SELECT DESCRIPTION FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + '), ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#appmodaltab4AddPartModalInputDescription').val()))) + ', (SELECT PRICE FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + '), ' + $.trim($('#appmodaltab4AddPartModalInputCnt').val()) + ', ' + $('#appmodaltab4PartID').text() + ', (SELECT ISNULL(b.PER,0) as DISCPER FROM TBL_PART a LEFT JOIN ( SELECT PART_ID, PER FROM TBL_PARTDISC WHERE GETDATE() BETWEEN CONVERT(datetime, BEGINDATE) AND CONVERT(datetime, ENDDATE) ) b ON a.ID=b.PART_ID WHERE a.ID=' + $('#appmodaltab4PartID').text() + '))"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function () {
    //                dataBindAppmodaltab4Table2();
    //                $('#appmodaltab4AddPartModal').modal('hide');
    //                smallBox('Солигдох сэлбэг', 'Амжилттай хадгалагдлаа', '#659265');
    //            },
    //            failure: function (response) {
    //                alert('FAILURE: ' + response.d);
    //            },
    //            error: function (xhr, status, error) {
    //                window.location = '../#pg/error500.aspx';
    //            }
    //        });
    //    }
    //});
    $("#appmodaltab4AddPartModalForm").validate({
        rules: {
            appmodaltab4AddPartModalInputCnt: {
                required: true,
                maxlength: 2,
                digits: true
            },
            appmodaltab4AddPartModalInputDescription: {
                maxlength: 100
            }
        },
        // Messages for form validation
        messages: {
            appmodaltab4AddPartModalInputCnt: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 2 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            appmodaltab4AddPartModalInputDescription: {
                required: 'Уртдаа 100 тэмдэгт авна'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"INSERT INTO TBL_APPOINTMENT_PART (APPOINTMENT_ID, PART_TYPE_NAME, PART_CODE, PART_NAME, PART_DESCRIPTION, DESCRIPTION, PART_PRICE, CNT, PART_ID, DISCPER) VALUES (' + $('#appointmentID').text() + ', (SELECT NAME FROM TBL_PART_TYPE WHERE ID=(SELECT PART_TYPE_ID FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + ')), (SELECT CODE FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + '), (SELECT NAME FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + '), (SELECT DESCRIPTION FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + '), ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#appmodaltab4AddPartModalInputDescription').val()))) + ', (SELECT PRICE FROM TBL_PART WHERE ID=' + $('#appmodaltab4PartID').text() + '), ' + $.trim($('#appmodaltab4AddPartModalInputCnt').val()) + ', ' + $('#appmodaltab4PartID').text() + ', (SELECT ISNULL(b.PER,0) as DISCPER FROM TBL_PART a LEFT JOIN ( SELECT PART_ID, PER FROM TBL_PARTDISC WHERE GETDATE() BETWEEN CONVERT(datetime, BEGINDATE) AND CONVERT(datetime, ENDDATE) ) b ON a.ID=b.PART_ID WHERE a.ID=' + $('#appmodaltab4PartID').text() + '))"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    dataBindAppmodaltab4Table2();
                    $('#appmodaltab4AddPartModal').modal('hide');
                    smallBox('Солигдох сэлбэг', 'Амжилттай хадгалагдлаа', '#659265');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });

    function dataBindAppmodaltab4Table2() {
        var valData = '';
        //showLoader('loaderAppModalTab4Table2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Appmodaltab4Datatable2",
            data: '{"appid":"' + $('#appointmentID').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table class=\"table table-hover\"><thead><tr><th lang=\"mn\">Код</th><th lang=\"mn\">Солигдох сэлбэгийн нэр</th><th lang=\"mn\">Тоо</th><th lang=\"mn\">Тайлбар</th><th>&nbsp;</th></tr></thead><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"font-sm\">" + replaceDatabaseToDisplay(value.PART_CODE) + "</td>";
                    valData += "<td class=\"font-sm\">" + replaceDatabaseToDisplay(value.PART_NAME) + "</td>";
                    valData += "<td class=\"font-sm\">" + value.CNT + "</td>";
                    valData += "<td class=\"font-sm\">" + replaceDatabaseToDisplay(value.DESCRIPTION) + "</td>";
                    valData += "<td><a href=\"javascript:void(0);\" rel=\"tooltip\" title=\"\" data-placement=\"left\" data-original-title=\"Устгах\" class=\"pull-right txt-color-darken font-sm\" data-id=\"" + value.ID + "\" onclick=\"appModaltab4ShowDeleteTab2(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                    valData += "</tr>";
                });
                if (valData == "<table class=\"table table-hover\"><thead><tr><th lang=\"mn\">Код</th><th lang=\"mn\">Солигдох сэлбэгийн нэр</th><th lang=\"mn\">Тоо</th><th lang=\"mn\">Тайлбар</th><th>&nbsp;</th></tr></thead><tbody>") valData += "<tr><td colspan=\"6\">Мэдээлэл олдсонгүй...</td></tr>";
                valData += "</tbody></table>";
                $("#appmodaltab4AppointmentPartListDiv").html(valData);
                var valCnt = 0;
                $('#appmodaltab4AppointmentPartListDiv table tbody tr').each(function () {
                    if ($(this).find('td:eq(0)').attr('colspan') == undefined) valCnt++;
                });
                $('#calendarAppointmentModalTabsContent4Count').html(valCnt);
                setEditable_Part($.trim($('#calendarAppointmentModalInputDate').val()));
                //hideLoader('loaderAppModalTab4Table2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function appModaltab4ShowDeleteTab2(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон солигдох сэлбэгийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_APPOINTMENT_PART WHERE ID=' + $(el).attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindAppmodaltab4Table2();
                        smallBox('Сонгосон солигдох сэлбэг', 'Амжилттай устлаа', '#659265');
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    //tab5
    function dataBindAppmodaltab5(appid) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT CAST((SELECT ISNULL(SUM(a.TOTALPRICE),0) as TOTALPRICE FROM ( SELECT (a.PRICE*a.CNT)-(CEILING(((a.PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a WHERE a.APPOINTMENT_ID=' + appid + ' UNION ALL SELECT (a.SERVICE_PRICE*a.CNT)-(CEILING(((a.SERVICE_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_SERVICE a WHERE a.APPOINTMENT_ID=' + appid + ' UNION ALL SELECT (a.PART_PRICE*a.CNT)-(CEILING(((a.PART_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_PART a WHERE a.APPOINTMENT_ID=' + appid + ' ) a ) as varchar)+\'~\'+CAST(( SELECT ISNULL(DISCOUNT,0) as DISCOUNT FROM TBL_APPOINTMENT WHERE ID=' + appid + ' ) as varchar)+\'~\'+CAST(( SELECT ISNULL(SUM(a.ULDEGDEL),0) as ULDEGDEL FROM ( SELECT a.APPOINTMENT_ID, (a.TOTALPRICE-ISNULL(b.DISCOUNT,0))-ISNULL(b.PAID,0) as ULDEGDEL FROM ( SELECT a.APPOINTMENT_ID, SUM(a.TOTALPRICE) as TOTALPRICE FROM ( SELECT a.APPOINTMENT_ID, (a.PRICE*a.CNT)-(CEILING(((a.PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_DIAGNOSTICTYPE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID AND b.PATIENT_ID=(SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID=' + appid + ') WHERE a.APPOINTMENT_ID<>' + appid + ' AND CONVERT(datetime, b.DT) < CONVERT(datetime, (SELECT DT FROM TBL_APPOINTMENT WHERE ID=' + appid + ')) UNION ALL SELECT a.APPOINTMENT_ID, (a.SERVICE_PRICE*a.CNT)-(CEILING(((a.SERVICE_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_SERVICE a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID AND b.PATIENT_ID=(SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID=' + appid + ') WHERE a.APPOINTMENT_ID<>' + appid + ' AND CONVERT(datetime, b.DT) < CONVERT(datetime, (SELECT DT FROM TBL_APPOINTMENT WHERE ID=' + appid + ')) UNION ALL SELECT a.APPOINTMENT_ID, (a.PART_PRICE*a.CNT)-(CEILING(((a.PART_PRICE*a.CNT)/100)*ISNULL(a.DISCPER, 0))) as TOTALPRICE FROM TBL_APPOINTMENT_PART a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID AND b.PATIENT_ID=(SELECT PATIENT_ID FROM TBL_APPOINTMENT WHERE ID=' + appid + ') WHERE a.APPOINTMENT_ID<>' + appid + ' AND CONVERT(datetime, b.DT) < CONVERT(datetime, (SELECT DT FROM TBL_APPOINTMENT WHERE ID=' + appid + ')) ) a GROUP BY a.APPOINTMENT_ID ) a INNER JOIN TBL_APPOINTMENT b ON a.APPOINTMENT_ID=b.ID ) a ) as varchar)+\'~\'+CAST(( SELECT ISNULL(PAID,0) as PAID FROM TBL_APPOINTMENT WHERE ID=' + appid + ' ) as varchar)+\'~\'+CAST(( SELECT ISNULL(WAGE,0) as WAGE FROM TBL_APPOINTMENT WHERE ID=' + appid + ' ) as varchar)"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $('#appmodaltab5ValTotalPrice').html(formatNumber(msg.d.split('~')[0]));
                $('#appmodaltab5ValWage').html(formatNumber(msg.d.split('~')[4]));
                //$('#appmodaltab5ValDiscount').html(formatNumber(msg.d.split('~')[1]));
                $('#appmodaltab5ValUldegdel').html(formatNumber(msg.d.split('~')[2]));
                $('#appmodaltab5ValTuluhDun').html(formatNumber(((parseInt(msg.d.split('~')[0]) - parseInt(msg.d.split('~')[1])) - parseInt(msg.d.split('~')[2]))));
                $('#appmodaltab5ValTulsunDun').html(formatNumber(msg.d.split('~')[3]));
                $('#appmodaltab5ValTulugduuguiDun').html(formatNumber((((parseInt(msg.d.split('~')[0]) - parseInt(msg.d.split('~')[1])) - parseInt(msg.d.split('~')[2])) - parseInt(msg.d.split('~')[3]))));
                $('#appmodaltab5InputDiscount').val(msg.d.split('~')[1]);
                $('#appmodaltab5InputWage').val(msg.d.split('~')[4]);
                $('#appmodaltab5InputPaid').val(msg.d.split('~')[3]);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    //$('#appmodaltab5Form').bootstrapValidator({
    //    fields: {
    //        //appmodaltab5InputDiscount: {
    //        //    group: '.col-md-9',
    //        //    validators: {
    //        //        stringLength: {
    //        //            max: 7,
    //        //            message: 'Уртдаа 7 тэмдэгт авна'
    //        //        },
    //        //        numeric: {
    //        //            message: 'Зөвхөн тоон тэмдэгт орно'
    //        //        }
    //        //    }
    //        //},
    //        appmodaltab5InputWage: {
    //            group: '.col-md-9',
    //            validators: {
    //                stringLength: {
    //                    max: 7,
    //                    message: 'Уртдаа 7 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Зөвхөн тоон тэмдэгт орно'
    //                }
    //            }
    //        },
    //        appmodaltab5InputPaid: {
    //            group: '.col-md-9',
    //            validators: {
    //                stringLength: {
    //                    max: 7,
    //                    message: 'Уртдаа 7 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Зөвхөн тоон тэмдэгт орно'
    //                }
    //            }
    //        }
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        globalAjaxVar = $.ajax({
    //            type: "POST",
    //            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
    //            data: '{"qry":"UPDATE TBL_APPOINTMENT SET DISCOUNT=' + strQryIsNull('numeric', $.trim($('#appmodaltab5InputDiscount').val())) + ', PAID=' + strQryIsNull('numeric', $.trim($('#appmodaltab5InputPaid').val())) + ', WAGE=' + strQryIsNull('numeric', $.trim($('#appmodaltab5InputWage').val())) + ' WHERE ID=' + $('#appointmentID').text() + '"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function () {
    //                dataBindAppmodaltab5($('#appointmentID').text());
    //                smallBox('Хямдрал болон төлбөр төлөлт', 'Амжилттай хадгалагдлаа', '#659265');
    //            },
    //            failure: function (response) {
    //                alert('FAILURE: ' + response.d);
    //            },
    //            error: function (xhr, status, error) {
    //                window.location = '../#pg/error500.aspx';
    //            }
    //        });
    //    }
    //});
    $("#appmodaltab5Form").validate({
        rules: {
            appmodaltab5InputWage: {
                maxlength: 7,
                digits: true
            },
            appmodaltab5InputPaid: {
                maxlength: 7,
                digits: true
            }
        },
        // Messages for form validation
        messages: {
            appmodaltab5InputWage: {
                maxlength: 'Уртдаа 7 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            appmodaltab5InputPaid: {
                maxlength: 'Уртдаа 7 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"UPDATE TBL_APPOINTMENT SET DISCOUNT=' + strQryIsNull('numeric', $.trim($('#appmodaltab5InputDiscount').val())) + ', PAID=' + strQryIsNull('numeric', $.trim($('#appmodaltab5InputPaid').val())) + ', WAGE=' + strQryIsNull('numeric', $.trim($('#appmodaltab5InputWage').val())) + ' WHERE ID=' + $('#appointmentID').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    dataBindAppmodaltab5($('#appointmentID').text());
                    smallBox('Хямдрал болон төлбөр төлөлт', 'Амжилттай хадгалагдлаа', '#659265');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });

    //dashboard
    $('.calendarBlockClick').click(function (e) {
        $('#calendarCurrentRoomId').text($(this).attr('data-roomid'));
        $('#calendarCurrentRoomChiarNumArr').html($(this).find('span').html());
        $('#calendar1').fullCalendar('destroy');
        bindCalendar();
    });
     
    //validator insert appointment
    $("#calendarInsertForm").validate({
        rules: {
            calendarInputAppointmenttype: {
                required: true
            },
            calendarSelectStartTime: {
                required: true
            },
            calendarSelectEndTime: {
                required: true
            },
            calendarSelectRoom: {
                required: true
            },
            calendarSelectChair: {
                required: true
            },
            calendarInputAutono: {
                required: true
            },
            calendarSelectAutomarkType: {
                required: true
            },
            calendarSelectAutomark: {
                required: true
            },
            calendarSelectAutoYear: {
                required: true
            },
            calendarInputFueltype: {
                required: true
            },
            calendarInputTransmission: {
                required: true
            },
            calendarInputVinno: {
                minlength: 6,
                maxlength: 17
            },
            calendarInputKmzaalt: {
                maxlength: 8,
                digits: true
            },
            calendarInputOwnername: {
                required: true,
                maxlength: 100
            },
            calendarInputTel: {
                required: true,
                maxlength: 8,
                digits: true
            },
            calendarInputTel2: {
                maxlength: 8,
                digits: true
            },
            calendarInputType: {
                required: true
            },
            calendarInputAddress: {
                maxlength: 150
            },
            calendarInputRequest: {
                required: true
            },
            calendarInputMemo: {
                maxlength: 500
            },
            calendarSelectSubmitStaff: {
                required: true
            },
            calendarInputDiscount: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            calendarInputAppointmenttype: {
                required: 'Сонгоно уу'
            },
            calendarSelectStartTime: {
                required: 'Сонгоно уу'
            },
            calendarSelectEndTime: {
                required: 'Сонгоно уу'
            },
            calendarSelectRoom: {
                required: 'Сонгоно уу'
            },
            calendarSelectChair: {
                required: 'Сонгоно уу'
            },
            calendarInputAutono: {
                required: 'Оруулна уу'
            },
            calendarSelectAutomarkType: {
                required: 'Сонгоно уу'
            },
            calendarSelectAutomark: {
                required: 'Сонгоно уу'
            },
            calendarSelectAutoYear: {
                required: 'Сонгоно уу'
            },
            calendarInputFueltype: {
                required: 'Сонгоно уу'
            },
            calendarInputTransmission: {
                required: 'Сонгоно уу'
            },
            calendarInputVinno: {
                minlength: 'Багадаа 6 тэмдэгт оруулна уу',
                maxlength: 'Уртдаа 17 тэмдэгт оруулна уу'
            },
            calendarInputKmzaalt: {
                maxlength: 'Уртдаа 8 тэмдэгт авна',
                digits: 'Тоон тэмдэгт орно'
            },
            calendarInputOwnername: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 100 тэмдэгт авна'
            },
            calendarInputTel: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 8 тэмдэгт авна',
                digits: 'Тоон тэмдэгт орно'
            },
            calendarInputTel2: {
                maxlength: 'Уртдаа 8 тэмдэгт авна',
                digits: 'Тоон тэмдэгт орно'
            },
            calendarInputType: {
                required: 'Сонгоно уу'
            },
            calendarInputAddress: {
                maxlength: 'Уртдаа 150 тэмдэгт авна'
            },
            calendarInputRequest: {
                required: 'Сонгоно уу'
            },
            calendarInputMemo: {
                maxlength: 'Уртдаа 500 тэмдэгт авна'
            },
            calendarSelectSubmitStaff: {
                required: 'Сонгоно уу'
            },
            calendarInputDiscount: {
                required: 'Сонгоно уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            var allVals = [];
            $('input[name=calendarInputRequest]:checked').each(function () {
                allVals.push($(this).val());
            });
            var valEmergencyTelType = '', valIsWashing = '', valIsGetPart = '', valZaaltType = '', valIsMySold = '0', valDiscount = '';
            //if ($('input[name=calendarInputTelEmergencyType]:checked').val() != undefined) {
            //    valEmergencyTelType = $('input[name=calendarInputTelEmergencyType]:checked').val();
            //}
            //if ($('input[name=calendarInputWashCar]:checked').val() != undefined) {
            //    valIsWashing = $('input[name=calendarInputWashCar]:checked').val();
            //}
            //if ($('input[name=calendarInputGetPart]:checked').val() != undefined) {
            //    valIsGetPart = $('input[name=calendarInputGetPart]:checked').val();
            //}
            if ($('input[name=calendarInputZaaltType]:checked').val() != undefined) {
                valZaaltType = $('input[name=calendarInputZaaltType]:checked').val();
            }
            if ($('input[name=calendarInputIsMySold]:checked').val() != undefined) {
                valIsMySold = $('input[name=calendarInputIsMySold]:checked').val();
            }
            if ($('input[name=calendarInputDiscount]:checked').val() != undefined) {
                valDiscount = $('input[name=calendarInputDiscount]:checked').val();
            }
            if ($.trim($('#patientID').html()) != '') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/INS_APPOINTMENT",
                    data: '{"CLINIC_ID":"' + $('#indexClinicId').text() + '", "ROOM_ID":"' + $('#calendarSelectRoom option:selected').val() + '", "CHAIRNUM":"' + $("#calendarSelectChair option:selected").val() + '", "PATIENT_ID":"' + $.trim($('#patientID').html()) + '", "DT":"' + $.trim($('#calendarInsertDate').text()) + '", "STARTTIME":"' + $.trim($('#calendarSelectStartTime').val()) + '", "ENDTIME":"' + $.trim($('#calendarSelectEndTime').val()) + '", "APPOINTMENTTYPE":"' + $('input[name=calendarInputAppointmenttype]:checked').val() + '", "REQUESTMEMO":"' + replaceDisplayToDatabase($.trim($('#calendarInputMemo').val())) + '", "REQUESTTYPELISTID":"' + allVals + '", "MILEAGE":"' + $.trim($('#calendarInputKmzaalt').val()) + '", "ISWASHING":"' + valIsWashing + '", "ISGETPART":"' + valIsGetPart + '", "SUBMIT_STAFFID":"' + $('#calendarSelectSubmitStaff option:selected').val() + '", "STAFFID":"' + $.trim($('#indexStaffId').html()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            data: '{"qry":"UPDATE TBL_PATIENT SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputOwnername').val()))) + ', [TYPE]=' + strQryIsNull('numeric', $('input[name=calendarInputType]:checked').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#calendarInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#calendarInputTel2').val())) + ', [ADDRESS]=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAddress').val()))) + ', MARK_ID=' + strQryIsNull('numeric', $('#calendarSelectAutomark option:selected').val()) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#calendarSelectAutoYear option:selected').val()) + ', AUTONO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAutono').val()))) + ', VINNO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputVinno').val()))) + ', FUELTYPE=' + strQryIsNull('numeric', $('input[name=calendarInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE=' + strQryIsNull('numeric', $('input[name=calendarInputTransmission]:checked').val()) + ', UPDATED_STAFFID=N\'' + $.trim($('#indexUserName').html()) + '\', UPDATED_DATE=GETDATE(), ZAALTTYPE=' + strQryIsNull('numeric', valZaaltType) + ', ISMYSOLD=' + strQryIsNull('numeric', valIsMySold) + ', PATIENTDISCOUNT_ID=' + strQryIsNull('numeric', valDiscount) + ' WHERE ID=' + $.trim($('#patientID').html()) + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                $('input[name=calendarInputAppointmenttype]').prop('checked', false);
                                $('#calendarSelectStartTime').val('');
                                $('#calendarSelectEndTime').val('');
                                $('#calendarSelectRoom').val('');
                                $('#calendarSelectChair').val('');
                                $('#patientID').html('');
                                $('#calendarInputAutono').val('');
                                if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val('');
                                else {
                                    $('#calendarSelectAutomarkType').val('');
                                    $('#calendarSelectAutomark').val('');
                                    $('#calendarSelectAutomark').prop('disabled', true);
                                }
                                $('#calendarSelectAutoYear').val('');
                                $('input[name=calendarInputFueltype]').prop('checked', false);
                                $('input[name=calendarInputTransmission]').prop('checked', false);
                                $('#calendarInputVinno').val('');
                                $('input[name=calendarInputZaaltType]').prop('checked', false);
                                $('#calendarInputKmzaalt').val('');
                                $('#calendarInputIsMySold').prop('checked', false);
                                $('#calendarInputOwnername').val('');
                                $('#calendarInputTel').val('');
                                $('#calendarInputTel2').val('');
                                $('input[name=calendarInputType]').prop('checked', false);
                                $('input[name=calendarInputRequest]').prop('checked', false);
                                $('#calendarInputAddress').val('');
                                //$('#calendarInputTelEmergency').val('');
                                //$('input[name=calendarInputTelEmergencyType]').prop('checked', false);
                                //$('#calendarInputTelEmergencyPersonname').val('');
                                $('#calendarInputMemo').val('');
                                //$('input[name=calendarInputWashCar]').prop('checked', false);
                                //$('input[name=calendarInputGetPart]').prop('checked', false);
                                $('#calendarSelectSubmitStaff').val('');
                                $('input[name=calendarInputDiscount]').prop('checked', false);
                                $('#calendar1').fullCalendar('refetchEvents');
                                smallBox('Захиалга', 'Амжилттай хадгалагдлаа', '#659265');
                                $('#calendarAppointmentInsertModal').modal('hide');
                                //$.connection.hub.start().done(function () {
                                //    chat.server.send($.trim($('#indexSessionID').html()));
                                //});
                                //e.preventDefault();
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == $.trim($('#applmtmsg').val())) {
                            alert($.trim($('#applmtmsg').val()));
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else {
                var valMaxId = '';
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteScalar",
                    //data: '{"qry":"INSERT INTO TBL_PATIENT (CLINIC_ID, CODE, NAME, [TYPE], TEL, TEL2, VINNO, MARK_ID, PRODUCEDYEAR, AUTONO, FUELTYPE, TRANSMISSIONTYPE, CREATED_STAFFID, CREATED_DATE, EMERGENCYTEL, EMERGENCYTELTYPE, EMERGENCYPERSONNAME, ZAALTTYPE, ISMYSOLD) VALUES (' + $('#indexClinicId').text() + ', dbo.FUNC_GETPATIENTCODE(' + $('#indexClinicId').text() + '), ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputOwnername').val()))) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputType]:checked').val()) + ', ' + strQryIsNull('varchar', $.trim($('#calendarInputTel').val())) + ', ' + strQryIsNull('varchar', $.trim($('#calendarInputTel2').val())) + ', ' + strQryIsNull('nvarchar', $.trim($('#calendarInputVinno').val())) + ', ' + strQryIsNull('numeric', $('#calendarSelectAutomark option:selected').val()) + ', ' + strQryIsNull('numeric', $('#calendarSelectAutoYear option:selected').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAutono').val()))) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputFueltype]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputTransmission]:checked').val()) + ', N\'' + $.trim($('#indexStaffId').html()) + '\', GETDATE(), ' + strQryIsNull('numeric', $('#calendarInputTelEmergency').val()) + ', ' + strQryIsNull('numeric', valEmergencyTelType) + ', ' + strQryIsNull('nvarchar', $.trim($('#calendarInputTelEmergencyPersonname').val())) + ', ' + strQryIsNull('numeric', valZaaltType) + ', ' + valIsMySold + ')     SELECT MAX(ID) FROM TBL_PATIENT"}',
                    data: '{"qry":"INSERT INTO TBL_PATIENT (CLINIC_ID, CODE, NAME, [TYPE], TEL, TEL2, [ADDRESS], VINNO, MARK_ID, PRODUCEDYEAR, AUTONO, FUELTYPE, TRANSMISSIONTYPE, CREATED_STAFFID, CREATED_DATE, ZAALTTYPE, ISMYSOLD, PATIENTDISCOUNT_ID) VALUES (' + $('#indexClinicId').text() + ', dbo.FUNC_GETPATIENTCODE(' + $('#indexClinicId').text() + '), ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputOwnername').val()))) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputType]:checked').val()) + ', ' + strQryIsNull('varchar', $.trim($('#calendarInputTel').val())) + ', ' + strQryIsNull('varchar', $.trim($('#calendarInputTel2').val())) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAddress').val()))) + ', ' + strQryIsNull('nvarchar', $.trim($('#calendarInputVinno').val())) + ', ' + strQryIsNull('numeric', $('#calendarSelectAutomark option:selected').val()) + ', ' + strQryIsNull('numeric', $('#calendarSelectAutoYear option:selected').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAutono').val()))) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputFueltype]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputTransmission]:checked').val()) + ', N\'' + $.trim($('#indexStaffId').html()) + '\', GETDATE(), ' + strQryIsNull('numeric', valZaaltType) + ', ' + valIsMySold + ', ' + strQryIsNull('numeric', valDiscount) + ')     SELECT MAX(ID) FROM TBL_PATIENT"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        valMaxId = msg.d
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/INS_APPOINTMENT",
                            data: '{"CLINIC_ID":"' + $('#indexClinicId').text() + '", "ROOM_ID":"' + $('#calendarSelectRoom option:selected').val() + '", "CHAIRNUM":"' + $("#calendarSelectChair option:selected").val() + '", "PATIENT_ID":"' + valMaxId + '", "DT":"' + $.trim($('#calendarInsertDate').text()) + '", "STARTTIME":"' + $.trim($('#calendarSelectStartTime').val()) + '", "ENDTIME":"' + $.trim($('#calendarSelectEndTime').val()) + '", "APPOINTMENTTYPE":"' + $('input[name=calendarInputAppointmenttype]:checked').val() + '", "REQUESTMEMO":"' + replaceDisplayToDatabase($.trim($('#calendarInputMemo').val())) + '", "REQUESTTYPELISTID":"' + allVals + '", "MILEAGE":"' + $.trim($('#calendarInputKmzaalt').val()) + '", "ISWASHING":"' + valIsWashing + '", "ISGETPART":"' + valIsGetPart + '", "SUBMIT_STAFFID":"' + $('#calendarSelectSubmitStaff option:selected').val() + '", "STAFFID":"' + $.trim($('#indexStaffId').html()) + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                $('input[name=calendarInputAppointmenttype]').prop('checked', false);
                                $('#calendarSelectStartTime').val('');
                                $('#calendarSelectEndTime').val('');
                                $('#calendarSelectRoom').val('');
                                $('#calendarSelectChair').val('');
                                $('#patientID').html('');
                                $('#calendarInputAutono').val('');
                                if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val('');
                                else {
                                    $('#calendarSelectAutomarkType').val('');
                                    $('#calendarSelectAutomark').val('');
                                    $('#calendarSelectAutomark').prop('disabled', true);
                                }
                                $('#calendarSelectAutoYear').val('');
                                $('input[name=calendarInputFueltype]').prop('checked', false);
                                $('input[name=calendarInputTransmission]').prop('checked', false);
                                $('#calendarInputVinno').val('');
                                $('input[name=calendarInputZaaltType]').prop('checked', false);
                                $('#calendarInputKmzaalt').val('');
                                $('#calendarInputIsMySold').prop('checked', false);
                                $('#calendarInputOwnername').val('');
                                $('#calendarInputTel').val('');
                                $('#calendarInputTel2').val('');
                                $('input[name=calendarInputType]').prop('checked', false);
                                $('input[name=calendarInputRequest]').prop('checked', false);
                                $('#calendarInputAddress').val('');
                                //$('#calendarInputTelEmergency').val('');
                                //$('input[name=calendarInputTelEmergencyType]').prop('checked', false);
                                //$('#calendarInputTelEmergencyPersonname').val('');
                                $('#calendarInputMemo').val('');
                                //$('input[name=calendarInputWashCar]').prop('checked', false);
                                //$('input[name=calendarInputGetPart]').prop('checked', false);
                                $('#calendarSelectSubmitStaff').val('');
                                $('input[name=calendarInputDiscount]').prop('checked', false);
                                $('#calendar1').fullCalendar('refetchEvents');
                                smallBox('Захиалга', 'Амжилттай хадгалагдлаа', '#659265');
                                $('#calendarAppointmentInsertModal').modal('hide');
                                //$.connection.hub.start().done(function () {
                                //    chat.server.send($.trim($('#indexSessionID').html()));
                                //});
                                e.preventDefault();
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
    });
    //$('#calendarInsertForm').bootstrapValidator({
    //    fields: {
    //        calendarInputAppointmenttype: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarSelectStartTime: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarSelectEndTime: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarSelectRoom: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarSelectChair: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarInputAutono: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                }
    //            }
    //        },
    //        calendarSelectAutomarkType: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarSelectAutomark: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarSelectAutoYear: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarInputFueltype: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarInputTransmission: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarInputVinno: {
    //            group: '.col-md-3',
    //            validators: {
    //                stringLength: {
    //                    min: 6,
    //                    max: 17,
    //                    message: '6-17 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        //calendarInputZaaltType: {
    //        //    group: '.col-md-2',
    //        //    validators: {
    //        //        notEmpty: {
    //        //            message: 'Сонгоно уу'
    //        //        }
    //        //    }
    //        //},
    //        calendarInputKmzaalt: {
    //            group: '.col-md-3',
    //            validators: {
    //                stringLength: {
    //                    max: 8,
    //                    message: 'Уртдаа 8 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Тоон тэмдэгт орно'
    //                }
    //            }
    //        },
    //        calendarInputOwnername: {
    //            group: '.col-md-5',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 100,
    //                    message: 'Уртдаа 100 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        calendarInputTel: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 8,
    //                    message: 'Уртдаа 8 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Тоон тэмдэгт орно'
    //                }
    //            }
    //        },
    //        calendarInputTel2: {
    //            group: '.col-md-2',
    //            validators: {
    //                stringLength: {
    //                    max: 8,
    //                    message: 'Уртдаа 8 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Тоон тэмдэгт орно'
    //                }
    //            }
    //        },
    //        calendarInputType: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarInputAddress: {
    //            group: '.col-md-9',
    //            validators: {
    //                stringLength: {
    //                    max: 150,
    //                    message: 'Уртдаа 150 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        //calendarInputTelEmergency: {
    //        //    group: '.col-md-3',
    //        //    validators: {
    //        //        stringLength: {
    //        //            max: 8,
    //        //            message: 'Уртдаа 8 тэмдэгт авна'
    //        //        },
    //        //        numeric: {
    //        //            message: 'Тоон тэмдэгт орно'
    //        //        }
    //        //    }
    //        //},
    //        //calendarInputTelEmergencyPersonname: {
    //        //    group: '.col-md-7',
    //        //    validators: {
    //        //        stringLength: {
    //        //            max: 100,
    //        //            message: 'Уртдаа 100 тэмдэгт авна'
    //        //        }
    //        //    }
    //        //},
    //        calendarInputRequest: {
    //            group: '.col-md-9',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarInputMemo: {
    //            group: '.col-md-12',
    //            validators: {
    //                stringLength: {
    //                    max: 500,
    //                    message: 'Уртдаа 500 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        calendarSelectSubmitStaff: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        calendarInputDiscount: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        }
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        var allVals = [];
    //        $('input[name=calendarInputRequest]:checked').each(function () {
    //            allVals.push($(this).val());
    //        });
    //        var valEmergencyTelType = '', valIsWashing = '', valIsGetPart = '', valZaaltType = '', valIsMySold = '0', valDiscount = '';
    //        //if ($('input[name=calendarInputTelEmergencyType]:checked').val() != undefined) {
    //        //    valEmergencyTelType = $('input[name=calendarInputTelEmergencyType]:checked').val();
    //        //}
    //        //if ($('input[name=calendarInputWashCar]:checked').val() != undefined) {
    //        //    valIsWashing = $('input[name=calendarInputWashCar]:checked').val();
    //        //}
    //        //if ($('input[name=calendarInputGetPart]:checked').val() != undefined) {
    //        //    valIsGetPart = $('input[name=calendarInputGetPart]:checked').val();
    //        //}
    //        if ($('input[name=calendarInputZaaltType]:checked').val() != undefined) {
    //            valZaaltType = $('input[name=calendarInputZaaltType]:checked').val();
    //        }
    //        if ($('input[name=calendarInputIsMySold]:checked').val() != undefined) {
    //            valIsMySold = $('input[name=calendarInputIsMySold]:checked').val();
    //        }
    //        if ($('input[name=calendarInputDiscount]:checked').val() != undefined) {
    //            valDiscount = $('input[name=calendarInputDiscount]:checked').val();
    //        }
    //        if ($.trim($('#patientID').html()) != '') {
    //            globalAjaxVar = $.ajax({
    //                type: "POST",
    //                url: "../wcf/ServiceMain.svc/INS_APPOINTMENT",
    //                data: '{"CLINIC_ID":"' + $('#indexClinicId').text() + '", "ROOM_ID":"' + $('#calendarSelectRoom option:selected').val() + '", "CHAIRNUM":"' + $("#calendarSelectChair option:selected").val() + '", "PATIENT_ID":"' + $.trim($('#patientID').html()) + '", "DT":"' + $.trim($('#calendarInsertDate').text()) + '", "STARTTIME":"' + $.trim($('#calendarSelectStartTime').val()) + '", "ENDTIME":"' + $.trim($('#calendarSelectEndTime').val()) + '", "APPOINTMENTTYPE":"' + $('input[name=calendarInputAppointmenttype]:checked').val() + '", "REQUESTMEMO":"' + replaceDisplayToDatabase($.trim($('#calendarInputMemo').val())) + '", "REQUESTTYPELISTID":"' + allVals + '", "MILEAGE":"' + $.trim($('#calendarInputKmzaalt').val()) + '", "ISWASHING":"' + valIsWashing + '", "ISGETPART":"' + valIsGetPart + '", "SUBMIT_STAFFID":"' + $('#calendarSelectSubmitStaff option:selected').val() + '", "STAFFID":"' + $.trim($('#indexStaffId').html()) + '"}',
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function () {
    //                    globalAjaxVar = $.ajax({
    //                        type: "POST",
    //                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
    //                        data: '{"qry":"UPDATE TBL_PATIENT SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputOwnername').val()))) + ', [TYPE]=' + strQryIsNull('numeric', $('input[name=calendarInputType]:checked').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#calendarInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#calendarInputTel2').val())) + ', [ADDRESS]=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAddress').val()))) + ', MARK_ID=' + strQryIsNull('numeric', $('#calendarSelectAutomark option:selected').val()) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#calendarSelectAutoYear option:selected').val()) + ', AUTONO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAutono').val()))) + ', VINNO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputVinno').val()))) + ', FUELTYPE=' + strQryIsNull('numeric', $('input[name=calendarInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE=' + strQryIsNull('numeric', $('input[name=calendarInputTransmission]:checked').val()) + ', UPDATED_STAFFID=N\'' + $.trim($('#indexUserName').html()) + '\', UPDATED_DATE=GETDATE(), ZAALTTYPE=' + strQryIsNull('numeric', valZaaltType) + ', ISMYSOLD=' + strQryIsNull('numeric', valIsMySold) + ', PATIENTDISCOUNT_ID=' + strQryIsNull('numeric', valDiscount) + ' WHERE ID=' + $.trim($('#patientID').html()) + '"}',
    //                        contentType: "application/json; charset=utf-8",
    //                        dataType: "json",
    //                        success: function (msg) {
    //                            $('input[name=calendarInputAppointmenttype]').prop('checked', false);
    //                            $('#calendarSelectStartTime').val('');
    //                            $('#calendarSelectEndTime').val('');
    //                            $('#calendarSelectRoom').val('');
    //                            $('#calendarSelectChair').val('');
    //                            $('#patientID').html('');
    //                            $('#calendarInputAutono').val('');
    //                            if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val('');
    //                            else {
    //                                $('#calendarSelectAutomarkType').val('');
    //                                $('#calendarSelectAutomark').val('');
    //                                $('#calendarSelectAutomark').prop('disabled', true);
    //                            }
    //                            $('#calendarSelectAutoYear').val('');
    //                            $('input[name=calendarInputFueltype]').prop('checked', false);
    //                            $('input[name=calendarInputTransmission]').prop('checked', false);
    //                            $('#calendarInputVinno').val('');
    //                            $('input[name=calendarInputZaaltType]').prop('checked', false);
    //                            $('#calendarInputKmzaalt').val('');
    //                            $('#calendarInputIsMySold').prop('checked', false);
    //                            $('#calendarInputOwnername').val('');
    //                            $('#calendarInputTel').val('');
    //                            $('#calendarInputTel2').val('');
    //                            $('input[name=calendarInputType]').prop('checked', false);
    //                            $('input[name=calendarInputRequest]').prop('checked', false);
    //                            $('#calendarInputAddress').val('');
    //                            //$('#calendarInputTelEmergency').val('');
    //                            //$('input[name=calendarInputTelEmergencyType]').prop('checked', false);
    //                            //$('#calendarInputTelEmergencyPersonname').val('');
    //                            $('#calendarInputMemo').val('');
    //                            //$('input[name=calendarInputWashCar]').prop('checked', false);
    //                            //$('input[name=calendarInputGetPart]').prop('checked', false);
    //                            $('#calendarSelectSubmitStaff').val('');
    //                            $('input[name=calendarInputDiscount]').prop('checked', false);
    //                            $('#calendar1').fullCalendar('refetchEvents');
    //                            smallBox('Захиалга', 'Амжилттай хадгалагдлаа', '#659265');
    //                            $('#calendarAppointmentInsertModal').modal('hide');
    //                            //$.connection.hub.start().done(function () {
    //                            //    chat.server.send($.trim($('#indexSessionID').html()));
    //                            //});
    //                            e.preventDefault();
    //                        },
    //                        failure: function (response) {
    //                            alert('FAILURE: ' + response.d);
    //                        },
    //                        error: function (xhr, status, error) {
    //                            window.location = '../#pg/error500.aspx';
    //                        }
    //                    });
    //                },
    //                failure: function (response) {
    //                    alert('FAILURE: ' + response.d);
    //                },
    //                error: function (xhr, status, error) {
    //                    var err = eval("(" + xhr.responseText + ")");
    //                    if (err.Message == $.trim($('#applmtmsg').val())) {
    //                        alert($.trim($('#applmtmsg').val()));
    //                    }
    //                    else window.location = '../#pg/error500.aspx';
    //                }
    //            });
    //        }
    //        else {
    //            var valMaxId = '';
    //            globalAjaxVar = $.ajax({
    //                type: "POST",
    //                url: "../wcf/ServiceMain.svc/ExecuteScalar",
    //                //data: '{"qry":"INSERT INTO TBL_PATIENT (CLINIC_ID, CODE, NAME, [TYPE], TEL, TEL2, VINNO, MARK_ID, PRODUCEDYEAR, AUTONO, FUELTYPE, TRANSMISSIONTYPE, CREATED_STAFFID, CREATED_DATE, EMERGENCYTEL, EMERGENCYTELTYPE, EMERGENCYPERSONNAME, ZAALTTYPE, ISMYSOLD) VALUES (' + $('#indexClinicId').text() + ', dbo.FUNC_GETPATIENTCODE(' + $('#indexClinicId').text() + '), ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputOwnername').val()))) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputType]:checked').val()) + ', ' + strQryIsNull('varchar', $.trim($('#calendarInputTel').val())) + ', ' + strQryIsNull('varchar', $.trim($('#calendarInputTel2').val())) + ', ' + strQryIsNull('nvarchar', $.trim($('#calendarInputVinno').val())) + ', ' + strQryIsNull('numeric', $('#calendarSelectAutomark option:selected').val()) + ', ' + strQryIsNull('numeric', $('#calendarSelectAutoYear option:selected').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAutono').val()))) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputFueltype]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputTransmission]:checked').val()) + ', N\'' + $.trim($('#indexStaffId').html()) + '\', GETDATE(), ' + strQryIsNull('numeric', $('#calendarInputTelEmergency').val()) + ', ' + strQryIsNull('numeric', valEmergencyTelType) + ', ' + strQryIsNull('nvarchar', $.trim($('#calendarInputTelEmergencyPersonname').val())) + ', ' + strQryIsNull('numeric', valZaaltType) + ', ' + valIsMySold + ')     SELECT MAX(ID) FROM TBL_PATIENT"}',
    //                data: '{"qry":"INSERT INTO TBL_PATIENT (CLINIC_ID, CODE, NAME, [TYPE], TEL, TEL2, [ADDRESS], VINNO, MARK_ID, PRODUCEDYEAR, AUTONO, FUELTYPE, TRANSMISSIONTYPE, CREATED_STAFFID, CREATED_DATE, ZAALTTYPE, ISMYSOLD, PATIENTDISCOUNT_ID) VALUES (' + $('#indexClinicId').text() + ', dbo.FUNC_GETPATIENTCODE(' + $('#indexClinicId').text() + '), ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputOwnername').val()))) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputType]:checked').val()) + ', ' + strQryIsNull('varchar', $.trim($('#calendarInputTel').val())) + ', ' + strQryIsNull('varchar', $.trim($('#calendarInputTel2').val())) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAddress').val()))) + ', ' + strQryIsNull('nvarchar', $.trim($('#calendarInputVinno').val())) + ', ' + strQryIsNull('numeric', $('#calendarSelectAutomark option:selected').val()) + ', ' + strQryIsNull('numeric', $('#calendarSelectAutoYear option:selected').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#calendarInputAutono').val()))) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputFueltype]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=calendarInputTransmission]:checked').val()) + ', N\'' + $.trim($('#indexStaffId').html()) + '\', GETDATE(), ' + strQryIsNull('numeric', valZaaltType) + ', ' + valIsMySold + ', ' + strQryIsNull('numeric', valDiscount) + ')     SELECT MAX(ID) FROM TBL_PATIENT"}',
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function (msg) {
    //                    valMaxId = msg.d
    //                    globalAjaxVar = $.ajax({
    //                        type: "POST",
    //                        url: "../wcf/ServiceMain.svc/INS_APPOINTMENT",
    //                        data: '{"CLINIC_ID":"' + $('#indexClinicId').text() + '", "ROOM_ID":"' + $('#calendarSelectRoom option:selected').val() + '", "CHAIRNUM":"' + $("#calendarSelectChair option:selected").val() + '", "PATIENT_ID":"' + valMaxId + '", "DT":"' + $.trim($('#calendarInsertDate').text()) + '", "STARTTIME":"' + $.trim($('#calendarSelectStartTime').val()) + '", "ENDTIME":"' + $.trim($('#calendarSelectEndTime').val()) + '", "APPOINTMENTTYPE":"' + $('input[name=calendarInputAppointmenttype]:checked').val() + '", "REQUESTMEMO":"' + replaceDisplayToDatabase($.trim($('#calendarInputMemo').val())) + '", "REQUESTTYPELISTID":"' + allVals + '", "MILEAGE":"' + $.trim($('#calendarInputKmzaalt').val()) + '", "ISWASHING":"' + valIsWashing + '", "ISGETPART":"' + valIsGetPart + '", "SUBMIT_STAFFID":"' + $('#calendarSelectSubmitStaff option:selected').val() + '", "STAFFID":"' + $.trim($('#indexStaffId').html()) + '"}',
    //                        contentType: "application/json; charset=utf-8",
    //                        dataType: "json",
    //                        success: function () {
    //                            $('input[name=calendarInputAppointmenttype]').prop('checked', false);
    //                            $('#calendarSelectStartTime').val('');
    //                            $('#calendarSelectEndTime').val('');
    //                            $('#calendarSelectRoom').val('');
    //                            $('#calendarSelectChair').val('');
    //                            $('#patientID').html('');
    //                            $('#calendarInputAutono').val('');
    //                            if ($('#calendarSelectAutomarkType').is(':disabled')) $('#calendarSelectAutomark').val('');
    //                            else {
    //                                $('#calendarSelectAutomarkType').val('');
    //                                $('#calendarSelectAutomark').val('');
    //                                $('#calendarSelectAutomark').prop('disabled', true);
    //                            }
    //                            $('#calendarSelectAutoYear').val('');
    //                            $('input[name=calendarInputFueltype]').prop('checked', false);
    //                            $('input[name=calendarInputTransmission]').prop('checked', false);
    //                            $('#calendarInputVinno').val('');
    //                            $('input[name=calendarInputZaaltType]').prop('checked', false);
    //                            $('#calendarInputKmzaalt').val('');
    //                            $('#calendarInputIsMySold').prop('checked', false);
    //                            $('#calendarInputOwnername').val('');
    //                            $('#calendarInputTel').val('');
    //                            $('#calendarInputTel2').val('');
    //                            $('input[name=calendarInputType]').prop('checked', false);
    //                            $('input[name=calendarInputRequest]').prop('checked', false);
    //                            $('#calendarInputAddress').val('');
    //                            //$('#calendarInputTelEmergency').val('');
    //                            //$('input[name=calendarInputTelEmergencyType]').prop('checked', false);
    //                            //$('#calendarInputTelEmergencyPersonname').val('');
    //                            $('#calendarInputMemo').val('');
    //                            //$('input[name=calendarInputWashCar]').prop('checked', false);
    //                            //$('input[name=calendarInputGetPart]').prop('checked', false);
    //                            $('#calendarSelectSubmitStaff').val('');
    //                            $('input[name=calendarInputDiscount]').prop('checked', false);
    //                            $('#calendar1').fullCalendar('refetchEvents');
    //                            smallBox('Захиалга', 'Амжилттай хадгалагдлаа', '#659265');
    //                            $('#calendarAppointmentInsertModal').modal('hide');
    //                            //$.connection.hub.start().done(function () {
    //                            //    chat.server.send($.trim($('#indexSessionID').html()));
    //                            //});
    //                            e.preventDefault();
    //                        },
    //                        failure: function (response) {
    //                            alert('FAILURE: ' + response.d);
    //                        },
    //                        error: function (xhr, status, error) {
    //                            window.location = '../#pg/error500.aspx';
    //                        }
    //                    });
    //                },
    //                failure: function (response) {
    //                    alert('FAILURE: ' + response.d);
    //                },
    //                error: function (xhr, status, error) {
    //                    window.location = '../#pg/error500.aspx';
    //                }
    //            });
    //        }
    //    }
    //});

    //tab1
    //$('#patientModalForm').bootstrapValidator({
    //    fields: {
    //        patientModalInputAutono: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 8,
    //                    message: 'Уртдаа 8 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        patientModalSelectAutomarkType: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        patientModalSelectAutomark: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        patientModalSelectAutoYear: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        patientModalInputFueltype: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        patientModalInputTransmission: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        patientModalInputVinno: {
    //            group: '.col-md-3',
    //            validators: {
    //                stringLength: {
    //                    min: 6,
    //                    max: 17,
    //                    message: '6-17 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        //patientModalInputZaaltType: {
    //        //    group: '.col-md-2',
    //        //    validators: {
    //        //        notEmpty: {
    //        //            message: 'Сонгоно уу'
    //        //        }
    //        //    }
    //        //},
    //        patientModalInputOwnername: {
    //            group: '.col-md-5',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 100,
    //                    message: 'Уртдаа 100 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        patientModalInputTel: {
    //            group: '.col-md-2',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 8,
    //                    message: 'Уртдаа 8 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Тоон тэмдэгт орно'
    //                }
    //            }
    //        },
    //        patientModalInputTel2: {
    //            group: '.col-md-2',
    //            validators: {
    //                stringLength: {
    //                    max: 8,
    //                    message: 'Уртдаа 8 тэмдэгт авна'
    //                },
    //                numeric: {
    //                    message: 'Тоон тэмдэгт орно'
    //                }
    //            }
    //        },
    //        patientModalInputType: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        patientModalInputAddress: {
    //            group: '.col-md-9',
    //            validators: {
    //                stringLength: {
    //                    max: 150,
    //                    message: 'Уртдаа 150 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        //patientModalInputTelEmergency: {
    //        //    group: '.col-md-2',
    //        //    validators: {
    //        //        stringLength: {
    //        //            max: 8,
    //        //            message: 'Уртдаа 8 тэмдэгт авна'
    //        //        },
    //        //        numeric: {
    //        //            message: 'Тоон тэмдэгт орно'
    //        //        }
    //        //    }
    //        //},
    //        //patientModalInputTelEmergencyPersonname: {
    //        //    group: '.col-md-7',
    //        //    validators: {
    //        //        stringLength: {
    //        //            max: 100,
    //        //            message: 'Уртдаа 100 тэмдэгт авна'
    //        //        }
    //        //    }
    //        //},
    //        patientModalInputEmail: {
    //            group: '.col-md-3',
    //            validators: {
    //                emailAddress: {
    //                    message: 'Зөв оруулна уу'
    //                }
    //            }
    //        },
    //        patientModalInputDiscount: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        }
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        var valEmergencyTelType = '', valZaaltType = '', valIsMySold = '0', valDiscount = '';
    //        //if ($('input[name=patientModalInputTelEmergencyType]:checked').val() != undefined) {
    //        //    valEmergencyTelType = $('input[name=patientModalInputTelEmergencyType]:checked').val();
    //        //}
    //        if ($('input[name=patientModalInputZaaltType]:checked').val() != undefined) {
    //            valZaaltType = $('input[name=patientModalInputZaaltType]:checked').val();
    //        }
    //        if ($('input[name=patientModalInputIsMySold]:checked').val() != undefined) {
    //            valIsMySold = $('input[name=patientModalInputIsMySold]:checked').val();
    //        }
    //        if ($('input[name=patientModalInputDiscount]:checked').val() != undefined) {
    //            valDiscount = $('input[name=patientModalInputDiscount]:checked').val();
    //        }
    //        globalAjaxVar = $.ajax({
    //            type: "POST",
    //            url: "../wcf/ServiceMain.svc/ExecuteScalar",
    //            data: '{"qry":"SELECT COUNT(1) FROM TBL_PATIENT WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND ID<>' + $('#appmodaltab1PatientID').text() + ' AND (AUTONO=N\'' + replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val())) + '\')"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (msg) {
    //                if (msg.d == '0') {
    //                    globalAjaxVar = $.ajax({
    //                        type: "POST",
    //                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
    //                        //data: '{"qry":"UPDATE TBL_PATIENT SET CODE=' + strQryIsNull('varchar', $('#patientModalInputCode').val()) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputOwnername').val()))) + ', [TYPE]=' + strQryIsNull('numeric', $('input[name=patientModalInputType]:checked').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel2').val())) + ', EMAIL=' + strQryIsNull('varchar', $.trim($('#patientModalInputEmail').val())) + ', [ADDRESS]=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAddress').val()))) + ', MARK_ID=' + strQryIsNull('numeric', $('#patientModalSelectAutomark option:selected').val()) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#patientModalSelectAutoYear option:selected').val()) + ', AUTONO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val()))) + ', VINNO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputVinno').val()))) + ', FUELTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputTransmission]:checked').val()) + ', UPDATED_STAFFID=N\'' + $.trim($('#indexUserName').html()) + '\', UPDATED_DATE=GETDATE(), EMERGENCYTEL=' + strQryIsNull('numeric', $('#patientModalInputTelEmergency').val()) + ', EMERGENCYTELTYPE=' + strQryIsNull('numeric', valEmergencyTelType) + ', EMERGENCYPERSONNAME=' + strQryIsNull('nvarchar', $.trim($('#patientModalInputTelEmergencyPersonname').val())) + ', ZAALTTYPE=' + strQryIsNull('numeric', valZaaltType) + ', ISMYSOLD=' + strQryIsNull('numeric', valIsMySold) + ' WHERE ID=' + $('#appmodaltab1PatientID').text() + '"}',
    //                        data: '{"qry":"UPDATE TBL_PATIENT SET CODE=' + strQryIsNull('varchar', $('#patientModalInputCode').val()) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputOwnername').val()))) + ', [TYPE]=' + strQryIsNull('numeric', $('input[name=patientModalInputType]:checked').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel2').val())) + ', EMAIL=' + strQryIsNull('varchar', $.trim($('#patientModalInputEmail').val())) + ', [ADDRESS]=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAddress').val()))) + ', MARK_ID=' + strQryIsNull('numeric', $('#patientModalSelectAutomark option:selected').val()) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#patientModalSelectAutoYear option:selected').val()) + ', AUTONO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val()))) + ', VINNO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputVinno').val()))) + ', FUELTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputTransmission]:checked').val()) + ', UPDATED_STAFFID=N\'' + $.trim($('#indexUserName').html()) + '\', UPDATED_DATE=GETDATE(), ZAALTTYPE=' + strQryIsNull('numeric', valZaaltType) + ', ISMYSOLD=' + strQryIsNull('numeric', valIsMySold) + ', PATIENTDISCOUNT_ID=' + strQryIsNull('numeric', valDiscount) + ' WHERE ID=' + $('#appmodaltab1PatientID').text() + '"}',
    //                        contentType: "application/json; charset=utf-8",
    //                        dataType: "json",
    //                        success: function (msg) {
    //                            smallBox('Үйлчлүүлэгчийн мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
    //                        },
    //                        failure: function (response) {
    //                            alert('FAILURE: ' + response.d);
    //                        },
    //                        error: function (xhr, status, error) {
    //                            window.location = '../#pg/error500.aspx';
    //                        }
    //                    });
    //                }
    //                else alert('Улсын дугаар: ' + $.trim($('#patientModalInputAutono').val()) + ', Арал: ' + $.trim($('#patientModalInputVinno').val()) + ' дугаартай үйлчлүүлэгч бүртгэгдсэн байна!');
    //            },
    //            failure: function (response) {
    //                alert('FAILURE: ' + response.d);
    //            },
    //            error: function (xhr, status, error) {
    //                window.location = '../#pg/error500.aspx';
    //            }
    //        });
    //    }
    //});
    $("#patientModalForm").validate({
        rules: {
            patientModalInputAutono: {
                required: true,
                maxlength: 8
            },
            patientModalSelectAutomarkType: {
                required: true
            },
            patientModalSelectAutomark: {
                required: true
            },
            patientModalSelectAutoYear: {
                required: true
            },
            patientModalInputFueltype: {
                required: true
            },
            patientModalInputTransmission: {
                required: true
            },
            patientModalInputVinno: {
                minlength: 6,
                maxlength: 17
            },
            patientModalInputOwnername: {
                required: true,
                maxlength: 100
            },
            patientModalInputTel: {
                required: true,
                maxlength: 8,
                digits: true
            },
            patientModalInputTel2: {
                maxlength: 8,
                digits: true
            },
            patientModalInputType: {
                required: true
            },
            patientModalInputAddress: {
                maxlength: 150
            },
            patientModalInputEmail: {
                email: true
            },
            patientModalInputDiscount: {
                required: true,
            }
        },
        // Messages for form validation
        messages: {
            patientModalInputAutono: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 8 тэмдэгт авна'
            },
            patientModalSelectAutomarkType: {
                required: 'Сонгоно уу'
            },
            patientModalSelectAutomark: {
                required: 'Сонгоно уу'
            },
            patientModalSelectAutoYear: {
                required: 'Сонгоно уу'
            },
            patientModalInputFueltype: {
                required: 'Сонгоно уу'
            },
            patientModalInputTransmission: {
                required: 'Сонгоно уу'
            },
            patientModalInputVinno: {
                minlength: 'Багадаа 6 тэмдэгт авна',
                maxlength: 'Уртдаа 17 тэмдэгт авна'
            },
            patientModalInputOwnername: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 100 тэмдэгт авна'
            },
            patientModalInputTel: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 8 тэмдэгт авна',
                digits: 'Тоон тэмдэгт орно'
            },
            patientModalInputTel2: {
                maxlength: 'Уртдаа 8 тэмдэгт авна',
                digits: 'Тоон тэмдэгт орно'
            },
            patientModalInputType: {
                required: 'Сонгоно уу'
            },
            patientModalInputAddress: {
                maxlength: 'Уртдаа 150 тэмдэгт авна',
            },
            patientModalInputEmail: {
                email: 'Зөв оруулна уу'
            },
            patientModalInputDiscount: {
                required: 'Сонгоно уу',
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            var valEmergencyTelType = '', valZaaltType = '', valIsMySold = '0', valDiscount = '';
            //if ($('input[name=patientModalInputTelEmergencyType]:checked').val() != undefined) {
            //    valEmergencyTelType = $('input[name=patientModalInputTelEmergencyType]:checked').val();
            //}
            if ($('input[name=patientModalInputZaaltType]:checked').val() != undefined) {
                valZaaltType = $('input[name=patientModalInputZaaltType]:checked').val();
            }
            if ($('input[name=patientModalInputIsMySold]:checked').val() != undefined) {
                valIsMySold = $('input[name=patientModalInputIsMySold]:checked').val();
            }
            if ($('input[name=patientModalInputDiscount]:checked').val() != undefined) {
                valDiscount = $('input[name=patientModalInputDiscount]:checked').val();
            }
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT COUNT(1) FROM TBL_PATIENT WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND ID<>' + $('#appmodaltab1PatientID').text() + ' AND (AUTONO=N\'' + replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val())) + '\')"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == '0') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            //data: '{"qry":"UPDATE TBL_PATIENT SET CODE=' + strQryIsNull('varchar', $('#patientModalInputCode').val()) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputOwnername').val()))) + ', [TYPE]=' + strQryIsNull('numeric', $('input[name=patientModalInputType]:checked').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel2').val())) + ', EMAIL=' + strQryIsNull('varchar', $.trim($('#patientModalInputEmail').val())) + ', [ADDRESS]=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAddress').val()))) + ', MARK_ID=' + strQryIsNull('numeric', $('#patientModalSelectAutomark option:selected').val()) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#patientModalSelectAutoYear option:selected').val()) + ', AUTONO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val()))) + ', VINNO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputVinno').val()))) + ', FUELTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputTransmission]:checked').val()) + ', UPDATED_STAFFID=N\'' + $.trim($('#indexUserName').html()) + '\', UPDATED_DATE=GETDATE(), EMERGENCYTEL=' + strQryIsNull('numeric', $('#patientModalInputTelEmergency').val()) + ', EMERGENCYTELTYPE=' + strQryIsNull('numeric', valEmergencyTelType) + ', EMERGENCYPERSONNAME=' + strQryIsNull('nvarchar', $.trim($('#patientModalInputTelEmergencyPersonname').val())) + ', ZAALTTYPE=' + strQryIsNull('numeric', valZaaltType) + ', ISMYSOLD=' + strQryIsNull('numeric', valIsMySold) + ' WHERE ID=' + $('#appmodaltab1PatientID').text() + '"}',
                            data: '{"qry":"UPDATE TBL_PATIENT SET CODE=' + strQryIsNull('varchar', $('#patientModalInputCode').val()) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputOwnername').val()))) + ', [TYPE]=' + strQryIsNull('numeric', $('input[name=patientModalInputType]:checked').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel2').val())) + ', EMAIL=' + strQryIsNull('varchar', $.trim($('#patientModalInputEmail').val())) + ', [ADDRESS]=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAddress').val()))) + ', MARK_ID=' + strQryIsNull('numeric', $('#patientModalSelectAutomark option:selected').val()) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#patientModalSelectAutoYear option:selected').val()) + ', AUTONO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val()))) + ', VINNO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputVinno').val()))) + ', FUELTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputTransmission]:checked').val()) + ', UPDATED_STAFFID=N\'' + $.trim($('#indexUserName').html()) + '\', UPDATED_DATE=GETDATE(), ZAALTTYPE=' + strQryIsNull('numeric', valZaaltType) + ', ISMYSOLD=' + strQryIsNull('numeric', valIsMySold) + ', PATIENTDISCOUNT_ID=' + strQryIsNull('numeric', valDiscount) + ' WHERE ID=' + $('#appmodaltab1PatientID').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                smallBox('Үйлчлүүлэгчийн мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    }
                    else alert('Улсын дугаар: ' + $.trim($('#patientModalInputAutono').val()) + ', Арал: ' + $.trim($('#patientModalInputVinno').val()) + ' дугаартай үйлчлүүлэгч бүртгэгдсэн байна!');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    //tab2
    //$('#appmodaltab2Form').bootstrapValidator({
    //    //feedbackIcons: {
    //    //    valid: 'glyphicon glyphicon-ok',
    //    //    invalid: 'glyphicon glyphicon-remove',
    //    //    validating: 'glyphicon glyphicon-refresh'
    //    //},
    //    fields: {
    //        appmodaltab2CheckDiagnostic: {
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        appmodaltab2InputDescription: {
    //            validators: {
    //                stringLength: {
    //                    max: 1000,
    //                    message: 'Уртдаа 1000 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        appmodaltab2SelectSeniorMechanical: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        appmodaltab2SelectMechanical: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        },
    //        appmodaltab2SelectServiceConsultant: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        }
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        var allVals = [];
    //        $('input[name=appmodaltab2CheckDiagnostic]:checked').each(function () {
    //            allVals.push($(this).val());
    //        });
    //        globalAjaxVar = $.ajax({
    //            type: "POST",
    //            url: "../wcf/ServiceMain.svc/INSUPD_APPDIAGNOSTIC",
    //            data: '{"APPOINTMENT_ID":"' + $('#appointmentID').text() + '", "DIAGNOSTICLISTID":"' + allVals + '", "DIAGNOSTIC_NAME":"' + replaceDisplayToDatabase($.trim($('#appmodaltab2InputDescription').val()).replace(/\r?\n/g, '<br>')) + '", "SENIORMECHANICAL_STAFFID":"' + $('#appmodaltab2SelectSeniorMechanical option:selected').val() + '", "MECHANICAL_STAFFID":"' + $('#appmodaltab2SelectMechanical option:selected').val() + '", "SERVICECONSULTANT_STAFFID":"' + $('#appmodaltab2SelectServiceConsultant option:selected').val() + '", "STAFFID":"' + $('#indexStaffId').text() + '"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function () {
    //                smallBox('Оношлогоо', 'Амжилттай хадгалагдлаа', '#659265');
    //            },
    //            failure: function (response) {
    //                alert('FAILURE: ' + response.d);
    //            },
    //            error: function (xhr, status, error) {
    //                window.location = '../#pg/error500.aspx';
    //            }
    //        });
    //    }
    //});
    $("#appmodaltab2Form").validate({
        rules: {
            appmodaltab2CheckDiagnostic: {
                required: true
            },
            appmodaltab2InputDescription: {
                maxlength: 1000
            },
            appmodaltab2SelectSeniorMechanical: {
                required: true
            },
            appmodaltab2SelectMechanical: {
                required: true
            },
            appmodaltab2SelectServiceConsultant: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            appmodaltab2CheckDiagnostic: {
                required: 'Сонгоно уу'
            },
            appmodaltab2InputDescription: {
                maxlength: 'Уртдаа 1000 тэмдэгт авна'
            },
            appmodaltab2SelectSeniorMechanical: {
                required: 'Сонгоно уу'
            },
            appmodaltab2SelectMechanical: {
                required: 'Сонгоно уу'
            },
            appmodaltab2SelectServiceConsultant: {
                required: 'Сонгоно уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            var allVals = [];
            $('input[name=appmodaltab2CheckDiagnostic]:checked').each(function () {
                allVals.push($(this).val());
            });
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/INSUPD_APPDIAGNOSTIC",
                data: '{"APPOINTMENT_ID":"' + $('#appointmentID').text() + '", "DIAGNOSTICLISTID":"' + allVals + '", "DIAGNOSTIC_NAME":"' + replaceDisplayToDatabase($.trim($('#appmodaltab2InputDescription').val()).replace(/\r?\n/g, '<br>')) + '", "SENIORMECHANICAL_STAFFID":"' + $('#appmodaltab2SelectSeniorMechanical option:selected').val() + '", "MECHANICAL_STAFFID":"' + $('#appmodaltab2SelectMechanical option:selected').val() + '", "SERVICECONSULTANT_STAFFID":"' + $('#appmodaltab2SelectServiceConsultant option:selected').val() + '", "STAFFID":"' + $('#indexStaffId').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Оношлогоо', 'Амжилттай хадгалагдлаа', '#659265');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    
    $('#calendarAppointmentModalInputDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя']
    }).change(calendarAppointmentModalInputDateChanged).on('changeDate', calendarAppointmentModalInputDateChanged);
    $('#btn-calendar').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        constrainInput: true,
        showOn: 'button',
        buttonText: 'Select...',
        buttonImageOnly: true,
        buttonImage: '../img/Apps-Calendar-Metro-icon.png'
    }).change(calendarDateChanged).on('changeDate', calendarDateChanged);
    function calendarDateChanged(ev) {
        $('#calendarInsertDate').text($('#btn-calendar').val());
        $('#calendar1').fullCalendar('gotoDate', $('#btn-calendar').val());
        //reloadCalendar();
        drawActiveWorkedMechanic();
        return false;
    }

    function reloadCalendar() {
        var view = $('#calendar1').fullCalendar('getView');
        var calendarNewSource = '';
        calendarNewSource = '/pg/calendarjson.aspx?tp=' + view.name + '&dtbegin=' + view.start.format().split('T')[0] + '&dtend=' + view.end.format().split('T')[0] + '&room=' + $('#calendarCurrentRoomId').text();
        //$('#calendar1').fullCalendar('removeEvents').fullCalendar('removeEventSources').fullCalendar('addEventSource', calendarNewSource).fullCalendar('refetchEvents');
        $('#calendar1').fullCalendar('removeEvents');
        $('#calendar1').fullCalendar('removeEventSource', calendarSource);
        $('#calendar1').fullCalendar('addEventSource', calendarNewSource);
        $('#calendar1').fullCalendar('refetchEvents');
        calendarSource = calendarNewSource;
        //$('#calendarAppointmentInsertModal').modal('hide');
    }


    //swap patient
    $("#calendarswappatient-setting").click(function () {
        $(".calendarswappatient").toggleClass("activate");
    });
    $("#calendarSwapPatientBtnAutoNoFilter").click(function () {
        var valData = '';
        if ($.trim($('#calendarSwapPatientInputAutoNoFilter').val()).length == 8) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT COUNT(1) FROM TBL_PATIENT WHERE AUTONO=N\'' + $.trim($("#calendarSwapPatientInputAutoNoFilter").val()) + '\'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d != '0') {
                        $.SmartMessageBox({
                            title: "",
                            content: "Та сонгосон үйлчлүүлэгч солихдоо итгэлтэй байна уу?",
                            buttons: '[Үгүй][Тийм]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed === "Тийм") {
                                showLoader('loaderCalendarTab1');
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../wcf/ServiceMain.svc/ExecuteScalar",
                                    data: '{"qry":"SELECT ISNULL(CAST(ID as varchar),\'\')+\'~\'+ISNULL(NAME,\'\')+\'~\'+ISNULL(CAST(TYPE as varchar),\'\')+\'~\'+ISNULL(TEL,\'\')+\'~\'+ISNULL(TEL2,\'\')+\'~\'+ISNULL(EMAIL,\'\')+\'~\'+ISNULL(ADDRESS,\'\')+\'~\'+ISNULL(CAST(MARK_ID as varchar),\'\')+\'~\'+ISNULL(CAST(PRODUCEDYEAR as varchar),\'\')+\'~\'+ISNULL(AUTONO,\'\')+\'~\'+ISNULL(VINNO,\'\')+\'~\'+ISNULL(CAST(FUELTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(TRANSMISSIONTYPE as varchar),\'\')+\'~\'+ISNULL(CODE,\'\')+\'~\'+ISNULL(CAST(EMERGENCYTEL as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYTELTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYPERSONNAME as varchar),\'\')+\'~\'+ISNULL(CAST(ZAALTTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(ISMYSOLD as varchar),\'\')+\'~\'+ISNULL(CAST(PATIENTDISCOUNT_ID as varchar),\'\') FROM TBL_PATIENT WHERE AUTONO=N\'' + $.trim($("#calendarSwapPatientInputAutoNoFilter").val()) + '\'"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) {
                                        $('#appmodaltab1PatientID').html(msg.d.split('~')[0]);
                                        $('#patientModalInputCode').val(msg.d.split('~')[13]);
                                        $('#patientModalInputOwnername').val(replaceDatabaseToDisplay(msg.d.split('~')[1]));
                                        $('input[name=patientModalInputType]').prop('checked', false);
                                        if (msg.d.split('~')[2] == '1') $('#patientModalInputType1').prop('checked', true);
                                        else if (msg.d.split('~')[2] == '0') $('#patientModalInputType2').prop('checked', true);
                                        $('#patientModalInputTel').val(msg.d.split('~')[3]);
                                        $('#patientModalInputTel2').val(msg.d.split('~')[4]);
                                        $('#patientModalInputEmail').val(msg.d.split('~')[5]);
                                        $('#patientModalInputAddress').val(replaceDatabaseToDisplay(msg.d.split('~')[6]));
                                        var valAutomarkId = msg.d.split('~')[7];
                                        if ($('#patientModalSelectAutomarkType').is(':disabled')) $('#patientModalSelectAutomark').val(valAutomarkId);
                                        else {
                                            globalAjaxVar = $.ajax({
                                                type: "POST",
                                                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                                                data: '{"qry":"SELECT AUTOMARK_TYPE_ID FROM TBL_AUTOMARK WHERE ID = ' + valAutomarkId + '"}',
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (msg) {
                                                    $('#patientModalSelectAutomarkType').val(msg.d);
                                                    globalAjaxVar = $.ajax({
                                                        type: "POST",
                                                        url: "../wcf/ServiceMain.svc/CalendarAutomarkListForDDL",
                                                        data: '{"automarktype":"' + $('#patientModalSelectAutomarkType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                                                        contentType: "application/json; charset=utf-8",
                                                        dataType: "json",
                                                        success: function (data) {
                                                            valData = '';
                                                            $($.parseJSON(data.d)).each(function (index, value) {
                                                                valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                                                            });
                                                            $('#patientModalSelectAutomark').html('<option value="" lang="mn">- Сонго -</option>' + valData);
                                                            $('#patientModalSelectAutomark').val(valAutomarkId);
                                                            $('#patientModalSelectAutomark').prop('disabled', false);
                                                        },
                                                        failure: function (response) {
                                                            alert('FAILURE: ' + response.d);
                                                        },
                                                        error: function (xhr, status, error) {
                                                            window.location = '../#pg/error500.aspx';
                                                        }
                                                    });
                                                },
                                                failure: function (response) {
                                                    alert('FAILURE: ' + response.d);
                                                },
                                                error: function (xhr, status, error) {
                                                    window.location = '../#pg/error500.aspx';
                                                }
                                            });
                                        }
                                        $('#patientModalSelectAutoYear').val(msg.d.split('~')[8]);
                                        $('#patientModalInputAutono').val(msg.d.split('~')[9]);
                                        $('#patientModalInputVinno').val(msg.d.split('~')[10]);
                                        $('input[name=patientModalInputZaaltType]').prop('checked', false);
                                        if (msg.d.split('~')[17] == '1') $('#patientModalInputZaaltType1').prop('checked', true);
                                        else if (msg.d.split('~')[17] == '2') $('#patientModalInputZaaltType2').prop('checked', true);
                                        $('input[name=patientModalInputFueltype]').prop('checked', false);
                                        if (msg.d.split('~')[11] == '1') $('#patientModalInputFueltype1').prop('checked', true);
                                        else if (msg.d.split('~')[11] == '0') $('#patientModalInputFueltype2').prop('checked', true);
                                        $('input[name=patientModalInputTransmission]').prop('checked', false);
                                        if (msg.d.split('~')[12] == '1') $('#patientModalInputTransmission1').prop('checked', true);
                                        else if (msg.d.split('~')[12] == '0') $('#patientModalInputTransmission2').prop('checked', true);
                                        //$('#patientModalInputTelEmergency').val(msg.d.split('~')[14]);
                                        //$('input[name="patientModalInputTelEmergencyType"]').prop('checked', false);
                                        //if (msg.d.split('~')[15] == '1') $('#patientModalInputTelEmergencyType1').prop('checked', true);
                                        //else if (msg.d.split('~')[15] == '2') $('#patientModalInputTelEmergencyType2').prop('checked', true);
                                        //else if (msg.d.split('~')[15] == '3') $('#patientModalInputTelEmergencyType3').prop('checked', true);
                                        //$('#patientModalInputTelEmergencyPersonname').val(msg.d.split('~')[16]);
                                        $('input[name=patientModalInputIsMySold]').prop('checked', false);
                                        if (msg.d.split('~')[18] == '1') $('#patientModalInputIsMySold').prop('checked', true);
                                        $('input[name=patientModalInputDiscount]').prop('checked', false);
                                        if (msg.d.split('~')[19] != '') $('#patientModalInputDiscount' + msg.d.split('~')[19]).prop('checked', true);
                                        hideLoader('loaderCalendarTab1');
                                        globalAjaxVar = $.ajax({
                                            type: "POST",
                                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                            data: '{"qry":"UPDATE TBL_APPOINTMENT SET PATIENT_ID=' + $('#appmodaltab1PatientID').html() + ' WHERE ID=' + $('#appointmentID').text() + '"}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function () {
                                                //reloadCalendar();
                                                $('#calendar1').fullCalendar('refetchEvents');
                                                smallBox('Үйлчлүүлэгч', 'Амжилттай солигдлоо', '#659265');
                                                //$.connection.hub.start().done(function () {
                                                //    chat.server.send($.trim($('#indexSessionID').html()));
                                                //});
                                            },
                                            failure: function (response) {
                                                alert('FAILURE: ' + response.d);
                                            },
                                            error: function (xhr, status, error) {
                                                window.location = '../#pg/error500.aspx';
                                            }
                                        });
                                    },
                                    failure: function (response) {
                                        alert('FAILURE: ' + response.d);
                                    },
                                    error: function (xhr, status, error) {
                                        window.location = '../#pg/error500.aspx';
                                    }
                                });
                            }
                        });
                    }
                    else alert($.trim($('#calendarSwapPatientInputAutoNoFilter').val()) + ' бүртгэлтэй улсын дугаар олдсонгүй! Дахин шалгана уу!');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
        else alert('Солих үйлчлүүлэгчийн улсын дугаар гүйцэт оруулна уу!');
    });
    
    $("#calendarSelectAutomarkType").change(function () {
        var valData = '';
        if ($('#calendarSelectAutomarkType option:selected').val() == '') {
            $('#calendarSelectAutomark').html('<option value="">- Сонго -</option>');
            $('#calendarSelectAutomark').prop('disabled', true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/CalendarAutomarkListForDDL",
                data: '{"automarktype":"' + $('#calendarSelectAutomarkType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                    });
                    $('#calendarSelectAutomark').html('<option value="" lang="mn">- Сонго -</option>' + valData);
                    $('#calendarSelectAutomark').prop('disabled', false);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#patientModalSelectAutomarkType").change(function () {
        var valData = '';
        if ($('#patientModalSelectAutomarkType option:selected').val() == '') {
            $('#patientModalSelectAutomark').html('<option value="">- Сонго -</option>');
            $('#patientModalSelectAutomark').prop('disabled', true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/CalendarAutomarkListForDDL",
                data: '{"automarktype":"' + $('#patientModalSelectAutomarkType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                    });
                    $('#patientModalSelectAutomark').html('<option value="" lang="mn">- Сонго -</option>' + valData);
                    $('#patientModalSelectAutomark').prop('disabled', false);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });

    //mechanic irts
    //$('#calendarActiveMechanicModalForm').bootstrapValidator({
    //    fields: {
    //        calendarActiveMechanicModalSelectStaff: {
    //            group: '.col-md-12',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Сонгоно уу'
    //                }
    //            }
    //        }
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        var valStaffList = '';
    //        $('input[name="calendarActiveMechanicModalSelectStaff"]:checked').each(function () {
    //            if (valStaffList != '') valStaffList += ',';
    //            valStaffList += $(this).val();
    //        });
    //        globalAjaxVar = $.ajax({
    //            type: "POST",
    //            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
    //            data: '{"qry":"DELETE FROM TBL_STAFFTRCDLOG WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND DT=\'' + $('#calendarInsertDate').text() + '\'     INSERT INTO TBL_STAFFTRCDLOG (CLINIC_ID, STAFF_ID, DT) SELECT ' + $('#indexClinicId').text() + ' as CLINIC_ID, CAST(DATA as numeric) as STAFF_ID, \'' + $('#calendarInsertDate').text() + '\' as DT FROM dbo.FUNC_SPLIT(\',\',\'' + valStaffList + '\')"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function () {
    //                drawActiveCameMechanic();
    //                $('#calendarActiveMechanicModal').modal('hide');
    //                smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
    //            },
    //            failure: function (response) {
    //                alert('FAILURE: ' + response.d);
    //            },
    //            error: function (xhr, status, error) {
    //                window.location = '../#pg/error500.aspx';
    //            }
    //        });
    //    }
    //});
    $("#calendarActiveMechanicModalForm").validate({
        rules: {
            calendarActiveMechanicModalSelectStaff: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            calendarActiveMechanicModalSelectStaff: {
                required: 'Сонгоно уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            var valStaffList = '';
            $('input[name="calendarActiveMechanicModalSelectStaff"]:checked').each(function () {
                if (valStaffList != '') valStaffList += ',';
                valStaffList += $(this).val();
            });
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"DELETE FROM TBL_STAFFTRCDLOG WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND DT=\'' + $('#calendarInsertDate').text() + '\'     INSERT INTO TBL_STAFFTRCDLOG (CLINIC_ID, STAFF_ID, DT) SELECT ' + $('#indexClinicId').text() + ' as CLINIC_ID, CAST(DATA as numeric) as STAFF_ID, \'' + $('#calendarInsertDate').text() + '\' as DT FROM dbo.FUNC_SPLIT(\',\',\'' + valStaffList + '\')"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    drawActiveCameMechanic();
                    $('#calendarActiveMechanicModal').modal('hide');
                    smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });

    //appointment cancel description insert/update
    function appmodalCalendarAppType5DescriptionAddEdit(istp5) {
        $('#appmodalCalendarAppType5DescriptionModalIsSetAppType5').html(istp5);
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT APPCANCELINFO FROM TBL_APPOINTMENT WHERE ID=' + $.trim($('#appointmentID').html()) + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == '') {
                    $('#appmodalCalendarAppType5DescriptionModalHeaderLabel').html('нэмэх');
                    $('#appmodalCalendarAppType5DescriptionModalTextareaDesc').val('');
                }
                else {
                    $('#appmodalCalendarAppType5DescriptionModalHeaderLabel').html('засах');
                    $('#appmodalCalendarAppType5DescriptionModalTextareaDesc').val(replaceDatabaseToDisplay(data.d));
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        $('#appmodalCalendarAppType5DescriptionModalForm').find('.modal-footer').find(':submit').prop('disabled',false);
    }
    //$('#appmodalCalendarAppType5DescriptionModalForm').bootstrapValidator({
    //    fields: {
    //        appmodalCalendarAppType5DescriptionModalTextareaDesc: {
    //            group: '.col-md-12',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 750,
    //                    message: 'Уртдаа 750 тэмдэгт авна'
    //                }
    //            }
    //        }
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        var valStaffList = '';
    //        $('input[name="calendarActiveMechanicModalSelectStaff"]:checked').each(function () {
    //            if (valStaffList != '') valStaffList += ',';
    //            valStaffList += $(this).val();
    //        });
    //        globalAjaxVar = $.ajax({
    //            type: "POST",
    //            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
    //            data: '{"qry":"UPDATE TBL_APPOINTMENT SET APPCANCELINFO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#appmodalCalendarAppType5DescriptionModalTextareaDesc').val()).replace(/\r?\n/g, '<br>'))) + ' WHERE ID=' + $.trim($('#appointmentID').html()) + '"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function () {
    //                if ($('#appmodalCalendarAppType5DescriptionModalIsSetAppType5').html() == '1') {
    //                    globalAjaxVar = $.ajax({
    //                        type: "POST",
    //                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
    //                        data: '{"qry":"UPDATE TBL_APPOINTMENT SET APPOINTMENT_TYPE_ID=5 WHERE ID=' + $('#appointmentID').text() + '"}',
    //                        contentType: "application/json; charset=utf-8",
    //                        dataType: "json",
    //                        success: function () {
    //                            //reloadCalendar();
    //                            $('#calendar1').fullCalendar('refetchEvents');
    //                            drawActiveWorkedMechanic();
    //                            $('#appmodalCalendarAppType5DescriptionModal').modal('hide');
    //                            smallBox('Цуцлагдсан тайлбар', 'Амжилттай хадгалагдлаа', '#659265');
    //                            //$.connection.hub.start().done(function () {
    //                            //    chat.server.send($.trim($('#indexSessionID').html()));
    //                            //});
    //                        },
    //                        failure: function (response) {
    //                            alert('FAILURE: ' + response.d);
    //                        },
    //                        error: function (xhr, status, error) {
    //                            window.location = '../#pg/error500.aspx';
    //                        }
    //                    });
    //                }
    //                else {
    //                    $('#appmodalCalendarAppType5DescriptionModal').modal('hide');
    //                    smallBox('Цуцлагдсан тайлбар', 'Амжилттай хадгалагдлаа', '#659265');
    //                }
    //            },
    //            failure: function (response) {
    //                alert('FAILURE: ' + response.d);
    //            },
    //            error: function (xhr, status, error) {
    //                window.location = '../#pg/error500.aspx';
    //            }
    //        });
    //    }
    //});
    $("#appmodalCalendarAppType5DescriptionModalForm").validate({
        rules: {
            appmodalCalendarAppType5DescriptionModalTextareaDesc: {
                required: true,
                maxlength: 750
            }
        },
        // Messages for form validation
        messages: {
            appmodalCalendarAppType5DescriptionModalTextareaDesc: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 750 тэмдэгт авна'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            var valStaffList = '';
            $('input[name="calendarActiveMechanicModalSelectStaff"]:checked').each(function () {
                if (valStaffList != '') valStaffList += ',';
                valStaffList += $(this).val();
            });
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"UPDATE TBL_APPOINTMENT SET APPCANCELINFO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#appmodalCalendarAppType5DescriptionModalTextareaDesc').val()).replace(/\r?\n/g, '<br>'))) + ' WHERE ID=' + $.trim($('#appointmentID').html()) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    if ($('#appmodalCalendarAppType5DescriptionModalIsSetAppType5').html() == '1') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            data: '{"qry":"UPDATE TBL_APPOINTMENT SET APPOINTMENT_TYPE_ID=5 WHERE ID=' + $('#appointmentID').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                //reloadCalendar();
                                $('#calendar1').fullCalendar('refetchEvents');
                                drawActiveWorkedMechanic();
                                $('#appmodalCalendarAppType5DescriptionModal').modal('hide');
                                smallBox('Цуцлагдсан тайлбар', 'Амжилттай хадгалагдлаа', '#659265');
                                //$.connection.hub.start().done(function () {
                                //    chat.server.send($.trim($('#indexSessionID').html()));
                                //});
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    }
                    else {
                        $('#appmodalCalendarAppType5DescriptionModal').modal('hide');
                        smallBox('Цуцлагдсан тайлбар', 'Амжилттай хадгалагдлаа', '#659265');
                    }
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
</script>

