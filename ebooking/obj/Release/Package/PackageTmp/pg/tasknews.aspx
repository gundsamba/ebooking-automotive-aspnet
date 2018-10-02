<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tasknews.aspx.cs" Inherits="ebooking.pg.tasknews" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-wrench fa-fw "></i> 
			<span lang="mn">Мэдээ мэдээлэл</span>
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
			        <h4 class="modal-title"><span lang="mn">Мэдээ мэдээлэл</span>&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Гарчиг</label>
									<input id="pTab1ModalInputNo" name="pTab1ModalInputNo" type="text" class="form-control" placeholder="Гарчиг" lang="mn" />
                                </div>
                                
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Агуулга</label>
                                    <textarea id="pTab1ModalInputName" name="pTab1ModalInputName" class="form-control" placeholder="Агуулга" rows="4"></textarea>
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
            url: "ws.aspx/tasknews_tasknewsTab1Datatable",
            data: '{clinicid:"' + $('#indexClinicId').text() + '"}',
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
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        $('#pTab1ID').html('');
        $('#pTab1ModalInputNo').val('');
        $('#pTab1ModalInputName').val('');
        if (isinsupt == 'засах') {
            $('#pTab1ID').text($(el).closest('tr').attr('data-id'));
            $('#pTab1ModalInputNo').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1ModalInputName').val($(el).closest('tr').find('td:eq(3)').text());
        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон мөрийн мэдээллийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"DELETE FROM TBL_TASK_NEWS WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        smallBox('Сонгосон мөрийн мэдээлэл', 'Амжилттай устлаа', '#659265');
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
            pTab1ModalInputNo: {
                group: '.col-md-12',
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
            pTab1ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 1000,
                        message: 'Уртдаа 1000 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSExecuteNonQuery",
                    data: '{qry:"INSERT INTO TBL_TASK_NEWS (CLINIC_ID, TITLE, NAME, CREATEDDATE, CREATEDUSERID) VALUES (' + $('#indexClinicId').text() + ', N\'' + $.trim($('#pTab1ModalInputNo').val()) + '\', N\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val())) + '\', (SELECT CONVERT(nvarchar(10), getdate(), 121)), ' + <%=Session["eBook_UserID"]%> + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Мэдээ мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{qry:"UPDATE TBL_TASK_NEWS SET TITLE=N\'' + $.trim($('#pTab1ModalInputNo').val()) + '\', NAME=N\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val())) + '\' WHERE ID=' + $('#pTab1ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Мэдээ мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
