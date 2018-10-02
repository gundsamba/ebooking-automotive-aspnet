<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="taskmission.aspx.cs" Inherits="ebooking.pg.taskmission" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-globe fa-fw "></i> 
			<span id="headTitleName" runat="server" lang="mn"></span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
            <header>
                <%--<span class="widget-icon"> <i class="fa fa-medkit"></i> </span>
				<h2 lang="mn">Үүрэг даалгавар</h2>--%>
                <ul class="nav nav-tabs" id="pTab">
					<li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
						<a data-toggle="tab" href="#s1"><span class="hidden-mobile hidden-tablet" lang="mn"><i class="fa fa-list"></i> Бүртгэл</span></a>
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
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#pTab1Modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:135px;">
                                <select id="pTab1SelectType" name="pTab1SelectType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:345px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Алба:</label></div>
                            <div class="Colvis TableTools" style="right:390px; top:0px; z-index:5; margin-top:7px; width:135px;">
                                <select id="pTab1SelectMissionType" name="pTab1SelectMissionType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:530px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Үр дүн:</label></div>
                            <div class="Colvis TableTools" style="right:585px; top:0px; z-index:5; margin-top:7px; width:135px;">
                                <select id="pTab1SelectStaff" name="pTab1SelectStaff" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:725px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Хэнийх:</label></div>
                            <div id="pTab1DatatableDiv">

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
			        <h4 class="modal-title"><span id="modalHeadTitleName" runat="server" lang="mn">Үүрэг даалгавар</span>&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">*Алба</label>
							        <select id="pTab1ModalSelectType" name="pTab1ModalSelectType" runat="server" class="form-control">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label" lang="mn">*Дугаар</label>
									<input id="pTab1ModalInputNo" name="pTab1ModalInputNo" type="text" class="form-control" placeholder="Дугаар" lang="mn" />
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label" lang="mn">*Нэр</label>
                                    <textarea id="pTab1ModalInputName" name="pTab1ModalInputName" class="form-control" placeholder="Нэр" rows="2"></textarea>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Үүсгэсэн ажилтан</label>
									<select id="pTab1ModalSelectCreatedStaff" name="pTab1ModalSelectCreatedStaff" runat="server" class="form-control">
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
                                    <label class="control-label" lang="mn">*Хариуцах ажилтан</label>
									<div id="pTab1ModalDivSelect2Staff">

									</div>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label lang="mn">*Дуусгах огноо</label>
							        <input id="pTab1ModalInputDate" name="pTab1ModalInputDate" type="text" class="form-control hasDatepicker" placeholder="Дуусгах огноо" lang="mn" />
                                </div>
                                <div class="col-md-8">
                                    <label lang="mn">Тайлбар</label>
                                    <textarea id="pTab1ModalInputMemo" name="pTab1ModalInputMemo" class="form-control" placeholder="Тайлбар" rows="2"></textarea>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Харах эрх</label>
									<div id="pTab1ModalDivSelect2User">

									</div>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group" style="margin:10px 0 0 0; display:block; overflow:hidden;">
                                        <div class="col-md-4" style="font-size:13px;">
                                            Хавсралт файл:
                                        </div>
                                        <div class="col-md-8" style="font-style:italic;padding-left: 0;">
                                            <a href="javascript:void(0);" id="pTab1ModalAttachBtn" class="btn btn-link btn-xs" style="padding:0px; border:none;"></a>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin:0; display:block; overflow:hidden;">
                                        <div class="col-md-4">
                                            <a id="pTab1ModalAttachDelete" class="btn btn-link btn-xs" href="javascript:void(0);"><i class="fa fa-trash-o"></i> файл устгах</a>
                                        </div>
                                        <div class="col-md-8" style="padding-left: 0;">
                                            <input name="pTab1ModalAttachInput" id="pTab1ModalAttachInput" class="btn btn-default" type="file">
                                        </div>
                                    </div>
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
<div id="pTab1MemoModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">

        </div>
    </div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        $("#pTab1SelectType").html('<option value="">- Бүгд -</option>' + $("#pTab1SelectType").html());
        $("#pTab1ModalSelectType").html('<option value="">- Сонго -</option>' + $("#pTab1ModalSelectType").html());
        $("#pTab1SelectMissionType").html('<option value="">- Бүгд -</option>' + $("#pTab1SelectMissionType").html());
        $("#pTab1SelectStaff").html('<option value="">- Бүгд -</option>' + $("#pTab1SelectStaff").html());
        $("#pTab1ModalSelectCreatedStaff").html('<option value="">- Сонго -</option>' + $("#pTab1ModalSelectCreatedStaff").html());
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
    }
    //tab1
    function dataBindTab1Table() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/taskmission_taskmissionTab1Datatable",
            data: '{clinicid:"' + $('#indexClinicId').text() + '", typeid:"' + <%=Request.QueryString["id"]%> + '", curruserid:"' + $('#indexStaffId').text() + '", albaid:"' + $('#pTab1SelectType option:selected').val() + '", evaltypeid:"' + $('#pTab1SelectMissionType option:selected').val() + '", createdstaffid:"' + $('#pTab1SelectStaff option:selected').val() + '"}',
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
    $("#pTab1SelectStaff, #pTab1SelectMissionType, #pTab1SelectType").change(function () {
        dataBindTab1Table();
    });
    function dataBindTab1ModalStaffSelect2(valSelected) {
        $('#pTab1ModalDivSelect2Staff').html('<input class="form-control ui-autocomplete-loading" placeholder="" type="text">');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/taskmissionTab1StaffListForSelect2",
            data: '{clinicid:"' + $('#indexClinicId').text() + '", selectedidlist:"' + valSelected + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1ModalDivSelect2Staff").html(msg.d);
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
    function dataBindTab1ModalUserSelect2(valSelected) {
        $('#pTab1ModalDivSelect2User').html('<input class="form-control ui-autocomplete-loading" placeholder="" type="text">');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/taskmissionTab1UserListForSelect2",
            data: '{clinicid:"' + $('#indexClinicId').text() + '", selectedidlist:"' + valSelected + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1ModalDivSelect2User").html(msg.d);
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
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1ID').html('');
            $('#pTab1ModalSelectType').val('');
            $('#pTab1ModalInputNo').val('');
            $('#pTab1ModalInputName').val('');
            $('#pTab1ModalSelectCreatedStaff').val('');
            dataBindTab1ModalStaffSelect2('');
            $('#pTab1ModalInputDate').val('');
            $('#pTab1ModalInputMemo').val('');
            dataBindTab1ModalUserSelect2('');
            $('#pTab1ModalAttachBtn').html('Файл хавсаргаагүй байна...');
            $('#pTab1ModalAttachInput').val('');
        }
        else if (isinsupt == 'засах') {
            $('#pTab1ID').text($(el).closest('tr').attr('data-id'));
            $('#pTab1ModalSelectType').val($(el).closest('tr').find('td:eq(3)').attr('data-id'));
            $('#pTab1ModalInputNo').val($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab1ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1ModalSelectCreatedStaff').val($(el).closest('tr').find('td:eq(6)').attr('data-id'));
            dataBindTab1ModalStaffSelect2($(el).closest('tr').find('td:eq(7)').attr('data-id'));
            $('#pTab1ModalInputDate').val($(el).closest('tr').find('td:eq(5)').text());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSExecuteScalar",
                data: '{qry:"SELECT MEMO FROM TBL_TASK_MISSION WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $('#pTab1ModalInputMemo').val(replaceDatabaseToDisplay(msg.d));
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
            dataBindTab1ModalUserSelect2($(el).closest('tr').attr('data-useridlist'));
            if ($(el).closest('tr').find('td:eq(9)').find('a').length == 0) {
                $('#pTab1ModalAttachBtn').html('Файл хавсаргаагүй байна...');
                $('#pTab1ModalAttachInput').val('');
            }
            else {
                $('#pTab1ModalAttachBtn').html($(el).closest('tr').find('td:eq(9)').find('a').attr('href').split('/').pop());
                $('#pTab1ModalAttachInput').val('');
            }
        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон мөр мэдээллийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"DELETE FROM TBL_TASK_MISSION WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        smallBox('Сонгосон мөр мэдээлэл', 'Амжилттай устлаа', '#659265');
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
    $('#pTab1ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            pTab1ModalSelectType: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputNo: {
                group: '.col-md-4',
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
            pTab1ModalInputName: {
                group: '.col-md-8',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 200,
                        message: 'Уртдаа 200 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalSelectCreatedStaff: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputDate: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1ModalInputMemo: {
                group: '.col-md-8',
                validators: {
                    stringLength: {
                        max: 500,
                        message: 'Уртдаа 500 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1ModalSelect2Staff').val() == null) {
                alert('Хариуцах ажилтан сонгоно уу');
                $('#pTab1ModalForm').find('.modal-footer').find('.btn-success').prop('disabled', false);
            }
            else {
                if ($('#pTab1ModalSelect2User').val() == null) {
                    alert('Харуулах эрх сонгоно уу');
                    $('#pTab1ModalForm').find('.modal-footer').find('.btn-success').prop('disabled', false);
                }
                else {
                    var stlist = "none", userlist = "";
                    if ($('#pTab1ModalSelect2Staff').val() != null) stlist = $('#pTab1ModalSelect2Staff').val();
                    if ($('#pTab1ModalSelect2User').val() != null) userlist = $('#pTab1ModalSelect2User').val();

                    var filename = 'null', filenameF = '';

                    if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/WSExecuteScalar",
                            data: '{qry:"SELECT ISNULL(MAX(ID),0)+1 FROM TBL_TASK_MISSION"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                if ($('#pTab1ModalAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
                                    filename = '\'FileTM' + msg.d + '.' + $('#pTab1ModalAttachInput').val().split('.').pop() + '\'';
                                    filenameF = 'FileTM' + msg.d + '.' + $('#pTab1ModalAttachInput').val().split('.').pop() + '';
                                }
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "ws.aspx/INS_TASKMISSION",
                                    data: '{CLINIC_ID:"' + $('#indexClinicId').text() + '", MISSIONTYPE_ID:"' + <%=Request.QueryString["id"]%> + '", TASK_STAT_TYPE_ID:"' + $('#pTab1ModalSelectType option:selected').val() + '", NO:"' + $.trim($('#pTab1ModalInputNo').val()) + '", NAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val())) + '", DT:"' + $.trim($('#pTab1ModalInputDate').val()) + '", MEMO:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputMemo').val())) + '", CREATEDSTAFFID:"' + $('#pTab1ModalSelectCreatedStaff option:selected').val() + '", CREATEDUSERID:"' +<%=Session["eBook_UserID"]%> +'", STAFFLIST:"' + stlist + '", USERLIST:"' + userlist + '", FILENAME:"' + filenameF + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function () {
                                        if ($('#pTab1ModalAttachInput').val() != '') {
                                            var uploadfiles = $("#pTab1ModalAttachInput").get(0);
                                            var uploadedfiles = uploadfiles.files;
                                            var fromdata = new FormData();
                                            fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                            var choice = {};
                                            choice.url = "pg/uploadFile.ashx?fileurl=files/task&filename=" + filenameF;
                                            choice.type = "POST";
                                            choice.data = fromdata;
                                            choice.contentType = false;
                                            choice.processData = false;
                                            choice.success = function (result) {
                                                if (result != "1") alert('Файл хуулхад алдаа гарлаа');
                                            };
                                            choice.error = function (err) { alert('Файл хадгалахад алдаа гарлаа: ' + err.statusText); };
                                            $.ajax(choice);
                                            e.preventDefault();
                                        }
                                        dataBindTab1Table();
                                        $('#pTab1Modal').modal('hide');
                                        smallBox('Оруулсан мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
                        if ($('#pTab1ModalAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
                            filename = '\'FileTM' + $('#pTab1ID').text() + '.' + $('#pTab1ModalAttachInput').val().split('.').pop() + '\'';
                            filenameF = 'FileTM' + $('#pTab1ID').text() + '.' + $('#pTab1ModalAttachInput').val().split('.').pop() + '';
                        }
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/UPT_TASKMISSION",
                            data: '{ID:"' + $('#pTab1ID').text() + '", MISSIONTYPE_ID:"' + <%=Request.QueryString["id"]%> + '", TASK_STAT_TYPE_ID:"' + $('#pTab1ModalSelectType option:selected').val() + '", NO:"' + $.trim($('#pTab1ModalInputNo').val()) + '", NAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val())) + '", DT:"' + $.trim($('#pTab1ModalInputDate').val()) + '", MEMO:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputMemo').val())) + '", CREATEDSTAFFID:"' + $('#pTab1ModalSelectCreatedStaff option:selected').val() + '", CREATEDUSERID:"' +<%=Session["eBook_UserID"]%> +'", STAFFLIST:"' + stlist + '", USERLIST:"' + userlist + '", FILENAME:"' + filenameF + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                if ($('#pTab1ModalAttachInput').val() != '') {
                                    var uploadfiles = $("#pTab1ModalAttachInput").get(0);
                                    var uploadedfiles = uploadfiles.files;
                                    var fromdata = new FormData();
                                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                    var choice = {};
                                    choice.url = "pg/uploadFile.ashx?fileurl=files/task&filename=" + filenameF;
                                    choice.type = "POST";
                                    choice.data = fromdata;
                                    choice.contentType = false;
                                    choice.processData = false;
                                    choice.success = function (result) {
                                        if (result != "1") alert('Файл хуулхад алдаа гарлаа');
                                    };
                                    choice.error = function (err) { alert('Файл хадгалахад алдаа гарлаа: ' + err.statusText); };
                                    $.ajax(choice);
                                    e.preventDefault();
                                }
                                dataBindTab1Table();
                                $('#pTab1Modal').modal('hide');
                                smallBox('Оруулсан мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
            }

            

        }
    });
    function saveEval(me) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSExecuteNonQuery",
            data: '{qry:"UPDATE TBL_TASK_MISSION SET TASK_MISSIONEVALTYPE_ID=' + $(me).val() + ' WHERE ID = ' + $(me).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Үр дүн', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                else window.location = '../#pg/error500.aspx';
            }
        });
        if ($(me).val() == "1") { $(me).removeClass($(me).attr('class')); $(me).addClass('bg-color-blueLight form-control'); $(me).css('border', 'none'); }
        else if ($(me).val() == "2") { $(me).removeClass($(me).attr('class')); $(me).addClass('bg-color-red form-control'); $(me).css('border', 'none'); }
        else if ($(me).val() == "3") { $(me).removeClass($(me).attr('class')); $(me).addClass('bg-color-orangeDark form-control'); $(me).css('border', 'none'); }
    }
    $("#pTab1ModalAttachInput").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 52428800) {
            errMsg += 'Файлын хэмжээ 50MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png' && valE != 'gif' && valE != 'pdf' && valE != 'doc' && valE != 'docx' && valE != 'xls' && valE != 'xlsx' && valE != 'xlsm') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png, gif, pdf, doc, docx, xls, xlsx, xlsm/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            $('#pTab1ModalAttachBtn').html($(this).val().split('\\').pop());
        }
        else alert(errMsg);
    });
    $("#pTab1ModalAttachDelete").click(function () {
        if ($('#pTab1ModalAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
            $.SmartMessageBox({
                title: "Анхааруулга!",
                content: "Та устгахдаа итгэлтэй байна уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/DeleteFile",
                        data: '{filename:"~/files/plan/' + $('#pTab1ModalAttachBtn').html() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $('#pTab1ModalAttachBtn').html('Файл хавсаргаагүй байна...');
                            $('#pTab1Datatable > tbody  > tr').each(function () {
                                if ($(this).attr('data-id') == $('#pTab1ID').text()) {
                                    $('td:eq(9)', this).html('');
                                    return false;
                                }
                            });
                            smallBox('Файл', 'Амжилттай устгагдлаа...', '#659265', 3000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            var err = eval("(" + xhr.responseText + ")");
                            if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                            else window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            });
        }
    });


    $('#pTab1ModalInputDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя']
    });
</script>
