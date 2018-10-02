<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usersetup.aspx.cs" Inherits="ebooking.pg.usersetup" %>

<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-user fa-fw "></i> 
			<span lang="mn">Хэрэглэгчийн эрх</span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12 animated fadeInDown">
        <div class="jarviswidget jarviswidget-color-blueDark">
            <header>
				<span class="widget-icon"> <i class="fa fa-user"></i> </span>
				<h2 lang="mn">Хэрэглэгчийн эрх</h2>
			</header>
            <div>
                <div id="loader1" class="loader-background">
                    <img src="../img/loading.gif" />
                    <h2 lang="mn">Уншиж байна...</h2>
                </div>
                <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#usersetupTab1Modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                </div>
                <div id="usersetupDatatableDiv" class="widget-body no-padding">
					
				</div>
			</div>
        </div>
    </div>
</div>
<div id="usersetupTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h4 class="modal-title"><span lang="mn">Хэрэглэгч</span>&nbsp;<span id="usersetupModalHeaderLabel"></span></h4>
		    </div>
		    <div class="modal-body no-padding">
                <form id="usersetupModalForm" class="smart-form">
                    <div id="usersetupID" class="hide"></div>
                    <fieldset>
						<section class="col col-3">
                            <label class="label" lang="mn">*Нэвтрэх нэр</label>
                            <label class="input state-disabled">
							    <input id="usersetupModalInputCode" name="usersetupModalInputCode" type="text" placeholder="Нэвтрэх нэр" lang="mn" disabled />
                            </label>
                        </section>
                        <section class="col col-4">
                            <label class="label" lang="mn">*И-мэйл</label>
                            <label class="input">
							    <input id="usersetupModalInputEmail" name="usersetupModalInputEmail" type="text" placeholder="И-мэйл" lang="mn" />
                            </label>
                        </section>
                        <section class="col col-5">
                            <label class="label" lang="mn">Хэрэглэгчийн нэр/тайлбар</label>
                            <label class="input">
							    <input id="usersetupModalInputDescription" name="usersetupModalInputDescription" type="text" placeholder="Хэрэглэгчийн нэр/тайлбар" lang="mn" />
                            </label>
                        </section>
                        <section class="col col-4">
                            <label class="label" lang="mn">*Нууц үг</label>
                            <label class="input">
							    <input id="usersetupModalInputPassword" name="usersetupModalInputPassword" type="password" placeholder="Нууц үг" lang="mn" />
                            </label>
                        </section>
                        <section class="col col-4">
                            <label class="label" lang="mn">*Нууц үг давт</label>
                            <label class="input">
							    <input id="usersetupModalInputPasswordconfirm" name="usersetupModalInputPasswordconfirm" type="password" placeholder="Нууц үг давт" lang="mn" />
                            </label>
                        </section>
					</fieldset>
                    <fieldset>
                        <section id="roleListDiv" runat="server"></section>
                        <section id="staffListDiv" runat="server"></section>
                    </fieldset>
                    <footer>
			            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
			            <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
                    </footer>
                </form>
		    </div>
            <%--<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
            </div>--%>
        </div>
	</div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var date = new Date();
    var lastDay;
    var pagefunction = function () {
        dataBindTable();
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
        $('#usersetupModalForm').bootstrapValidator('destroy');
    }
    pagefunction();
    function dataBindTable() {
        var valData = '';
        showLoader('loader1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/UsersetupTab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"usersetupTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">Нэвтрэх нэр</th>";
                valData += "<th lang=\"mn\">И-мэйл</th>";
                valData += "<th lang=\"mn\">Хэрэглэгчийн нэр/тайлбар</th>";
                valData += "<th lang=\"mn\">Нууц үг</th>";
                valData += "<th lang=\"mn\">Модулын эрх</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.USER_ID + "\" data-staffidlist=\"" + value.STAFFIDLIST + "\">";
                    valData += "<td>" + value.USERNAME + "</td>";
                    valData += "<td>" + value.EMAIL + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.USERDESCRIPTION) + "</td>";
                    valData += "<td><em>" + replaceDatabaseToDisplay(value.PASSWORD) + "</em></td>";
                    valData += "<td data-id=\"" + value.ROLEIDLIST + "\">" + replaceDatabaseToDisplay(value.ROLENAMELIST) + "</td>";
                    valData += "<td>";
                    valData += "<button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#usersetupTab1Modal\" onclick=\"showAddEditTab1(this,'засах')\"><i class=\"fa fa-pencil\"></i></button>";
                    if (value.USER_ID != "1") valData += "<button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></button>";
                    valData += "</td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_usersetupTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#usersetupTab1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_usersetupTab1Datatable) {responsiveHelper_usersetupTab1Datatable = new ResponsiveDatatablesHelper($('#usersetupTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_usersetupTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_usersetupTab1Datatable.respond();}});<\/script>";
                $("#usersetupDatatableDiv").html(valData);
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
    function showAddEditTab1(el, isinsupt) {
        $('#usersetupModalHeaderLabel').text(isinsupt);
        //$('#usersetupModalBtnSave').prop('disabled', false);
        $('#usersetupID').html('');
        $('#usersetupModalInputEmail').val('');
        $('#usersetupModalInputDescription').val('');
        $('#usersetupModalInputPassword').val('');
        $('#usersetupModalInputPasswordconfirm').val('');
        $('input[name="usersetupModalInputRole"]').prop('checked', false);
        if (isinsupt == 'нэмэх') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT dbo.FUNC_GETUSERNUM(' + $('#indexClinicId').text() + ')"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#usersetupModalInputCode').val(data.d);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
            dataBindTab1ModalStaffSelect2('');
        }
        else {
            $('#usersetupID').html($(el).closest('tr').attr('data-id'));
            $('#usersetupModalInputCode').val($(el).closest('tr').find('td:eq(0)').text());
            $('#usersetupModalInputEmail').val($(el).closest('tr').find('td:eq(1)').text());
            $('#usersetupModalInputDescription').val($(el).closest('tr').find('td:eq(2)').text());
            $('#usersetupModalInputPassword, #usersetupModalInputPasswordconfirm').val($(el).closest('tr').find('td:eq(3)').text());
            for (var i = 0; i < parseInt($.trim($(el).closest('tr').find('td:eq(4)').attr('data-id')).split(',').length) ; i++) {
                $('#usersetupModalInputRole' + $.trim($(el).closest('tr').find('td:eq(4)').attr('data-id').split(',')[i])).prop('checked', true)
            }
            dataBindTab1ModalStaffSelect2($(el).closest('tr').attr('data-staffidlist'));
        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон хэрэглэгчийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_USER WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            data: '{"qry":"DELETE FROM TBL_USER_ROLE WHERE USER_ID=' + $(el).closest('tr').attr('data-id') + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                    data: '{"qry":"DELETE FROM TBL_USER_STAFF WHERE USER_ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function () {
                                        dataBindTable();
                                        smallBox('Ажилтан', 'Амжилттай устлаа', '#659265');
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
    //$('#usersetupModalForm').bootstrapValidator({
    //    feedbackIcons: {
    //        valid: 'glyphicon glyphicon-ok',
    //        invalid: 'glyphicon glyphicon-remove',
    //        validating: 'glyphicon glyphicon-refresh'
    //    },
    //    fields: {
    //        usersetupModalInputCode: {
    //            group: '.col-md-3',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 6,
    //                    message: 'Уртдаа 6 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        usersetupModalInputEmail: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 50,
    //                    message: 'Уртдаа 50 тэмдэгт авна'
    //                },
    //                emailAddress: {
    //                    message: 'И-мэйл зөв оруулна уу'
    //                }
    //            }
    //        },
    //        usersetupModalInputDescription: {
    //            group: '.col-md-5',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 50,
    //                    message: 'Уртдаа 50 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        usersetupModalInputPassword: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 50,
    //                    message: 'Уртдаа 50 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        usersetupModalInputPasswordconfirm: {
    //            group: '.col-md-4',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Оруулна уу'
    //                },
    //                stringLength: {
    //                    max: 50,
    //                    message: 'Уртдаа 50 тэмдэгт авна'
    //                }
    //            }
    //        },
    //        usersetupModalInputRole: {
    //            group: '.form-group',
    //            validators: {
    //                notEmpty: {
    //                    message: 'Модулын эрх сонгоно уу'
    //                }
    //            }
    //        },
            
    //    },
    //    onSuccess: function (e, data) {
    //        e.preventDefault();
    //        var valIsIns = '0';
    //        if ($('#usersetupModalHeaderLabel').text() == 'нэмэх') {
    //            valIsIns = '1';
    //        }
    //        var allVals = [];
    //        $('input[name="usersetupModalInputRole"]:checked').each(function () {
    //            allVals.push($(this).val());
    //        });
    //        globalAjaxVar = $.ajax({
    //            type: "POST",
    //            url: "../wcf/ServiceMain.svc/INSUPT_USER",
    //            data: '{"ISINS":"' + valIsIns + '","CLINIC_ID":"' + $('#indexClinicId').text() + '","USERNAME":"' + $.trim($('#usersetupModalInputCode').val()) + '","PASSWORD":"' + $.trim($('#usersetupModalInputPassword').val()) + '","EMAIL":"' + $.trim($('#usersetupModalInputEmail').val()) + '","USERDESCRIPTION":"' + $.trim($('#usersetupModalInputDescription').val()) + '","ROLELISTID":"' + allVals + '"}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function () {
    //                dataBindTable();
    //                $('#usersetupTab1Modal').modal('hide');
    //                smallBox('Хэрэглэгч', 'Амжилттай хадгалагдлаа', '#659265');
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
    $("#usersetupModalForm").validate({
        rules: {
            usersetupModalInputCode: {
                required: true,
                maxlength: 6
            },
            usersetupModalInputEmail: {
                required: true,
                maxlength: 50,
                email: true
            },
            usersetupModalInputDescription: {
                required: true,
                maxlength: 50
            },
            usersetupModalInputPassword: {
                required: true,
                maxlength: 50
            },
            usersetupModalInputPasswordconfirm: {
                required: true,
                maxlength: 50
            },
            usersetupModalInputRole: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            usersetupModalInputCode: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 6 тэмдэгт авна'
            },
            usersetupModalInputEmail: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 50 тэмдэгт авна',
                email: true
            },
            usersetupModalInputDescription: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 50 тэмдэгт авна'
            },
            usersetupModalInputPassword: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 50 тэмдэгт авна'
            },
            usersetupModalInputPasswordconfirm: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 50 тэмдэгт авна'
            },
            usersetupModalInputRole: {
                required: 'Модулын эрх сонгоно уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            var valIsIns = '0';
            if ($('#usersetupModalHeaderLabel').text() == 'нэмэх') {
                valIsIns = '1';
            }
            var allVals = [];
            $('input[name="usersetupModalInputRole"]:checked').each(function () {
                allVals.push($(this).val());
            });
            var stlist = "";
            if ($('#usersetupModalSelectStaffs').val() != null) stlist = $('#usersetupModalSelectStaffs').val();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/INSUPT_USER",
                data: '{"ISINS":"' + valIsIns + '","CLINIC_ID":"' + $('#indexClinicId').text() + '","USERNAME":"' + $.trim($('#usersetupModalInputCode').val()) + '","PASSWORD":"' + $.trim($('#usersetupModalInputPassword').val()) + '","EMAIL":"' + $.trim($('#usersetupModalInputEmail').val()) + '","USERDESCRIPTION":"' + $.trim($('#usersetupModalInputDescription').val()) + '","ROLELISTID":"' + allVals + '", "STAFFLISTID":"' + stlist + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    dataBindTable();
                    $('#usersetupTab1Modal').modal('hide');
                    smallBox('Хэрэглэгч', 'Амжилттай хадгалагдлаа', '#659265');
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
    function dataBindTab1ModalStaffSelect2(valSelected) {
        var optObj = '';
        $('#usersetupModalSelectStaffs').find('option').each(function () {
            $(this).removeAttr('selected');
            optObj = $(this);
            if (valSelected != '') {
                for (var i = 0; i < valSelected.split(',').length; i++) {
                    if (optObj.attr('value') == valSelected.split(',')[i]) {
                        optObj.attr('selected', 'selected');
                    }
                }
            }
        });
        $('#usersetupModalSelectStaffs').select2();
    }
</script>
