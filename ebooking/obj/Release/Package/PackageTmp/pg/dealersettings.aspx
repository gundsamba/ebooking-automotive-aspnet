<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dealersettings.aspx.cs" Inherits="ebooking.pg.dealersettings" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-gears fa-fw "></i> 
			<span lang="mn">Автомашин борлуулалтын тохиргоо</span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
            <header>
				<span class="widget-icon"> <i class="fa fa-gears"></i> </span>
				<h2 lang="mn">Автомашин борлуулалтын тохиргоо</h2>
                <ul class="nav nav-tabs pull-right in" id="pTab">
					<li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
						<a data-toggle="tab" href="#s1"><span class="hidden-mobile hidden-tablet" lang="mn">Загварын төрөл</span></a>
					</li>
					<li id="pTab2Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s2"><span class="hidden-mobile hidden-tablet" lang="mn">Гадар/дотор өнгө</span></a>
					</li>
					<li id="pTab3Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s3"><span class="hidden-mobile hidden-tablet" lang="mn">Төлбөрийн хэлбэр</span></a>
					</li>
				</ul>
			</header>
            <div class="no-padding">
                <div class="jarviswidget-editbox"></div>
                <div class="widget-body">
					<div class="tab-content">
                        <div id="s1" class="tab-pane fade active in animated fast fadeInDown">
                            <div id="loaderTab1" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab1Modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab1SelectMark" name="pTab1SelectMark" runat="server" class="form-control no-padding" disabled="disabled">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:360px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Модел:</label></div>
                            <div class="Colvis TableTools" style="right:415px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab1SelectMarktype" name="pTab1SelectMarktype" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:570px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Үйлдвэрлэгч:</label></div>
                            <div id="pTab1DatatableDiv">

                            </div>
                        </div>
                        <div id="s2" class="tab-pane fade animated fast fadeInDown">
                            <div class="row">
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <div class="jarviswidget no-margin" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
                                        <header>
				                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
				                            <h2 lang="mn">Гадар өнгө</h2>
			                            </header>
                                        <div class="no-padding">
                                            <div class="jarviswidget-editbox"></div>
                                            <div class="widget-body">
                                                <div id="loaderTab2t1" class="loader-background">
                                                    <img src="../img/loading.gif" />
                                                    <h2 lang="mn">Уншиж байна...</h2>
                                                </div>
                                                <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                                                <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab2Modal" onclick="showAddEditTab2(this,'нэмэх', '1')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                                                </div>
                                                <div id="pTab2t1DatatableDiv">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <div class="jarviswidget no-margin" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
                                        <header>
				                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
				                            <h2 lang="mn">Дотор өнгө</h2>
			                            </header>
                                        <div class="no-padding">
                                            <div class="jarviswidget-editbox"></div>
                                            <div class="widget-body">
                                                <div id="loaderTab2t2" class="loader-background">
                                                    <img src="../img/loading.gif" />
                                                    <h2 lang="mn">Уншиж байна...</h2>
                                                </div>
                                                <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                                                <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab2Modal" onclick="showAddEditTab2(this,'нэмэх', '2')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                                                </div>
                                                <div id="pTab2t2DatatableDiv">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="s3" class="tab-pane fade animated fast fadeInDown">
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
                    </div>
				</div>
			</div>
        </div>
    </div>
</div>
<div id="pTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Загварын төрөл</span>&nbsp;<span id="pTab1ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Үйлдвэрлэгч</label>
                                    <select id="pTab1ModalSelectMarktype" name="pTab1ModalSelectMarktype" runat="server" class="form-control">
								        <option value="" lang="mn">- Сонго -</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Модел</label>
                                    <select id="pTab1ModalSelectMark" name="pTab1ModalSelectMark" runat="server" class="form-control" disabled="disabled">
								        <option value="" lang="mn">- Сонго -</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
                                    <textarea id="pTab1ModalInputName" name="pTab1ModalInputName" class="form-control" placeholder="Нэр" lang="mn" rows="3"></textarea>
                                </div>
                            </div>
						</div>
					</fieldset>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
	</div>
</div>
<div id="pTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="z-index:999;">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Өнгө</span>&nbsp;<span id="pTab2ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab2ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Төрөл</label>
                                    <select id="pTab2ModalSelectColortype" name="pTab2ModalSelectColortype" runat="server" class="form-control">
								        <option value="" lang="mn">- Сонго -</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Код</label>
                                    <input id="pTab2ModalInputCode" name="pTab2ModalInputCode" class="form-control" placeholder="Код" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
                                    <input id="pTab2ModalInputName" name="pTab2ModalInputName" class="form-control" placeholder="Нэр" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Өнгө</label>
                                    <input id="pTab2ModalInputColor" name="pTab2ModalInputColor" class="form-control jscolor" placeholder="Өнгө" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
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
			        <h4 class="modal-title"><span lang="mn">Төлбөрийн хэлбэр</span>&nbsp;<span id="pTab3ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab3ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
                                    <textarea id="pTab3ModalInputName" name="pTab3ModalInputName" class="form-control" placeholder="Нэр" lang="mn" rows="3"></textarea>
                                </div>
                            </div>
						</div>
					</fieldset>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
	</div>
</div>
<script type="text/javascript" src="../js/plugin/jscolor/jscolor.js"></script>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        var valData = '';
        var totalprice = 0;
        $('#pTab1SelectMarktype').html($('#pTab1SelectMarktype').html().replace('<option value="">- Бүгд -</option>', '<option value="" lang="mn">- Бүгд -</option>'));
        $('#pTab1SelectMark').html($('#pTab1SelectMark').html().replace('<option value="">- Бүгд -</option>', '<option value="" lang="mn">- Бүгд -</option>'));
        $('#pTab1ModalSelectMarktype').html($('#pTab1ModalSelectMarktype').html().replace('<option value="">- Бүгд -</option>', '<option value="" lang="mn">- Сонго -</option>'));
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
            if ($.trim($('#pTab1DatatableDiv').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#pTab2t1DatatableDiv').html()) == "") {
                dataBindTab2t1Table();
                dataBindTab2t2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#pTab3DatatableDiv').html()) == "") {
                dataBindTab3Table();
            }
        }
    }

    //tab1
    function dataBindTab1Table() {
        var valData='';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealersettingsTab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "mark":"'+$('#pTab1SelectMark option:selected').val()+'", "marktype":"'+$('#pTab1SelectMarktype option:selected').val()+'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">#</th>";
                valData += "<th data-hide=\"phone\ lang=\"mn\">Үйлдвэрлэгч</th>";
                valData += "<th lang=\"mn\">Модел</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td data-id=\""+value.AUTOMARK_TYPE_ID+"\">" + replaceDatabaseToDisplay(value.AUTOMARK_TYPE_NAME) + "</td>";
                    valData += "<td data-id=\""+value.MARK_ID+"\">" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab1Modal\" onclick=\"showAddEditTab1(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null, null, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#pTab1DatatableDiv").html(valData);
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
    $("#pTab1SelectMarktype").change(function () {
        var valdata = '';
        var valoptgroup = '';
        if ($('#pTab1SelectMarktype option:selected').val() == '') {
            $('#pTab1SelectMark').html('<option value="" lang="mn">- Бүгд -</option>');
            $('#pTab1SelectMark').prop('disabled', true);
            dataBindTab1Table()
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/DealersettingsTab1AutomarkListForDDL",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "marktype":"' + $("#pTab1SelectMarktype option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    valoptgroup = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        if (valoptgroup != value.AUTOMARK_TYPE_ID) {
                            if (valoptgroup != '') valData += '</optgroup>';
                            valData += '<optgroup label="' + replaceDatabaseToDisplay(value.AUTOMARK_TYPE_NAME) + '">';
                        }
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                        valoptgroup = value.AUTOMARK_TYPE_ID;
                    });
                    $("#pTab1SelectMark").html('<option value="" lang="mn">- Бүгд -</option>' + valData);
                    $("#pTab1SelectMark").prop('disabled', false);
                    dataBindTab1Table()
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
    $("#pTab1ModalSelectMarktype").change(function () {
        var valdata = '';
        var valoptgroup = '';
        if ($('#pTab1ModalSelectMarktype option:selected').val() == '') {
            $('#pTab1ModalSelectMark').html('<option value="" lang="mn">- Сонго -</option>');
            $('#pTab1ModalSelectMark').prop('disabled', true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/DealersettingsTab1AutomarkListForDDL",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "marktype":"' + $("#pTab1ModalSelectMarktype option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    valoptgroup = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        if (valoptgroup != value.AUTOMARK_TYPE_ID) {
                            if (valoptgroup != '') valData += '</optgroup>';
                            valData += '<optgroup label="' + replaceDatabaseToDisplay(value.AUTOMARK_TYPE_NAME) + '">';
                        }
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                        valoptgroup = value.AUTOMARK_TYPE_ID;
                    });
                    $("#pTab1ModalSelectMark").html('<option value="" lang="mn">- Сонго -</option>' + valData);
                    $("#pTab1ModalSelectMark").prop('disabled', false);
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
    $("#pTab1SelectMark").change(function () {
        dataBindTab1Table();
    });
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        $('#pTab1ModalID').html('');
        $('#pTab1ModalSelectMarktype, #pTab1ModalInputName').val('');
        $('#pTab1ModalSelectMark').html('<option value="" lang="mn">- Сонго -</option>');
        $('#pTab1ModalSelectMark').prop('disabled', true);
        $('#pTab1ModalForm').find('.modal-footer').find(':submit').prop('disabled', false);
        if (isinsupt == 'засах') {
            $('#pTab1ModalID').html($(el).closest('tr').attr('data-id'));
            $('#pTab1ModalSelectMarktype').val($(el).closest('tr').find('td:eq(1)').attr('data-id'));
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/DealersettingsTab1AutomarkListForDDL",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "marktype":"' + $("#pTab1ModalSelectMarktype option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    valoptgroup = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        if (valoptgroup != value.AUTOMARK_TYPE_ID) {
                            if (valoptgroup != '') valData += '</optgroup>';
                            valData += '<optgroup label="' + replaceDatabaseToDisplay(value.AUTOMARK_TYPE_NAME) + '">';
                        }
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                        valoptgroup = value.AUTOMARK_TYPE_ID
                    });
                    $("#pTab1ModalSelectMark").html('<option value="" lang="mn">- Сонго -</option>' + valData);
                    $("#pTab1ModalSelectMark").prop('disabled', false);
                    $('#pTab1ModalSelectMark').val($(el).closest('tr').find('td:eq(2)').attr('data-id'));
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
            $('#pTab1ModalInputName').val($(el).closest('tr').find('td:eq(3)').html());
        }
    }
    function showDeleteTab1(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_SELLCARS WHERE SPECTYPE_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != '0') alert('Сонгосон загварын төрөлд хамааралтай автомашины мэдээлэл орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон загварын төрлийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_SPECTYPE WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1Table();
                                    smallBox('Загварын төрөл', 'Амжилттай устлаа', '#659265');
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
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            pTab1ModalSelectMarktype: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectMark: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 150,
                        message: 'Утас уртдаа 150 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_SPECTYPE (CLINIC_ID, MARK_ID, NAME) VALUES (' + $('#indexClinicId').text() + ', ' + $('#pTab1ModalSelectMark option:selected').val() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Загварын төрөл', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_SPECTYPE SET MARK_ID=' + $('#pTab1ModalSelectMark option:selected').val() + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val()))) + ' WHERE ID=' + $('#pTab1ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Загварын төрөл', 'Амжилттай хадгалагдлаа', '#659265');
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
    //tab2
    function dataBindTab2t1Table() {
        var valData = '';
        showLoader('loaderTab2t1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealersettingsTab2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "colortype":"1"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab2t1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">#</th>";
                valData += "<th lang=\"mn\">Код</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th lang=\"mn\">Өнгө</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.CODE) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td data-value=\""+value.HTMLCODE+"\" style=\"background-color:#"+value.HTMLCODE+";\"></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab2Modal\" onclick=\"showAddEditTab2(this,'засах', '1')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab2(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab2t1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab2t1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab2t1Datatable) {responsiveHelper_pTab2t1Datatable = new ResponsiveDatatablesHelper($('#pTab2t1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab2t1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab2t1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null, { \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#pTab2t1DatatableDiv").html(valData);
                hideLoader('loaderTab2t1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dataBindTab2t2Table() {
        var valData = '';
        showLoader('loaderTab2t2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealersettingsTab2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "colortype":"2"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab2t2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">#</th>";
                valData += "<th lang=\"mn\">Код</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th lang=\"mn\">Өнгө</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.CODE) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td data-value=\"" + value.HTMLCODE + "\" style=\"background-color:#" + value.HTMLCODE + ";\"></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab2Modal\" onclick=\"showAddEditTab2(this,'засах', '2')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab2(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab2t2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab2t2Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab2t2Datatable) {responsiveHelper_pTab2t2Datatable = new ResponsiveDatatablesHelper($('#pTab2t2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab2t2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab2t2Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null, { \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#pTab2t2DatatableDiv").html(valData);
                hideLoader('loaderTab2t2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab2(el, isinsupt, tp) {
        $('#pTab2ModalHeaderLabel').text(isinsupt);
        $('#pTab2ModalID').html('');
        $('#pTab2ModalSelectColortype').val(tp);
        $('#pTab2ModalSelectColortype').prop('disabled',true);
        $('#pTab2ModalInputCode, #pTab2ModalInputName, #pTab2ModalInputColor').val('');
        $('#pTab2ModalInputColor').removeAttr('style');
        $('#pTab2ModalForm').find('.modal-footer').find(':submit').prop('disabled', false);
        if (isinsupt == 'засах') {
            $('#pTab2ModalID').html($(el).closest('tr').attr('data-id'));
            $('#pTab2ModalInputCode').val($(el).closest('tr').find('td:eq(1)').html());
            $('#pTab2ModalInputName').val($(el).closest('tr').find('td:eq(2)').html());
            $('#pTab2ModalInputColor').val($(el).closest('tr').find('td:eq(3)').attr('data-value'));
            $('#pTab2ModalInputColor').css('background-color', '#' + $(el).closest('tr').find('td:eq(3)').attr('data-value'));
        }
    }
    function showDeleteTab2(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_SELLCARS WHERE EXTCOLOR_ID=' + $(el).closest('tr').attr('data-id') + ' OR INTCOLOR_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != '0') alert('Сонгосон өнгөний мэдээлэлд хамааралтай автомашины мэдээлэл орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон өнгөний мэдээллийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_CARCOLOR WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    if ($(el).closest('table').attr('id') == 'pTab2t1Datatable') dataBindTab2t1Table();
                                    else if ($(el).closest('table').attr('id') == 'pTab2t2Datatable') dataBindTab2t2Table();
                                    smallBox('Өнгөний мэдээлэл', 'Амжилттай устлаа', '#659265');
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
    $('#pTab2ModalForm').bootstrapValidator({
        fields: {
            pTab2ModalSelectColortype: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2ModalInputCode: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 10,
                        message: 'Утас уртдаа 10 тэмдэгт авна'
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
                        max: 150,
                        message: 'Утас уртдаа 150 тэмдэгт авна'
                    }
                }
            },
            pTab2ModalInputColor: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 6,
                        message: 'Утас уртдаа 6 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_CARCOLOR (CLINIC_ID, CARCOLORTYPE_ID, CODE, NAME, HTMLCODE) VALUES (' + $('#indexClinicId').text() + ', ' + $('#pTab2ModalSelectColortype option:selected').val() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab2ModalInputCode').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab2ModalInputColor').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($('#pTab2ModalSelectColortype option:selected').val() == '1') dataBindTab2t1Table();
                        else if ($('#pTab2ModalSelectColortype option:selected').val() == '2') dataBindTab2t2Table();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Өнгөний мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_CARCOLOR SET CARCOLORTYPE_ID=' + $('#pTab2ModalSelectColortype option:selected').val() + ', CODE=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab2ModalInputCode').val()))) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val()))) + ', HTMLCODE=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab2ModalInputColor').val()))) + ' WHERE ID=' + $('#pTab2ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($('#pTab2ModalSelectColortype option:selected').val() == '1') dataBindTab2t1Table();
                        else if ($('#pTab2ModalSelectColortype option:selected').val() == '2') dataBindTab2t2Table();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Өнгөний мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
    //tab3
    function dataBindTab3Table() {
        var valData = '';
        showLoader('loaderTab3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealersettingsTab3Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab3Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">#</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTa2t1Modal\" onclick=\"showAddEditTab2t1(this,'засах', '1')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab2t1(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab3Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab3Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab3Datatable) {responsiveHelper_pTab3Datatable = new ResponsiveDatatablesHelper($('#pTab3Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab3Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab3Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#pTab3DatatableDiv").html(valData);
                hideLoader('loaderTab3');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab3(el, isinsupt) {
        $('#pTab3ModalHeaderLabel').text(isinsupt);
        $('#pTab3ModalID').html('');
        $('#pTab3ModalInputName').val('');
        $('#pTab3ModalForm').find('.modal-footer').find(':submit').prop('disabled', false);
        if (isinsupt == 'засах') {
            $('#pTab3ModalID').html($(el).closest('tr').attr('data-id'));
            $('#pTab3ModalInputName').val($(el).closest('tr').find('td:eq(1)').html());
        }
    }
    function showDeleteTab3(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_SOLDCARCUSTOMER_SELLCARS WHERE SELLCARSPAYMENTTYPE_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != '0') alert('Сонгосон төлбөрийн хэлбэрд хамааралтай автомашин худалдан авсан мэдээлэл орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон загварын төрлийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_SELLCARSPAYMENTTYPE WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab3Table();
                                    smallBox('Төлбөрийн хэлбэр', 'Амжилттай устлаа', '#659265');
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
    $('#pTab3ModalForm').bootstrapValidator({
        fields: {
            pTab3ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 150,
                        message: 'Утас уртдаа 150 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab3ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_SELLCARSPAYMENTTYPE (CLINIC_ID, NAME) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputName').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3Table();
                        $('#pTab3Modal').modal('hide');
                        smallBox('Төлбөрийн хэлбэр', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_SELLCARSPAYMENTTYPE SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputName').val()))) + ' WHERE ID=' + $('#pTab3ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3Table();
                        $('#pTab3Modal').modal('hide');
                        smallBox('Төлбөрийн хэлбэр', 'Амжилттай хадгалагдлаа', '#659265');
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
