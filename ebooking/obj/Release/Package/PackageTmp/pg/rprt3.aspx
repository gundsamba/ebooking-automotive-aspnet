<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rprt3.aspx.cs" Inherits="ebooking.pg.rprt3" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-medkit fa-fw "></i> 
			<span lang="mn">Ерөнхий тайлан</span>
		</h1>
	</div>
</div>
<section id="widget-grid" class="">
    <div class="row">
	    <div class="col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs bordered">
			    <li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
				    <a href="#s1" data-toggle="tab" lang="mn">Үйлчлүүлэгчийн үйлчлүүлсэн тоо</a>
			    </li>
			    <li id="pTab2Li" onclick="pDatabindTabs(this)">
				    <a href="#s2" data-toggle="tab" lang="mn">Weekly analyze</a>
			    </li>
			    <li id="pTab3Li" onclick="pDatabindTabs(this)">
				    <a href="#s3" data-toggle="tab" lang="mn">Ажилтны үзүүлсэн засвар үйлчилгээ</a>
			    </li>
			    <li id="pTab4Li" onclick="pDatabindTabs(this)">
				    <a href="#s4" data-toggle="tab" lang="mn">Ажилтны үзүүлсэн оношлогоо</a>
			    </li>
		    </ul>
            <div id="myTabContent1" class="tab-content">
                <div class="tab-pane fade in active" id="s1">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:45px; float: left; line-height: 14px;" lang="mn">Эхлэх<br />огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="pTab1SelectStartDate" runat="server" type="text" name="pTab1SelectStartDate">
                                    </label>
                                </div>
                                <div style="width:50px; float: left; line-height: 14px;" lang="mn">Дуусах<br />огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="pTab1SelectEndDate" runat="server" type="text" name="pTab1SelectEndDate">
                                    </label>
                                </div>
                                <div style="width:105px; float: left; line-height: 14px;" lang="mn">Манайхаас худалдан авсан:</div>
                                <div style="width:70px; float: left; margin-right: 10px;">
                                    <select id="pTab1SelectIsMySold" runat="server" class="form-control" style="padding:1px;"><option value="">- Нийт -</option><option value="1">Тийм</option><option value="0">Үгүй</option></select>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab1', 'Ерөнхий тайлан')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab1')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab1')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="loaderTab1" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab1" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <span lang="mn">ҮЙЛЧЛҮҮЛЭГЧИЙН ҮЙЛЧЛҮҮЛСЭН ТОО</span> /<label id="pTab1BeginDate" runat="server"></label> - <label id="pTab1EndDate" runat="server"></label>/
                            </div>
                            <div id="divBindTab1Table"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="s2">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:55px; float: left; margin-right: 10px;">
                                    <select id="pTab1SelectYear" runat="server" class="form-control" style="padding:1px;"></select>
                                </div>
                                <div style="width:65px; float: left; margin-right: 10px;">
                                    <select id="pTab1SelectMonth" runat="server" class="form-control" style="padding:1px;">
                                        <option value="1">1 сар</option>
                                        <option value="2">2 сар</option>
                                        <option value="3">3 сар</option>
                                        <option value="4">4 сар</option>
                                        <option value="5">5 сар</option>
                                        <option value="6">6 сар</option>
                                        <option value="7">7 сар</option>
                                        <option value="8">8 сар</option>
                                        <option value="9">9 сар</option>
                                        <option value="10">10 сар</option>
                                        <option value="11">11 сар</option>
                                        <option value="12">12 сар</option>
                                    </select>
                                </div>
                                <div style="width:105px; float: left; line-height: 14px;" lang="mn">Манайхаас худалдан авсан:</div>
                                <div style="width:70px; float: left; margin-right: 10px;">
                                    <select id="pTab2SelectIsMySold" runat="server" class="form-control" style="padding:1px;"><option value="">- Нийт -</option><option value="1">Тийм</option><option value="0">Үгүй</option></select>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab2', 'Weekly analyze')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab2')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab2')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="loaderTab2" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab2" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px; width:auto; overflow-x: scroll;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <span lang="mn">WEEKLY ANALYZE</span> /<label id="pTab2Month" runat="server" style="font-weight:bold;"></label> MONTH/
                            </div>
                            <div id="divBindTab2Table"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="s3">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:45px; float: left; line-height: 14px;" lang="mn">Эхлэх<br />огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="pTab3SelectStartDate" runat="server" type="text" name="pTab3SelectStartDate">
                                    </label>
                                </div>
                                <div style="width:50px; float: left; line-height: 14px;" lang="mn">Дуусах<br />огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="pTab3SelectEndDate" runat="server" type="text" name="pTab3SelectEndDate">
                                    </label>
                                </div>
                                <div style="width:65px; float: left; line-height: 14px;" lang="mn">Ажилтан:</div>
                                <div style="width:170px; float: left; margin-right: 30px;">
                                    <select id="pTab3SelectStaff" runat="server" class="form-control" style="padding:1px;"><option value="">- Сонго -</option></select>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab3', 'Ажилтны үзүүлсэн засвар үйлчилгээ')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab3')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab3')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="loaderTab3" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab3" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <label id="pTab3Staff" runat="server" style="font-weight:bold;"></label><span lang="mn">-Н ҮЗҮҮЛСЭН ЗАСВАР ҮЙЛЧИЛГЭЭ</span> /<label id="pTab3BeginDate" runat="server" style="font-weight:bold;"></label> - <label id="pTab3EndDate" runat="server" style="font-weight:bold;"></label>/
                            </div>
                            <div id="divBindTab3Table"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="s4">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:45px; float: left; line-height: 14px;" lang="mn">Эхлэх<br />огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="pTab4SelectStartDate" runat="server" type="text" name="pTab4SelectStartDate">
                                    </label>
                                </div>
                                <div style="width:50px; float: left; line-height: 14px;" lang="mn">Дуусах<br />огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="pTab4SelectEndDate" runat="server" type="text" name="pTab4SelectEndDate">
                                    </label>
                                </div>
                                <div style="width:65px; float: left; line-height: 14px;" lang="mn">Ажилтан:</div>
                                <div style="width:170px; float: left; margin-right: 30px;">
                                    <select id="pTab4SelectStaff" runat="server" class="form-control" style="padding:1px;"><option value="">- Сонго -</option></select>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab4', 'Ажилтны үзүүлсэн оношлогоо')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab4')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab4')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="loaderTab4" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab4" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <label id="pTab4Staff" runat="server" style="font-weight:bold;"></label><span lang="mn">-Н ҮЗҮҮЛСЭН ОНОШЛОГОО</span> /<label id="pTab4BeginDate" runat="server" style="font-weight:bold;"></label> - <label id="pTab4EndDate" runat="server" style="font-weight:bold;"></label>/
                            </div>
                            <div id="divBindTab4Table"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div id="rprt3InfoModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="z-index:1051;">
	<div class="modal-dialog modal-lg" style="width:210mm;">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group pull-right">
                    <a href="javascript:void(0);" class="btn btn-default" data-dismiss="modal" aria-hidden="true" rel="tooltip" data-placement="top" data-original-title="Хаах">x</a>
                </div>
                <div class="btn-group pull-right">
		            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#rprt3InfoModalContent')"><i class="fa fa-print"></i></a>
	            </div>
            </div>
        </div>
        <div id="rprt3InfoModalContent" class="modal-content">

        </div>
    </div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        var valData = '';
        dataBindTab1Table();
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    function pDatabindTabs(el) {
        if ($.trim($(el).attr('id')) == 'pTab1Li') {
            if ($.trim($('#divBindTab1Table').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#divBindTab2Table').html()) == "") {
                dataBindTab2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#divBindTab3Table').html()) == "") {
                dataBindTab3DataTableFirst();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab4Li') {
            if ($.trim($('#divBindTab4Table').html()) == "") {
                dataBindTab4DataTableFirst();
            }
        }
    }
    //tab1
    function dataBindTab1Table() {
        var valData = '';
        var valTotalCnt = 0;
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt3Tab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $.trim($('#pTab1SelectStartDate').val()) + '", "enddate":"' + $.trim($('#pTab1SelectEndDate').val()) + '", "ismysold":"' + $('#pTab1SelectIsMySold option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valTotalCnt = 0;
                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;\">";
                valData += "<tbody>";
                valData += "<tr style=\"background-color:#C6D9F1;\">";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">#</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Арал/дугаар</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">У/дугаар</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Эзэмшигч/нэр</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Төрөл</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Загвар</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Он</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">ҮЙЛЧЛҮҮЛСЭН ТОО</th>";
                valData += "</tr>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valTotalCnt += parseInt(value.APPOINTMENTCNT);
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" data-id=\""+value.ID+"\">" + value.RW + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.VINNO) + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + value.AUTONO + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + value.TYPE + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.PRODUCEDYEAR + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><a href=\"../pg/rprt3Tab1ModalInfo.aspx?id=" + value.ID + "&begindt=" + $.trim($('#pTab1SelectStartDate').val()) + "&enddt=" + $.trim($('#pTab1SelectEndDate').val()) + "\" data-toggle=\"modal\" data-target=\"#rprt3InfoModal\" class=\"btn btn-link btn-xs\">" + value.APPOINTMENTCNT + "</a></td>";
                    valData += "</tr>";
                });
                valData += "<tr>";
                valData += "<th colspan=\"7\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">НИЙТ</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + valTotalCnt + "</th>";
                valData += "</tr>";
                valData += "</tbody>";
                valData += "</table>";
                $("#divBindTab1Table").html(valData);
                $('#pTab1BeginDate').text($('#pTab1SelectStartDate').val());
                $('#pTab1EndDate').text($('#pTab1SelectEndDate').val());
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dateChangedTab1(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "pTab1SelectStartDate") {
            if ($.trim($('#pTab1SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#pTab1SelectEndDate').val().split('-')[0], $('#pTab1SelectEndDate').val().split('-')[1], $('#pTab1SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab1Table();
                }
            }
        }
        else if ($(this).attr('id') == "pTab1SelectEndDate") {
            if ($.trim($('#pTab1SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#pTab1SelectStartDate').val().split('-')[0], $('#pTab1SelectStartDate').val().split('-')[1], $('#pTab1SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab1Table();
                }
            }
        }
    }
    $("#pTab1SelectIsMySold").change(function () {
        dataBindTab1Table();
    });
    $('#pTab1SelectStartDate, #pTab1SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab1).on('changeDate', dateChangedTab1);

    //tab2
    function dataBindTab2Table() {
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt3Tab2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "yr":"' + $('#pTab1SelectYear option:selected').val() + '", "mnth":"' + $('#pTab1SelectMonth option:selected').val() + '", "ismysold":"' + $('#pTab2SelectIsMySold option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#divBindTab2Table").html(replaceDatabaseToDisplay(data.d));
                $('#pTab2Month').html($('#pTab1SelectMonth option:selected').val());
                hideLoader('loaderTab2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });



        //var valData = '';
        //var valRequestListId = '', valRequestListName = '';
        //var valMonthLastDay = new Date(parseInt($('#pTab1SelectYear option:selected').val()), parseInt($('#pTab1SelectMonth option:selected').val()) + 1, 0).getDate();
        //showLoader('loaderTab2');
        //globalAjaxVar = $.ajax({
        //    type: "POST",
        //    url: "../wcf/ServiceMain.svc/ExecuteDataSet",
        //    data: '{"qry":"SELECT ID, NAME FROM TBL_REQUESTTYPE WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' ORDER BY ID"}',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (data) {
        //        $($.parseJSON(data.d)).each(function (index, value) {
        //            if (valRequestListId != '') valRequestListId += ','
        //            valRequestListId += value.ID;
        //            if (valRequestListName != '') valRequestListName += ','
        //            valRequestListName += replaceDatabaseToDisplay(value.NAME);
        //        });
        //        globalAjaxVar = $.ajax({
        //            type: "POST",
        //            url: "../wcf/ServiceMain.svc/Rprt3Tab2Datatable",
        //            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "yr":"' + $('#pTab1SelectYear option:selected').val() + '", "mnth":"' + $('#pTab1SelectMonth option:selected').val() + '"}',
        //            contentType: "application/json; charset=utf-8",
        //            dataType: "json",
        //            success: function (data) {
        //                valData = '';
        //                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;\">";
        //                valData += "<tbody>";
        //                valData += "<tr style=\"background-color:#C6D9F1;\">";
        //                valData += "<th rowspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">#</th>";
        //                valData += "<th rowspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Модел</th>";
        //                for (var i = 1; i <= valMonthLastDay; i++) {
        //                    valData += "<th cols=\"" + (valRequestListId.split(',').length + 2) + "\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">" + $('#pTab1SelectYear option:selected').val() + "-" + $('#pTab1SelectMonth option:selected').val() + "-" + i + "</th>";
        //                }
        //                valData += "</tr>";
        //                valData += "<tr style=\"background-color:#C6D9F1;\">";
        //                for (var i = 1; i <= valMonthLastDay; i++) {
        //                    for (var y = 1; y <= valRequestListId.split(',').length; y++) {
        //                        valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">" + valRequestListName.split(',')[y] + "</th>";
        //                    }
        //                    valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нийт</th>";
        //                    valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Төлбөр</th>";
        //                }
        //                valData += "</tr>";
        //                $($.parseJSON(data.d)).each(function (index, value) {
        //                    valTotalCnt += parseInt(value.APPOINTMENTCNT);
        //                    valData += "<tr>";
        //                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" data-id=\"" + value.ID + "\">" + value.RW + "</td>";
        //                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.VINNO) + "</td>";
        //                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + value.AUTONO + "</td>";
        //                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.NAME) + "</td>";
        //                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + value.TYPE + "</td>";
        //                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
        //                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.PRODUCEDYEAR + "</td>";
        //                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><a href=\"../pg/rprt3Tab1ModalInfo.aspx?id=" + value.ID + "&begindt=" + $.trim($('#pTab1SelectStartDate').val()) + "&enddt=" + $.trim($('#pTab1SelectEndDate').val()) + "\" data-toggle=\"modal\" data-target=\"#rprt3InfoModal\" class=\"btn btn-link btn-xs\">" + value.APPOINTMENTCNT + "</a></td>";
        //                    valData += "</tr>";
        //                });
        //                valData += "</tbody>";
        //                valData += "</table>";
        //                $("#divBindTab2Table").html(valData);
        //                $('#pTab2Month').html($('#pTab1SelectMonth option:selected').val());
        //                hideLoader('loaderTab2');
        //            },
        //            failure: function (response) {
        //                alert('FAILURE: ' + response.d);
        //            },
        //            error: function (xhr, status, error) {
        //                window.location = '../#pg/error500.aspx';
        //            }
        //        });
        //    },
        //    failure: function (response) {
        //        alert('FAILURE: ' + response.d);
        //    },
        //    error: function (xhr, status, error) {
        //        window.location = '../#pg/error500.aspx';
        //    }
        //});
    }
    $("#pTab1SelectYear, #pTab1SelectMonth, #pTab2SelectIsMySold").change(function () {
        dataBindTab2Table();
    });

    //tab3
    function dataBindTab3DataTableFirst() {
        var valData = '', valOptGroup = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt3TabsStaffListForDDL",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valOptGroup = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (value.STAFF_POSITION_ID != valOptGroup) {
                        if (valOptGroup != '') valData += '</optgroup>';
                        valData += '<optgroup label="' + value.STAFF_POSITION_NAME + '">';
                    }
                    valData += '<option value="' + value.ID + '">' + value.STAFFNAME + '</option>';
                    valOptGroup = value.STAFF_POSITION_ID;
                });
                $("#pTab3SelectStaff").html("<option value=\"\" selected>- Сонго -</option>" + valData);
                dataBindTab2Table();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });

    }
    function dataBindTab3Table() {
        if ($('#pTab3SelectStaff option:selected').val() == '') {
            $('#pTab3BeginDate').html($('#pTab3SelectStartDate').val());
            $('#pTab3EndDate').html($('#pTab3SelectEndDate').val());
            $('#pTab3Staff').html('');
            $("#divBindTab3Table").html('');
        }
        else {
            showLoader('loaderTab3');
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/Rprt3Tab3Datatable",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $.trim($('#pTab3SelectStartDate').val()) + '", "enddate":"' + $.trim($('#pTab3SelectEndDate').val()) + '", "staffid":"' + $('#pTab3SelectStaff option:selected').val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#pTab3BeginDate').html($('#pTab3SelectStartDate').val());
                    $('#pTab3EndDate').html($('#pTab3SelectEndDate').val());
                    $('#pTab3Staff').html($('#pTab3SelectStaff option:selected').closest('optgroup').attr('label') + ' ' + $('#pTab3SelectStaff option:selected').text());
                    $("#divBindTab3Table").html(replaceDatabaseToDisplay(data.d));
                    hideLoader('loaderTab3');
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    }
    function dateChangedTab3(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "pTab3SelectStartDate") {
            if ($.trim($('#pTab3SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#pTab3SelectEndDate').val().split('-')[0], $('#pTab3SelectEndDate').val().split('-')[1], $('#pTab3SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab3Table();
                }
            }
        }
        else if ($(this).attr('id') == "pTab3SelectEndDate") {
            if ($.trim($('#pTab3SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#pTab3SelectStartDate').val().split('-')[0], $('#pTab3SelectStartDate').val().split('-')[1], $('#pTab3SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab3Table();
                }
            }
        }
    }
    $("#pTab3SelectStaff").change(function () {
        dataBindTab3Table();
    });
    $('#pTab3SelectStartDate, #pTab3SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab3).on('changeDate', dateChangedTab3);

    //tab4
    function dataBindTab4DataTableFirst() {
        var valData = '', valOptGroup = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt3TabsStaffListForDDL",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valOptGroup = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (value.STAFF_POSITION_ID != valOptGroup) {
                        if (valOptGroup != '') valData += '</optgroup>';
                        valData += '<optgroup label="' + value.STAFF_POSITION_NAME + '">';
                    }
                    valData += '<option value="' + value.ID + '">' + value.STAFFNAME + '</option>';
                    valOptGroup = value.STAFF_POSITION_ID;
                });
                $("#pTab4SelectStaff").html("<option value=\"\" selected>- Сонго -</option>" + valData);
                dataBindTab2Table();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });

    }
    function dataBindTab4Table() {
        if ($('#pTab4SelectStaff option:selected').val() == '') {
            $('#pTab4BeginDate').html($('#pTab4SelectStartDate').val());
            $('#pTab4EndDate').html($('#pTab4SelectEndDate').val());
            $('#pTab4Staff').html('');
            $("#divBindTab4Table").html('');
        }
        else {
            showLoader('loaderTab4');
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/Rprt3Tab4Datatable",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $.trim($('#pTab4SelectStartDate').val()) + '", "enddate":"' + $.trim($('#pTab4SelectEndDate').val()) + '", "staffid":"' + $('#pTab4SelectStaff option:selected').val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#pTab4BeginDate').html($('#pTab4SelectStartDate').val());
                    $('#pTab4EndDate').html($('#pTab4SelectEndDate').val());
                    $('#pTab4Staff').html($('#pTab4SelectStaff option:selected').closest('optgroup').attr('label') + ' ' + $('#pTab4SelectStaff option:selected').text());
                    $("#divBindTab4Table").html(replaceDatabaseToDisplay(data.d));
                    hideLoader('loaderTab4');
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    }
    function dateChangedTab4(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "pTab4SelectStartDate") {
            if ($.trim($('#pTab4SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#pTab4SelectEndDate').val().split('-')[0], $('#pTab4SelectEndDate').val().split('-')[1], $('#pTab4SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab4Table();
                }
            }
        }
        else if ($(this).attr('id') == "pTab4SelectEndDate") {
            if ($.trim($('#pTab4SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#pTab4SelectStartDate').val().split('-')[0], $('#pTab4SelectStartDate').val().split('-')[1], $('#pTab4SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab4Table();
                }
            }
        }
    }
    $("#pTab4SelectStaff").change(function () {
        dataBindTab4Table();
    });
    $('#pTab4SelectStartDate, #pTab4SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab4).on('changeDate', dateChangedTab4);
</script>