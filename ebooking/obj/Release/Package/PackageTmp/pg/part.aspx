<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="part.aspx.cs" Inherits="ebooking.pg.part" %>
<style type="text/css">
    .Colvis {
        position:absolute;
        float:right;
    }
</style>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-wrench fa-fw "></i> 
			<span lang="mn">Сэлбэгийн бүртгэл</span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
            <header>
				<span class="widget-icon"> <i class="fa fa-medkit"></i> </span>
				<h2 lang="mn">Сэлбэгийн бүртгэл</h2>
                <ul class="nav nav-tabs pull-right in" id="partTab">
					<li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
						<a data-toggle="tab" href="#s1"><span lang="mn">Сэлбэг</span></a>
					</li>
					<li id="pTab2Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s2"><span lang="mn">Сэлбэгийн төрөл</span></a>
					</li>
					<li id="pTab3Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s3"><span lang="mn">Сэлбэгийн хямдрал</span></a>
					</li>
					<li id="pTab4Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s4"><span lang="mn">Сэлбэгийн эрэлт</span></a>
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
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#partTab1Modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="partTab1SelectPartType" name="partTab1SelectPartType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:360px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Сэлбэгийн төрөл:</label></div>
                            <div class="Colvis TableTools hidden-mobile hidden-tablet" style="right:480px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-success btn-xs" data-toggle="modal" data-target="#partTab1ModalExcel" onclick="showAddEditTab1Excel(this)"><i class="fa fa-download"></i> <span lang="mn"> Эксэл файлаас сэлбэг оруулах</span></a>
                            </div>
                            <div id="partTab1DatatableDiv">

                            </div>
                        </div>
                        <div id="s2" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab2" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#partTab2Modal" onclick="showAddEditTab2(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div id="partTab2DatatableDiv">

                            </div>
                        </div>
                        <div id="s3" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab3" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#partTab3Modal" onclick="showAddEditTab3(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="partTab3SelectPartType" name="partTab3SelectPartType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:360px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Сэлбэгийн төрөл:</label></div>
                            <div id="partTab3DatatableDiv">

                            </div>
                        </div>
                        <div id="s4" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab4" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:140px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="partTab4SelectPartType" name="partTab4SelectPartType" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:295px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Сэлбэгийн төрөл:</label></div>                            
                            <div class="Colvis TableTools smart-form" style="right:415px; top:0px; z-index:5; margin-top:7px; width:120px;">
                                <label class="input">
                                    <i class="icon-append fa fa-calendar"></i>
                                    <input name="partTab4SelectEndDate" id="partTab4SelectEndDate" runat="server" type="text">
                                </label>
                            </div>
                            <div class="Colvis TableTools" style="right:546px; top:4px; z-index:5; margin-top:7px;">-</div>
                            <div class="Colvis TableTools smart-form" style="right:560px; top:0px; z-index:5; margin-top:7px; width:120px;">
                                <label class="input">
                                    <i class="icon-append fa fa-calendar"></i>
                                    <input name="partTab4SelectStartDate" id="partTab4SelectStartDate" runat="server" type="text">
                                </label>
                            </div>
                            <div class="Colvis TableTools" style="right:685px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Огноо:</label></div>
                            <div id="partTab4DatatableDiv">

                            </div>
                        </div>
                    </div>
				</div>
			</div>
        </div>
    </div>
</div>
<div id="partTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="partTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Сэлбэг</span>&nbsp;<span id="partTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="partTab1ID" class="hide"></div>
			        <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">*Сэлбэгийн төрөл</label>
							        <select id="partTab1ModalSelectPartType" name="partTab1ModalSelectPartType" runat="server" class="form-control">
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
									<input id="partTab1ModalInputCode" name="partTab1ModalInputCode" type="text" class="form-control" placeholder="Код" lang="mn" />
                                </div>
                                <div class="col-md-9">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="partTab1ModalInputName" name="partTab1ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-8">
                                    <label class="control-label" lang="mn">Тайлбар</label>
									<input id="partTab1ModalInputDescription" name="partTab1ModalInputDescription" type="text" class="form-control" placeholder="Тайлбар" lang="mn" />
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label" lang="mn">*Нэгж үнэ</label>
									<input id="partTab1ModalInputPrice" name="partTab1ModalInputPrice" type="text" class="form-control" placeholder="Нэгж үнэ" lang="mn" />
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
<div id="partTab1ModalExcel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Эксэл файлаас сэлбэг оруулах </span></h4>
		        </div>
		        <div class="modal-body no-padding">
                    <form id="partTab1ModalExcelForm" action="" class="smart-form" novalidate="novalidate">
                        <fieldset>
						    <div class="form-group">
                                <div class="row">
                                    <section class="col col-10">
                                        <label class="label" lang="mn">*Сэлбэгийн төрөл <small><strong><em class="text-color-red">/Эксэлээс оруулахдаа төрлөөр оруулахыг анхаарна уу! Өөрөөр хэлбэр импорт хийх гэж байгаа эксэл дээр нэг бүлэгт хамаарах сэлбэгийг зааврын дагуу бичиж оруулна./</em></strong></small></label>
                                        <label class="select">
									        <select id="partTab1ModalExcelSelectPartType" name="partTab1ModalExcelSelectPartType" runat="server">                                                 <option value="" lang="mn">- Сонго -</option>
                                            </select><i></i>
                                        </label>
                                    </section>
                                </div>
                                <div class="row">
                                    <section class="col col-12">
                                        <div class="alert alert-warning fade in" style="margin-bottom: 2px;">
				                            <i class="fa-fw fa fa-info"></i>
				                            Сэлбэгийн бүртгэлийг эксэлээс татан оруулахдаа доор байрлах "Загвар татах" товч дээр даран эксэл файл татаж аван тухайн файл дээрээ мэдээллээ харгалзаах баганын дагуу зааврын дагуу оруулах ба Сэлбэгийн кодын давхардлыг сайн шалгана уу!
			                            </div>
                                    </section>
                                </div>
                                <div class="row">
                                    <section class="col col-8">
                                        <label for="file" class="input input-file">
										    <div class="button">
                                                <input id="partTab1ModalExcelInputImportExcel" name="partTab1ModalExcelInputImportExcel" type="file" name="file" onchange="this.parentNode.nextSibling.value = this.value">Browse
										    </div>
                                            <input type="text" placeholder="Эксэл файл сонгоно уу" readonly=""/>
									    </label>
                                    </section>
                                    <section class="col col-4">
                                         <a href="../files/temp/PartTemp.xls" class="btn btn-link btn-block" download="">
                                             <i class="fa fa-file-excel-o"></i>&nbsp;&nbsp;Загвар татах
                                        </a>
                                    </section>
                                </div>
                            </div>
                        </fieldset>
		                <footer>
			                <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			                <button id="partTab1ModalExcelButtonImportExcel" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		                </footer>
                    </form>
		        </div>
        </div>
	</div>
</div>
<div id="partTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="partTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Сэлбэгийн төрөл</span>&nbsp;<span id="partTab2ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="partTab2ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="partTab2ModalInputName" name="partTab2ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn" />
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
<div id="partTab3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="partTab3ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Сэлбэгийн хямдрал</span>&nbsp;<span id="partTab3ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="partTab3ID" class="hide"></div>
			        <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">*Сэлбэгийн төрөл</label>
							        <select id="partTab3ModalSelectPartType" name="partTab3ModalSelectPartType" runat="server" class="form-control">
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
                                    <label lang="mn">*Сэлбэг</label>
							        <select id="partTab3ModalSelectPart" name="partTab3ModalSelectPart" runat="server" class="form-control" disabled>
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
							        <input id="partTab3ModalInputBegindate" name="partTab3ModalInputBegindate" runat="server" type="text" class="form-control" maxlength="10" placeholder="Эхлэх огноо" lang="mn"/>
                                </div>
                                <div class="col-md-4">
                                    <label lang="mn">*Дуусах огноо</label>
							        <input id="partTab3ModalInputEnddate" name="partTab3ModalInputEnddate" runat="server" type="text" class="form-control" maxlength="10" placeholder="Дуусах огноо" lang="mn"/>
                                </div>
                                <div class="col-md-4">
                                    <label lang="mn">*Хямдралын хувь</label>
							        <input id="partTab3ModalInputPer" name="partTab3ModalInputPer" runat="server" type="text" class="form-control text-right" maxlength="3" placeholder="Хямдралын хувь" lang="mn"/>
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
<div id="partTab4Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="partTab4ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Сэлбэгийн эрэлт</span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="partTab4ID" class="hide"></div>
                    <div id="partTab4ColIndex" class="hide"></div>
			        <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">Код: </label>
							        <span id="pTab4ModalSpanCode"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">Нэр: </label>
							        <span id="pTab4ModalSpanName"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label lang="mn">Огноо: </label>
							        <span id="pTab4ModalSpanDate"></span>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="col-md-12">
                                <input class="form-control spinner spinner-both" id="pTab4ModalInputSpinner" name="pTab4ModalInputSpinner" value="">
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
        $('#partTab1ModalSelectPartType, #partTab3ModalSelectPartType, #partTab1ModalExcelSelectPartType').html('<option value="">- Сонго -</option>' + $('#partTab1ModalSelectPartType').html());
        $('#partTab3SelectPartType').html('<option value="">Бүгд</option>' + $('#partTab3SelectPartType').html());
        dataBindTab1Table();
        $('#pTab4ModalInputSpinner').spinner();
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
            if ($.trim($('#partTab1DatatableDiv').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#partTab2DatatableDiv').html()) == "") {
                dataBindTab2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#partTab3DatatableDiv').html()) == "") {
                dataBindTab3Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab4Li') {
            if ($.trim($('#partTab4DatatableDiv').html()) == "") {
                dataBindTab4Table();
            }
        }
    }
    //таб1
    function dataBindTab1Table() {
        var valData = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/PartTab1Datatable",
            data: '{"parttype":"' + $('#partTab1SelectPartType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"partTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th data-class=\"expand\" lang=\"mn\">Код</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Тэмдэглэл</th>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Нэгж үнэ</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\" data-parttypeid=\"" + value.PART_TYPE_ID + "\">";
                    valData += "<td>" + value.CODE + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.DESCRIPTION) + "</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#partTab1Modal\" onclick=\"showAddEditTab1(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_partTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#partTab1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_partTab1Datatable) {responsiveHelper_partTab1Datatable = new ResponsiveDatatablesHelper($('#partTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_partTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_partTab1Datatable.respond();}});<\/script>";
                $("#partTab1DatatableDiv").html(valData);
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
    $("#partTab1SelectPartType").change(function () {
        dataBindTab1Table();
    });
    function showAddEditTab1(el, isinsupt) {
        $('#partTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#partTab1ID').text('');
            $('#partTab1ModalSelectPartType').val('');
            $('#partTab1ModalInputCode').val('');
            $('#partTab1ModalInputName').val('');
            $('#partTab1ModalInputDescription').val('');
            $('#partTab1ModalInputPrice').val('');
        }
        else {
            $('#partTab1ID').text($(el).closest('tr').attr('data-id'));
            $('#partTab1ModalSelectPartType').val($(el).closest('tr').attr('data-parttypeid'));
            $('#partTab1ModalInputCode').val($(el).closest('tr').find('td:eq(0)').text());
            $('#partTab1ModalInputName').val($(el).closest('tr').find('td:eq(1)').text());
            $('#partTab1ModalInputDescription').val($(el).closest('tr').find('td:eq(2)').text());
            $('#partTab1ModalInputPrice').val($(el).closest('tr').find('td:eq(3)').text().replace(/₮/g, '').replace(/,/g, ''));
        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон сэлбэг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_PART WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        smallBox('Сэлбэг', 'Амжилттай устлаа', '#659265');
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
    $('#partTab1ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            partTab1ModalSelectpartType: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            partTab1ModalInputCode: {
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
            partTab1ModalInputName: {
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
            partTab1ModalInputPrice: {
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
            if ($('#partTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_PART (CLINIC_ID, CODE, NAME, DESCRIPTION, PRICE, PART_TYPE_ID) VALUES (' + $('#indexClinicId').text() + ', N\'' + $('#partTab1ModalInputCode').val() + '\', N\'' + replaceDisplayToDatabase($.trim($('#partTab1ModalInputName').val())) + '\', N\'' + replaceDisplayToDatabase($.trim($('#partTab1ModalInputDescription').val())) + '\', ' + $.trim($('#partTab1ModalInputPrice').val()) + ', ' + $('#partTab1ModalSelectPartType option:selected').val() + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#partTab1Modal').modal('hide');
                        smallBox('Сэлбэг', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_PART SET CODE=\'' + $('#partTab1ModalInputCode').val() + '\', NAME=N\'' + replaceDisplayToDatabase($.trim($('#partTab1ModalInputName').val())) + '\', DESCRIPTION=N\'' + replaceDisplayToDatabase($.trim($('#partTab1ModalInputDescription').val())) + '\', PRICE=' + $.trim($('#partTab1ModalInputPrice').val()) + ', PART_TYPE_ID=' + $('#partTab1ModalSelectPartType option:selected').val() + ' WHERE ID=' + $('#partTab1ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#partTab1Modal').modal('hide');
                        smallBox('Сэлбэг', 'Амжилттай хадгалагдлаа', '#659265');
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
        $('#partTab1ModalSelectPartType').val('');
        $('#partTab1ModalExcelInputImportExcel').val('');
    }
    $("#partTab1ModalExcelForm").validate({
        rules: {
            partTab1ModalExcelSelectPartType: {
                required: true
            },
            partTab1ModalExcelInputImportExcel: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            partTab1ModalExcelSelectPartType: {
                required: 'Сонгоно уу'
            },
            partTab1ModalExcelInputImportExcel: {
                required: 'Оруулна уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            if ($('#partTab1ModalExcelInputImportExcel').val() == '') alert('Эксэл файл сонгоно уу!');
            else {
                //alert($('#partTab1ModalExcelInputImportExcel').val());

                $("#partTab1ModalExcelButtonImportExcel").html('<i class="fa fa-refresh fa-spin"></i> Хадгалах');
                var uploadfiles = $("#partTab1ModalExcelInputImportExcel").get(0);
                var uploadedfiles = uploadfiles.files;
                var fromdata = new FormData();
                fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                var choice = {};
                choice.url = "../pg/uploadFile.ashx?fileurl=files/part&filename=PartTemp.xls";
                choice.type = "POST";
                choice.data = fromdata;
                choice.contentType = false;
                choice.processData = false;
                choice.success = function (result) {
                    if (result != "1") {
                        alert('Файл хуулхад алдаа гарлаа');
                        $("#partTab1ModalExcelButtonImportExcel").html('<span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах');
                    }
                    else {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/PartqExcelBulkUpload",
                            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "typeid":"' + $('#partTab1ModalExcelSelectPartType option:selected').val() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                alert(data.d);
                                $("#partTab1ModalExcelButtonImportExcel").html('<span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах');
                                dataBindTab1Table();
                                $('#partTab1ModalExcel').modal('hide');
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
            url: "../wcf/ServiceMain.svc/PartTab2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"partTab2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\""+value.ID+"\">";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#partTab2Modal\" onclick=\"showAddEditTab2(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab2(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_partTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#partTab2Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_partTab2Datatable) {responsiveHelper_partTab2Datatable = new ResponsiveDatatablesHelper($('#partTab2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_partTab2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_partTab2Datatable.respond();}});<\/script>";
                $("#partTab2DatatableDiv").html(valData);
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
        $('#partTab2ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#partTab2ID').text('');
            $('#partTab2ModalInputName').val('');
        }
        else {
            $('#partTab2ID').text($(el).closest('tr').attr('data-id'));
            $('#partTab2ModalInputName').val($(el).closest('tr').find('td:eq(0)').text());
        }
    }
    function showDeleteTab2(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_PART WHERE PART_TYPE_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d != '0') alert('Сонгосон сэлбэгийн төрөлд төрөлд хамааралтай сэлбэг орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон сэлбэгийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_PART_TYPE WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab2Table();
                                    dataBindTabsPartType();
                                    smallBox('Сэлбэгийн төрөл', 'Амжилттай устлаа', '#659265');
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
    function dataBindTabsPartType() {
        var valData = '';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/PartPartTypeListForDDL",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                });
                $('#partTab1ModalSelectPartType').html("<option value=\"\" lang=\"mn\">- Сонго -</option>" + valData);
                $('#partTab1ModalExcelSelectPartType').html("<option value=\"\" lang=\"mn\">- Сонго -</option>" + valData);
                $("#partTab1SelectPartType").html("<option value=\"\" lang=\"mn\">- Бүгд -</option>"+valData);
                $("#partTab4SelectPartType").html("<option value=\"\" lang=\"mn\">- Бүгд -</option>"+valData);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#partTab2ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            partTab2ModalInputName: {
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
            if ($('#partTab2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_part_TYPE (CLINIC_ID, NAME) VALUES (' + $('#indexClinicId').text() + ', N\'' + replaceDisplayToDatabase($.trim($('#partTab2ModalInputName').val())) + '\')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        $('#partTab2Modal').modal('hide');
                        dataBindTabsPartType();
                        smallBox('Сэлбэгийн төрөл', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_PART_TYPE SET NAME=N\'' + replaceDisplayToDatabase($.trim($('#partTab2ModalInputName').val())) + '\' WHERE ID=' + $('#partTab2ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        $('#partTab2Modal').modal('hide');
                        dataBindTabsPartType();
                        smallBox('Сэлбэгийн төрөл', 'Амжилттай хадгалагдлаа', '#659265');
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
            url: "../wcf/ServiceMain.svc/PartTab3Datatable",
            data: '{"parttype":"' + $('#partTab3SelectPartType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"partTab3Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Төрөл</th>";
                valData += "<th data-class=\"expand\" lang=\"mn\">Сэлбэг</th>";
                valData += "<th lang=\"mn\">Нэгж үнэ</th>";
                valData += "<th style=\"width:140px;\" data-hide=\"phone\" lang=\"mn\">Хугацаа</th>";
                valData += "<th style=\"width:30px;\" data-hide=\"phone\" lang=\"mn\">Хувь</th>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Үнэ</th>";
                valData += "<th style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.PART_ID + "\" " + value.ISACTIVE + ">";
                    valData += "<td data-id=\"" + value.PART_TYPE_ID + "\">" + replaceDatabaseToDisplay(value.PART_TYPE) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.PART) + "</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td>" + value.BETWEENDATE + "</td>";
                    valData += "<td style=\"text-align:right;\">" + value.PER + "%</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.DISCPRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#partTab3Modal\" onclick=\"showAddEditTab3(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab3(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_partTab3Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#partTab3Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_partTab3Datatable) {responsiveHelper_partTab3Datatable = new ResponsiveDatatablesHelper($('#partTab3Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_partTab3Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_partTab3Datatable.respond();}});<\/script>";
                $("#partTab3DatatableDiv").html(valData);
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
    $("#partTab3SelectPartType").change(function () {
        dataBindTab3Table();
    });
    function showAddEditTab3(el, isinsupt) {
        var valData = '';
        $('#partTab3ModalHeaderLabel').text(isinsupt);
        $('#partTab3ID').html('');
        $('#partTab3ModalSelectPartType, #partTab3ModalInputBegindate, #partTab3ModalInputEnddate, #partTab3ModalInputPer').val('');
        $('#partTab3ModalSelectPart').html('<option value="">- Сонго -</option>');
        $('#partTab3ModalSelectPart').prop('disabled', true);
        if (isinsupt == 'засах') {
            $('#partTab3ID').text($(el).closest('tr').attr('data-id'));
            $('#partTab3ModalSelectPartType').val($(el).closest('tr').find('td:eq(0)').attr('data-id'));
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/PartPartListForDDL",
                data: '{"parttype":"' + $('#partTab3ModalSelectPartType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.PART) + "</option>";
                    });
                    $("#partTab3ModalSelectPart").html('<option value="">- Сонго -</option>' + valData);
                    $('#partTab3ModalSelectPart').prop('disabled', false);
                    $("#partTab3ModalSelectPart").val($(el).closest('tr').attr('data-id'));
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
            $('#partTab3ModalInputBegindate').val($(el).closest('tr').find('td:eq(3)').html().split(' - ')[0]);
            $('#partTab3ModalInputEnddate').val($(el).closest('tr').find('td:eq(3)').html().split(' - ')[1]);
            $('#partTab3ModalInputPer').val($(el).closest('tr').find('td:eq(4)').html().replace('%', ''));
        }
    }
    function showDeleteTab3(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон сэлбэгийн хямдралыг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_PARTDISC WHERE PART_ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3Table();
                        smallBox('Сэлбэгийн хямдрал', 'Амжилттай устлаа', '#659265');
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
    $('#partTab3ModalForm').bootstrapValidator({
        fields: {
            partTab3ModalSelectPartType: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            partTab3ModalSelectPart: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            partTab3ModalInputBegindate: {
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
            partTab3ModalInputEnddate: {
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
            partTab3ModalInputPer: {
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
            strtDate = new Date($('#partTab3ModalInputBegindate').val().split('-')[0], $('#partTab3ModalInputBegindate').val().split('-')[1], $('#partTab3ModalInputBegindate').val().split('-')[2]);
            endDate = new Date($('#partTab3ModalInputEnddate').val().split('-')[0], $('#partTab3ModalInputEnddate').val().split('-')[1], $('#partTab3ModalInputEnddate').val().split('-')[2]);
            if (strtDate > endDate) {
                alert('Эхлэх огноо дуусах огнооноос бага байна!');
            }
            else {
                if (parseFloat($.trim($('#partTab3ModalInputPer').val())) > 0 && parseFloat($.trim($('#partTab3ModalInputPer').val())) <= 100) {
                    if ($('#partTab3ModalHeaderLabel').text() == 'нэмэх') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            data: '{"qry":"INSERT INTO TBL_PARTDISC (PART_ID, BEGINDATE, ENDDATE, PER) VALUES (' + $('#partTab3ModalSelectPart option:selected').val() + ', \'' + $.trim($('#partTab3ModalInputBegindate').val()) + '\', \'' + $.trim($('#partTab3ModalInputEnddate').val()) + '\', ' + $.trim($('#partTab3ModalInputPer').val()) + ')"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                dataBindTab3Table();
                                $('#partTab3Modal').modal('hide');
                                smallBox('Сэлбэгийн хямдрал', 'Амжилттай хадгалагдлаа', '#659265');
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
                            data: '{"qry":"UPDATE TBL_PARTDISC SET PART_ID=' + $('#partTab3ModalSelectPart option:selected').val() + ', BEGINDATE=\'' + $.trim($('#partTab3ModalInputBegindate').val()) + '\', ENDDATE=\'' + $.trim($('#partTab3ModalInputEnddate').val()) + '\', PER=' + $.trim($('#partTab3ModalInputPer').val()) + ' WHERE PART_ID=' + $('#partTab3ID').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                dataBindTab3Table();
                                $('#partTab3Modal').modal('hide');
                                smallBox('Сэлбэгийн хямдрал', 'Амжилттай хадгалагдлаа', '#659265');
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
    $('#partTab3ModalSelectPartType').change(function () {
        var valData = '';
        $('#partTab3ModalSelectPart').html('<option value="">- Сонго -</option>');
        $('#partTab3ModalSelectPart').prop('disabled', true);
        if ($('#partTab3ModalSelectPartType option:selected').val() != '') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/PartPartListForDDL",
                data: '{"parttype":"' + $('#partTab3ModalSelectPartType option:selected').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.PART) + "</option>";
                    });
                    $("#partTab3ModalSelectPart").html('<option value="">- Сонго -</option>' + valData);
                    $('#partTab3ModalSelectPart').prop('disabled', false);
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

    $('#partTab3ModalInputBegindate, #partTab3ModalInputEnddate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab3).on('changeDate', dateChangedTab3);
    function dateChangedTab3(ev) {
        $('#partTab3Modal').find(':submit').prop('disabled', false);
    }

    //tab4
    function setFullNum2(val) {
        if (parseInt(val) < 10) return '0' + val.toString();
        else return val.toString();
    }
    function dataBindTab4Table() {
        var valData = '';
        showLoader('loaderTab4');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/PartTab4Datatable",
            data: '{"parttype":"' + $('#partTab4SelectPartType option:selected').val() + '", "startdate":"' + $('#partTab4SelectStartDate').val() + '", "enddate":"' + $('#partTab4SelectEndDate').val() + '", "clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab4Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th data-class=\"expand\" lang=\"mn\">Код</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                for (var d = new Date(parseInt($('#partTab4SelectStartDate').val().split('-')[0]), parseInt($('#partTab4SelectStartDate').val().split('-')[1]), parseInt($('#partTab4SelectStartDate').val().split('-')[2])) ; d <= new Date(parseInt($('#partTab4SelectEndDate').val().split('-')[0]), parseInt($('#partTab4SelectEndDate').val().split('-')[1]), parseInt($('#partTab4SelectEndDate').val().split('-')[2])) ; d.setDate(d.getDate() + 1)) {
                    valData += "<th lang=\"mn\">" + d.getFullYear() + "-" + setFullNum2((d.getMonth() + 1)) + "-" + setFullNum2(d.getDate()) + "</th>";
                }
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\""+value.ID+"\">";
                    valData += "<td>" + value.CODE + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    $.each(this, function (k, v) {
                        if (k != 'ID' && k != 'CODE' && k != 'NAME') valData += '<td data-dt="' + k + '" data-val="' + v + '" class="text-right" style="cursor: pointer;" onmouseover="pTab4DataDateOnMouseOver(this);" onmouseout="pTab4DataDateOnMouseOut(this);" onclick="pTab4DataDateOnClick(this);">' + v + '</td>';
                    });
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab4Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab4Datatable').dataTable({\"scrollX\": true, \"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab4Datatable) {responsiveHelper_pTab4Datatable = new ResponsiveDatatablesHelper($('#pTab4Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab4Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab4Datatable.respond();}});<\/script>";
                $("#partTab4DatatableDiv").html(valData);
                hideLoader('loaderTab4');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#partTab4SelectPartType').change(function () {
        dataBindTab4Table();
    });
    $('#partTab4SelectStartDate, #partTab4SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab4).on('changeDate', dateChangedTab4);
    function dateChangedTab4(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "partTab4SelectStartDate") {
            if ($.trim($('#partTab4SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#partTab4SelectEndDate').val().split('-')[0], $('#partTab4SelectEndDate').val().split('-')[1], $('#partTab4SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab4Table();
                }
            }
        }
        else if ($(this).attr('id') == "partTab4SelectEndDate") {
            if ($.trim($('#partTab4SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#partTab4SelectStartDate').val().split('-')[0], $('#partTab4SelectStartDate').val().split('-')[1], $('#partTab4SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab4Table();
                }
            }
        }
    }
    function pTab4DataDateOnMouseOver(el) {
        $(el).html('засах');
        $(el).attr('class', 'text-center text-muted');
        $(el).attr('style', 'cursor: pointer; background-color: #f9f2f4; color: #c7254e; text-decoration:underline;');
    }
    function pTab4DataDateOnMouseOut(el) {
        $(el).html($(el).attr('data-val'));
        $(el).attr('class', 'text-right');
        $(el).attr('style', 'cursor: pointer;');
    }
    function pTab4DataDateOnClick(el) {
        $('#partTab4ID').html($(el).closest('tr').attr('data-id'));
        $('#pTab4ModalSpanCode').html($(el).closest('tr').find('td:eq(0)').html());
        $('#pTab4ModalSpanName').html($(el).closest('tr').find('td:eq(1)').html());
        $('#pTab4ModalSpanDate').html($(el).attr('data-dt'));
        $('#pTab4ModalInputSpinner').val($(el).attr('data-val'));
        $('#partTab4ColIndex').html($(el).index());
        $('#partTab4Modal').modal('show');
    }
    $('#partTab4ModalForm').bootstrapValidator({
        fields: {
            pTab4ModalInputSpinner: {
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
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"DELETE FROM TBL_PART_DEMAND WHERE PART_ID='+$('#partTab4ID').html()+' AND DT=\''+$('#pTab4ModalSpanDate').html()+'\'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                        data: '{"qry":"INSERT INTO TBL_PART_DEMAND (PART_ID, DT, CNT) VALUES (' + $('#partTab4ID').html() + ', \'' + $('#pTab4ModalSpanDate').html() + '\', ' + $.trim($('#pTab4ModalInputSpinner').val()) + ')"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            $('#pTab4Datatable tbody tr').each(function () {
                                if ($(this).attr('data-id') == $('#partTab4ID').html()) {
                                    $(this).find('td:eq(' + $('#partTab4ColIndex').html() + ')').html($.trim($('#pTab4ModalInputSpinner').val()));
                                }
                            });
                            $('#partTab4Modal').modal('hide');
                            smallBox('Сэлбэгийн эрэлт', 'Амжилттай хадгалагдлаа...', '#659265');
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
</script>

