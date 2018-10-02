<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="service.aspx.cs" Inherits="ebooking.pg.service" %>
<style type="text/css">
    .Colvis {
        position:absolute;
        float:right;
    }
</style>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-medkit fa-fw "></i> 
			<span lang="mn">Засвар үйлчилгээ</span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
            <header>
				<span class="widget-icon"> <i class="fa fa-medkit"></i> </span>
				<h2 lang="mn">Засвар үйлчилгээ</h2>
                <ul class="nav nav-tabs pull-right in" id="serviceTab">
					<li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
						<a data-toggle="tab" href="#s1"><span lang="mn">Засвар үйлчилгээ</span></a>
					</li>
					<li id="pTab2Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s2"><span lang="mn">Засвар үйлчилгээний төрөл</span></a>
					</li>
					<li id="pTab3Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s3"><span lang="mn">Засвар үйлчилгээний хямдрал</span></a>
					</li>
				</ul>
			</header>
            <div class="no-padding">
                <div class="jarviswidget-editbox">
                </div>
                <div class="widget-body">
					<div class="tab-content">
                        <div id="s1" class="tab-pane fade active in animated fast fadeInDown">
                            <div id="loaderTab1" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц:</label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#serviceTab1Modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="serviceTab1SelectServiceType" name="serviceTab1SelectServiceType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:360px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Засвар үйлчилгээний төрөл</label>:</div>
                            <div class="Colvis TableTools hidden-tablet hidden-mobile" style="right:550px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-success btn-xs" data-toggle="modal" data-target="#serviceTab1ModalExcel" onclick="showAddEditTab1Excel(this)"><i class="fa fa-download"></i> <span lang="mn"> Эксэл файлаас оруулах</span></a>
                            </div>
                            <div id="serviceTab1DatatableDiv">

                            </div>
                        </div>
                        <div id="s2" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab2" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц:</label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#serviceTab2Modal" onclick="showAddEditTab2(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div id="serviceTab2DatatableDiv">

                            </div>
                        </div>
                        <div id="s3" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab3" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц:</label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#serviceTab3Modal" onclick="showAddEditTab3(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="serviceTab3SelectServiceType" name="serviceTab3SelectServiceType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:360px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Засвар үйлчилгээний төрөл</label>:</div>
                            <div id="serviceTab3DatatableDiv">

                            </div>
                        </div>
                    </div>
				</div>
			</div>
        </div>
    </div>
</div>
<div id="serviceTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="serviceTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Засвар үйлчилгээ</span>&nbsp;<span id="serviceTab1ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="serviceTab1ID" class="hide"></div>
			        <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">*Засвар үйлчилгээний төрөл</label>
							        <select id="serviceTab1ModalSelectServiceType" name="serviceTab1ModalSelectServiceType" runat="server" class="form-control">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-3">
                                    <label class="control-label" lang="mn">*Код</label>
									<input id="serviceTab1ModalInputCode" name="serviceTab1ModalInputCode" type="text" class="form-control" placeholder="Код" lang="mn" />
                                </div>
                                <div class="col-md-9">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="serviceTab1ModalInputName" name="serviceTab1ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-8">
                                    <label class="control-label" lang="mn">Тайлбар</label>
									<input id="serviceTab1ModalInputDescription" name="serviceTab1ModalInputDescription" type="text" class="form-control" placeholder="Тайлбар" lang="mn" />
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label" lang="mn">*Нэгж үнэ</label>
									<input id="serviceTab1ModalInputPrice" name="serviceTab1ModalInputPrice" type="text" class="form-control" placeholder="Нэгж үнэ" lang="mn" />
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
<div id="serviceTab1ModalExcel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Эксэл файлаас засвар үйлчилгээ оруулах </span></h4>
		        </div>
		        <div class="modal-body no-padding">
                    <form id="serviceTab1ModalExcelForm" action="" class="smart-form" novalidate="novalidate">
                        <fieldset>
						    <div class="form-group">
                                <div class="row">
                                    <section class="col col-10">
                                        <label class="label" lang="mn">*Засвар үйлчилгээний төрөл <small><strong><em class="text-color-red">/Эксэлээс оруулахдаа төрлөөр оруулахыг анхаарна уу! Өөрөөр хэлбэр импорт хийх гэж байгаа эксэл дээр нэг бүлэгт хамаарах засвар үйлчилгээг зааврын дагуу бичиж оруулна./</em></strong></small></label>
                                        <label class="select">
									        <select id="serviceTab1ModalExcelSelectServiceType" name="serviceTab1ModalExcelSelectServiceType" runat="server">                                                 <option value="" lang="mn">- Сонго -</option>
                                            </select><i></i>
                                        </label>
                                    </section>
                                </div>
                                <div class="row">
                                    <section class="col col-12">
                                        <div class="alert alert-warning fade in" style="margin-bottom: 2px;">
				                            <i class="fa-fw fa fa-info"></i>
				                            Засвар үйлчилгээний бүртгэлийг эксэлээс татан оруулахдаа доор байрлах "Загвар татах" товч дээр даран эксэл файл татаж аван тухайн файл дээрээ мэдээллээ харгалзаах баганын дагуу зааврын дагуу оруулах ба Засвар үйлчилгээний кодын давхардлыг сайн шалгана уу!
			                            </div>
                                    </section>
                                </div>
                                <div class="row">
                                    <section class="col col-8">
                                        <label for="file" class="input input-file">
										    <div class="button">
                                                <input id="serviceTab1ModalExcelInputImportExcel" name="serviceTab1ModalExcelInputImportExcel" type="file" name="file" onchange="this.parentNode.nextSibling.value = this.value">Browse
										    </div>
                                            <input type="text" placeholder="Эксэл файл сонгоно уу" readonly=""/>
									    </label>
                                    </section>
                                    <section class="col col-4">
                                         <a href="../files/temp/ServiceTemp.xls" class="btn btn-link btn-block" download="">
                                             <i class="fa fa-file-excel-o"></i>&nbsp;&nbsp;Загвар татах
                                        </a>
                                    </section>
                                </div>
                            </div>
                        </fieldset>
		                <footer>
			                <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			                <button id="serviceTab1ModalExcelButtonImportExcel" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		                </footer>
                    </form>
		        </div>
        </div>
	</div>
</div>
<div id="serviceTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="serviceTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Засвар үйлчилгээний төрөл</span>&nbsp;<span id="serviceTab2ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="serviceTab2ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="serviceTab2ModalInputName" name="serviceTab2ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn" />
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
<div id="serviceTab3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="serviceTab3ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Засвар үйлчилгээ хямдрал</span>&nbsp;<span id="serviceTab3ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="serviceTab3ID" class="hide"></div>
			        <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">*Засвар үйлчилгээний төрөл</label>
							        <select id="serviceTab3ModalSelectServiceType" name="serviceTab3ModalSelectServiceType" runat="server" class="form-control">
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
                                    <label lang="mn">*Засвар үйлчилгээ</label>
							        <select id="serviceTab3ModalSelectService" name="serviceTab3ModalSelectService" runat="server" class="form-control" disabled>
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
                                    <label lang="mn">*Эхлэх огноо</label>
							        <input id="serviceTab3ModalInputBegindate" name="serviceTab3ModalInputBegindate" runat="server" type="text" class="form-control" maxlength="10" placeholder="Эхлэх огноо" lang="mn"/>
                                </div>
                                <div class="col-md-4">
                                    <label lang="mn">*Дуусах огноо</label>
							        <input id="serviceTab3ModalInputEnddate" name="serviceTab3ModalInputEnddate" runat="server" type="text" class="form-control" maxlength="10" placeholder="Дуусах огноо" lang="mn"/>
                                </div>
                                <div class="col-md-4">
                                    <label lang="mn">*Хямдралын хувь</label>
							        <input id="serviceTab3ModalInputPer" name="serviceTab3ModalInputPer" runat="server" type="text" class="form-control text-right" maxlength="3" placeholder="Хямдралын хувь" lang="mn"/>
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
        $('#serviceTab1ModalSelectServiceType, #serviceTab3ModalSelectServiceType').html('<option value="">- Сонго -</option>' + $('#serviceTab1ModalSelectServiceType').html());
        $('#serviceTab3SelectServiceType').html('<option value="">Бүгд</option>' + $('#serviceTab3SelectServiceType').html());
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
            if ($.trim($('#serviceTab1DatatableDiv').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#serviceTab2DatatableDiv').html()) == "") {
                dataBindTab2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#serviceTab3DatatableDiv').html()) == "") {
                dataBindTab3Table();
            }
        }
    }
    //таб1
    function dataBindTab1Table() {
        var valData = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ServiceTab1Datatable",
            data: '{"servicetype":"' + $('#serviceTab1SelectServiceType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"serviceTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ID</th>";
                valData += "<th data-class=\"expand\" lang=\"mn\">Код</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Тэмдэглэл</th>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Нэгж үнэ</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "<th class=\"hide\">SERVICE_TYPE_ID</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ID + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.CODE) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.DESCRIPTION) + "</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#serviceTab1Modal\" onclick=\"showAddEditTab1(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "<td class=\"hide\">" + value.SERVICE_TYPE_ID + "</td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_serviceTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#serviceTab1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_serviceTab1Datatable) {responsiveHelper_serviceTab1Datatable = new ResponsiveDatatablesHelper($('#serviceTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_serviceTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_serviceTab1Datatable.respond();}});<\/script>";
                $("#serviceTab1DatatableDiv").html(valData);
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#serviceTab1SelectServiceType").change(function () {
        dataBindTab1Table();
    });
    function showAddEditTab1(el, isinsupt) {
        $('#serviceTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#serviceTab1ID').text('');
            $('#serviceTab1ModalSelectServiceType').val('');
            $('#serviceTab1ModalInputCode').val('');
            $('#serviceTab1ModalInputName').val('');
            $('#serviceTab1ModalInputDescription').val('');
            $('#serviceTab1ModalInputPrice').val('');
        }
        else {
            $('#serviceTab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#serviceTab1ModalSelectServiceType').val($(el).closest('tr').find('td:eq(6)').text());
            $('#serviceTab1ModalInputCode').val($(el).closest('tr').find('td:eq(1)').text());
            $('#serviceTab1ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
            $('#serviceTab1ModalInputDescription').val($(el).closest('tr').find('td:eq(3)').text());
            $('#serviceTab1ModalInputPrice').val($(el).closest('tr').find('td:eq(4)').text().replace(/₮/g, '').replace(/,/g, ''));
        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон үйлчилгээг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_SERVICE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        smallBox('Засвар үйлчилгээ', 'Амжилттай устлаа', '#659265');
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
    $('#serviceTab1ModalForm').bootstrapValidator({
        fields: {
            serviceTab1ModalSelectServiceType: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            serviceTab1ModalInputCode: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 15,
                        message: 'Уртдаа 15 тэмдэгт авна'
                    }
                }
            },
            serviceTab1ModalInputName: {
                group: '.col-md-9',
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
            serviceTab1ModalInputPrice: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт орно'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#serviceTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_SERVICE (CLINIC_ID, CODE, NAME, DESCRIPTION, PRICE, SERVICE_TYPE_ID) VALUES (' + $('#indexClinicId').text() + ', N\'' + $('#serviceTab1ModalInputCode').val() + '\', N\'' + replaceDisplayToDatabase($.trim($('#serviceTab1ModalInputName').val())) + '\', N\'' + replaceDisplayToDatabase($.trim($('#serviceTab1ModalInputDescription').val())) + '\', ' + $.trim($('#serviceTab1ModalInputPrice').val()) + ', ' + $('#serviceTab1ModalSelectServiceType option:selected').val() + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#serviceTab1Modal').modal('hide');
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
                    data: '{"qry":"UPDATE TBL_SERVICE SET CODE=\'' + $('#serviceTab1ModalInputCode').val() + '\', NAME=N\'' + replaceDisplayToDatabase($.trim($('#serviceTab1ModalInputName').val())) + '\', DESCRIPTION=N\'' + replaceDisplayToDatabase($.trim($('#serviceTab1ModalInputDescription').val())) + '\', PRICE=' + $.trim($('#serviceTab1ModalInputPrice').val()) + ', SERVICE_TYPE_ID=' + $('#serviceTab1ModalSelectServiceType option:selected').val() + ' WHERE ID=' + $('#serviceTab1ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#serviceTab1Modal').modal('hide');
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
            
        }
    });

    function showAddEditTab1Excel(el) {
        $('#serviceTab1ModalSelectServiceType').val('');
        $('#serviceTab1ModalExcelInputImportExcel').val('');
    }
    $("#serviceTab1ModalExcelForm").validate({
        rules: {
            serviceTab1ModalExcelSelectServiceType: {
                required: true
            },
            serviceTab1ModalExcelInputImportExcel: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            serviceTab1ModalExcelSelectServiceType: {
                required: 'Сонгоно уу'
            },
            serviceTab1ModalExcelInputImportExcel: {
                required: 'Оруулна уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            if ($('#serviceTab1ModalExcelInputImportExcel').val() == '') alert('Эксэл файл сонгоно уу!');
            else {
                //alert($('#serviceTab1ModalExcelInputImportExcel').val());

                $("#serviceTab1ModalExcelButtonImportExcel").html('<i class="fa fa-refresh fa-spin"></i> Хадгалах');
                var uploadfiles = $("#serviceTab1ModalExcelInputImportExcel").get(0);
                var uploadedfiles = uploadfiles.files;
                var fromdata = new FormData();
                fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                var choice = {};
                choice.url = "../pg/uploadFile.ashx?fileurl=files/service&filename=ServiceTemp.xls";
                choice.type = "POST";
                choice.data = fromdata;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (result) {
                    if (result != "1") {
                        alert('Файл хуулхад алдаа гарлаа');
                        $("#serviceTab1ModalExcelButtonImportExcel").html('<span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах');
                    }
                    else {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ServiceqExcelBulkUpload",
                            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "typeid":"' + $('#serviceTab1ModalExcelSelectServiceType option:selected').val() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                alert(data.d);
                                $("#serviceTab1ModalExcelButtonImportExcel").html('<span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах');
                                dataBindTab1Table();
                                $('#serviceTab1ModalExcel').modal('hide');
                                smallBox('Сэлбэг эксэлээс', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    }
                };
                choice.error = function (err) { alert('Файл хадгалахад алдаа гарлаа: ' + err.statusText); };
                $.ajax(choice);
            }
        }
    });

    //таб2
    function dataBindTab2Table() {
        var valData = '';
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ServiceTab2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"serviceTab2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ID</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ID + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#serviceTab2Modal\" onclick=\"showAddEditTab2(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab2(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_serviceTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#serviceTab2Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_serviceTab2Datatable) {responsiveHelper_serviceTab2Datatable = new ResponsiveDatatablesHelper($('#serviceTab2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_serviceTab2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_serviceTab2Datatable.respond();}});<\/script>";
                $("#serviceTab2DatatableDiv").html(valData);
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
    function showAddEditTab2(el, isinsupt) {
        $('#serviceTab2ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#serviceTab2ID').text('');
            $('#serviceTab2ModalInputName').val('');
        }
        else {
            $('#serviceTab2ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#serviceTab2ModalInputName').val($(el).closest('tr').find('td:eq(1)').text());
        }
    }
    function showDeleteTab2(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_SERVICE WHERE SERVICE_TYPE_ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != '0') alert('Сонгосон засвар үйлчилгээний төрөлд хамааралтай засвар үйлчилгээ орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон үйлчилгээг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_SERVICE_TYPE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab2Table();
                                    dataBindTabsServiceType();
                                    smallBox('Засвар үйлчилгээний төрөл', 'Амжилттай устлаа', '#659265');
                                    $('#serviceTab1DatatableDiv, #serviceTab3DatatableDiv').html('');
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
    function dataBindTabsServiceType() {
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ServiceServiceTypeListForDDL",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                });
                $('#serviceTab1ModalSelectServiceType').html("<option value=\"\" lang=\"mn\">- Сонго -</option>" + valData);
                $('#serviceTab1ModalExcelSelectServiceType').html("<option value=\"\" lang=\"mn\">- Сонго -</option>" + valData);
                $("#serviceTab1SelectServiceType").html("<option value=\"\" lang=\"mn\">- Бүгд -</option>" + valData);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#serviceTab2ModalForm').bootstrapValidator({
        fields: {
            serviceTab2ModalInputName: {
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
            if ($('#serviceTab2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_SERVICE_TYPE (CLINIC_ID, NAME) VALUES (' + $('#indexClinicId').text() + ', N\'' + replaceDisplayToDatabase($.trim($('#serviceTab2ModalInputName').val())) + '\')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        $('#serviceTab2Modal').modal('hide');
                        dataBindTabsServiceType();
                        smallBox('Засвар үйлчилгээний төрөл', 'Амжилттай хадгалагдлаа', '#659265');
                        $('#serviceTab1DatatableDiv, #serviceTab3DatatableDiv').html('');
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
                    data: '{"qry":"UPDATE TBL_SERVICE_TYPE SET NAME=N\'' + replaceDisplayToDatabase($.trim($('#serviceTab2ModalInputName').val())) + '\' WHERE ID=' + $('#serviceTab2ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        $('#serviceTab2Modal').modal('hide');
                        dataBindTabsServiceType();
                        smallBox('Засвар үйлчилгээний төрөл', 'Амжилттай хадгалагдлаа', '#659265');
                        $('#serviceTab1DatatableDiv, #serviceTab3DatatableDiv').html('');
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

    //таб3
    function dataBindTab3Table() {
        var valData = '';
        showLoader('loaderTab3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ServiceTab3Datatable",
            data: '{"servicetype":"' + $('#serviceTab3SelectServiceType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"serviceTab3Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Төрөл</th>";
                valData += "<th data-class=\"expand\" lang=\"mn\">Засвар үйлчилгээ</th>";
                valData += "<th lang=\"mn\">Нэгж үнэ</th>";
                valData += "<th style=\"width:140px;\" data-hide=\"phone\" lang=\"mn\">Хугацаа</th>";
                valData += "<th style=\"width:30px;\" data-hide=\"phone\" lang=\"mn\">Хувь</th>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Үнэ</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.SERVICE_ID + "\" " + value.ISACTIVE + ">";
                    valData += "<td data-id=\"" + value.SERVICE_TYPE_ID + "\">" + replaceDatabaseToDisplay(value.SERVICE_TYPE) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.SERVICE) + "</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td>" + value.BETWEENDATE + "</td>";
                    valData += "<td style=\"text-align:right;\">" + value.PER + "%</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.DISCPRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#serviceTab3Modal\" onclick=\"showAddEditTab3(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab3(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_serviceTab3Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#serviceTab3Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_serviceTab3Datatable) {responsiveHelper_serviceTab3Datatable = new ResponsiveDatatablesHelper($('#serviceTab3Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_serviceTab3Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_serviceTab3Datatable.respond();}});<\/script>";
                $("#serviceTab3DatatableDiv").html(valData);
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
    $("#serviceTab3SelectServiceType").change(function () {
        dataBindTab3Table();
    });
    function showAddEditTab3(el, isinsupt) {
        var valData = '';
        $('#serviceTab3ModalHeaderLabel').text(isinsupt);
        $('#serviceTab3ID').html('');
        $('#serviceTab3ModalSelectServiceType, #serviceTab3ModalInputBegindate, #serviceTab3ModalInputEnddate, #serviceTab3ModalInputPer').val('');
        $('#serviceTab3ModalSelectService').html('<option value="">- Сонго -</option>');
        $('#serviceTab3ModalSelectService').prop('disabled',true);
        if (isinsupt == 'засах'){
            $('#serviceTab3ID').text($(el).closest('tr').attr('data-id'));
            $('#serviceTab3ModalSelectServiceType').val($(el).closest('tr').find('td:eq(0)').attr('data-id'));
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ServiceServiceListForDDL",
                data: '{"servicetype":"' + $('#serviceTab3ModalSelectServiceType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.SERVICE) + "</option>";
                    });
                    $("#serviceTab3ModalSelectService").html('<option value="">- Сонго -</option>' + valData);
                    $('#serviceTab3ModalSelectService').prop('disabled', false);
                    $("#serviceTab3ModalSelectService").val($(el).closest('tr').attr('data-id'));
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
            $('#serviceTab3ModalInputBegindate').val($(el).closest('tr').find('td:eq(3)').html().split(' - ')[0]);
            $('#serviceTab3ModalInputEnddate').val($(el).closest('tr').find('td:eq(3)').html().split(' - ')[1]);
            $('#serviceTab3ModalInputPer').val($(el).closest('tr').find('td:eq(4)').html().replace('%',''));
        }
    }
    function showDeleteTab3(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон үйлчилгээний хямдралыг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_SERVICEDISC WHERE SERVICE_ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3Table();
                        smallBox('Үйлчилгээний хямдрал', 'Амжилттай устлаа', '#659265');
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
    $('#serviceTab3ModalForm').bootstrapValidator({
        fields: {
            serviceTab3ModalSelectServiceType: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            serviceTab3ModalSelectService: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            serviceTab3ModalInputBegindate: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо зөв оруулна уу /Жил-сар-өдөр/'
                    }
                }
            },
            serviceTab3ModalInputEnddate: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо зөв оруулна уу /Жил-сар-өдөр/'
                    }
                }
            },
            serviceTab3ModalInputPer: {
                group: '.col-md-4',
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
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            var strtDate;
            var endDate;
            strtDate = new Date($('#serviceTab3ModalInputBegindate').val().split('-')[0], $('#serviceTab3ModalInputBegindate').val().split('-')[1], $('#serviceTab3ModalInputBegindate').val().split('-')[2]);
            endDate = new Date($('#serviceTab3ModalInputEnddate').val().split('-')[0], $('#serviceTab3ModalInputEnddate').val().split('-')[1], $('#serviceTab3ModalInputEnddate').val().split('-')[2]);
            if (strtDate > endDate) {
                alert('Эхлэх огноо дуусах огнооноос бага байна!');
            }
            else {
                if (parseFloat($.trim($('#serviceTab3ModalInputPer').val())) > 0 && parseFloat($.trim($('#serviceTab3ModalInputPer').val())) <= 100) {
                    if ($('#serviceTab3ModalHeaderLabel').text() == 'нэмэх') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            data: '{"qry":"INSERT INTO TBL_SERVICEDISC (SERVICE_ID, BEGINDATE, ENDDATE, PER) VALUES (' + $('#serviceTab3ModalSelectService option:selected').val() + ', \'' + $.trim($('#serviceTab3ModalInputBegindate').val()) + '\', \'' + $.trim($('#serviceTab3ModalInputEnddate').val()) + '\', ' + $.trim($('#serviceTab3ModalInputPer').val()) + ')"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                dataBindTab3Table();
                                $('#serviceTab3Modal').modal('hide');
                                smallBox('Үйлчилгээний хямдрал', 'Амжилттай хадгалагдлаа', '#659265');
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
                            data: '{"qry":"UPDATE TBL_SERVICEDISC SET SERVICE_ID=' + $('#serviceTab3ModalSelectService option:selected').val() + ', BEGINDATE=\'' + $.trim($('#serviceTab3ModalInputBegindate').val()) + '\', ENDDATE=\'' + $.trim($('#serviceTab3ModalInputEnddate').val()) + '\', PER=' + $.trim($('#serviceTab3ModalInputPer').val()) + ' WHERE SERVICE_ID=' + $('#serviceTab3ID').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                dataBindTab3Table();
                                $('#serviceTab3Modal').modal('hide');
                                smallBox('Үйлчилгээний хямдрал', 'Амжилттай хадгалагдлаа', '#659265');
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
                else alert('Хөнглөлтийн хувь 0-оос 100-ийн хооронд байна.');
            }
        }
    });
    $('#serviceTab3ModalSelectServiceType').change(function () {
        var valData = '';
        $('#serviceTab3ModalSelectService').html('<option value="">- Сонго -</option>');
        $('#serviceTab3ModalSelectService').prop('disabled', true);
        if ($('#serviceTab3ModalSelectServiceType option:selected').val() != '') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ServiceServiceListForDDL",
                data: '{"servicetype":"' + $('#serviceTab3ModalSelectServiceType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.SERVICE) + "</option>";
                    });
                    $("#serviceTab3ModalSelectService").html('<option value="">- Сонго -</option>' + valData);
                    $('#serviceTab3ModalSelectService').prop('disabled', false);
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

    $('#serviceTab3ModalInputBegindate, #serviceTab3ModalInputEnddate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab3).on('changeDate', dateChangedTab3);

    function dateChangedTab3(ev) {
        $('#serviceTab3Modal').find(':submit').prop('disabled',false);
    }
</script>