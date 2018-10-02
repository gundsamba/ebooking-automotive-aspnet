<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patient.aspx.cs" Inherits="ebooking.pg.patient" %>
<style type="text/css">
    .Colvis {
        position:absolute;
        float:right;
    }
    .dataTables_filter {
        display:none;
    }
</style>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-user fa-fw "></i> <span lang="mn">Үйлчлүүлэгчийн бүртгэл</span></h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget jarviswidget-color-blueDark animated fadeInDown">
            <header>
				<span class="widget-icon"> <i class="fa fa-medkit"></i> </span>
				<h2 lang="mn">Үйлчлүүлэгчийн бүртгэл</h2>
                <div class="widget-toolbar" role="menu"> 
                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#patientModal" onclick="patientAddEdit(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                </div>
			</header>
            <div>
                <div class="jarviswidget-editbox">
                    
				</div>
                <div class="widget-body no-padding">
                    <div id="loader1" class="loader-background">
                        <img src="../img/loading.gif" />
                        <h2 lang="mn">Уншиж байна...</h2>
                    </div>
                    <div style="padding:3px;">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg1-2">
                                <div class="input-group input-group-md" style="float:left; width:166px; margin-bottom: 3px;">
						            <div class="icon-addon addon-md">
						                <input id="patientInputAutoNoFilter" type="text" placeholder="0000 УБА" class="form-control" maxlength="8"/>
						                <label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="" data-original-title="Улсын дугаар"></label>
						            </div>
						            <span class="input-group-btn">
                                        <a id="patientBtnAutoNoFilter" href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="bottom" data-original-title="Улсын дугаараар хайх">ХАЙХ</a>
						            </span>
					            </div>
                                <div class="input-group input-group-md" style="float:left; width:250px; margin-bottom: 3px; margin-left: 10px;">
						            <div class="icon-addon addon-md">
						                <input id="patientInputVinNoFilter" type="text" placeholder="AAZZ99..." class="form-control" maxlength="17"/>
						                <label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="" data-original-title="Аралын дугаар"></label>
						            </div>
						            <span class="input-group-btn">
                                        <a id="patientBtnVinNoFilter" href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="bottom" data-original-title="Аралын дугаараар хайх">ХАЙХ</a>
						            </span>
					            </div>
                                <div class="input-group input-group-md" style="float:left; width:250px; margin-bottom: 3px; margin-left: 10px;">
						            <div class="icon-addon addon-md">
						                <input id="patientInputOwnerNameFilter" type="text" placeholder="Эзэмшигчийн нэр" class="form-control" maxlength="50"/>
						                <label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="" data-original-title="Эзэмшигчийн нэр"></label>
						            </div>
						            <span class="input-group-btn">
                                        <a id="patientBtnOwnerNameFilter" href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="bottom" data-original-title="Эзэмшигчийн нэрээр хайх">ХАЙХ</a>
						            </span>
					            </div>
                                <div class="input-group input-group-md" style="float:left; width:166px; margin-bottom: 3px; margin-left: 10px;">
						            <div class="icon-addon addon-md">
						                <input id="patientInputTelFilter" type="text" placeholder="Утас..." class="form-control" maxlength="8"/>
						                <label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="" data-original-title="Утасны дугаар"></label>
						            </div>
						            <span class="input-group-btn">
                                        <a id="patientBtnTelFilter" href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="bottom" data-original-title="Утасны дугаараар хайх">ХАЙХ</a>
						            </span>
					            </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg1-2">
                                <div style="position: absolute; right: 15px;"><span lang="mn">Илэрц:</span> <span id="patientBeginResult" runat="server">0</span>-<span id="patientEndResult" runat="server">0</span> / <span lang="mn">Нийт:</span> <span id="patientTotalResult" runat="server">0</span></div>
                            </div>
                        </div>
                    </div>
					<div id="patientDatatableDiv" runat="server" class="table-responsive" style="margin-top: 15px; display: block;">

					</div>
                    <div id="patientPagination" runat="server" style="padding:3px;" class="text-center">
                        
                    </div>
				</div>
			</div>
        </div>
    </div>
</div>
<div id="patientModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="patientModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Үйлчлүүлэгч</span>&nbsp;<span id="patientModalHeaderLabel" lang="mn"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="patientID" class="hide"></div>
                    <fieldset>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label" lang="mn">*Код</label>
                                    <input id="patientModalInputCode" name="patientModalInputCode" type="text" class="form-control" placeholder="Код" disabled lang="mn" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; background-color:#D6D6D6; margin-bottom: 0;">
                            <div class="row">
                                <div class="col-md-12" lang="mn">Автомашиний мэдээлэл</div>
                            </div>
                        </div>
						<div class="form-group" style="border: 1px solid grey; padding:5px; border-top:none; margin-bottom: 3px;">
                            <div class="row" style="margin-bottom:5px;">
                                <div class="col-md-2">
                                    <label class="control-label" lang="mn">*Улсын дугаар</label>
                                    <input id="patientModalInputAutono" name="patientModalInputAutono" type="text" class="form-control" placeholder="0000 УБА" data-mask="9999 ccc" data-mask-placeholder= "_" />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label" lang="mn">*Үйлдвэрлэгч</label>
                                    <select id="patientModalSelectAutomarkType" name="patientModalSelectAutomarkType" runat="server" class="form-control" style="padding:1px;">
								        <option value="">- Сонго -</option>
							        </select>								
                                </div>
								<div class="col-md-4">
                                    <label class="control-label" lang="mn">*Автомашины загвар</label>
                                    <select id="patientModalSelectAutomark" name="patientModalSelectAutomark" runat="server" class="form-control">
								        <option value="">- Сонго -</option>
							        </select>								
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label" lang="mn">*Үйлдвэрлэсэн он</label>
                                    <select id="patientModalSelectAutoYear" name="patientModalSelectAutoYear" runat="server" class="form-control">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label" lang="mn">Аралын дугаар</label>
                                    <input id="patientModalInputVinno" name="patientModalInputVinno" type="text" class="form-control" placeholder="Аралын дугаар" lang="mn" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label no-margin" lang="mn">*Шатхууны төрөл</label>
                                    <label class="radio radio-inline" style="margin-top:-8px;">
									    <input id="patientModalInputFueltype1" type="radio" class="radiobox" name="patientModalInputFueltype" value="1">
									    <span lang="mn">Бензин</span>
								    </label>
                                    <label class="radio radio-inline" style="margin-top:-8px; margin-left:0;">
									    <input id="patientModalInputFueltype2" type="radio" class="radiobox" name="patientModalInputFueltype" value="0">
									    <span lang="mn">Дизель</span>
								    </label>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label no-margin" lang="mn">*Хурдны хайрцаг</label>
                                    <label class="radio radio-inline" style="margin-top:-8px;">
									    <input id="patientModalInputTransmission1" type="radio" class="radiobox" name="patientModalInputTransmission" value="1">
									    <span lang="mn">Автомат</span>
								    </label>
                                    <label class="radio radio-inline" style="margin-top:-8px; margin-left:0;">
									    <input id="patientModalInputTransmission2" type="radio" class="radiobox" name="patientModalInputTransmission" value="0">
									    <span lang="mn">Механик</span>
								    </label>
                                </div>
                                <div class="col-md-2" style="width:90px!important;">
                                    <label class="control-label" style="display:block;" lang="mn">Заалт</label>
                                    <label class="radio radio-inline" style="margin-top:-8px;">
									    <input id="patientModalInputZaaltType1" type="radio" class="radiobox" name="patientModalInputZaaltType" value="1">
									    <span lang="mn">Мил</span>
								    </label>
                                    <label class="radio radio-inline" style="margin-top:-8px; margin-left:0;">
									    <input id="patientModalInputZaaltType2" type="radio" class="radiobox" name="patientModalInputZaaltType" value="2">
									    <span lang="mn">Км</span>
								    </label>
                                </div>
                                <div class="col-md-2" style="margin: 25px 0px 0px -25px;">
                                    <div class="input-group input-group-md">
						                <div class="addon-md">
						                    <input id="patientModalInputKmzaalt" name="patientModalInputKmzaalt" type="text" placeholder="Заалт" class="form-control">
						                </div>
						                <span class="input-group-btn">
                                            <a id="patientModalButtonKmzaalt" name="patientModalButtonKmzaalt" href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="bottom" data-original-title="Заалт хадгалах"><span class="glyphicon glyphicon-floppy-disk"></span></a>
						                </span>
						            </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label" style="display:block;" lang="mn">Манайхаас худалдан авсан</label>
                                    <label class="checkbox-inline" style="margin-top:-8px;">
									    <input id="patientModalInputIsMySold" type="checkbox" class="checkbox style-0" name="patientModalInputIsMySold" value="1">
									    <span lang="mn">Тийм</span>
								    </label>
                                </div>
                            </div>
						</div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; background-color:#D6D6D6; margin-bottom: 0;">
                            <div class="row">
                                <div class="col-md-12" lang="mn">
                                    Үйлчлүүлэгчийн мэдээлэл
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="border: 1px solid grey; padding:5px; border-top:none; margin-bottom: 3px;">
                            <div class="row" style="margin-bottom:5px;">
                                <div class="col-md-5">
                                    <label class="control-label" lang="mn">*Эзэмшигчийн нэр</label>
                                    <input id="patientModalInputOwnername" name="patientModalInputOwnername" type="text" class="form-control" placeholder="Эзэмшигчийн нэр" lang="mn" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label" lang="mn">*Утас 1</label>
                                    <input id="patientModalInputTel" name="patientModalInputTel" type="text" class="form-control" placeholder="Утас 1" lang="mn" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label" lang="mn">Утас 2</label>
                                    <input id="patientModalInputTel2" name="patientModalInputTel2" type="text" class="form-control" placeholder="Утас 2" lang="mn" />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label" style="display:block;" lang="mn">*Эзэмшигч</label>
                                    <label class="radio radio-inline" style="margin-top:-8px;">
										<input id="patientModalInputType1" type="radio" class="radiobox" name="patientModalInputType" value="1">
										<span lang="mn">Хувь хүн</span>
									</label>
                                    <label class="radio radio-inline" style="margin-top:-8px; margin-left:0;">
										<input id="patientModalInputType2" type="radio" class="radiobox" name="patientModalInputType" value="0">
										<span lang="mn">Байгууллага</span>
									</label>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:5px;">
                                <div class="col-md-9">
                                    <label class="control-label" lang="mn">Хаяг</label>
                                    <textarea id="patientModalInputAddress" name="patientModalInputAddress" class="form-control" rows="1" placeholder="Хаяг" lang="mn" maxlength="150"></textarea>
                                </div>
                                <div id="patientModalDiscountsDiv" runat="server" class="col-md-3">

                                </div>
                            </div>
                            <%--<div class="row" style="margin-bottom:5px;">
                                <div class="col-md-5" lang="mn">
                                    Яаралтай үед холбогдох утас
                                </div>
                                <div class="col-md-7" lang="mn">
                                    Таны хэн болох
                                </div>
                            </div>--%>
                            <%--<div class="row" style="margin-bottom:5px;">
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
                                <div class="col-md-3">
                                    <label class="control-label" lang="mn">И-мэйл</label>
                                    <input id="patientModalInputEmail" name="patientModalInputEmail" type="text" class="form-control" placeholder="И-мэйл" lang="mn" />
                                </div>
                            </div>
                        </div>
					</fieldset>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button id="patientModalBtnSave" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
	</div>
</div>
<div id="patientInfoModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">

        </div>
    </div>
</div>
<script type="text/javascript" src="../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var date = new Date();
    var lastDay;
    var pagefunction = function () {
        for (var i = 1900; i <= date.getFullYear() ; i++) $('#patientModalSelectDofYear').append('<option>' + i + '</option>');
        //dataBindTable();
        //$.get('../files/registeredmarkno.txt', function (txtFile) {
        //    var mymark = txtFile.split("\n");
        //    $("#patientInputAutoNoFilter").autocomplete({
        //        source: mymark
        //    });
        //});
        $("#patientInputAutoNoFilter").autocomplete({
            source: function (request, response) {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/AutonoAutocomplete",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '", "autono":"' + $.trim($("#patientInputAutoNoFilter").val()) + '"}',
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
            }
        });
        //$.get('../files/registeredvinno.txt', function (txtFile) {
        //    var mymark = txtFile.split("\n");
        //    $("#patientInputVinNoFilter").autocomplete({
        //        source: mymark
        //    });
        //});
        $("#patientInputVinNoFilter").autocomplete({
            source: function (request, response) {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/VinnoAutocomplete",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '", "vinno":"' + $.trim($("#patientInputVinNoFilter").val()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var values = [];
                        $($.parseJSON(data.d)).each(function (index, value) {
                            values.push(value.VINNO);
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
            }
        });
        $("#patientInputOwnerNameFilter").autocomplete({
            source: function (request, response) {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/OwnernameAutocomplete",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '", "name":"' + $.trim($("#patientInputOwnerNameFilter").val()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var values = [];
                        $($.parseJSON(data.d)).each(function (index, value) {
                            values.push(value.NAME);
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
            }
        });
        $("#patientInputTelFilter").autocomplete({
            source: function (request, response) {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/TelAutocomplete",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '", "tel":"' + $.trim($("#patientInputTelFilter").val()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var values = [];
                        $($.parseJSON(data.d)).each(function (index, value) {
                            values.push(value.TEL);
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
            }
        });
        if (!funcIsRole('1,2')) {
            $('.widget-toolbar').find('a').addClass('disabled');
        }
        else {
            $('.widget-toolbar').find('a').removeClass('disabled');
        }
    }
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    $("#patientBtnAutoNoFilter").click(function () {
        var valData = '';
        //if ($.trim($("#patientInputAutoNoFilter").val()).length == 8) {
            showLoader('loader1');
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/PatientDatatableFilterByAutoNo",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "autono":"' + $.trim($("#patientInputAutoNoFilter").val()) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    var valCnt = 0;
                    valData += "<table id=\"patientDatatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                    valData += "<thead>";
                    valData += "<tr>";
                    valData += "<th>#</th>";
                    valData += "<th style=\"width:100px;\" data-class=\"expand\" lang=\"mn\">Арал/дугаар</th>";
                    valData += "<th style=\"width:85px;\" lang=\"mn\">У/дугаар</th>";
                    valData += "<th lang=\"mn\">Эзэмшигч/нэр</th>";
                    valData += "<th style=\"width:98px;\" lang=\"mn\" data-hide=\"phone,tablet\">Төрөл</th>";
                    valData += "<th lang=\"mn\">Загвар</th>";
                    valData += "<th style=\"width:51px;\" lang=\"mn\">Он</th>";
                    valData += "<th class=\"text-center\" style=\"width:51px;\" data-hide=\"phone,tablet\">Үйлчлүүлсэн тоо</th>";
                    valData += "<th class=\"text-center\" style=\"width:70px;\" data-hide=\"phone,tablet\">КМ заалт</th>";
                    valData += "<th style=\"width:85px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                    valData += "<th style=\"width:114px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                    valData += "<th style=\"width:67px;\">&nbsp;</th>";
                    valData += "</tr>";
                    valData += "</thead>";
                    valData += "<tbody>";
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<tr data-id=\"" + value.ID + "\" class=\""+value.ISMYSOLD+"\">";
                        valData += "<td>" + value.RW + "</td>";
                        valData += "<td>" + value.VINNO + "</td>";
                        valData += "<td>" + value.AUTONO + "</td>";
                        valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                        valData += "<td>" + value.TYPE + "</td>";
                        valData += "<td>" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                        valData += "<td>" + value.PRODUCEDYEAR + "</td>";
                        valData += "<td class=\"text-center\">" + value.APP_CNT + "</td>";
                        valData += "<td class=\"text-center\">" + value.ZAALT + "</td>";
                        valData += "<td><a class=\"btn btn-info btn-xs\" href=\"#pg/patienttimeline.aspx?id=" + value.ID + "\"><i class=\"fa fa-archive\"></i> <span lang=\"mn\">Үйлчилгээний архив харах</span></a></td>";
                        valData += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/patientinfomodal.aspx?id=" + value.ID + "\" data-toggle=\"modal\" data-target=\"#patientInfoModal\"><i class=\"fa fa-info\"></i> <span lang=\"mn\">Дэлгэрэнгүй харах</span></a></td>";
                        valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#patientModal\" onclick=\"patientAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"patientDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                        valData += "</tr>";
                        valCnt++;
                    });
                    if (valCnt == 0) {
                        valData += "<tr><td class=\"hide\"></td><td colspan=\"10\" class=\"text-center\"><i>Мэдээлэл олдсонгүй...</i></td></tr>";
                    }
                    valData += "</tbody>";
                    valData += "</table>";
                    valData += "<script>var responsiveHelper_patientDatatable = undefined; var breakpointDefinition = {  tablet: 1024,  phone: 480 }; $('#patientDatatable').dataTable({\"iDisplayLength\": 100,  \"columns\": [ null,  { \"width\": \"95px\" },  { \"width\": \"85px\" },  null,  { \"width\": \"98px\" },  null,  { \"width\": \"51px\" },  { \"width\": \"51px\" },  { \"width\": \"70px\" },  { \"width\": \"85px\" },  { \"width\": \"114px\" },  { \"width\": \"67px\" } ],  \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",  \"autoWidth\": true,  \"preDrawCallback\": function() {  if (!responsiveHelper_patientDatatable) {  responsiveHelper_patientDatatable = new ResponsiveDatatablesHelper($('#patientDatatable'), breakpointDefinition);  }  },  \"rowCallback\": function(nRow) {  responsiveHelper_patientDatatable.createExpandIcon(nRow);  },  \"drawCallback\": function(oSettings) {  responsiveHelper_patientDatatable.respond();  }, \"paging\": false, \"info\": false });<\/script>";
                    $("#patientDatatableDiv").html(valData);
                    hideLoader('loader1');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        //}
        //else alert('Улсын дугаар гүйцэт оруулна уу!');
    });
    $("#patientBtnVinNoFilter").click(function () {
        var valData = '';
        showLoader('loader1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/PatientDatatableFilterByVinNo",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "vinno":"' + $.trim($("#patientInputVinNoFilter").val()) + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                var valCnt = 0;
                valData += "<table id=\"patientDatatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th>#</th>";
                valData += "<th style=\"width:95px;\" data-class=\"expand\" lang=\"mn\">Арал/дугаар</th>";
                valData += "<th style=\"width:85px;\" lang=\"mn\">У/дугаар</th>";
                valData += "<th lang=\"mn\">Эзэмшигч/нэр</th>";
                valData += "<th style=\"width:98px;\" lang=\"mn\" data-hide=\"phone,tablet\">Төрөл</th>";
                valData += "<th lang=\"mn\">Загвар</th>";
                valData += "<th style=\"width:51px;\" lang=\"mn\">Он</th>";
                valData += "<th class=\"text-center\" style=\"width:51px;\" data-hide=\"phone,tablet\">Үйлчлүүлсэн тоо</th>";
                valData += "<th class=\"text-center\" style=\"width:70px;\" data-hide=\"phone,tablet\">КМ заалт</th>";
                valData += "<th style=\"width:85px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                valData += "<th style=\"width:114px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                valData += "<th style=\"width:67px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\" class=\"" + value.ISMYSOLD + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + value.VINNO + "</td>";
                    valData += "<td>" + value.AUTONO + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + value.TYPE + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td>" + value.PRODUCEDYEAR + "</td>";
                    valData += "<td class=\"text-center\">" + value.APP_CNT + "</td>";
                    valData += "<td class=\"text-center\">" + value.ZAALT + "</td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"#pg/patienttimeline.aspx?id=" + value.ID + "\"><i class=\"fa fa-archive\"></i> <span lang=\"mn\">Үйлчилгээний архив харах</span></a></td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/patientinfomodal.aspx?id=" + value.ID + "\" data-toggle=\"modal\" data-target=\"#patientInfoModal\"><i class=\"fa fa-info\"></i> <span lang=\"mn\">Дэлгэрэнгүй харах</span></a></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#patientModal\" onclick=\"patientAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"patientDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                    valCnt++;
                });
                if (valCnt == 0) {
                    valData += "<tr><td class=\"hide\"></td><td colspan=\"10\" class=\"text-center\"><i>Мэдээлэл олдсонгүй...</i></td></tr>";
                }
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_patientDatatable = undefined; var breakpointDefinition = {  tablet: 1024,  phone: 480 }; $('#patientDatatable').dataTable({\"iDisplayLength\": 100,  \"columns\": [ null,  { \"width\": \"95px\" },  { \"width\": \"85px\" },  null,  { \"width\": \"98px\" },  null,  { \"width\": \"51px\" },  { \"width\": \"51px\" },  { \"width\": \"70px\" },  { \"width\": \"85px\" },  { \"width\": \"114px\" },  { \"width\": \"67px\" } ],  \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",  \"autoWidth\": true,  \"preDrawCallback\": function() {  if (!responsiveHelper_patientDatatable) {  responsiveHelper_patientDatatable = new ResponsiveDatatablesHelper($('#patientDatatable'), breakpointDefinition);  }  },  \"rowCallback\": function(nRow) {  responsiveHelper_patientDatatable.createExpandIcon(nRow);  },  \"drawCallback\": function(oSettings) {  responsiveHelper_patientDatatable.respond();  }, \"paging\": false, \"info\": false });<\/script>";
                $("#patientDatatableDiv").html(valData);
                hideLoader('loader1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#patientBtnOwnerNameFilter").click(function () {
        var valData = '';
        showLoader('loader1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/PatientDatatableFilterByOwnerName",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "vinno":"' + $.trim($("#patientInputOwnerNameFilter").val()) + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                var valCnt = 0;
                valData += "<table id=\"patientDatatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th>#</th>";
                valData += "<th style=\"width:95px;\" data-class=\"expand\" lang=\"mn\">Арал/дугаар</th>";
                valData += "<th style=\"width:85px;\" lang=\"mn\">У/дугаар</th>";
                valData += "<th lang=\"mn\">Эзэмшигч/нэр</th>";
                valData += "<th style=\"width:98px;\" lang=\"mn\" data-hide=\"phone,tablet\">Төрөл</th>";
                valData += "<th lang=\"mn\">Загвар</th>";
                valData += "<th style=\"width:51px;\" lang=\"mn\">Он</th>";
                valData += "<th class=\"text-center\" style=\"width:51px;\" data-hide=\"phone,tablet\">Үйлчлүүлсэн тоо</th>";
                valData += "<th class=\"text-center\" style=\"width:70px;\" data-hide=\"phone,tablet\">КМ заалт</th>";
                valData += "<th style=\"width:85px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                valData += "<th style=\"width:114px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                valData += "<th style=\"width:67px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\" class=\"" + value.ISMYSOLD + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + value.VINNO + "</td>";
                    valData += "<td>" + value.AUTONO + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + value.TYPE + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td>" + value.PRODUCEDYEAR + "</td>";
                    valData += "<td class=\"text-center\">" + value.APP_CNT + "</td>";
                    valData += "<td class=\"text-center\">" + value.ZAALT + "</td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"#pg/patienttimeline.aspx?id=" + value.ID + "\"><i class=\"fa fa-archive\"></i> <span lang=\"mn\">Үйлчилгээний архив харах</span></a></td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/patientinfomodal.aspx?id=" + value.ID + "\" data-toggle=\"modal\" data-target=\"#patientInfoModal\"><i class=\"fa fa-info\"></i> <span lang=\"mn\">Дэлгэрэнгүй харах</span></a></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#patientModal\" onclick=\"patientAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"patientDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                    valCnt++;
                });
                if (valCnt == 0) {
                    valData += "<tr><td class=\"hide\"></td><td colspan=\"10\" class=\"text-center\"><i>Мэдээлэл олдсонгүй...</i></td></tr>";
                }
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_patientDatatable = undefined; var breakpointDefinition = {  tablet: 1024,  phone: 480 }; $('#patientDatatable').dataTable({\"iDisplayLength\": 100,  \"columns\": [ null,  { \"width\": \"95px\" },  { \"width\": \"85px\" },  null,  { \"width\": \"98px\" },  null,  { \"width\": \"51px\" },  { \"width\": \"51px\" },  { \"width\": \"70px\" },  { \"width\": \"85px\" },  { \"width\": \"114px\" },  { \"width\": \"67px\" } ],  \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",  \"autoWidth\": true,  \"preDrawCallback\": function() {  if (!responsiveHelper_patientDatatable) {  responsiveHelper_patientDatatable = new ResponsiveDatatablesHelper($('#patientDatatable'), breakpointDefinition);  }  },  \"rowCallback\": function(nRow) {  responsiveHelper_patientDatatable.createExpandIcon(nRow);  },  \"drawCallback\": function(oSettings) {  responsiveHelper_patientDatatable.respond();  }, \"paging\": false, \"info\": false });<\/script>";
                $("#patientDatatableDiv").html(valData);
                hideLoader('loader1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#patientBtnTelFilter").click(function () {
        var valData = '';
        showLoader('loader1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/PatientDatatableFilterByTel",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "vinno":"' + $.trim($("#patientInputTelFilter").val()) + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                var valCnt = 0;
                valData += "<table id=\"patientDatatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th>#</th>";
                valData += "<th style=\"width:95px;\" data-class=\"expand\" lang=\"mn\">Арал/дугаар</th>";
                valData += "<th style=\"width:85px;\" lang=\"mn\">У/дугаар</th>";
                valData += "<th lang=\"mn\">Эзэмшигч/нэр</th>";
                valData += "<th style=\"width:98px;\" lang=\"mn\" data-hide=\"phone,tablet\">Төрөл</th>";
                valData += "<th lang=\"mn\">Загвар</th>";
                valData += "<th style=\"width:51px;\" lang=\"mn\">Он</th>";
                valData += "<th class=\"text-center\" style=\"width:51px;\" data-hide=\"phone,tablet\">Үйлчлүүлсэн тоо</th>";
                valData += "<th class=\"text-center\" style=\"width:70px;\" data-hide=\"phone,tablet\">КМ заалт</th>";
                valData += "<th style=\"width:85px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                valData += "<th style=\"width:114px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                valData += "<th style=\"width:67px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\" class=\"" + value.ISMYSOLD + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + value.VINNO + "</td>";
                    valData += "<td>" + value.AUTONO + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + value.TYPE + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td>" + value.PRODUCEDYEAR + "</td>";
                    valData += "<td class=\"text-center\">" + value.APP_CNT + "</td>";
                    valData += "<td class=\"text-center\">" + value.ZAALT + "</td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"#pg/patienttimeline.aspx?id=" + value.ID + "\"><i class=\"fa fa-archive\"></i> <span lang=\"mn\">Үйлчилгээний архив харах</span></a></td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/patientinfomodal.aspx?id=" + value.ID + "\" data-toggle=\"modal\" data-target=\"#patientInfoModal\"><i class=\"fa fa-info\"></i> <span lang=\"mn\">Дэлгэрэнгүй харах</span></a></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#patientModal\" onclick=\"patientAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"patientDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                    valCnt++;
                });
                if (valCnt == 0) {
                    valData += "<tr><td class=\"hide\"></td><td colspan=\"10\" class=\"text-center\"><i>Мэдээлэл олдсонгүй...</i></td></tr>";
                }
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_patientDatatable = undefined; var breakpointDefinition = {  tablet: 1024,  phone: 480 }; $('#patientDatatable').dataTable({\"iDisplayLength\": 100,  \"columns\": [ null,  { \"width\": \"95px\" },  { \"width\": \"85px\" },  null,  { \"width\": \"98px\" },  null,  { \"width\": \"51px\" },  { \"width\": \"51px\" },  { \"width\": \"70px\" },  { \"width\": \"85px\" },  { \"width\": \"114px\" },  { \"width\": \"67px\" } ],  \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",  \"autoWidth\": true,  \"preDrawCallback\": function() {  if (!responsiveHelper_patientDatatable) {  responsiveHelper_patientDatatable = new ResponsiveDatatablesHelper($('#patientDatatable'), breakpointDefinition);  }  },  \"rowCallback\": function(nRow) {  responsiveHelper_patientDatatable.createExpandIcon(nRow);  },  \"drawCallback\": function(oSettings) {  responsiveHelper_patientDatatable.respond();  }, \"paging\": false, \"info\": false });<\/script>";
                $("#patientDatatableDiv").html(valData);
                hideLoader('loader1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    function dataBindTable() {
        var valData = '';
        showLoader('loader1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/PatientDatatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                var valCnt = 0;
                valData += "<table id=\"patientDatatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th>#</th>";
                valData += "<th style=\"width:95px;\" data-class=\"expand\" lang=\"mn\">Арал/дугаар</th>";
                valData += "<th style=\"width:85px;\" lang=\"mn\">У/дугаар</th>";
                valData += "<th lang=\"mn\">Эзэмшигч/нэр</th>";
                valData += "<th style=\"width:98px;\" lang=\"mn\" data-hide=\"phone,tablet\">Төрөл</th>";
                valData += "<th lang=\"mn\">Загвар</th>";
                valData += "<th style=\"width:51px;\" lang=\"mn\">Он</th>";
                valData += "<th class=\"text-center\" style=\"width:51px;\" data-hide=\"phone,tablet\">Үйлчлүүлсэн тоо</th>";
                valData += "<th class=\"text-center\" style=\"width:70px;\" data-hide=\"phone,tablet\">КМ заалт</th>";
                valData += "<th style=\"width:85px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                valData += "<th style=\"width:114px;\" data-hide=\"phone,tablet\">&nbsp;</th>";
                valData += "<th style=\"width:67px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\" class=\"" + value.ISMYSOLD + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + value.VINNO + "</td>";
                    valData += "<td>" + value.AUTONO + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + value.TYPE + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td>" + value.PRODUCEDYEAR + "</td>";
                    valData += "<td class=\"text-center\">" + value.APP_CNT + "</td>";
                    valData += "<td class=\"text-center\">" + value.ZAALT + "</td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"#pg/patienttimeline.aspx?id=" + value.ID + "\"><i class=\"fa fa-archive\"></i> <span lang=\"mn\">Үйлчилгээний архив харах</span></a></td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/patientinfomodal.aspx?id=" + value.ID + "\" data-toggle=\"modal\" data-target=\"#patientInfoModal\"><i class=\"fa fa-info\"></i> <span lang=\"mn\">Дэлгэрэнгүй харах</span></a></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#patientModal\" onclick=\"patientAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"patientDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                    valCnt++;
                });
                if (valCnt == 0) {
                    valData += "<tr><td class=\"hide\"></td><td colspan=\"10\" class=\"text-center\"><i>Мэдээлэл олдсонгүй...</i></td></tr>";
                }
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_patientDatatable = undefined; var breakpointDefinition = {  tablet: 1024,  phone: 480 }; $('#patientDatatable').dataTable({\"iDisplayLength\": 100,  \"columns\": [ null,  { \"width\": \"95px\" },  { \"width\": \"85px\" },  null,  { \"width\": \"98px\" },  null,  { \"width\": \"51px\" },  { \"width\": \"51px\" },  { \"width\": \"70px\" },  { \"width\": \"85px\" },  { \"width\": \"114px\" },  { \"width\": \"67px\" } ],  \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",  \"autoWidth\": true,  \"preDrawCallback\": function() {  if (!responsiveHelper_patientDatatable) {  responsiveHelper_patientDatatable = new ResponsiveDatatablesHelper($('#patientDatatable'), breakpointDefinition);  }  },  \"rowCallback\": function(nRow) {  responsiveHelper_patientDatatable.createExpandIcon(nRow);  },  \"drawCallback\": function(oSettings) {  responsiveHelper_patientDatatable.respond();  }, \"paging\": false, \"info\": false });<\/script>";
                $("#patientDatatableDiv").html(valData);
                if (!funcIsRole('1,2')) {
                    $('#patientDatatable > tbody  > tr').each(function () {
                        $(this).find('td:eq(10)').find('button').addClass('hide');
                    });
                }
                else {
                    $('#patientDatatable > tbody  > tr').each(function () {
                        $(this).find('td:eq(10)').find('button').removeClass('hide');
                    });
                }
                hideLoader('loader1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function patientAddEdit(el, isinsupt) {
        $('#patientModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT dbo.FUNC_GETPATIENTCODE(' + $('#indexClinicId').text() + ')"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#patientID').text('');
                    $('#patientModalInputCode').val(data.d);
                    $('#patientModalInputAutono').val('');
                    if ($('#patientModalSelectAutomarkType').is(':disabled')) {
                        $('#patientModalSelectAutomark').val('');
                    }
                    else {
                        $('#patientModalSelectAutomarkType').val('');
                        $('#patientModalSelectAutomark').html('<option value="">- Сонго -</optino>');
                    }
                    $('#patientModalSelectAutoYear').val('');
                    $('#patientModalInputVinno').val('');
                    $('input[name="patientModalInputFueltype"]').prop('checked', false);
                    $('input[name="patientModalInputTransmission"]').prop('checked', false);
                    $('input[name="patientModalInputZaaltType"]').prop('checked', false);
                    $('#patientModalInputKmzaalt').val('');
                    $('input[name="patientModalInputIsMySold"]').prop('checked', false);
                    $('#patientModalInputOwnername').val('');
                    $('#patientModalInputTel').val('');
                    $('#patientModalInputTel2').val('');
                    $('input[name="patientModalInputType"]').prop('checked', false);
                    $('#patientModalInputAddress').val('');
                    //$('#patientModalInputTelEmergency').val('');
                    //$('#patientModalInputTelEmergencyType').prop('checked', false);
                    //$('#patientModalInputTelEmergencyPersonname').val('');
                    $('#patientModalInputEmail').val('');
                    $('input[name="patientModalInputDiscount"]').prop('checked', false);
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
            $('#patientID').text($(el).closest('tr').attr('data-id'));
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT ISNULL(CAST(ID as VARCHAR),\'\')+\'~\'+ISNULL(CODE,\'\')+\'~\'+ISNULL(NAME,\'\')+\'~\'+ISNULL(CAST(TYPE as VARCHAR),\'\')+\'~\'+ISNULL(TEL,\'\')+\'~\'+ISNULL(TEL2,\'\')+\'~\'+ISNULL(EMAIL,\'\')+\'~\'+ISNULL(ADDRESS,\'\')+\'~\'+ISNULL(CAST(MARK_ID as VARCHAR),\'\')+\'~\'+ISNULL(CAST(PRODUCEDYEAR as VARCHAR),\'\')+\'~\'+ISNULL(AUTONO,\'\')+\'~\'+ISNULL(VINNO,\'\')+\'~\'+ISNULL(CAST(FUELTYPE as VARCHAR),\'\')+\'~\'+ISNULL(CAST(TRANSMISSIONTYPE as VARCHAR),\'\')+\'~\'+ISNULL(CAST(EMERGENCYTEL as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYTELTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(EMERGENCYPERSONNAME as varchar),\'\')+\'~\'+ISNULL(CAST(ZAALTTYPE as varchar),\'\')+\'~\'+ISNULL(CAST(ISMYSOLD as varchar),\'\')+\'~\'+ISNULL(CAST(PATIENTDISCOUNT_ID as varchar),\'\') FROM TBL_PATIENT WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
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
        }
        if (!funcIsRole('1,2')) {
            $('#patientModalInputCode').prop('disabled', false);
            $('#patientModalInputOwnername').prop('disabled', true);
            $('input[name="patientModalInputType"]').prop('disabled', true);
            $('#patientModalInputTel').prop('disabled', true);
            $('#patientModalInputTel2').prop('disabled', true);
            $('#patientModalInputEmail').prop('disabled', true);
            $('#patientModalInputAddress').prop('disabled', true);
            $('#patientModalSelectAutomark').prop('disabled', true);
            $('#patientModalSelectAutoYear').prop('disabled', true);
            $('#patientModalInputAutono').prop('disabled', true);
            $('#patientModalInputVinno').prop('disabled', true);
            $('input[name="patientModalInputZaaltType"]').prop('disabled', true);
            $('input[name="patientModalInputFueltype"]').prop('disabled', true);
            $('input[name="patientModalInputTransmission"]').prop('disabled', true);
            //$('#patientModalInputTelEmergency').prop('disabled', true);
            //$('input[name="patientModalInputTelEmergencyType"]').prop('disabled', true);
            //$('#patientModalInputTelEmergencyPersonname').prop('disabled', true);
            $('input[name=patientModalInputIsMySold]').prop('disabled', true);
            $('input[name=patientModalInputDiscount]').prop('disabled', true);
            $('#patientModalBtnSave').prop('disabled', true);
        }
        else {
            $('#patientModalInputCode').prop('disabled', false);
            $('#patientModalInputOwnername').prop('disabled', false);
            $('input[name="patientModalInputType"]').prop('disabled', false);
            $('#patientModalInputTel').prop('disabled', false);
            $('#patientModalInputTel2').prop('disabled', false);
            $('#patientModalInputEmail').prop('disabled', false);
            $('#patientModalInputAddress').prop('disabled', false);
            $('#patientModalSelectAutomark').prop('disabled', false);
            $('#patientModalSelectAutoYear').prop('disabled', false);
            $('#patientModalInputAutono').prop('disabled', false);
            $('#patientModalInputVinno').prop('disabled', false);
            $('input[name="patientModalInputZaaltType"]').prop('disabled', false);
            $('input[name="patientModalInputFueltype"]').prop('disabled', false);
            $('input[name="patientModalInputTransmission"]').prop('disabled', false);
            //$('#patientModalInputTelEmergency').prop('disabled', false);
            //$('input[name="patientModalInputTelEmergencyType"]').prop('disabled', false);
            //$('#patientModalInputTelEmergencyPersonname').prop('disabled', false);
            $('input[name=patientModalInputIsMySold]').prop('disabled', false);
            $('input[name=patientModalInputDiscount]').prop('disabled', false);
            $('#patientModalBtnSave').prop('disabled', false);
        }
    }
    function patientDelete(el) {
        if (!funcIsRole('1,2')) {
            alert('Хэрэглэгчийн бүртгэлийн мэдээлэлтэй ажиллах эрх байхгүй байна!');
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT WHERE PATIENT_ID=' + $(el).closest('tr').attr('data-id') + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d != '0') alert('Сонгосон үйлчлүүлэгчид хамааралтай захиалга орсон тул устгах боломжгүй байна!');
                    else {
                        $.SmartMessageBox({
                            title: "",
                            content: "Та сонгосон үйлчлүүлэгчийг устгахдаа итгэлтэй байна уу?",
                            buttons: '[Үгүй][Тийм]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed === "Тийм") {
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                    data: '{"qry":"DELETE FROM TBL_PATIENT WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function () {
                                        $('#patientTotalResult').html((parseInt($('#patientTotalResult').text()) - 1));
                                        dataBindTable();
                                        smallBox('Үйлчлүүлэгч', 'Амжилттай устлаа', '#659265');
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

    $('#patientModalForm').bootstrapValidator({
        fields: {
            patientModalInputAutono: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    }
                }
            },
            patientModalSelectAutomarkType: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            patientModalSelectAutomark: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            patientModalSelectAutoYear: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            patientModalInputFueltype: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            patientModalInputTransmission: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            patientModalInputVinno: {
                group: '.col-md-3',
                validators: {
                    stringLength: {
                        min: 6,
                        max: 17,
                        message: '6-17 тэмдэгт авна'
                    }
                }
            },
            //patientModalInputZaaltType: {
            //    group: '.col-md-2',
            //    validators: {
            //        notEmpty: {
            //            message: 'Сонгоно уу'
            //        }
            //    }
            //},
            patientModalInputOwnername: {
                group: '.col-md-5',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            patientModalInputTel: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Тоон тэмдэгт орно'
                    }
                }
            },
            patientModalInputTel2: {
                group: '.col-md-2',
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Тоон тэмдэгт орно'
                    }
                }
            },
            patientModalInputType: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            patientModalInputAddress: {
                group: '.col-md-9',
                validators: {
                    stringLength: {
                        max: 150,
                        message: 'Уртдаа 150 тэмдэгт авна'
                    }
                }
            },
            //patientModalInputTelEmergency: {
            //    group: '.col-md-2',
            //    validators: {
            //        stringLength: {
            //            max: 8,
            //            message: 'Уртдаа 8 тэмдэгт авна'
            //        },
            //        numeric: {
            //            message: 'Тоон тэмдэгт орно'
            //        }
            //    }
            //},
            //patientModalInputTelEmergencyPersonname: {
            //    group: '.col-md-7',
            //    validators: {
            //        stringLength: {
            //            max: 100,
            //            message: 'Уртдаа 100 тэмдэгт авна'
            //        }
            //    }
            //},
            patientModalInputEmail: {
                group: '.col-md-3',
                validators: {
                    emailAddress: {
                        message: 'Зөв оруулна уу'
                    }
                }
            },
            patientModalInputDiscount: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            var valEmergencyTelType = '', valZaaltType = '', valIsMySold = '', valDiscount = '';
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
            if ($('#patientModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteScalar",
                    data: '{"qry":"SELECT COUNT(1) FROM TBL_PATIENT WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND AUTONO=N\'' + replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val())) + '\' OR VINNO=N\'' + replaceDisplayToDatabase($.trim($('#patientModalInputVinno').val())) + '\'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == '0') {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                //data: '{"qry":"INSERT INTO TBL_PATIENT (CLINIC_ID, CODE, NAME, [TYPE], TEL, TEL2, EMAIL, [ADDRESS], MARK_ID, PRODUCEDYEAR, AUTONO, VINNO, FUELTYPE, TRANSMISSIONTYPE, CREATED_STAFFID, CREATED_DATE, EMERGENCYTEL, EMERGENCYTELTYPE, EMERGENCYPERSONNAME, ZAALTTYPE, ISMYSOLD) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('varchar', $('#patientModalInputCode').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputOwnername').val()))) + ', ' + strQryIsNull('numeric', $('input[name=patientModalInputType]:checked').val()) + ', ' + strQryIsNull('varchar', $.trim($('#patientModalInputTel').val())) + ', ' + strQryIsNull('varchar', $.trim($('#patientModalInputTel2').val())) + ', ' + strQryIsNull('varchar', $.trim($('#patientModalInputEmail').val())) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAddress').val()))) + ', ' + strQryIsNull('numeric', $('#patientModalSelectAutomark option:selected').val()) + ', ' + strQryIsNull('numeric', $('#patientModalSelectAutoYear option:selected').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputVinno').val()))) + ', ' + strQryIsNull('numeric', $('input[name=patientModalInputFueltype]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=patientModalInputTransmission]:checked').val()) + ', N\'' + $.trim($('#indexStaffId').html()) + '\', GETDATE(), ' + strQryIsNull('numeric', $('#patientModalInputTelEmergency').val()) + ', ' + strQryIsNull('numeric', valEmergencyTelType) + ', ' + strQryIsNull('nvarchar', $.trim($('#patientModalInputTelEmergencyPersonname').val())) + ', ' + strQryIsNull('numeric', valZaaltType) + ', ' + strQryIsNull('numeric', valIsMySold) + ')"}',
                                data: '{"qry":"INSERT INTO TBL_PATIENT (CLINIC_ID, CODE, NAME, [TYPE], TEL, TEL2, EMAIL, [ADDRESS], MARK_ID, PRODUCEDYEAR, AUTONO, VINNO, FUELTYPE, TRANSMISSIONTYPE, CREATED_STAFFID, CREATED_DATE, ZAALTTYPE, ISMYSOLD, PATIENTDISCOUNT_ID) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('varchar', $('#patientModalInputCode').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputOwnername').val()))) + ', ' + strQryIsNull('numeric', $('input[name=patientModalInputType]:checked').val()) + ', ' + strQryIsNull('varchar', $.trim($('#patientModalInputTel').val())) + ', ' + strQryIsNull('varchar', $.trim($('#patientModalInputTel2').val())) + ', ' + strQryIsNull('varchar', $.trim($('#patientModalInputEmail').val())) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAddress').val()))) + ', ' + strQryIsNull('numeric', $('#patientModalSelectAutomark option:selected').val()) + ', ' + strQryIsNull('numeric', $('#patientModalSelectAutoYear option:selected').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputVinno').val()))) + ', ' + strQryIsNull('numeric', $('input[name=patientModalInputFueltype]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=patientModalInputTransmission]:checked').val()) + ', N\'' + $.trim($('#indexStaffId').html()) + '\', GETDATE(), ' + strQryIsNull('numeric', valZaaltType) + ', ' + strQryIsNull('numeric', valIsMySold) + ', ' + strQryIsNull('numeric', valDiscount) + ')"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    dataBindTable();
                                    $('#patientTotalResult').html((parseInt($('#patientTotalResult').text()) + 1));
                                    $('#patientModal').modal('hide');
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
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"UPDATE TBL_PATIENT SET CODE=' + strQryIsNull('varchar', $('#patientModalInputCode').val()) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputOwnername').val()))) + ', [TYPE]=' + strQryIsNull('numeric', $('input[name=patientModalInputType]:checked').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#patientModalInputTel2').val())) + ', EMAIL=' + strQryIsNull('varchar', $.trim($('#patientModalInputEmail').val())) + ', [ADDRESS]=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAddress').val()))) + ', MARK_ID=' + strQryIsNull('numeric', $('#patientModalSelectAutomark option:selected').val()) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#patientModalSelectAutoYear option:selected').val()) + ', AUTONO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputAutono').val()))) + ', VINNO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#patientModalInputVinno').val()))) + ', FUELTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE=' + strQryIsNull('numeric', $('input[name=patientModalInputTransmission]:checked').val()) + ', UPDATED_STAFFID=N\'' + $.trim($('#indexUserName').html()) + '\', UPDATED_DATE=GETDATE(), ZAALTTYPE=' + strQryIsNull('numeric', valZaaltType) + ', ISMYSOLD=' + strQryIsNull('numeric', valIsMySold) + ', PATIENTDISCOUNT_ID=' + strQryIsNull('numeric', valDiscount) + ' WHERE ID=' + $('#patientID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        $('#patientDatatable').find('tbody > tr').each(function (index) {
                            if ($(this).find('td:eq(0)').text() == $('#patientID').text()) {
                                $(this).find('td:eq(3)').html($.trim($('#patientModalInputAutono').val()));
                                $(this).find('td:eq(4)').html($.trim($('#patientModalInputOwnername').val()));
                                if ($('input[name=patientModalInputType]:checked').val() == '1') $(this).find('td:eq(5)').html('Хувь хүн');
                                else if ($('input[name=patientModalInputType]:checked').val() == '2') $(this).find('td:eq(5)').html('Байгууллага');
                                $(this).find('td:eq(6)').html($('#patientModalSelectAutomark option:selected').text());
                                $(this).find('td:eq(7)').html($('#patientModalSelectAutoYear option:selected').val());
                            }
                        });
                        $('#patientModal').modal('hide');
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
        }
    });
</script>
