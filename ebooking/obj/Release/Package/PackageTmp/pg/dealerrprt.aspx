<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dealerrprt.aspx.cs" Inherits="ebooking.pg.dealerrprt" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-medkit fa-fw "></i> 
			<span lang="mn">Автомашин борлуулалтын тайлан</span>
		</h1>
	</div>
</div>
<section id="widget-grid" class="">
    <div class="row">
	    <div class="col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs bordered">
			    <li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
				    <a href="#s1" data-toggle="tab" lang="mn">Автомашины мэдээлэл</a>
			    </li>
			    <li id="pTab2Li" onclick="pDatabindTabs(this)">
				    <a href="#s2" data-toggle="tab">-----</a>
			    </li>
		    </ul>
            <div id="myTabContent1" class="tab-content">
				<div class="tab-pane fade in active" id="s1">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:45px; float: left; padding-top: 6px;" lang="mn">Төлөв:</div>
                                <div style="width:105px; float: left; margin-right: 10px;">
                                    <select id="pTab1SelectAppointmentType" runat="server" class="form-control" style="padding:1px;">
                                        <option value="1">Бэлэн байгаа</option>
                                        <option value="2">Ирж байгаа</option>
                                    </select>
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
                        <div id="loaderTab1" class="search-background" style="display: none; background: rgba(0, 0, 0, 0.298039);">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab1" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <label id="pTab1TitleLabelTp" runat="server"></label> <span lang="mn">автомашины загвар, өнгөний сонголт</span>
                            </div>
                            <div id="divBindTab1Table"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="s2">

                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var valData = '';
    var pagefunction = function () {
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
                //dataBindTab2Table();
            }
        }
    }
    //tab1
    function dataBindTab1Table() {
        var valData = '';
        var totalprice = 0;
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealerrprtTab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "tp":"' + $('#pTab1SelectAppointmentType option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table style=\"border: 1px solid #000; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;\">";
                valData += "<tbody>";
                valData += "<tr style=\"background-color:dimgrey;\">";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">#</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">Модел</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">Загвар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">Гадар өнгө</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">Дотор өнгө</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">Үнэ /сая.төг/</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">Захиалгатай эсэх</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">Арлын дугаар</th>";
                if ($('#pTab1SelectAppointmentType option:selected').val() == '2') valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; color:#FFF;\" lang=\"mn\">Буух огноо</th>";
                valData += "</tr>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.RW + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + replaceDatabaseToDisplay(value.SPECTYPE_NAME) + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + replaceDatabaseToDisplay(value.EXTCOLORNAME) + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + replaceDatabaseToDisplay(value.INTCOLORNAME) + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.PRICE_MLN + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + value.ISSELLCARS + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + replaceDatabaseToDisplay(value.VINNO) + "</td>";
                    if ($('#pTab1SelectAppointmentType option:selected').val() == '2') valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.GETDT + "</td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                if ($('#pTab1SelectAppointmentType option:selected').val() == '1') $('#pTab1TitleLabelTp').html('Бэлэн байгаа');
                else if ($('#pTab1SelectAppointmentType option:selected').val() == '2') $('#pTab1TitleLabelTp').html('Ирж байгаа');
                $("#divBindTab1Table").html(valData);
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
    $("#pTab1SelectAppointmentType").change(function () {
        dataBindTab1Table();
    });
</script>