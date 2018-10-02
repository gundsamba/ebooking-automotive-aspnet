<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="automark.aspx.cs" Inherits="ebooking.pg.automark" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-3">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-car fa-fw "></i> 
			<span lang="mn">Автомашины марк</span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
            <header>
				<span class="widget-icon"> <i class="fa fa-car"></i> </span>
				<h2 lang="mn">Автомашины маркын бүртгэл</h2>
                <ul class="nav nav-tabs pull-right in" id="partTab">
					<li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
						<a data-toggle="tab" href="#s1"><span lang="mn">Маркын бүртгэл</span></a>
					</li>
					<li id="pTab2Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s2"><span lang="mn">Үйлдвэрлэгч</span></a>
					</li>
				</ul>
			</header>
            <div class="no-padding">
                <div class="jarviswidget-editbox"></div>
                <div class="widget-body">
					<div class="tab-content">
                        <div id="s1" class="tab-pane active animated fast fadeInDown">
                            <div id="loaderTab1" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab1Modal" onclick="pTab1ModalAddEdit(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div id="pTab1DatatableDiv">
					
				            </div>
                        </div>
                        <div id="s2" class="tab-pane animated fast fadeInDown">
                            <div id="loaderTab2" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab2Modal" onclick="pTab2ModalAddEdit(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div id="pTab2DatatableDiv">
					
				            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="pTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="pTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Автомашины марк</span>&nbsp;<span id="pTab1ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="pTab1ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Үйлдвэрлэгч</label>
                                    <select id="pTab1ModalSelectMarkType" name="pTab1ModalSelectMarkType" class="form-control">
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
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="pTab1ModalInputName" name="pTab1ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn"/>
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
<div id="pTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="pTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Үйлдвэрлэгч</span>&nbsp;<span id="pTab2ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="pTab2ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="pTab2ModalInputName" name="pTab2ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn"/>
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
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/AutomarkTab1TypeListForDDL",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                });
                $("#pTab1ModalSelectMarkType").html('<option value="">- Сонго -</option>' + valData);
                dataBindTab1Table();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
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
    }
    //tab1
    function dataBindTab1Table() {
        var valData = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/AutomarkTab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th>#</th>";
                valData += "<th lang=\"mn\">Үйлдвэрлэгч</th>";
                valData += "<th lang=\"mn\">Маркын нэр</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td data-id=\"" + value.AUTOMARK_TYPE_ID + "\">" + replaceDatabaseToDisplay(value.AUTOMARK_TYPE_NAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab1Modal\" onclick=\"pTab1ModalAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"pTab1ModalDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab1Datatable').dataTable({\"iDisplayLength\": 100, \"columns\": [{ \"width\": \"30px\" }, null, null, { \"width\": \"40px\" }], \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}});<\/script>";
                $("#pTab1DatatableDiv").html(valData);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/AutomarkTab1TypeListForDDL",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                        });
                        $("#pTab1ModalSelectMarkType").html('<option value="">- Сонго -</option>' + valData);
                        hideLoader('loaderTab1');
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
    function pTab1ModalAddEdit(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').html(isinsupt);
        $('#pTab1ModalID').html('');
        $('#pTab1ModalSelectMarkType').val('');
        $('#pTab1ModalInputName').val('');
        if (isinsupt == 'засах') {
            $('#pTab1ModalID').text($(el).closest('tr').attr('data-id'));
            $('#pTab1ModalSelectMarkType').val($(el).closest('tr').find('td:eq(1)').attr('data-id'));
            $('#pTab1ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
        }
    }
    function pTab1ModalDelete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(ID) FROM TBL_PATIENT WHERE MARK_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон маркад хамааралтай үйлчлүүлэгчийн мэдээлэл орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон маркыг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_AUTOMARK WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1Table();
                                    smallBox('Сонгосон марк', 'Амжилттай устлаа', '#659265');
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
            pTab1ModalSelectMarkType: {
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
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
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
                    data: '{"qry":"INSERT INTO TBL_AUTOMARK (CLINIC_ID, NAME, AUTOMARK_TYPE_ID) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val()))) + ', ' + $('#pTab1ModalSelectMarkType option:selected').val() + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Машины марк', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_AUTOMARK SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val()))) + ', AUTOMARK_TYPE_ID=' + $('#pTab1ModalSelectMarkType option:selected').val() + ' WHERE ID=' + $('#pTab1ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Машины марк', 'Амжилттай хадгалагдлаа', '#659265');
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
    function dataBindTab2Table() {
        var valData = '';
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/AutomarkTab2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">#</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab2Modal\" onclick=\"pTab2ModalAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"pTab2ModalDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab2Datatable').dataTable({\"iDisplayLength\": 100, \"columns\": [{ \"width\": \"30px\" }, null, { \"width\": \"40px\" }], \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab2Datatable) {responsiveHelper_pTab2Datatable = new ResponsiveDatatablesHelper($('#pTab2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab2Datatable.respond();}});<\/script>";
                $("#pTab2DatatableDiv").html(valData);
                hideLoader('loaderTab2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function pTab2ModalAddEdit(el, isinsupt) {
        $('#pTab2ModalHeaderLabel').html(isinsupt);
        $('#pTab2ModalID').html('');
        $('#pTab2ModalInputName').val('');
        if (isinsupt == 'засах') {
            $('#pTab2ModalID').text($(el).closest('tr').attr('data-id'));
            $('#pTab2ModalInputName').val($(el).closest('tr').find('td:eq(1)').html());
        }
    }
    function pTab2ModalDelete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(ID) FROM TBL_AUTOMARK WHERE AUTOMARK_TYPE_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон Үйлдвэрлэгчид хамааралтай автомашины марк орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон Үйлдвэрлэгчийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_AUTOMARK_TYPE WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab2Table();
                                    smallBox('Сонгосон Үйлдвэрлэгч', 'Амжилттай устлаа', '#659265');
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
            pTab2ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
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
                    data: '{"qry":"INSERT INTO TBL_AUTOMARK_TYPE (CLINIC_ID, NAME) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Үйлдвэрлэгч', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_AUTOMARK_TYPE SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val()))) + ' WHERE ID=' + $('#pTab2ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Үйлдвэрлэгч', 'Амжилттай хадгалагдлаа', '#659265');
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
