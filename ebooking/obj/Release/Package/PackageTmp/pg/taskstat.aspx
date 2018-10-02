<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="taskstat.aspx.cs" Inherits="ebooking.pg.taskstat" %>
<style>
    td.cry {
        cursor: pointer;
    }
    td.cry:hover {
        background-color:#D6D6D6;
    }
    td.modifiedcell {
        background-color:#f9f2f4;
    }
</style>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-wrench fa-fw "></i> 
			<span lang="mn">Статистик</span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
            <header>
                <span class="widget-icon"> <i class="fa fa-medkit"></i> </span>
				<h2 lang="mn">Статистик</h2>
                <ul class="nav nav-tabs pull-right in" id="pTab">
					<li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
						<a data-toggle="tab" href="#s1"><span class="hidden-mobile hidden-tablet" lang="mn"><i class="fa fa-list"></i> Статистик утга</span></a>
					</li>
					<li id="pTab2Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s2"><span class="hidden-mobile hidden-tablet" lang="mn"><i class="fa fa-table"></i> Статистик нэр</span></a>
					</li>
					<li id="pTab3Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s3"><span class="hidden-mobile hidden-tablet" lang="mn"><i class="fa fa-wrench"></i> Алба</span></a>
					</li>
					<li id="pTab4Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s4"><span class="hidden-mobile hidden-tablet" lang="mn"><i class="fa fa-wrench"></i> Хэмжих нэгж</span></a>
					</li>
				</ul>
            </header>
            <div class="no-padding">
                <div class="jarviswidget-editbox"></div>
                <div class="widget-body">
                    <div class="tab-content">
                        <div id="s1" class="tab-pane fade active in">
                            <div id="loaderTab1" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:0px; z-index:5; margin-top:7px; width:135px;">
                                <select id="pTab1SelectType" name="pTab1SelectType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:315px; top:0px; z-index:5; margin-top:7px; width:60px;">
                                <select id="pTab1SelectYear" name="pTab1SelectYear" runat="server" class="form-control no-padding"></select>
                            </div>
                            <div class="Colvis TableTools" style="right:385px; top:0px; z-index:5; margin-top:7px; width:80px;">
                                <select id="pTab1SelectMonth" name="pTab1SelectMonth" runat="server" class="form-control no-padding">
                                    <option value="1">1-р сар</option>
                                    <option value="2">2-р сар</option>
                                    <option value="3">3-р сар</option>
                                    <option value="4">4-р сар</option>
                                    <option value="5">5-р сар</option>
                                    <option value="6">6-р сар</option>
                                    <option value="7">7-р сар</option>
                                    <option value="8">8-р сар</option>
                                    <option value="9">9-р сар</option>
                                    <option value="10">10-р сар</option>
                                    <option value="11">11-р сар</option>
                                    <option value="12">12-р сар</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:275px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Алба:</label></div>
                            <div id="pTab1DatatableDiv">

                            </div>
                        </div>
                        <div id="s2" class="tab-pane fade">
                            <div id="loaderTab2" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab2Modal" onclick="showAddEditTab2(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab2SelectType" name="pTab2SelectType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:360px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Алба:</label></div>
                            <div id="pTab2DatatableDiv">

                            </div>
                        </div>
                        <div id="s3" class="tab-pane fade">
                            <div id="loaderTab3" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab3Modal" onclick="showAddEditTab3(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div id="pTab3DatatableDiv">

                            </div>
                        </div>
                        <div id="s4" class="tab-pane fade">
                            <div id="loaderTab4" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab4Modal" onclick="showAddEditTab4(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div id="pTab4DatatableDiv">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="pTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Статистик</span>&nbsp;<span id="pTab2ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab2ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">*Алба</label>
							        <select id="pTab2ModalSelectType" name="pTab2ModalSelectType" runat="server" class="form-control">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Дугаар</label>
									<input id="pTab2ModalInputNo" name="pTab2ModalInputNo" type="text" class="form-control" placeholder="Дугаар" lang="mn" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="pTab2ModalInputName" name="pTab2ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Оруулах ажилтаны нэр</label>
									<input id="pTab2ModalInputStaffname" name="pTab2ModalInputStaffname" type="text" class="form-control" placeholder="Оруулах ажилтаны нэр" lang="mn" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">*Нэмжих нэгж</label>
							        <select id="pTab2ModalSelectMnttype" name="pTab2ModalSelectMnttype" runat="server" class="form-control">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="pTab3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab3ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Алба</span>&nbsp;<span id="pTab3ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab3ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Дугаар</label>
									<input id="pTab3ModalInputNo" name="pTab3ModalInputNo" type="text" class="form-control" placeholder="Дугаар" lang="mn" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="pTab3ModalInputName" name="pTab3ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn" />
                                </div>
                            </div>
						</div>
					</fieldset>
                </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="pTab4Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab4ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Хэмжих нэгж</span>&nbsp;<span id="pTab4ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab4ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="pTab4ModalInputName" name="pTab4ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn" />
                                </div>
                            </div>
						</div>
					</fieldset>
                </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/taskstat_taskstatTypeListForDDL",
            data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1SelectType, #pTab2SelectType").html('<option value="">- Бүгд -</option>' + replaceDatabaseToDisplay(msg.d));
                $("#pTab2ModalSelectType").html('<option value="">- Сонго -</option>' + replaceDatabaseToDisplay(msg.d));
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/taskstat_taskstatMnttypeListForDDL",
                    data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        $("#pTab2ModalSelectMnttype").html('<option value="">- Сонго -</option>' + replaceDatabaseToDisplay(msg.d));
                        dataBindTab1Table();
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
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
            if ($.trim($('#pTab1DatatableDiv').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#pTab2DatatableDiv').html()) == "") {
                dataBindTab2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#pTab3DatatableDiv').html()) == "") {
                dataBindTab3Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab4Li') {
            if ($.trim($('#pTab4DatatableDiv').html()) == "") {
                dataBindTab4Table();
            }
        }
    }
    //tab1
    function dataBindTab1Table() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/taskstat_taskstatTab1Datatable",
            data: '{clinicid:"' + $('#indexClinicId').text() + '", typeid:"' + $('#pTab1SelectType option:selected').val() + '", yr:"' + $('#pTab1SelectYear option:selected').val() + '", mnth:"' + $('#pTab1SelectMonth option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1DatatableDiv").html(replaceDatabaseToDisplay(msg.d));
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#pTab1SelectType, #pTab1SelectYear, #pTab1SelectMonth").change(function () {
        dataBindTab1Table();
    });
    function funcTab1Cry(el) {
        $(el).html('<input type="text" class="text-right cryinput" value="' + $.trim($(el).text()) + '" onblur="funcTab1CryInputFocusout(this)" onfocusout="funcTab1CryInputFocusout(this)" onkeyup="funcTab1CryInputKeyup(this)" onkeydown="funcTab1CryInputKeydown(this,event)"/>');
        $(el).find('input[type="text"]').focus().select();
    };
    function funcTab1CryInputFocusout(el) {
        var valPer = 0;
        var valColor = '';
        if ($(el).closest('td').index() == 6) {
            if (parseFloat($(el).val().replace(/,/g, "")) == 0) {
                valPer = 0;
            }
            else {
                valPer = ((parseFloat($(el).val().replace(/,/g, "")) / parseFloat($(el).closest('tr').find('td:eq(5)').text().replace(/,/g, ""))) * 100).toFixed(1);
            }
        }
        else {
            valPer = ((parseFloat($(el).closest('tr').find('td:eq(6)').text().replace(/,/g, "")) / parseFloat($(el).val().replace(/,/g, ""))) * 100).toFixed(1);
        }
        if (valPer < 50) valColor = 'bg-color-red';
        else if (valPer > 49 && valPer < 80) valColor = 'bg-color-orangeDark';
        else if (valPer > 79) valColor = 'bg-color-greenDark';
        $(el).closest('tr').find('td:eq(7)').html('<span class="font-sm label ' + valColor + '">' + valPer.toString() + ' %</span>');
        $(el).closest('tr').find('td:eq(9)').html('<button class=\"btn btn-xs btn-primary\" onclick=\"showSaveTab1(this)\"><i class=\"glyphicon glyphicon-floppy-disk\"></i></button>');
        $(el).closest('td').toggleClass('modifiedcell');
        $(el).closest('td').html(parseFloat($(el).val().replace(/,/g, ""))
                    .toFixed(0)
                    .toString()
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }
    function funcTab1CryInputKeyup(el) {
        if ($.trim($(el).val()) == '') {
            $(el).val('0');
        }
        else {
            $(el).val(parseFloat($(el).val().replace(/,/g, ""))
                 .toFixed(0)
                 .toString()
                 .replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        }
    }
    function funcTab1CryInputKeydown(el, e) {
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
            (e.keyCode >= 35 && e.keyCode <= 40)) {
            return;
        }
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    };
    function showSaveTab1(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSExecuteNonQuery",
            data: '{qry:"UPDATE TBL_TASK_STAT SET PLANCRY=' + $(el).closest('tr').find('td:eq(5)').text().replace(/,/g, "") + ' , PERFCRY=' + $(el).closest('tr').find('td:eq(6)').text().replace(/,/g, "") + ' WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                $(el).closest('tr').find('td:eq(5)').toggleClass('modifiedcell');
                $(el).closest('tr').find('td:eq(6)').toggleClass('modifiedcell');
                $(el).closest('tr').find('td:eq(9)').html('');
                smallBox('Статистик мэдээ', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }

    //tab2
    function dataBindTab2Table() {
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/taskstat_taskstatTab2Datatable",
            data: '{clinicid:"' + $('#indexClinicId').text() + '", typeid:"' + $('#pTab2SelectType option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab2DatatableDiv").html(replaceDatabaseToDisplay(msg.d));
                hideLoader('loaderTab2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#pTab2SelectType").change(function () {
        dataBindTab2Table();
    });
    function showAddEditTab2(el, isinsupt) {
        $('#pTab2ModalHeaderLabel').text(isinsupt);
        $('#pTab2ID').html('');
        $('#pTab2ModalSelectType').val('');
        $('#pTab2ModalInputNo').val('');
        $('#pTab2ModalInputName').val('');
        $('#pTab2ModalInputStaffname').val('');
        $('#pTab2ModalSelectMnttype').val('');
        if (isinsupt == 'засах') {
            $('#pTab2ID').text($(el).closest('tr').attr('data-id'));
            $('#pTab2ModalSelectType').val($(el).closest('tr').find('td:eq(3)').attr('data-id'));
            $('#pTab2ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab2ModalInputNo').val($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab2ModalInputStaffname').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab2ModalSelectMnttype').val($(el).closest('tr').find('td:eq(5)').attr('data-id'));
        }
    }
    function showDeleteTab2(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон статистикийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"DELETE FROM TBL_TASK_STAT WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        $("#pTab1DatatableDiv").html('');
                        dataBindTab2Table();
                        smallBox('Статистик', 'Амжилттай устлаа', '#659265');
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    $('#pTab2ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            pTab2ModalSelectType: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2ModalInputNo: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт орно'
                    }
                }
            },
            pTab2ModalInputName: {
                group: '.col-md-12',
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
            pTab2ModalInputStaffname: {
                group: '.col-md-12',
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
            pTab2ModalSelectMnttype: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"INSERT INTO TBL_TASK_STAT (CLINIC_ID, TASK_STAT_TYPE_ID, NO, NAME, STAFFNAME, MNTTYPE_ID, LAST_UPDATE) VALUES (' + $('#indexClinicId').text() + ', ' + $('#pTab2ModalSelectType option:selected').val() + ', ' + $.trim($('#pTab2ModalInputNo').val()) + ', N\'' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val())) + '\', N\'' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputStaffname').val())) + '\', ' + $('#pTab2ModalSelectMnttype option:selected').val() + ', GETDATE())"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        $("#pTab1DatatableDiv").html('');
                        dataBindTab2Table();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Статистик', 'Амжилттай хадгалагдлаа', '#659265');
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"UPDATE TBL_TASK_STAT SET TASK_STAT_TYPE_ID=' + $('#pTab2ModalSelectType option:selected').val() + ', NO=' + $.trim($('#pTab2ModalInputNo').val()) + ', NAME=N\'' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val())) + '\', STAFFNAME=N\'' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputStaffname').val())) + '\', MNTTYPE_ID=' + $('#pTab2ModalSelectMnttype option:selected').val() + ' WHERE ID=' + $('#pTab2ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        $("#pTab1DatatableDiv").html('');
                        dataBindTab2Table();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Статистик', 'Амжилттай хадгалагдлаа', '#659265');
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }

        }
    });
    //tab3
    function dataBindTab3Table() {
        showLoader('loaderTab3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/taskstat_taskstatTab3Datatable",
            data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab3DatatableDiv").html(replaceDatabaseToDisplay(msg.d));
                hideLoader('loaderTab3');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab3(el, isinsupt) {
        $('#pTab3ModalHeaderLabel').text(isinsupt);
        $('#pTab3ID').text('');
        $('#pTab3ModalInputNo').val('');
        $('#pTab3ModalInputName').val('');
        if (isinsupt == 'засах') {
            $('#pTab3ID').text($(el).closest('tr').attr('data-id'));
            $('#pTab3ModalInputNo').val($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab3ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
        }
    }
    function showDeleteTab3(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSExecuteScalar",
            data: '{qry:"SELECT COUNT(1) FROM TBL_TASK_STAT WHERE TASK_STAT_TYPE_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d != '0') alert('Сонгосон албад хамааралтай статистик орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон албыг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/WSExecuteNonQuery",
                                data: '{qry:"DELETE FROM TBL_TASK_STAT_TYPE WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "ws.aspx/taskstat_taskstatTypeListForDDL",
                                        data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (msg) {
                                            $("#pTab1SelectType, #pTab2SelectType").html('<option value="">- Бүгд -</option>' + replaceDatabaseToDisplay(msg.d));
                                            $("#pTab2ModalSelectType").html('<option value="">- Сонго -</option>' + replaceDatabaseToDisplay(msg.d));
                                            $("#pTab1DatatableDiv, #pTab2DatatableDiv").html('');
                                            dataBindTab3Table();
                                            smallBox('Алба', 'Амжилттай устлаа', '#659265');
                                        },
                                        failure: function (response) {
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            var err = eval("(" + xhr.responseText + ")");
                                            if (err.Message == 'SessionDied') window.location = '../login.html';
                                            else window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    var err = eval("(" + xhr.responseText + ")");
                                    if (err.Message == 'SessionDied') window.location = '../login.html';
                                    else window.location = '../#pg/error500.aspx';
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
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#pTab3ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            pTab3ModalInputNo: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 3,
                        message: 'Уртдаа 3 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт орно'
                    }
                }
            },
            pTab3ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab3ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"INSERT INTO TBL_TASK_STAT_TYPE (CLINIC_ID, NO, NAME) VALUES (' + $('#indexClinicId').text() + ', ' + $.trim($('#pTab3ModalInputNo').val()) + ', N\'' + replaceDisplayToDatabase($.trim($('#pTab3ModalInputName').val())) + '\')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/taskstat_taskstatTypeListForDDL",
                            data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                $("#pTab1SelectType, #pTab2SelectType").html('<option value="">- Бүгд -</option>' + replaceDatabaseToDisplay(msg.d));
                                $("#pTab2ModalSelectType").html('<option value="">- Сонго -</option>' + replaceDatabaseToDisplay(msg.d));
                                $("#pTab1DatatableDiv, #pTab2DatatableDiv").html('');
                                dataBindTab3Table();
                                $('#pTab3Modal').modal('hide');
                                smallBox('Алба', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                var err = eval("(" + xhr.responseText + ")");
                                if (err.Message == 'SessionDied') window.location = '../login.html';
                                else window.location = '../#pg/error500.aspx';
                            }
                        });
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"UPDATE TBL_TASK_STAT_TYPE SET NO=' + $.trim($('#pTab3ModalInputNo').val()) + ', NAME=N\'' + replaceDisplayToDatabase($.trim($('#pTab3ModalInputName').val())) + '\' WHERE ID=' + $('#pTab3ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/taskstat_taskstatTypeListForDDL",
                            data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                $("#pTab1SelectType, #pTab2SelectType").html('<option value="">- Бүгд -</option>' + replaceDatabaseToDisplay(msg.d));
                                $("#pTab2ModalSelectType").html('<option value="">- Сонго -</option>' + replaceDatabaseToDisplay(msg.d));
                                $("#pTab1DatatableDiv, #pTab2DatatableDiv").html('');
                                dataBindTab3Table();
                                $('#pTab3Modal').modal('hide');
                                smallBox('Алба', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                var err = eval("(" + xhr.responseText + ")");
                                if (err.Message == 'SessionDied') window.location = '../login.html';
                                else window.location = '../#pg/error500.aspx';
                            }
                        });
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }

        }
    });
    //tab4
    function dataBindTab4Table() {
        showLoader('loaderTab4');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/taskstat_taskstatTab4Datatable",
            data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab4DatatableDiv").html(replaceDatabaseToDisplay(msg.d));
                hideLoader('loaderTab4');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab4(el, isinsupt) {
        $('#pTab4ModalHeaderLabel').text(isinsupt);
        $('#pTab4ID').text('');
        $('#pTab4ModalInputName').val('');
        if (isinsupt == 'засах') {
            $('#pTab4ID').text($(el).closest('tr').attr('data-id'));
            $('#pTab4ModalInputName').val($(el).closest('tr').find('td:eq(1)').text());
        }
    }
    function showDeleteTab4(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSExecuteScalar",
            data: '{qry:"SELECT COUNT(1) FROM TBL_TASK_STAT WHERE MNTTYPE_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d != '0') alert('Сонгосон хэмжих нэгжид хамааралтай статистик орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон хэмжих нэгж устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/WSExecuteNonQuery",
                                data: '{qry:"DELETE FROM TBL_MNTTYPE WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "ws.aspx/taskstat_taskstatMnttypeListForDDL",
                                        data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (msg) {
                                            $("#pTab2ModalSelectMnttype").html('<option value="">- Сонго -</option>' + replaceDatabaseToDisplay(msg.d));
                                            $("#pTab1DatatableDiv, #pTab2DatatableDiv").html('');
                                            dataBindTab4Table();
                                            smallBox('Хэмжих нэгж', 'Амжилттай устлаа', '#659265');
                                        },
                                        failure: function (response) {
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            var err = eval("(" + xhr.responseText + ")");
                                            if (err.Message == 'SessionDied') window.location = '../login.html';
                                            else window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    var err = eval("(" + xhr.responseText + ")");
                                    if (err.Message == 'SessionDied') window.location = '../login.html';
                                    else window.location = '../#pg/error500.aspx';
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
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#pTab4ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            pTab4ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab4ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"INSERT INTO TBL_MNTTYPE (CLINIC_ID, NAME) VALUES (' + $('#indexClinicId').text() + ', N\'' + replaceDisplayToDatabase($.trim($('#pTab4ModalInputName').val())) + '\')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/taskstat_taskstatMnttypeListForDDL",
                            data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                $("#pTab2ModalSelectMnttype").html('<option value="">- Сонго -</option>' + replaceDatabaseToDisplay(msg.d));
                                $("#pTab1DatatableDiv, #pTab2DatatableDiv").html('');
                                dataBindTab4Table();
                                $('#pTab4Modal').modal('hide');
                                smallBox('Хэмжих нэгж', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                var err = eval("(" + xhr.responseText + ")");
                                if (err.Message == 'SessionDied') window.location = '../login.html';
                                else window.location = '../#pg/error500.aspx';
                            }
                        });
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"UPDATE TBL_MNTTYPE SET NAME=N\'' + replaceDisplayToDatabase($.trim($('#pTab4ModalInputName').val())) + '\' WHERE ID=' + $('#pTab4ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/taskstat_taskstatTypeListForDDL",
                            data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                $("#pTab2ModalSelectMnttype").html('<option value="">- Сонго -</option>' + replaceDatabaseToDisplay(msg.d));
                                $("#pTab1DatatableDiv, #pTab2DatatableDiv").html('');
                                dataBindTab4Table();
                                $('#pTab4Modal').modal('hide');
                                smallBox('Хэмжих нэгж', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                var err = eval("(" + xhr.responseText + ")");
                                if (err.Message == 'SessionDied') window.location = '../login.html';
                                else window.location = '../#pg/error500.aspx';
                            }
                        });
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
    });
</script>