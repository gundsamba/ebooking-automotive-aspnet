<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staff.aspx.cs" Inherits="ebooking.pg.staff" %>
<style type="text/css">
    .Colvis {
        position:absolute;
        float:right;
    }
</style>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-group fa-fw "></i><span lang="mn">Ажилтаны бүртгэл</span></h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
            <header>
				<span class="widget-icon"> <i class="fa fa-group"></i> </span>
				<h2 lang="mn">Ажилтаны бүртгэл</h2>
                <ul class="nav nav-tabs pull-right" id="partTab">
					<li id="pTab1Li" onclick="pDatabindTabs(this)" class=" pull-left active">
						<a data-toggle="tab" href="#s1"><i class="fa fa-list"></i> <span lang="mn">Ажилтаны бүртгэл</span></a>
					</li>
					<li id="pTab2Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s2"><i class="fa fa-wrench"></i> <span lang="mn">Албан тушаалын бүртгэл</span></a>
					</li>
					<li id="pTab3Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s3"><i class="fa fa-wrench"></i> <span lang="mn">Нэгжийн бүртгэл</span></a>
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
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц:</label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staffTab1Modal" onclick="staffTab1AddEdit(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div id="staffTab1DatatableDiv">
					
				            </div>
                        </div>
                        <div id="s2" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab2" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2>Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц:</label></div>
                            <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staffTab2Modal" onclick="staffTab2AddEdit(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                            </div>
                            <div id="staffTab2DatatableDiv">
					
				            </div>
                        </div>
                        <div id="s3" class="tab-pane fade animated fast fadeInDown">
                            <div class="row">
                                <div class="col-sm-12 col-md-12 col-lg-124">
                                    <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
                                        <header>
                                            <ul class="nav nav-tabs pull-right" id="departmentTab">
					                            <li id="pTab3s1Li" onclick="pDatabindTabs(this)" class=" pull-left active">
						                            <a data-toggle="tab" href="#s3s1"><i class="fa fa-list"></i> <span lang="mn">Хэлтэс</span></a>
					                            </li>
					                            <li id="pTab3s2Li" onclick="pDatabindTabs(this)">
						                            <a data-toggle="tab" href="#s3s2"><i class="fa fa-list"></i> <span lang="mn">Алба</span></a>
					                            </li>
					                            <li id="pTab3s3Li" onclick="pDatabindTabs(this)">
						                            <a data-toggle="tab" href="#s3s3"><i class="fa fa-list"></i> <span lang="mn">Нэгж</span></a>
					                            </li>
				                            </ul>
			                            </header>
                                        <div class="no-padding">
                                            <div class="jarviswidget-editbox"></div>
                                            <div class="widget-body">
                                                <div class="tab-content">
                                                    <div id="s3s1" class="tab-pane fade active in animated fast fadeInDown">
                                                        <div id="loaderTab3s1" class="loader-background">
                                                            <img src="../img/loading.gif" />
                                                            <h2>Уншиж байна...</h2>
                                                        </div>
                                                        <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц:</label></div>
                                                        <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                                            <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staffTab3s1Modal" onclick="staffTab3s1AddEdit(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                                                        </div>
                                                        <div id="staffTab3s1DatatableDiv">

				                                        </div>
                                                    </div>
                                                    <div id="s3s2" class="tab-pane fade in animated fast fadeInDown">
                                                        <div id="loaderTab3s2" class="loader-background">
                                                            <img src="../img/loading.gif" />
                                                            <h2>Уншиж байна...</h2>
                                                        </div>
                                                        <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц:</label></div>
                                                        <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                                            <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staffTab3s2Modal" onclick="staffTab3s2AddEdit(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                                                        </div>
                                                        <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:135px;">
                                                            <select id="staffTab3s2SelectHeltes" name="staffTab3s2SelectHeltes" runat="server" class="form-control no-padding">
                                                                <option value="">- Бүгд -</option>
                                                            </select>
                                                        </div>
                                                        <div class="Colvis TableTools" style="right:345px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Хэлтэс:</label></div>
                                                        <div id="staffTab3s2DatatableDiv">

				                                        </div>
                                                    </div>
                                                    <div id="s3s3" class="tab-pane fade in animated fast fadeInDown">
                                                        <div id="loaderTab3s3" class="loader-background">
                                                            <img src="../img/loading.gif" />
                                                            <h2>Уншиж байна...</h2>
                                                        </div>
                                                        <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц:</label></div>
                                                        <div class="Colvis TableTools" style="right:135px; top:2px; z-index:5; margin-top:7px;">
                                                            <a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staffTab3s3Modal" onclick="staffTab3s3AddEdit(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Нэмэх</span></a>
                                                        </div>
                                                        <div class="Colvis TableTools" style="right:205px; top:0px; z-index:5; margin-top:7px; width:135px;">
                                                            <select id="staffTab3s3SelectAlba" name="staffTab3s3SelectAlba" runat="server" class="form-control no-padding" disabled>
                                                                <option value="">- Бүгд -</option>
                                                            </select>
                                                        </div>
                                                        <div class="Colvis TableTools" style="right:345px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Алба:</label></div>
                                                        <div class="Colvis TableTools" style="right:390px; top:0px; z-index:5; margin-top:7px; width:135px;">
                                                            <select id="staffTab3s3SelectHeltes" name="staffTab3s3SelectHeltes" runat="server" class="form-control no-padding">
                                                                <option value="">- Бүгд -</option>
                                                            </select>
                                                        </div>
                                                        <div class="Colvis TableTools" style="right:530px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Хэлтэс:</label></div>
                                                        <div id="staffTab3s3DatatableDiv">

				                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="staffTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="staffTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Ажилтан</span>&nbsp;<span id="staffTab1ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="staffTab1ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-2">
                                    <label class="control-label" lang="mn">*Код</label>
									<input id="staffTab1ModalInputCode" name="staffTab1ModalInputCode" type="text" class="form-control" placeholder="Код" lang="mn" disabled />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label" lang="mn">*Өөрийн нэр</label>
									<input id="staffTab1ModalInputFName" name="staffTab1ModalInputFName" type="text" class="form-control" placeholder="Өөрийн нэр" lang="mn" />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label" lang="mn">*Эцэг/эхийн нэр</label>
									<input id="staffTab1ModalInputLName" name="staffTab1ModalInputLName" type="text" class="form-control" placeholder="Эцэг/эхийн нэр" lang="mn" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label" lang="mn">*Хүйс</label>
                                    <select id="staffTab1ModalSelectGender" name="staffTab1ModalSelectGender" class="form-control">
								        <option value="" lang="mn">-Хүйс-</option>
                                        <option value="1" lang="mn">Эрэгтэй</option>
                                        <option value="0" lang="mn">Эмэгтэй</option>
							        </select>
                                </div>
                                <div class="col-md-2">
                                    <span class="onoffswitch-title">
								        <i class="fa fa-check"></i> <span lang="mn">Идэвхтэй эсэх</span>
							        </span>
							        <span class="onoffswitch">
								        <input id="staffTab1ModalSelectIsActive" name="staffTab1ModalSelectIsActive" type="checkbox" class="onoffswitch-checkbox" checked="checked">
								        <label class="onoffswitch-label" for="staffTab1ModalSelectIsActive"> 
									        <span class="onoffswitch-inner" data-swchon-text="ON" data-swchoff-text="OFF"></span> 
									        <span class="onoffswitch-switch"></span> 
								        </label> 
							        </span>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label" lang="mn">И-мэйл</label>
                                    <input id="staffTab1ModalInputEmail" name="staffTab1ModalInputEmail" type="text" class="form-control" placeholder="И-мэйл" lang="mn" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label" lang="mn">*Утас</label>
                                    <input id="staffTab1ModalInputTel" name="staffTab1ModalInputTel" type="text" class="form-control" placeholder="Утас" lang="mn" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label" lang="mn">Утас 2</label>
                                    <input id="staffTab1ModalInputTel2" name="staffTab1ModalInputTel2" type="text" class="form-control" placeholder="Утас 2" lang="mn" />
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label" lang="mn">*Албан тушаал</label>
                                    <select id="staffTab1ModalSelectRole" name="staffTab1ModalSelectRole" runat="server" class="form-control">
								        <option value="" lang="mn">-Албан тушаал-</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-1">
                                    <img id="staffTab1ModalImgStaffImage" src="../img/staff/male.jpg" alt="me" style="height:60px; width:60px;" >
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label" lang="mn">Зураг</label>
                                    <input id="staffTab1ModalInputUploadImage" type="file" class="btn btn-default">
                                </div>
                                <div class="col-md-7">
                                    <label class="control-label" lang="mn">*Нэгж</label>
                                    <select id="staffTab1ModalSelectNegj" name="staffTab1ModalSelectNegj" runat="server" class="form-control">
								        <option value="" lang="mn">- Сонго -</option>
							        </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-group">
                            <div class="row">
                                <%--<div class="col-md-3">
                                    <label class="control-label" lang="mn">Ургийн овог</label>
									<input id="staffTab1ModalInputMName" name="staffTab1ModalInputMName" type="text" class="form-control" placeholder="Ургийн овог" lang="mn" />
                                </div>--%>
								<%--<div class="col-md-3">
                                    <label class="control-label" lang="mn">*Регистер #</label>
                                    <div class="input-group">
                                        <select id="staffTab1ModalSelectRd1" name="staffTab1ModalSelectRd1" class="form-control" style="padding: 5px; width:53px;">
								            <option value="">-</option><option value="А">А</option><option value="Б">Б</option><option value="В">В</option><option value="Г">Г</option><option value="Д">Д</option><option value="Е">Е</option><option value="Ё">Ё</option><option value="Ж">Ж</option><option value="З">З</option><option value="И">И</option><option value="Й">Й</option><option value="К">К</option><option value="Л">Л</option><option value="М">М</option><option value="Н">Н</option><option value="О">О</option><option value="Ө">Ө</option><option value="П">П</option><option value="Р">Р</option><option value="С">С</option><option value="Т">Т</option><option value="У">У</option><option value="Ү">Ү</option><option value="Ф">Ф</option><option value="Х">Х</option><option value="Ц">Ц</option><option value="Ч">Ч</option><option value="Ш">Ш</option><option value="Щ">Щ</option><option value="Ъ">Ъ</option><option value="Ы">Ы</option><option value="Ь">Ь</option><option value="Э">Э</option><option value="Ю">Ю</option><option value="Я">Я</option>
							            </select>
                                        <select id="staffTab1ModalSelectRd2" name="staffTab1ModalSelectRd2" class="form-control" style="padding: 5px; width:53px;border-left: 0px;">
								            <option value="">-</option><option value="А">А</option><option value="Б">Б</option><option value="В">В</option><option value="Г">Г</option><option value="Д">Д</option><option value="Е">Е</option><option value="Ё">Ё</option><option value="Ж">Ж</option><option value="З">З</option><option value="И">И</option><option value="Й">Й</option><option value="К">К</option><option value="Л">Л</option><option value="М">М</option><option value="Н">Н</option><option value="О">О</option><option value="Ө">Ө</option><option value="П">П</option><option value="Р">Р</option><option value="С">С</option><option value="Т">Т</option><option value="У">У</option><option value="Ү">Ү</option><option value="Ф">Ф</option><option value="Х">Х</option><option value="Ц">Ц</option><option value="Ч">Ч</option><option value="Ш">Ш</option><option value="Щ">Щ</option><option value="Ъ">Ъ</option><option value="Ы">Ы</option><option value="Ь">Ь</option><option value="Э">Э</option><option value="Ю">Ю</option><option value="Я">Я</option>
							            </select>
                                        <input id="staffTab1ModalInputRd" name="staffTab1ModalInputRd" type="text" class="form-control" placeholder="" style="width: 85px; border-left: 0; padding: 12px;" />
                                    </div>									
                                </div>--%>
                                <%--<div class="col-md-3">
                                    <label class="control-label"><span lang="mn">*Төрсөн огноо</span> <i>/1900-01-01/</i></label>
									<div class="input-group">
                                        <select id="staffTab1ModalSelectDofYear" name="staffTab1ModalSelectDofYear" class="form-control" style="padding: 5px; width:70px;">
								            <option value="">----</option>
							            </select>
                                        <select id="staffTab1ModalSelectDofMonth" name="staffTab1ModalSelectDofMonth" class="form-control" style="padding: 5px; width:55px; border-left:0;">
								            <option value="">--</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
							            </select>
                                        <select id="staffTab1ModalSelectDofDate" name="staffTab1ModalSelectDofDate" class="form-control" style="padding: 5px; width:55px; border-left:0;" disabled>
								            <option value="">--</option>
							            </select>
                                    </div>
                                </div>--%>

                            </div>
                        </div>
                    </fieldset>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button id="staffTab1ModalBtnSave" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
	</div>
</div>
<div id="staffTab1InfoModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">

        </div>
    </div>
</div>
<div id="staffTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="staffTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Албан тушаал</span>&nbsp;<span id="staffTab2ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="staffTab2ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Албан тушаал</label>
									<input id="staffTab2ModalInputName" name="staffTab2ModalInputName" type="text" class="form-control" placeholder="Албан тушаал" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button id="staffTab2ModalBtnSave" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="staffTab3s1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="staffTab3s1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Хэлтэс</span>&nbsp;<span id="staffTab3s1ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="staffTab3s1ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-4">
                                    <label class="control-label" lang="mn">*Дугаар</label>
									<input id="staffTab3s1ModalInputNo" name="staffTab3s1ModalInputNo" type="text" class="form-control" placeholder="Дугаар" lang="mn"/>
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label" lang="mn">*Товч нэр</label>
									<input id="staffTab3s1ModalInputInitname" name="staffTab3s1ModalInputInitname" type="text" class="form-control" placeholder="Товч нэр" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="staffTab3s1ModalInputName" name="staffTab3s1ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn"/>
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
<div id="staffTab3s2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="staffTab3s2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Алба</span>&nbsp;<span id="staffTab3s2ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="staffTab3s2ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Хэлтэс</label>
									<select id="staffTab3s2ModalSelectHeltes" name="staffTab3s2ModalSelectHeltes" runat="server" class="form-control no-padding">
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
									<input id="staffTab3s2ModalInputNo" name="staffTab3s2ModalInputNo" type="text" class="form-control" placeholder="Дугаар" lang="mn"/>
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label" lang="mn">*Товч нэр</label>
									<input id="staffTab3s2ModalInputInitname" name="staffTab3s2ModalInputInitname" type="text" class="form-control" placeholder="Товч нэр" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="staffTab3s2ModalInputName" name="staffTab3s2ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn"/>
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
<div id="staffTab3s3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="staffTab3s3ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Нэгж</span>&nbsp;<span id="staffTab3s3ModalHeaderLabel" lang="mn"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="staffTab3s3ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Хэлтэс</label>
									<select id="staffTab3s3ModalSelectHeltes" name="staffTab3s3ModalSelectHeltes" runat="server" class="form-control no-padding">
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
                                    <label class="control-label" lang="mn">*Алба</label>
									<select id="staffTab3s3ModalSelectAlba" name="staffTab3s3ModalSelectAlba" runat="server" class="form-control no-padding" disabled>
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
									<input id="staffTab3s3ModalInputNo" name="staffTab3s3ModalInputNo" type="text" class="form-control" placeholder="Дугаар" lang="mn"/>
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label" lang="mn">*Товч нэр</label>
									<input id="staffTab3s3ModalInputInitname" name="staffTab3s3ModalInputInitname" type="text" class="form-control" placeholder="Товч нэр" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="staffTab3s3ModalInputName" name="staffTab3s3ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn"/>
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
    var date = new Date();
    var lastDay;
    var pagefunction = function () {
        for (var i = 1900; i <= date.getFullYear() ; i++) $('#staffTab1ModalSelectDofYear').append('<option>' + i + '</option>');
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
            if ($.trim($('#staffTab1DatatableDiv').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#staffTab2DatatableDiv').html()) == "") {
                dataBindTab2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#staffTab3s1DatatableDiv').html()) == "") {
                dataBindTab3s1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3s1Li') {
            if ($.trim($('#staffTab3s1DatatableDiv').html()) == "") {
                dataBindTab3s1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3s2Li') {
            if ($.trim($('#staffTab3s2DatatableDiv').html()) == "") {
                dataBindTab3s2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3s3Li') {
            if ($.trim($('#staffTab3s3DatatableDiv').html()) == "") {
                dataBindTab3s3Table();
            }
        }
    }
    //tab1
    function dataBindTab1Table() {
        var valData = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/StaffTab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"staffTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ID</th>";
                valData += "<th><i class=\"fa fa-fw fa-file-image-o txt-color-blue hidden-md hidden-sm hidden-xs\"></i></th>";
                valData += "<th data-class=\"expand\" lang=\"mn\">Код</th>";
                valData += "<th lang=\"mn\">Өөрийн нэр</th>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Эцэг/эхийн нэр</th>";
                valData += "<th data-hide=\"phone\" lang=\"mn\">Хүйс</th>";
                valData += "<th data-hide=\"phone,tablet\" lang=\"mn\">Албан тушаал</th>";
                valData += "<th data-hide=\"phone,tablet,desktop\" lang=\"mn\">Төлөв</th>";
                //valData += "<th data-hide=\"phone,tablet,desktop\" lang=\"mn\">Нэгж</th>";
                valData += "<th data-hide=\"phone,tablet,desktop\">&nbsp;</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ID + "</td>";
                    valData += "<td style=\"padding: 8px 0 0 10px;\"><div class=\"project-members\"><img src=\"../img/staff/" + value.PICTURE + "\"></div></td>";
                    valData += "<td>" + value.CODE + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.FNAME) + "</td>";
                    valData += "<td>" +replaceDatabaseToDisplay( value.LNAME) + "</td>";
                    valData += "<td>" + value.GENDER + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.POSITIONNAME) + "</td>";
                    valData += "<td>" + value.TYPE + "</td>";
                    //valData += "<td data-id=\"" + value.DEPARTMENT_ID + "\">" + value.DEPARTMENT_NAME + "</td>";
                    valData += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/staffinfomodal.aspx?id=" + value.ID + "\" data-toggle=\"modal\" data-target=\"#staffTab1InfoModal\"><i class=\"fa fa-info\"></i> <span lang=\"mn\">Дэлгэрэнгүй харах</span></a></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#staffTab1Modal\" onclick=\"staffTab1AddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"staffTab1Delete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_staffTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#staffTab1Datatable').dataTable({\"iDisplayLength\": 100, \"columns\": [null, { \"width\": \"17px\" },{ \"width\": \"32px\" },null,null,{ \"width\": \"32px\" },null,{ \"width\": \"40px\" },{ \"width\": \"120px\" },{ \"width\": \"40px\" }], \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_staffTab1Datatable) {responsiveHelper_staffTab1Datatable = new ResponsiveDatatablesHelper($('#staffTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_staffTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_staffTab1Datatable.respond();}});<\/script>";
                $("#staffTab1DatatableDiv").html(valData);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/StaffTab1NegjListForDDL",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                        });
                        $('#staffTab1ModalSelectNegj').html('<option value="">- Сонго -</option>' + valData);
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
    //$("#staffTab1ModalSelectDofYear").change(function () {
    //    if ($("#staffTab1ModalSelectDofYear option:selected").val() != '') {
    //        if ($("#staffTab1ModalSelectDofMonth option:selected").val() != '') {
    //            lastDay = new Date(parseInt($("#staffTab1ModalSelectDofYear option:selected").val()), parseInt($("#staffTab1ModalSelectDofMonth option:selected").val()), 0);
    //            $('#staffTab1ModalSelectDofDate').html('<option value="">--</option>');
    //            for (var i = 1; i <= lastDay.getDate() ; i++) $('#staffTab1ModalSelectDofDate').append('<option>' + i + '</option>');
    //            $('#staffTab1ModalSelectDofDate').prop('disabled', false);
    //        }
    //        else $('#staffTab1ModalSelectDofDate').prop('disabled', true);
    //    }
    //    else $('#staffTab1ModalSelectDofDate').prop('disabled', true);
    //});
    //$("#staffTab1ModalSelectDofMonth").change(function () {
    //    if ($("#staffTab1ModalSelectDofMonth option:selected").val() != '') {
    //        if ($("#staffTab1ModalSelectDofYear option:selected").val() != '') {
    //            lastDay = new Date(parseInt($("#staffTab1ModalSelectDofYear option:selected").val()), parseInt($("#staffTab1ModalSelectDofMonth option:selected").val()), 0);
    //            $('#staffTab1ModalSelectDofDate').html('<option value="">--</option>');
    //            for (var i = 1; i <= lastDay.getDate() ; i++) $('#staffTab1ModalSelectDofDate').append('<option>' + i + '</option>');
    //            $('#staffTab1ModalSelectDofDate').prop('disabled', false);
    //        }
    //        else $('#staffTab1ModalSelectDofDate').prop('disabled', true);
    //    }
    //    else $('#staffTab1ModalSelectDofDate').prop('disabled', true);
    //});
    function staffTab1AddEdit(el, isinsupt) {
        $('#staffTab1ModalHeaderLabel').text(isinsupt);
        $('#staffTab1ModalBtnSave').prop('disabled', false);
        if (isinsupt == 'нэмэх') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT dbo.FUNC_GETSTAFFCODE(' + $('#indexClinicId').text() + ')"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#staffTab1ModalID').text('');
                    $('#staffTab1ModalInputCode').val(data.d);
                    $('#staffTab1ModalInputFName').val('');
                    $('#staffTab1ModalInputLName').val('');
                    //$('#staffTab1ModalInputMName').val('');
                    //$('#staffTab1ModalSelectRd1').val('');
                    //$('#staffTab1ModalSelectRd2').val('');
                    //$('#staffTab1ModalInputRd').val('');
                    //$('#staffTab1ModalSelectDofYear').val('');
                    //$('#staffTab1ModalSelectDofMonth').val('');
                    //$('#staffTab1ModalSelectDofDate').val('');
                    //$('#staffTab1ModalSelectDofDate').prop('disabled', true);
                    $('#staffTab1ModalSelectGender').val('');
                    $('#staffTab1ModalInputTel').val('');
                    $('#staffTab1ModalInputTel2').val('');
                    //$('#staffTab1ModalInputAddress').val('');
                    $('#staffTab1ModalInputEmail').val('');
                    $('#staffTab1ModalImgStaffImage').attr('src', '../img/staff/male.jpg');
                    $('#staffTab1ModalInputUploadImage').val('');
                    $('#staffTab1ModalSelectRole').val('');
                    $('#staffTab1ModalSelectIsActive').prop('checked', true);
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
            $('#staffTab1ModalID').text($(el).closest('tr').find('td:eq(0)').text());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT ISNULL(CODE,\'\')+\'~\'+ISNULL(IDCARD,\'\')+\'~\'+ISNULL(FNAME,\'\')+\'~\'+ISNULL(LNAME,\'\')+\'~\'+ISNULL(MNAME,\'\')+\'~\'+CONVERT(char(10), BIRTHDATE,126)+\'~\'+CAST(GENDER as varchar)+\'~\'+ISNULL(TEL,\'\')+\'~\'+ISNULL(TEL2,\'\')+\'~\'+ISNULL(ADDRESS,\'\')+\'~\'+ISNULL(EMAIL,\'\')+\'~\'+ISNULL(PICTURE,\'male.jpg\')+\'~\'+CAST(STAFF_POSITION_ID as varchar)+\'~\'+CAST(ISACTIVE as varchar)+\'~\'+CAST(DEPARTMENT_ID as varchar) FROM TBL_STAFF WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#staffTab1ModalInputCode').val(data.d.split('~')[0]);
                    //$('#staffTab1ModalSelectRd1').val(data.d.split('~')[1].charAt(0));
                    //$('#staffTab1ModalSelectRd2').val(data.d.split('~')[1].charAt(1));
                    //$('#staffTab1ModalInputRd').val(data.d.split('~')[1].slice(2, 10));
                    $('#staffTab1ModalInputFName').val(replaceDatabaseToDisplay(data.d.split('~')[2]));
                    $('#staffTab1ModalInputLName').val(replaceDatabaseToDisplay(data.d.split('~')[3]));
                    //$('#staffTab1ModalInputMName').val(replaceDatabaseToDisplay(data.d.split('~')[4]));
                    //$('#staffTab1ModalSelectDofYear').val(parseInt(data.d.split('~')[5].split('-')[0]));
                    //$('#staffTab1ModalSelectDofMonth').val(parseInt(data.d.split('~')[5].split('-')[1]));
                    //lastDay = new Date(parseInt(data.d.split('~')[5].split('-')[0]), parseInt(data.d.split('~')[5].split('-')[1]), 0);
                    //$('#staffTab1ModalSelectDofDate').html('<option value="">--</option>');
                    //for (var i = 1; i <= lastDay.getDate() ; i++) $('#staffTab1ModalSelectDofDate').append('<option>' + i + '</option>');
                    //$('#staffTab1ModalSelectDofDate').val(parseInt(data.d.split('~')[5].split('-')[2]));
                    //$('#staffTab1ModalSelectDofDate').prop('disabled', false);
                    $('#staffTab1ModalSelectGender').val(data.d.split('~')[6]);
                    $('#staffTab1ModalInputTel').val(data.d.split('~')[7]);
                    $('#staffTab1ModalInputTel2').val(data.d.split('~')[8]);
                    //$('#staffTab1ModalInputAddress').val(replaceDatabaseToDisplay(data.d.split('~')[9]));
                    $('#staffTab1ModalInputEmail').val(data.d.split('~')[10]);
                    $('#staffTab1ModalImgStaffImage').attr('src', '../img/staff/' + data.d.split('~')[11]);
                    $('#staffTab1ModalSelectRole').val(data.d.split('~')[12]);
                    if (data.d.split('~')[13] == '1') $('#staffTab1ModalSelectIsActive').prop('checked', true);
                    else $('#staffTab1ModalSelectIsActive').prop('checked', false);
                    $('#staffTab1ModalSelectNegj').val(data.d.split('~')[14]);
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
    function staffTab1Delete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT WHERE PATIENT_ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != '0') alert('Сонгосон ажилтанд хамааралтай захиалга орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон ажилтанг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_STAFF WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1Table();
                                    smallBox('Ажилтан', 'Амжилттай устлаа', '#659265');
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
    function showImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#staffTab1ModalImgStaffImage').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#staffTab1ModalInputUploadImage").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 5242880) {
            errMsg += 'Файлын хэмжээ 5MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            showImage(this);
        }
        else alert(errMsg);
    });
    $('#staffTab1ModalForm').bootstrapValidator({
        fields: {
            staffTab1ModalInputFName: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Өөрийн нэр оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Өөрийн нэр уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            staffTab1ModalInputLName: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Эцэг/эхийн нэр оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: '*Эцэг/эхийн нэр уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            //staffTab1ModalInputMName: {
            //    group: '.col-md-3',
            //    validators: {
            //        stringLength: {
            //            max: 50,
            //            message: '*Ургийн овог уртдаа 50 тэмдэгт авна'
            //        }
            //    }
            //},
            //staffTab1ModalSelectRd1: {
            //    group: '.col-md-3',
            //    validators: {
            //        notEmpty: {
            //            message: 'Регистерийн дугаар оруулна уу'
            //        }
            //    }
            //},
            //staffTab1ModalSelectRd2: {
            //    group: '.col-md-3',
            //    validators: {
            //        notEmpty: {
            //            message: 'Регистерийн дугаар оруулна уу'
            //        }
            //    }
            //},
            //staffTab1ModalInputRd: {
            //    group: '.col-md-3',
            //    validators: {
            //        notEmpty: {
            //            message: 'Регистерийн дугаар оруулна уу'
            //        },
            //        stringLength: {
            //            min: 8,
            //            max: 8,
            //            message: 'Регистерийн дугаар 8 тэмдэгт орно'
            //        },
            //        numeric: {
            //            message: 'Регистерийн дугаар тоон тэмдэгт орно'
            //        }
            //    }
            //},
            //staffTab1ModalSelectDofYear: {
            //    group: '.col-md-3',
            //    validators: {
            //        notEmpty: {
            //            message: 'Төрсөн жил сонгоно уу'
            //        }
            //    }
            //},
            //staffTab1ModalSelectDofMonth: {
            //    group: '.col-md-3',
            //    validators: {
            //        notEmpty: {
            //            message: 'Төрсөн сар сонгоно уу'
            //        }
            //    }
            //},
            //staffTab1ModalSelectDofDate: {
            //    group: '.col-md-3',
            //    validators: {
            //        notEmpty: {
            //            message: 'Төрсөн өдөр сонгоно уу'
            //        }
            //    }
            //},
            staffTab1ModalSelectGender: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Хүйс сонгоно уу'
                    }
                }
            },
            staffTab1ModalInputTel: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Утас оруулна уу'
                    },
                    stringLength: {
                        max: 8,
                        message: 'Утас уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Утас тоон тэмдэгт орно'
                    }
                }
            },
            staffTab1ModalInputTel2: {
                group: '.col-md-2',
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Утас2 уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Утас2 тоон тэмдэгт орно'
                    }
                }
            },
            //staffTab1ModalInputAddress: {
            //    group: '.col-md-8',
            //    validators: {
            //        stringLength: {
            //            max: 150,
            //            message: 'Гэрийн хаяг 150 тэмдэгт авна'
            //        }
            //    }
            //},
            staffTab1ModalInputEmail: {
                group: '.col-md-4',
                validators: {
                    emailAddress: {
                        message: 'И-мэйл зөв оруулна уу'
                    }
                }
            },
            staffTab1ModalSelectRole: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            staffTab1ModalSelectNegj: {
                group: '.col-md-7',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            var filename = '';
            if ($("#staffTab1ModalInputUploadImage").val() != '') {
                var uploadfiles = $("#staffTab1ModalInputUploadImage").get(0);
                var uploadedfiles = uploadfiles.files;
                filename = $('#staffTab1ModalInputCode').val() + '.jpg';
            }
            else {
                if ($('#staffTab1ModalImgStaffImage').attr('src') == '../img/staff/male.jpg') filename = '';
                else filename = $('#staffTab1ModalInputCode').val() + '.jpg';
            }
            var isactive = 0;
            if ($('#staffTab1ModalSelectIsActive').is(':checked')) isactive = 1;
            if ($('#staffTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    //data: '{"qry":"INSERT INTO TBL_STAFF (CLINIC_ID, CODE, IDCARD, FNAME, LNAME, MNAME, BIRTHDATE, GENDER, TEL, TEL2, ADDRESS, EMAIL, PICTURE, STAFF_POSITION_ID, ISACTIVE) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('varchar', $('#staffTab1ModalInputCode').val()) + ', ' + strQryIsNull('nvarchar', $('#staffTab1ModalSelectRd1 option:selected').val() + $('#staffTab1ModalSelectRd2 option:selected').val() + replaceDisplayToDatabase($.trim($('#staffTab1ModalInputRd').val()))) + ', ' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputFName').val())))) + ', ' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputLName').val())))) + ', ' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputMName').val())))) + ', ' + strQryIsNull('varchar', $('#staffTab1ModalSelectDofYear option:selected').val() + '-' + $('#staffTab1ModalSelectDofMonth option:selected').val() + '-' + $('#staffTab1ModalSelectDofDate option:selected').val()) + ', ' + strQryIsNull('numeric', $('#staffTab1ModalSelectGender option:selected').val()) + ', ' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputTel').val())) + ', ' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputTel2').val())) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab1ModalInputAddress').val()))) + ', ' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputEmail').val())) + ', ' + strQryIsNull('nvarchar', filename) + ', ' + strQryIsNull('numeric', $('#staffTab1ModalSelectRole option:selected').val()) + ', ' + strQryIsNull('numeric', isactive) + ')"}',
                    data: '{"qry":"INSERT INTO TBL_STAFF (CLINIC_ID, CODE, FNAME, LNAME, GENDER, TEL, TEL2, EMAIL, PICTURE, STAFF_POSITION_ID, ISACTIVE, DEPARTMENT_ID) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('varchar', $('#staffTab1ModalInputCode').val()) + ', ' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputFName').val())))) + ', ' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputLName').val())))) + ', ' + strQryIsNull('numeric', $('#staffTab1ModalSelectGender option:selected').val()) + ', ' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputTel').val())) + ', ' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputTel2').val())) + ', ' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputEmail').val())) + ', ' + strQryIsNull('nvarchar', filename) + ', ' + strQryIsNull('numeric', $('#staffTab1ModalSelectRole option:selected').val()) + ', ' + strQryIsNull('numeric', isactive) + ', ' + strQryIsNull('numeric', $('#staffTab1ModalSelectNegj option:selected').val()) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($("#staffTab1ModalInputUploadImage").val() != '') {
                            var uploadfiles = $("#staffTab1ModalInputUploadImage").get(0);
                            var uploadedfiles = uploadfiles.files;
                            var fromdata = new FormData();
                            fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                            var choice = {};
                            choice.url = "pg/staffUploadImage.ashx?id=" + $('#staffTab1ModalInputCode').val();
                            choice.type = "POST";
                            choice.data = fromdata;
                            choice.contentType = false;
                            choice.processData = false;
                            choice.success = function (result) {
                                if (result == "1") {
                                    dataBindTab1Table();
                                    $('#staffTab1Modal').modal('hide');
                                    smallBox('Ажилтаны мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                                }
                                else {
                                    dataBindTab1Table();
                                    $('#staffTab1Modal').modal('hide');
                                    smallBox('Ажилтаны мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                                    alert('Зураг хадгалахад алдаа гарлаа: ' + result);
                                }
                            };
                            choice.error = function (err) { alert('Зураг хадгалахад алдаа гарлаа: ' + err.statusText); };
                            globalAjaxVar = $.ajax(choice);
                            event.preventDefault();
                        }
                        else {
                            dataBindTab1Table();
                            $('#staffTab1Modal').modal('hide');
                            smallBox('Ажилтаны мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    //data: '{"qry":"UPDATE TBL_STAFF SET CODE=' + strQryIsNull('varchar', $('#staffTab1ModalInputCode').val()) + ', IDCARD=' + strQryIsNull('nvarchar', $('#staffTab1ModalSelectRd1 option:selected').val() + $('#staffTab1ModalSelectRd2 option:selected').val() + replaceDisplayToDatabase($.trim($('#staffTab1ModalInputRd').val()))) + ', FNAME=' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputFName').val())))) + ', LNAME=' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputLName').val())))) + ', MNAME=' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputMName').val())))) + ', BIRTHDATE=' + strQryIsNull('varchar', $('#staffTab1ModalSelectDofYear option:selected').val() + '-' + $('#staffTab1ModalSelectDofMonth option:selected').val() + '-' + $('#staffTab1ModalSelectDofDate option:selected').val()) + ', GENDER=' + strQryIsNull('numeric', $('#staffTab1ModalSelectGender option:selected').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputTel2').val())) + ', ADDRESS=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab1ModalInputAddress').val()))) + ', EMAIL=' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputEmail').val())) + ', PICTURE=' + strQryIsNull('nvarchar', filename) + ', STAFF_POSITION_ID=' + strQryIsNull('numeric', $('#staffTab1ModalSelectRole option:selected').val()) + ', ISACTIVE=' + strQryIsNull('numeric', isactive) + ' WHERE ID=' + $('#staffTab1ModalID').text() + '"}',
                    data: '{"qry":"UPDATE TBL_STAFF SET CODE=' + strQryIsNull('varchar', $('#staffTab1ModalInputCode').val()) + ', FNAME=' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputFName').val())))) + ', LNAME=' + strQryIsNull('nvarchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#staffTab1ModalInputLName').val())))) + ', GENDER=' + strQryIsNull('numeric', $('#staffTab1ModalSelectGender option:selected').val()) + ', TEL=' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputTel').val())) + ', TEL2=' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputTel2').val())) + ', EMAIL=' + strQryIsNull('varchar', $.trim($('#staffTab1ModalInputEmail').val())) + ', PICTURE=' + strQryIsNull('nvarchar', filename) + ', STAFF_POSITION_ID=' + strQryIsNull('numeric', $('#staffTab1ModalSelectRole option:selected').val()) + ', ISACTIVE=' + strQryIsNull('numeric', isactive) + ', DEPARTMENT_ID=' + strQryIsNull('numeric', $('#staffTab1ModalSelectNegj option:selected').val()) + ' WHERE ID=' + $('#staffTab1ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($("#staffTab1ModalInputUploadImage").val() != '') {
                            var uploadfiles = $("#staffTab1ModalInputUploadImage").get(0);
                            var uploadedfiles = uploadfiles.files;
                            var fromdata = new FormData();
                            fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                            var choice = {};
                            choice.url = "pg/staffUploadImage.ashx?id=" + $('#staffTab1ModalInputCode').val();
                            choice.type = "POST";
                            choice.data = fromdata;
                            choice.contentType = false;
                            choice.processData = false;
                            choice.success = function (result) {
                                if (result == "1") {
                                    dataBindTab1Table();
                                    $('#staffTab1Modal').modal('hide');
                                    smallBox('Ажилтаны мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                                }
                                else {
                                    dataBindTab1Table();
                                    $('#staffTab1Modal').modal('hide');
                                    smallBox('Ажилтаны мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                                    alert('Зураг хадгалахад алдаа гарлаа 2: ' + result);
                                }
                            };
                            choice.error = function (err) {
                                $('#staffTab1Modal').modal('hide');
                                alert('Зураг хадгалахад алдаа гарлаа 1: ' + err.statusText);
                            };
                            globalAjaxVar = $.ajax(choice);
                            event.preventDefault();
                        }
                        else {
                            dataBindTab1Table();
                            $('#staffTab1Modal').modal('hide');
                            smallBox('Ажилтаны мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
    });

    //tab2
    function dataBindTab2Table() {
        var valData = '';
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/StaffTab2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"staffTab2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ID</th>";
                valData += "<th>#</th>";
                valData += "<th lang=\"mn\">Албан тушаалын нэр</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ID + "</td>";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#staffTab2Modal\" onclick=\"staffTab2AddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"staffTab2Delete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_staffTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#staffTab2Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_staffTab2Datatable) {responsiveHelper_staffTab2Datatable = new ResponsiveDatatablesHelper($('#staffTab2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_staffTab2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_staffTab2Datatable.respond();}, \"aoColumns\": [null, { \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null,{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#staffTab2DatatableDiv").html(valData);
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
    function staffTab2AddEdit(el, isinsupt) {
        $('#staffTab2ModalHeaderLabel').text(isinsupt);
        $('#staffTab2ModalBtnSave').prop('disabled', false);
        if (isinsupt == 'нэмэх') {
            $('#staffTab2ModalID').text('');
            $('#staffTab2ModalInputName').val('');
        }
        else {
            $('#staffTab2ModalID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#staffTab2ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
        }
    }
    function staffTab2Delete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(ID) FROM TBL_STAFF WHERE STAFF_POSITION_ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон албан тушаалд хамааралтай ажилтан орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон албан тушаалыг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_STAFF_POSITION WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab2Table();
                                    smallBox('Албан тушаал', 'Амжилттай устлаа', '#659265');
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
    $('#staffTab2ModalForm').bootstrapValidator({
        fields: {
            staffTab2ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Албан тушаал оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Албан тушаал уртдаа 50 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            var isactive = 0;
            if ($('#staffTab2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_STAFF_POSITION (CLINIC_ID, NAME) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab2ModalInputName').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        $('#staffTab2Modal').modal('hide');
                        smallBox('Албан тушаал', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_STAFF_POSITION SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab2ModalInputName').val()))) + ' WHERE ID=' + $('#staffTab2ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        $('#staffTab2Modal').modal('hide');
                        smallBox('Албан тушаал', 'Амжилттай хадгалагдлаа', '#659265');
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

    //tab3s1
    function dataBindTab3s1Table() {
        var valData = '';
        showLoader('loaderTab3s1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/StaffTab3s1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab3s1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th>#</th>";
                valData += "<th lang=\"mn\">Дугаар</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th lang=\"mn\">Товч нэр</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + value.NO + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.INITNAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#staffTab3s1Modal\" onclick=\"staffTab3s1AddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"staffTab3s1Delete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab3s1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab3s1Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab3s1Datatable) {responsiveHelper_pTab3s1Datatable = new ResponsiveDatatablesHelper($('#pTab3s1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab3s1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab3s1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\" },null, null, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#staffTab3s1DatatableDiv").html(valData);
                $("#staffTab3s2DatatableDiv, #staffTab3s3DatatableDiv").html('');
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/StaffHeltesListForDDL",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                        });
                        $('#staffTab3s2SelectHeltes, #staffTab3s3SelectHeltes').html('<option value="">- Бүгд -</option>' + valData);
                        $('#staffTab3s2ModalSelectHeltes, #staffTab3s3ModalSelectHeltes').html('<option value="">- Сонго -</option>' + valData);
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/StaffTab1NegjListForDDL",
                            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                valData = '';
                                $($.parseJSON(data.d)).each(function (index, value) {
                                    valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                                });
                                $('#staffTab1ModalSelectNegj').html('<option value="">- Сонго -</option>' + valData);
                                hideLoader('loaderTab3s1');
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
    function staffTab3s1AddEdit(el, isinsupt) {
        $('#staffTab3s1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#staffTab3s1ModalID').text('');
            $('#staffTab3s1ModalInputNo, #staffTab3s1ModalInputInitname, #staffTab3s1ModalInputName').val('');
        }
        else {
            $('#staffTab3s1ModalID').text($(el).closest('tr').attr('data-id'));
            $('#staffTab3s1ModalInputNo').val($(el).closest('tr').find('td:eq(1)').text());
            $('#staffTab3s1ModalInputInitname').val($(el).closest('tr').find('td:eq(3)').text());
            $('#staffTab3s1ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
        }
    }
    function staffTab3s1Delete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT SUM(a.CNT) as CNT FROM ( SELECT COUNT(1) as CNT FROM TBL_DEPARTMENT WHERE FATHER_ID=' + $(el).closest('tr').attr('data-id') + ' UNION ALL SELECT COUNT(1) as CTN FROM TBL_STAFF WHERE DEPARTMENT_ID=' + $(el).closest('tr').attr('data-id') + ' ) a"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон хэлтэсд хамааралтай ажилтан эсвэл алба орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон хэлтсийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_DEPARTMENT WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab3s1Table();
                                    smallBox('Хэлтэс', 'Амжилттай устлаа', '#659265');
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
    $('#staffTab3s1ModalForm').bootstrapValidator({
        fields: {
            staffTab3s1ModalInputNo: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 10,
                        message: 'Уртдаа 10 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт орно'
                    }
                }
            },
            staffTab3s1ModalInputInitname: {
                group: '.col-md-8',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 25,
                        message: 'Уртдаа 25 тэмдэгт авна'
                    }
                }
            },
            staffTab3s1ModalInputName: {
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
            var isactive = 0;
            if ($('#staffTab3s1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_DEPARTMENT (DEPARTMENT_TYPE_ID, FATHER_ID, NO, NAME, INITNAME) VALUES (1, null, ' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#staffTab3s1ModalInputNo').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s1ModalInputName').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s1ModalInputInitname').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3s1Table();
                        $('#staffTab3s1Modal').modal('hide');
                        smallBox('Хэлтэс', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_DEPARTMENT SET NO=' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#staffTab3s1ModalInputNo').val()))) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s1ModalInputName').val()))) + ', INITNAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s1ModalInputInitname').val()))) + ' WHERE ID=' + $('#staffTab3s1ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3s1Table();
                        $('#staffTab3s1Modal').modal('hide');
                        smallBox('Хэлтэс', 'Амжилттай хадгалагдлаа', '#659265');
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

    //tab3s2
    function dataBindTab3s2Table() {
        var valData = '';
        showLoader('loaderTab3s2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/StaffTab3s2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "heltesid":"' + $('#staffTab3s2SelectHeltes option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab3s2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th>#</th>";
                valData += "<th lang=\"mn\">Дугаар</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th lang=\"mn\">Товч нэр</th>";
                valData += "<th lang=\"mn\">Хэлтэс</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + value.NO + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.INITNAME) + "</td>";
                    valData += "<td data-id=\"" + value.HELTESID + "\">" + replaceDatabaseToDisplay(value.HELTESNAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#staffTab3s2Modal\" onclick=\"staffTab3s2AddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"staffTab3s2Delete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab3s2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab3s2Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab3s2Datatable) {responsiveHelper_pTab3s2Datatable = new ResponsiveDatatablesHelper($('#pTab3s2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab3s2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab3s2Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\" },null, null, null, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#staffTab3s2DatatableDiv").html(valData);
                $("#staffTab3s3DatatableDiv").html('');
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/StaffTab1NegjListForDDL",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                        });
                        $('#staffTab1ModalSelectNegj').html('<option value="">- Сонго -</option>' + valData);
                        hideLoader('loaderTab3s2');
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
    $("#staffTab3s2SelectHeltes").change(function () {
        dataBindTab3s2Table();
    });
    function staffTab3s2AddEdit(el, isinsupt) {
        $('#staffTab3s2ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#staffTab3s2ModalID').text('');
            $('#staffTab3s2ModalSelectHeltes, #staffTab3s2ModalInputNo, #staffTab3s2ModalInputInitname, #staffTab3s2ModalInputName').val('');
        }
        else {
            $('#staffTab3s2ModalID').text($(el).closest('tr').attr('data-id'));
            $('#staffTab3s2ModalSelectHeltes').val($(el).closest('tr').find('td:eq(4)').attr('data-id'));
            $('#staffTab3s2ModalInputNo').val($(el).closest('tr').find('td:eq(1)').text());
            $('#staffTab3s2ModalInputInitname').val($(el).closest('tr').find('td:eq(3)').text());
            $('#staffTab3s2ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
        }
    }
    function staffTab3s2Delete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT SUM(a.CNT) as CNT FROM ( SELECT COUNT(1) as CNT FROM TBL_DEPARTMENT WHERE FATHER_ID=' + $(el).closest('tr').attr('data-id') + ' UNION ALL SELECT COUNT(1) as CTN FROM TBL_STAFF WHERE DEPARTMENT_ID=' + $(el).closest('tr').attr('data-id') + ' ) a"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон албад хамааралтай ажилтан эсвэл нэгж орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон албыг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_DEPARTMENT WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab3s2Table();
                                    smallBox('Алба', 'Амжилттай устлаа', '#659265');
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
    $('#staffTab3s2ModalForm').bootstrapValidator({
        fields: {
            staffTab3s2ModalSelectHeltes: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            staffTab3s2ModalInputNo: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 10,
                        message: 'Уртдаа 10 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт орно'
                    }
                }
            },
            staffTab3s2ModalInputInitname: {
                group: '.col-md-8',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 25,
                        message: 'Уртдаа 25 тэмдэгт авна'
                    }
                }
            },
            staffTab3s2ModalInputName: {
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
            var isactive = 0;
            if ($('#staffTab3s2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_DEPARTMENT (DEPARTMENT_TYPE_ID, FATHER_ID, NO, NAME, INITNAME) VALUES (2, ' + strQryIsNull('numeric', $.trim($('#staffTab3s2ModalSelectHeltes option:selected').val())) + ', ' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#staffTab3s2ModalInputNo').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s2ModalInputName').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s2ModalInputInitname').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3s2Table();
                        $('#staffTab3s2Modal').modal('hide');
                        smallBox('Алба', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_DEPARTMENT SET FATHER_ID=' + strQryIsNull('numeric', $.trim($('#staffTab3s2ModalSelectHeltes option:selected').val())) + ', NO=' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#staffTab3s2ModalInputNo').val()))) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s2ModalInputName').val()))) + ', INITNAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s2ModalInputInitname').val()))) + ' WHERE ID=' + $('#staffTab3s2ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3s2Table();
                        $('#staffTab3s2Modal').modal('hide');
                        smallBox('Алба', 'Амжилттай хадгалагдлаа', '#659265');
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

    //tab3s3
    function dataBindTab3s3Table() {
        var valData = '';
        showLoader('loaderTab3s3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/StaffTab3s3Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "heltesid":"' + $('#staffTab3s3SelectHeltes option:selected').val() + '", "albaid":"' + $('#staffTab3s3SelectAlba option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab3s3Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th>#</th>";
                valData += "<th lang=\"mn\">Дугаар</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th lang=\"mn\">Товч нэр</th>";
                valData += "<th lang=\"mn\">Хэлтэс</th>";
                valData += "<th lang=\"mn\">Алба</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + value.NO + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.INITNAME) + "</td>";
                    valData += "<td data-id=\"" + value.HELTESID + "\">" + replaceDatabaseToDisplay(value.HELTESNAME) + "</td>";
                    valData += "<td data-id=\"" + value.ALBAID + "\">" + replaceDatabaseToDisplay(value.ALBANAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#staffTab3s3Modal\" onclick=\"staffTab3s3AddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"staffTab3s3Delete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab3s3Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab3s3Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab3s3Datatable) {responsiveHelper_pTab3s3Datatable = new ResponsiveDatatablesHelper($('#pTab3s3Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab3s3Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab3s3Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" },{ \"sWidth\": \"50px\", \"sClass\": \"text-center\" },null, null, null, null, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#staffTab3s3DatatableDiv").html(valData);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/StaffTab1NegjListForDDL",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                        });
                        $('#staffTab1ModalSelectNegj').html('<option value="">- Сонго -</option>' + valData);
                        hideLoader('loaderTab3s3');
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
    $("#staffTab3s3SelectHeltes").change(function () {
        var valData = '';
        if ($("#staffTab3s3SelectHeltes option:selected").val() == '') {
            $("#staffTab3s3SelectAlba").html('<option value="">- Бүгд -</option>');
            $("#staffTab3s3SelectAlba").prop('disabled', true);
            dataBindTab3s3Table();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/StaffAlbaListForDDL",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "heltesid":"' + $("#staffTab3s3SelectHeltes option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                    });
                    $("#staffTab3s3SelectAlba").html('<option value="">- Бүгд -</option>' + valData);
                    $("#staffTab3s3SelectAlba").prop('disabled', false);
                    dataBindTab3s3Table();
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
    $("#staffTab3s3ModalSelectHeltes").change(function () {
        var valData = '';
        if ($("#staffTab3s3ModalSelectHeltes option:selected").val() == '') {
            $("#staffTab3s3ModalSelectAlba").html('<option value="">- Бүгд -</option>');
            $("#staffTab3s3ModalSelectAlba").prop('disabled', true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/StaffAlbaListForDDL",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "heltesid":"' + $("#staffTab3s3ModalSelectHeltes option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                    });
                    $("#staffTab3s3ModalSelectAlba").html('<option value="">- Сонго -</option>' + valData);
                    $("#staffTab3s3ModalSelectAlba").prop('disabled', false);
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
    $("#staffTab3s3SelectAlba").change(function () {
        dataBindTab3s3Table();
    });
    function staffTab3s3AddEdit(el, isinsupt) {
        $('#staffTab3s3ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#staffTab3s3ModalID').text('');
            $("#staffTab3s3ModalSelectAlba").html('<option value="">- Бүгд -</option>');
            $("#staffTab3s3ModalSelectAlba").prop('disabled', true);
            $('#staffTab3s3ModalSelectHeltes, #staffTab3s3ModalInputNo, #staffTab3s3ModalInputInitname, #staffTab3s3ModalInputName').val('');
        }
        else {
            $('#staffTab3s3ModalID').text($(el).closest('tr').attr('data-id'));
            $('#staffTab3s3ModalSelectHeltes').val($(el).closest('tr').find('td:eq(4)').attr('data-id'));
            $('#staffTab3s3ModalSelectAlba').val($(el).closest('tr').find('td:eq(5)').attr('data-id'));
            $('#staffTab3s3ModalInputNo').val($(el).closest('tr').find('td:eq(1)').text());
            $('#staffTab3s3ModalInputInitname').val($(el).closest('tr').find('td:eq(3)').text());
            $('#staffTab3s3ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
        }
    }
    function staffTab3s3Delete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT SUM(a.CNT) as CNT FROM ( SELECT COUNT(1) as CTN FROM TBL_STAFF WHERE DEPARTMENT_ID=' + $(el).closest('tr').attr('data-id') + ' ) a"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон нэгжид хамааралтай ажилтан орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон нэгжийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_DEPARTMENT WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab3s3Table();
                                    smallBox('Нэгж', 'Амжилттай устлаа', '#659265');
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
    $('#staffTab3s3ModalForm').bootstrapValidator({
        fields: {
            staffTab3s3ModalSelectHeltes: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            staffTab3s3ModalSelectAlba: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            staffTab3s3ModalInputNo: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 10,
                        message: 'Уртдаа 10 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт орно'
                    }
                }
            },
            staffTab3s3ModalInputInitname: {
                group: '.col-md-8',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 25,
                        message: 'Уртдаа 25 тэмдэгт авна'
                    }
                }
            },
            staffTab3s3ModalInputName: {
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
            var isactive = 0;
            if ($('#staffTab3s3ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_DEPARTMENT (DEPARTMENT_TYPE_ID, FATHER_ID, NO, NAME, INITNAME) VALUES (3, ' + strQryIsNull('numeric', $.trim($('#staffTab3s3ModalSelectAlba option:selected').val())) + ', ' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#staffTab3s3ModalInputNo').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s3ModalInputName').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s3ModalInputInitname').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3s3Table();
                        $('#staffTab3s3Modal').modal('hide');
                        smallBox('Нэгж', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_DEPARTMENT SET FATHER_ID=' + strQryIsNull('numeric', $.trim($('#staffTab3s3ModalSelectAlba option:selected').val())) + ', NO=' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#staffTab3s3ModalInputNo').val()))) + ', NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s3ModalInputName').val()))) + ', INITNAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#staffTab3s3ModalInputInitname').val()))) + ' WHERE ID=' + $('#staffTab3s3ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3s3Table();
                        $('#staffTab3s3Modal').modal('hide');
                        smallBox('Нэгж', 'Амжилттай хадгалагдлаа', '#659265');
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
