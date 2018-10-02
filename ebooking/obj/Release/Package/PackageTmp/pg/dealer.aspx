<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dealer.aspx.cs" Inherits="ebooking.pg.dealer" %>
<div class="row">
	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-pencil-square-o fa-fw "></i> 
			<span lang="mn">Автомашин борлуулалтын бүртгэл</span>
		</h1>
	</div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
		<a id="pTab1AddBtn" href="javascript:void(0);" class="btn btn-primary pull-right" data-toggle="modal" data-target="#pTab1Modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Автомашин бүртгэх</span></a>
        <a id="pTab3AddBtn" href="javascript:void(0);" class="btn btn-primary pull-right hide" data-toggle="modal" data-target="#pTab3Modal" onclick="showAddEditTab3(this,'нэмэх')"><i class="fa fa-plus"></i> <span lang="mn">Захиалга бүртгэх</span></a>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
            <header>
				<span class="widget-icon"> <i class="fa fa-medkit"></i> </span>
				<h2 lang="mn">Автомашин борлуулалтын бүртгэл</h2>
                <ul class="nav nav-tabs pull-right in" id="pTab">
					<li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
						<a data-toggle="tab" href="#s1"><span class="hidden-mobile hidden-tablet" lang="mn">Бэлэн байгаа</span></a>
					</li>
					<li id="pTab2Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s2"><span class="hidden-mobile hidden-tablet" lang="mn">Ирж байгаа</span></a>
					</li>
					<li id="pTab3Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s3"><span class="hidden-mobile hidden-tablet" lang="mn">Урьдчилгаат захиалга</span></a>
					</li>
					<li id="pTab4Li" onclick="pDatabindTabs(this)">
						<a data-toggle="tab" href="#s4"><span class="hidden-mobile hidden-tablet" lang="mn">Худалдан авсан</span></a>
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
                            <div class="Colvis TableTools" style="right:135px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab1SelectMark" name="pTab1SelectMark" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:290px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Модел:</label></div>
                            <div class="Colvis TableTools" style="right:350px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab1SelectSpectype" name="pTab1SelectSpectype" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:505px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Загварын<br />төрөл:</label></div>
                            <div class="Colvis TableTools" style="right:575px; top:0px; z-index:5; margin-top:7px; width:100px;">
                                <select id="pTab1SelectIntcolor" name="pTab1SelectIntcolor" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:680px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Дотор<br />өнгө:</label></div>
                            <div class="Colvis TableTools" style="right:735px; top:0px; z-index:5; margin-top:7px; width:100px;">
                                <select id="pTab1SelectExtcolor" name="pTab1SelectExtcolor" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:840px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Гадар<br />өнгө:</label></div>
                            <div id="pTab1DatatableDiv">

                            </div>
                        </div>
                        <div id="s2" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab2" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab2SelectMark" name="pTab2SelectMark" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:290px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Модел:</label></div>
                            <div class="Colvis TableTools" style="right:350px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab2SelectSpectype" name="pTab2SelectSpectype" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:505px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Загварын<br />төрөл:</label></div>
                            <div class="Colvis TableTools" style="right:575px; top:0px; z-index:5; margin-top:7px; width:100px;">
                                <select id="pTab2SelectIntcolor" name="pTab2SelectIntcolor" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:680px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Дотор<br />өнгө:</label></div>
                            <div class="Colvis TableTools" style="right:735px; top:0px; z-index:5; margin-top:7px; width:100px;">
                                <select id="pTab2SelectExtcolor" name="pTab2SelectExtcolor" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:840px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Гадар<br />өнгө:</label></div>
                            <div id="pTab2DatatableDiv">

                            </div>
                        </div>
                        <div id="s3" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab3" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab3SelectSpectype" name="pTab3SelectSpectype" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:290px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Загварын<br />төрөл:</label></div>
                            <div class="Colvis TableTools" style="right:360px; top:0px; z-index:5; margin-top:7px; width:100px;">
                                <select id="pTab3SelectIntcolor" name="pTab3SelectIntcolor" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:465px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Дотор<br />өнгө:</label></div>
                            <div class="Colvis TableTools" style="right:520px; top:0px; z-index:5; margin-top:7px; width:100px;">
                                <select id="pTab3SelectExtcolor" name="pTab3SelectExtcolor" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:625px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Гадар<br />өнгө:</label></div>
                            <div class="Colvis TableTools" style="right:670px; top:0px; z-index:5; margin-top:7px; width:120px;">
                                <select id="pTab3SelectOrdertype" name="pTab3SelectOrdertype" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:795px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Захиалгын<br />төрөл:</label></div>
                            <div id="pTab3DatatableDiv">

                            </div>
                        </div>
                        <div id="s4" class="tab-pane fade animated fast fadeInDown">
                            <div id="loaderTab4" class="loader-background">
                                <img src="../img/loading.gif" />
                                <h2 lang="mn">Уншиж байна...</h2>
                            </div>
                            <div class="Colvis TableTools" style="right:85px; top:4px; z-index:5; margin-top:7px;"><label lang="mn">Илэрц: </label></div>
                            <div class="Colvis TableTools" style="right:135px; top:0px; z-index:5; margin-top:7px; width:150px;">
                                <select id="pTab4SelectSpectype" name="pTab4SelectSpectype" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:290px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Загварын<br />төрөл:</label></div>
                            <div class="Colvis TableTools" style="right:360px; top:0px; z-index:5; margin-top:7px; width:120px;">
                                <select id="pTab4SelectPaymenttype" name="pTab4SelectPaymenttype" runat="server" class="form-control no-padding">
                                    <option value="">- Бүгд -</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:485px; top:4px; z-index:5; margin-top:5px; line-height: 14px; text-align: right;"><label lang="mn">Төлбөрийн<br />хэлбэр:</label></div>
                            <div class="Colvis TableTools" style="right:565px; top:0px; z-index:5; margin-top:7px; width:63px;">
                                <select id="pTab3SelectMnth" name="pTab3SelectMnth" runat="server" class="form-control no-padding">
                                    <option value="1">1 сар</option>
                                    <option value="2">2 сар</option>
                                    <option value="3">3 сар</option>
                                    <option value="4">4 сар</option>
                                    <option value="5">5 сар</option>
                                    <option value="6">6 сар</option>
                                    <option value="7">7 сар</option>
                                    <option value="8">8 сар</option>
                                    <option value="9">9 сар</option>
                                    <option value="10">10 сар</option>
                                    <option value="11">11 сар</option>
                                    <option value="12">12 сар</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:635px; top:0px; z-index:5; margin-top:7px; width:55px;">
                                <select id="pTab3SelectYr" name="pTab3SelectYr" runat="server" class="form-control no-padding">
                                </select>
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
<div id="pTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h4 class="modal-title"><span lang="mn">Борлуулах автомашин</span>&nbsp;<span id="pTab1ModalHeaderLabel" lang="mn"></span></h4>
		    </div>
		    <div class="modal-body no-padding">
                <form id="pTab1ModalForm" action="" class="smart-form" novalidate="novalidate">
                    <div id="pTab1ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <section class="col col-3">
                                    <label class="label" lang="mn">*Үйлдвэрлэгч</label>
                                    <label class="select">
									    <select id="pTab1ModalSelectMarktype" name="pTab1ModalSelectMarktype" runat="server">
                                             <option value="" lang="mn">- Сонго -</option>
                                        </select><i></i>
                                    </label>
                                </section>
                                <section class="col col-6">
                                    <label class="label" lang="mn">*Модел</label>
                                    <label class="select">
					                    <select id="pTab1ModalSelectMark" name="pTab1ModalSelectMark" runat="server" disabled="disabled">
                                            <option value="" lang="mn">- Сонго -</option>
                                        </select><i></i>
                                    </label>
                                </section>
                                <section class="col col-3">
                                    <label class="label" lang="mn">*Загварын төрөл</label>
                                    <label class="select">
					                    <select id="pTab1ModalSelectSpectype" name="pTab1ModalSelectSpectype" runat="server" disabled="disabled">
                                            <option value="" lang="mn">- Сонго -</option>
                                        </select><i></i>
                                    </label>
                                </section>
                            </div>
                            <div class="row">
                                <div class="col col-3">
                                    <label class="label" lang="mn">*Аралын дугаар</label>
                                    <label class="input">
										<input id="pTab1ModalInputVinno" name="pTab1ModalInputVinno" type="text" placeholder="Аралын дугаар" lang="mn">
									</label>

                                    <%--<label class="control-label" lang="mn">*Аралын дугаар</label>
                                    <input id="pTab1ModalInputVinno" name="pTab1ModalInputVinno" class="form-control" placeholder="Аралын дугаар" lang="mn"/>--%>
                                </div>
                                <div class="col col-3">
                                    <label class="label" lang="mn">*Үйлдвэрлэсэн он</label>
                                    <label class="select">
					                    <select id="pTab1ModalSelectProducedyear" name="pTab1ModalSelectProducedyear" runat="server">
                                            <option value="" lang="mn">- Сонго -</option>
                                        </select><i></i>
                                    </label>
                                </div>
                                <div class="col col-2">
                                    <label class="label" lang="mn">*Шатхууны төрөл</label>
                                    <div class="inline-group">
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalInputFueltype1" name="pTab1ModalInputFueltype" type="radio" value="1">
											<i></i><span lang="mn">Бензин</span></label>
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalInputFueltype0" name="pTab1ModalInputFueltype" type="radio" value="0">
											<i></i><span lang="mn">Дизель</span></label>
									</div>
                                </div>
                                <div class="col col-2">
                                    <label class="label" lang="mn">*Хурдны хайрцаг</label>
									<div class="inline-group">
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalInputTransmission1" name="pTab1ModalInputTransmission" value="1" type="radio">
											<i></i><span lang="mn">Автомат</span></label>
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalInputTransmission0" name="pTab1ModalInputTransmission" value="0" type="radio">
											<i></i><span lang="mn">Механик</span></label>
									</div>
                                </div>
                                <div class="col col-2">
                                    <label class="label" lang="mn">*Заалт</label>
									<div class="inline-group">
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalInputZaaltType1" name="pTab1ModalInputZaaltType" value="1" type="radio">
											<i></i><span lang="mn">Мил</span></label>
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalInputZaaltType2" name="pTab1ModalInputZaaltType" value="2"type="radio">
											<i></i><span lang="mn">Км</span></label>
									</div>
                                </div>
                            </div>
                            <div class="row">                                
                                <div class="col col-3">
                                    <label class="label" lang="mn">*Буух огноо</label>
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
										<input id="pTab1ModalInputGetdt" name="pTab1ModalInputGetdt" type="text" placeholder="Буух огноо" lang="mn">
					                </label>
                                </div>
                                <div class="col col-3">
                                    <label class="label" lang="mn">*Борлуулах үнэ</label>
                                    <label class="input">
										<input id="pTab1ModalInputPrice" name="pTab1ModalInputPrice" type="text" placeholder="Борлуулах үнэ" lang="mn" style="text-align:right;">
					                </label>
                                </div>
                                <div class="col col-3">
                                    <div class="row">
                                        <div class="col col-10" style="padding-right: 0px;">
                                            <label class="label" lang="mn">*Гадар өнгө</label>
                                            <label class="select">
					                            <select id="pTab1ModalSelectExtcolor" name="pTab1ModalSelectExtcolor" runat="server" >
                                                    <option value="" lang="mn">- Сонго -</option>
                                                </select><i></i>
                                            </label>
                                        </div>
                                        <div class="col col-2">
                                            <div id="pTab1ModalDivExtcolor" style="margin: 25px 0 0px -10px; height: 30px; width: 30px; border: 1px solid #DDD;">
                                                &nbsp;
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col col-3">
                                    <div class="row">
                                        <div class="col col-10" style="padding-right: 0px;">
                                            <label class="label" lang="mn">*Дотор өнгө</label>
                                            <label class="select">
					                            <select id="pTab1ModalSelectIntcolor" name="pTab1ModalSelectIntcolor" runat="server">
                                                    <option value="" lang="mn">- Сонго -</option>
                                                </select><i></i>
                                            </label>
                                        </div>
                                        <div class="col col-2">
                                            <div id="pTab1ModalDivIntcolor" style="margin: 25px 0 0px -10px; height: 30px; width: 30px; border: 1px solid #DDD;">
                                                &nbsp;
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
					</fieldset>
		            <footer>
			            <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		            </footer>
                </form>
		    </div>
        </div>
	</div>
</div>
<div id="pTab1ModalSell" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Борлуулалт</span>&nbsp;<span id="pTab1ModalSellHeaderLabel" lang="mn"></span></h4>
		        </div>
		        <div class="modal-body no-padding">
                    <form id="pTab1ModalSellForm" action="" class="smart-form" novalidate="novalidate">
                        <div id="pTab1ModalSellID" class="hide"></div>
                        <fieldset style="padding-top:14px;">
                            <div class="row">
                                <div class="col col-6">
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Модел</label>
                                        <div id="pTab1ModalSellDivMark" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Загвар</label>
                                        <div id="pTab1ModalSellDivSpec" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Арал #</label>
                                        <div id="pTab1ModalSellDivVinno" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Үйл/он</label>
                                        <div id="pTab1ModalSellDivProducedyr" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Шатхууны төрөл</label>
                                        <div id="pTab1ModalSellDivFueltype" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Хурдны хайрцаг</label>
                                        <div id="pTab1ModalSellDivTransmissiontype" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                </div>
                                <div class="col col-6">
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Заалт</label>
                                        <div id="pTab1ModalSellDivZaalttype" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Буусан огноо</label>
                                        <div id="pTab1ModalSellDivGetdt" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Борлуулах үнэ</label>
                                        <div id="pTab1ModalSellDivPrice" class="col col-8" style="font-weight:bold;"></div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Гадар өнгө</label>
                                        <div id="pTab1ModalSellDivExtcolorname" class="col col-6" style="font-weight:bold;"></div>
                                        <div id="pTab1ModalSellDivExtcolor" class="col col-2" style="height: 32px; width: 30px; border: 1px solid #DDD;">
                                            &nbsp;
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col col-4" lang="mn">Дотор өнгө</label>
                                        <div id="pTab1ModalSellDivIntcolorname" class="col col-6" style="font-weight:bold;"></div>
                                        <div id="pTab1ModalSellDivIntcolor" class="col col-2" style="height: 32px; width: 30px; border: 1px solid #DDD;">
                                            &nbsp;
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset style="padding-top:14px;">
                            <section class="no-margin">
                                <div class="inline-group">
									<label class="radio state-disabled" style="margin-top:-8px;">
										<input id="pTab1ModalSellInputEvent1" name="pTab1ModalSellInputEvent" type="radio" value="1" disabled="disabled">
										<i></i><span lang="mn">Худалдан авалт</span></label>
									<label class="radio state-disabled" style="margin-top:-8px;">
										<input id="pTab1ModalSellInputEvent0" name="pTab1ModalSellInputEvent" type="radio" value="0" disabled="disabled">
										<i></i><span lang="mn">Баталгаат захиалга</span></label>
								</div>
                            </section>
                        </fieldset>
                        <fieldset style="padding-top:14px;">
                            <div class="row">
                                <input id="pTab1ModalSellCustomerId" name="pTab1ModalSellCustomerId" type="hidden" />
                                <input id="pTab1ModalSellSOLDCARCUSTOMER_SELLCARS_ID" name="pTab1ModalSellSOLDCARCUSTOMER_SELLCARS_ID" type="hidden" />
                                <section class="col col-3" style="padding-right: 0px;">
                                    <label class="label" lang="mn">*Эзэмшигчийн регистер</label>
                                    <label class="input">
										<input id="pTab1ModalSellInputRD" name="pTab1ModalSellInputRD" type="text" placeholder="Эзэмшигчийн регистер" lang="mn">
					                </label>
                                </section>
                                <section class="col col-5" style="padding-right: 0px;">
                                    <label class="label" lang="mn">*Эзэмшигчийн нэр</label>
                                    <label class="input">
										<input id="pTab1ModalSellInputOwnername" name="pTab1ModalSellInputOwnername" type="text" placeholder="Эзэмшигчийн нэ" lang="mn">
					                </label>
                                </section>
                                <section class="col col-2" style="padding-right: 0px;">
                                    <label class="label" lang="mn">*Утас 1</label>
                                    <label class="input">
										<input id="pTab1ModalSellInputTel" name="pTab1ModalSellInputTel" type="text" placeholder="Утас 1" lang="mn">
					                </label>
                                </section>
                                <section class="col col-2">
                                    <label class="label" lang="mn">Утас 2</label>
                                    <label class="input">
										<input id="pTab1ModalSellInputTel2" name="pTab1ModalSellInputTel2" type="text" placeholder="Утас 2" lang="mn">
					                </label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-6">
                                    <label class="label" lang="mn">Хаяг</label>
                                    <label class="textarea"> 										
										<textarea id="pTab1ModalSellInputAddress" name="pTab1ModalSellInputAddress" rows="1" placeholder="Хаяг" lang="mn"></textarea> 
									</label>
                                </section>
                                <section class="col col-3">
                                    <label class="label" lang="mn">И-мэйл</label>
                                    <label class="input">
										<input id="pTab1ModalSellInputEmail" name="pTab1ModalSellInputEmail" type="text" placeholder="И-мэйл" lang="mn">
					                </label>
                                </section>
                                <section class="col col-3">
                                    <label class="label" lang="mn">*Эзэмшигч</label>
									<div class="inline-group">
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalSellInputType1" name="pTab1ModalSellInputType" type="radio" value="1">
											<i></i><span lang="mn">Хувь хүн</span></label>
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalSellInputType0" name="pTab1ModalSellInputType" type="radio" value="0">
											<i></i><span lang="mn">Байгууллага</span></label>
									</div>
                                </section>
                            </div>
                        </fieldset>
                        <fieldset id="pTab1ModalSellFieldsetIsSubmit1" style="padding-top:14px;">
                            <div class="row">
                                <section class="col col-3">
                                    <label class="label" lang="mn">*Гэрээний дугаар</label>
                                    <label class="input">
										<input id="pTab1ModalSellInputAgreementno" name="pTab1ModalSellInputAgreementno" type="text" placeholder="Гэрээний дугаар" lang="mn">
					                </label>
                                </section>
                                <section class="col col-3">
                                    <label class="label" lang="mn">*Төлбөрийн хэлбэр</label>
                                    <label class="select">
					                    <select id="pTab1ModalSellSelectPaymenttype" name="pTab1ModalSellSelectPaymenttype" runat="server">
                                            <option value="">- Сонго -</option>
                                        </select><i></i>
                                    </label>
                                </section>                                
                                <section class="col col-3">
                                    <label class="label" lang="mn">*Гэрээ хийсэн огноо</label>
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
										<input id="pTab1ModalSellInputPaydt" name="pTab1ModalSellInputPaydt" type="text" placeholder="Гэрээ хийсэн огноо" lang="mn">
					                </label>
                                </section>
                                <section class="col col-3">
                                    <label class="label" lang="mn">*Дахин худалдан авалт эсэх</label>
									<div class="inline-group">
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalSellInputIsResold1" name="pTab1ModalSellInputIsResold" value="1" type="radio">
											<i></i><span lang="mn">Тийм</span></label>
										<label class="radio" style="margin-top:-8px;">
											<input id="pTab1ModalSellInputIsResold2" name="pTab1ModalSellInputIsResold" value="2" type="radio">
											<i></i><span lang="mn">Үгүй</span></label>
									</div>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-6">
                                    <div class="row">
                                        <section class="col col-4" style="font-size:13px; margin-bottom: 0;">
                                            *Хавсралт файл:
                                        </section>
                                        <section class="col col-8" style="font-style:italic;padding-left: 0; margin-bottom: 0;">
                                            <a id="pTab1ModalSellAttachBtn" class="btn btn-link btn-xs" href="javascript:void(0);" style="padding:0px; border:none;" download="">Файл хавсаргаагүй байна...</a>
                                        </section>
                                    </div>
                                    <div class="row">
                                        <section class="col col-4">
                                            <a id="pTab1ModalSellAttachDelete" class="btn btn-link btn-xs" href="javascript:void(0);"><i class="fa fa-trash-o"></i> файл устгах</a>
                                        </section>
                                        <section class="col col-8" style="padding-left: 0;">
                                            <label for="file" class="input input-file">
										        <div class="button">
                                                    <input id="pTab1ModalSellAttachInput" type="file" name="file" onchange="this.parentNode.nextSibling.value = this.value">Browse
										        </div>
                                                <input type="text" placeholder="PDF файл сонгоно уу" readonly="">
									        </label>
                                        </section>
                                    </div>
                                </section>
                                <section class="col col-2">
                                    <label class="label" lang="mn">Борлуулах үнэ</label>
                                    <span id="pTab1ModalSellSpanPrice" style="font-weight:bold; font-size:14px;">0</span>
                                </section>
                                <section class="col col-4">
                                    <label class="label" lang="mn">*Борлуулагч</label>
                                    <label class="select">
					                    <select id="pTab1ModalSellSelectSoldstaff" name="pTab1ModalSellSelectSoldstaff" runat="server">
                                            <option value="">- Сонго -</option>
                                        </select><i></i>
                                    </label>
                                </section>
                            </div>
					    </fieldset>
		                <footer>
			                <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			                <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		                </footer>
                    </form>
		        </div>
        </div>
	</div>
</div>
<div id="pTab3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h4 class="modal-title"><span lang="mn">Автомашин захиалга</span>&nbsp;<span id="pTab3ModalHeaderLabel" lang="mn"></span></h4>
		    </div>
		    <div class="modal-body no-padding">
                <form id="pTab3ModalForm" action="" class="smart-form" novalidate="novalidate">
                    <div id="pTab3ModalID" class="hide"></div>
                    <fieldset style="padding-top:0;">
                        <div class="row">
                            <section lang="mn" style="margin:15px; border: 1px solid grey; padding:5px; background-color:#D6D6D6;">
                                Захиалагчийн мэдээлэл
                            </section>
                        </div>
                        <div class="row">
                            <section class="col col-5">
                                <label class="label" lang="mn">*Эзэмшигчийн нэр</label>
                                <label class="input">
									<input id="pTab3ModalInputOwnername" name="pTab3ModalInputOwnername" type="text" placeholder="Эзэмшигчийн нэр" lang="mn">
					            </label>
                            </section>
                            <section class="col col-2">
                                <label class="label" lang="mn">*Утас 1</label>
                                <label class="input">
									<input id="pTab3ModalInputTel" name="pTab3ModalInputTel" type="text" placeholder="Утас 1" lang="mn">
					            </label>
                            </section>
                            <section class="col col-2">
                                <label class="label" lang="mn">Утас 2</label>
                                <label class="input">
									<input id="pTab3ModalInputTel2" name="pTab3ModalInputTel2" type="text" placeholder="Утас 2" lang="mn">
					            </label>
                            </section>
                            <section class="col col-3">
                                <label class="label" lang="mn">*Эзэмшигч</label>
								<div class="inline-group">
									<label class="radio" style="margin-top:-8px;">
										<input id="pTab3ModalInputType1" name="pTab3ModalInputType" value="1" type="radio">
										<i></i><span lang="mn">Хувь хүн</span></label>
									<label class="radio" style="margin-top:-8px;">
										<input id="pTab3ModalInputType0" name="pTab3ModalInputType" value="0" type="radio">
										<i></i><span lang="mn">Байгууллага</span></label>
								</div>
                            </section>
                        </div>
                        <div class="row">
                            <section class="col col-9">
                                <label class="label" lang="mn">Хаяг</label>
                                <label class="textarea"> 										
									<textarea id="pTab3ModalInputAddress" name="pTab3ModalInputAddress" rows="1" placeholder="Хаяг" maxlength="150" lang="mn"></textarea> 
								</label>
                            </section>
                            <section class="col col-3">
                                <label class="label" lang="mn">И-мэйл</label>
                                <label class="input">
									<input id="pTab3ModalInputEmail" name="pTab3ModalInputEmail" type="text" placeholder="И-мэйл" lang="mn">
					            </label>
                            </section>
                        </div>
                    </fieldset>
                    <fieldset style="padding-top:0;">
                        <div class="row">
                            <section lang="mn" style="margin:15px; border: 1px solid grey; padding:5px; background-color:#D6D6D6;">
                                Автомашиний мэдээлэл
                            </section>
                        </div>
                        <div class="row">
							<section class="col col-4">
                                <label class="label" lang="mn">*Загварын төрөл</label>
                                <label class="select">
					                <select id="pTab3ModalSelectSpectype" name="pTab3ModalSelectSpectype" runat="server">
                                        <option value="">- Сонго -</option>
                                    </select><i></i>
                                </label>							
                            </section>
                            <section class="col col-2">
                                <label class="label" lang="mn">*Үйлдвэрлэсэн он</label>
                                <label class="select">
					                <select id="pTab3ModalSelectProducedyear" name="pTab3ModalSelectProducedyear" runat="server">
                                        <option value="">- Сонго -</option>
                                    </select><i></i>
                                </label>
                            </section>
                            <section class="col col-2">
                                <label class="label" lang="mn">*Шатхууны төрөл</label>
								<div class="inline-group">
									<label class="radio" style="margin-top:-8px;">
										<input id="pTab3ModalInputFueltype1" name="pTab3ModalInputFueltype" value="1" type="radio">
										<i></i><span lang="mn">Бензин</span></label>
									<label class="radio" style="margin-top:-8px;">
										<input id="pTab3ModalInputFueltype0" name="pTab3ModalInputFueltype" value="0" type="radio">
										<i></i><span lang="mn">Дизель</span></label>
								</div>
                            </section>
                            <section class="col col-2">
                                <label class="label" lang="mn">*Хурдны хайрцаг</label>
								<div class="inline-group">
									<label class="radio" style="margin-top:-8px;">
										<input id="pTab3ModalInputTransmission1" name="pTab3ModalInputTransmission" value="1" type="radio">
										<i></i><span lang="mn">Автомат</span></label>
									<label class="radio" style="margin-top:-8px;">
										<input id="pTab3ModalInputTransmission0" name="pTab3ModalInputTransmission" value="0" type="radio">
										<i></i><span lang="mn">Механик</span></label>
								</div>
                            </section>
                            <section class="col col-2" style="width:90px!important;">
                                <label class="label" lang="mn">*Заалт</label>
								<div class="inline-group">
									<label class="radio" style="margin-top:-8px;">
										<input id="pTab3ModalInputZaaltType1" name="pTab3ModalInputZaaltType" value="1" type="radio">
										<i></i><span lang="mn">Мил</span></label>
									<label class="radio" style="margin-top:-8px;">
										<input id="pTab3ModalInputZaaltType2" name="pTab3ModalInputZaaltType" value="2" type="radio">
										<i></i><span lang="mn">Км</span></label>
								</div>
                            </section>
                        </div>
                        <div class="row">                                
                            <section class="col col-3">
                                <label class="label" lang="mn">*Буух огноо</label>
                                <label class="input">
                                    <i class="icon-append fa fa-calendar"></i>
									<input id="pTab3ModalInputGetdt" name="pTab3ModalInputGetdt" type="text" placeholder="Буух огноо" lang="mn">
					            </label>
                            </section>
                            <section class="col col-3">
                                <label class="label" lang="mn">*Борлуулах үнэ</label>
                                <label class="input">
									<input id="pTab3ModalInputPrice" name="pTab3ModalInputPrice" type="text" placeholder="Борлуулах үнэ" lang="mn" style="text-align:right;">
					            </label>
                            </section>
                            <section class="col col-3">
                                <div class="row">
                                    <section class="col col-10" style="padding-right: 0px;">
                                        <label class="label" lang="mn">*Гадар өнгө</label>
                                        <label class="select">
					                        <select id="pTab3ModalSelectExtcolor" name="pTab3ModalSelectExtcolor" runat="server">
                                                <option value="" lang="mn">- Сонго -</option>
                                            </select><i></i>
                                        </label>
                                    </section>
                                    <section class="col col-2">
                                        <div id="pTab3ModalDivExtcolor" style="margin: 22px 0 0px -10px; height: 32px; width: 30px; border: 1px solid #DDD;">
                                            &nbsp;
                                        </div>
                                    </section>
                                </div>
                            </section>
                            <section class="col col-3">
                                <div class="row">
                                    <section class="col col-10" style="padding-right: 0px;">
                                        <label class="label" lang="mn">*Дотор өнгө</label>
                                        <label class="select">
					                        <select id="pTab3ModalSelectIntcolor" name="pTab3ModalSelectIntcolor" runat="server">
                                                <option value="" lang="mn">- Сонго -</option>
                                            </select><i></i>
                                        </label>
                                    </section>
                                    <section class="col col-2">
                                        <div id="pTab3ModalDivIntcolor" style="margin: 22px 0 0px -10px; height: 32px; width: 30px; border: 1px solid #DDD;">
                                            &nbsp;
                                        </div>
                                    </section>
                                </div>
                            </section>
                        </div>
                        <div class="row"> 
                            <section class="col col-3">
                                <label class="label" lang="mn">*Төлөв</label>
                                <label class="select">
					                <select id="pTab3ModalSelectOrdertype" name="pTab3ModalSelectOrdertype" runat="server">
                                        <option value="" lang="mn">- Сонго -</option>
                                    </select><i></i>
                                </label>
                            </section>
                        </div>
                    </fieldset>
                    <footer>
                        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
                    </footer>
                </form>
		    </div>
        </div>
	</div>
</div>
<div id="pTab4AttachShowModal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display:none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
           
        </div>
    </div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        var valData = '';
        var valoptgroup = '';
        $('#pTab1SelectExtcolor').html($('#pTab1SelectExtcolor').html().replace('<option value="">- Бүгд -</option>', '<option value="" lang="mn">- Бүгд -</option>'));
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealerTab1SpectypeListForDDL",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valoptgroup = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (valoptgroup != value.MARK_ID) {
                        if (valoptgroup != '') valData += '</optgroup>';
                        valData += '<optgroup label="' + replaceDatabaseToDisplay(value.MARK_NAME) + '">';
                    }
                    valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                    valoptgroup = value.MARK_ID;
                });
                $("#pTab1SelectSpectype, #pTab2SelectSpectype, #pTab3SelectSpectype, #pTab4SelectSpectype").html('<option value="" lang="mn">- Бүгд -</option>' + valData);
                $("#pTab3ModalSelectSpectype").html('<option value="" lang="mn">- Сонго -</option>' + valData);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/DealerTab1UsedMarkListForDDL",
                    data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
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
                            valData += "<option value=\"" + value.MARK_ID + "\">" + replaceDatabaseToDisplay(value.MARK_NAME) + "</option>";
                            valoptgroup = value.AUTOMARK_TYPE_ID;
                        });
                        $("#pTab1SelectMark, #pTab2SelectMark").html('<option value="" lang="mn">- Бүгд -</option>' + valData);
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/DealerTab1ColorListForDDL",
                            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "type":"1"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                valData = '';
                                $($.parseJSON(data.d)).each(function (index, value) {
                                    valData += "<option value=\"" + value.ID + "\" data-htmlcode=\""+value.HTMLCODE+"\">"+replaceDatabaseToDisplay(value.CODE)+". " + replaceDatabaseToDisplay(value.NAME) + "</option>";
                                });
                                $("#pTab1SelectExtcolor, #pTab2SelectExtcolor, #pTab3SelectExtcolor").html('<option value="" lang="mn">- Бүгд -</option>' + valData);
                                $("#pTab1ModalSelectExtcolor, #pTab3ModalSelectExtcolor").html('<option value="" lang="mn">- Сонго -</option>' + valData);
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../wcf/ServiceMain.svc/DealerTab1ColorListForDDL",
                                    data: '{"clinicid":"' + $('#indexClinicId').text() + '", "type":"2"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        valData = '';
                                        $($.parseJSON(data.d)).each(function (index, value) {
                                            valData += "<option value=\"" + value.ID + "\" data-htmlcode=\"" + value.HTMLCODE + "\">" + replaceDatabaseToDisplay(value.CODE) + ". " + replaceDatabaseToDisplay(value.NAME) + "</option>";
                                        });
                                        $("#pTab1SelectIntcolor, #pTab2SelectIntcolor, #pTab3SelectIntcolor").html('<option value="" lang="mn">- Бүгд -</option>' + valData);
                                        $("#pTab1ModalSelectIntcolor, #pTab3ModalSelectIntcolor").html('<option value="" lang="mn">- Сонго -</option>' + valData);
                                        globalAjaxVar = $.ajax({
                                            type: "POST",
                                            url: "../wcf/ServiceMain.svc/DealerTab2OrderTypeListForDDL",
                                            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (data) {
                                                valData = '';
                                                $($.parseJSON(data.d)).each(function (index, value) {
                                                    valData += "<option value=\"" + value.ID + "\" data-bgcolor=\"" + value.BGCOLOR + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                                                });
                                                $("#pTab3SelectOrdertype").html('<option value="" lang="mn">- Бүгд -</option>' + valData);
                                                dataBindTab1Table();
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
            $('#pTab3AddBtn').addClass('hide');
            $('#pTab1AddBtn').removeClass('hide');
            if ($.trim($('#pTab1DatatableDiv').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            $('#pTab3AddBtn').addClass('hide');
            $('#pTab1AddBtn').removeClass('hide');
            if ($.trim($('#pTab2DatatableDiv').html()) == "") {
                dataBindTab2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            $('#pTab1AddBtn').addClass('hide');
            $('#pTab3AddBtn').removeClass('hide');
            if ($.trim($('#pTab3DatatableDiv').html()) == "") {
                dataBindTab3Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab4Li') {
            $('#pTab1AddBtn').addClass('hide');
            $('#pTab3AddBtn').addClass('hide');
            if ($.trim($('#pTab4DatatableDiv').html()) == "") {
                dataBindTab4Table();
            }
        }
    }

    //tab1
    function dataBindTab1Table() {
        var valData = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealerTab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "extcolor":"' + $('#pTab1SelectExtcolor option:selected').val() + '", "intcolor":"' + $('#pTab1SelectIntcolor option:selected').val() + '", "spectype":"' + $('#pTab1SelectSpectype option:selected').val() + '", "mark":"' + $('#pTab1SelectMark option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th rowspan=\"2\" lang=\"mn\">#</th>";
                valData += "<th rowspan=\"2\" data-class=\"expand\" lang=\"mn\">Аралын дугаар</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Модел</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Ү/он</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Загвар</th>";
                valData += "<th colspan=\"2\" lang=\"mn\">Өнгө</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Шатхууны төрөл</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Хурдны хайрцаг</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Заалт</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">БУУСАН ОГНОО</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Үнэ</th>";
                valData += "<th rowspan=\"2\">&nbsp;</th>";
                valData += "<th rowspan=\"2\">Борлуулах</th>";
                valData += "</tr>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">Гадар</th>";
                valData += "<th lang=\"mn\">Дотор</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\" class=\"" + value.ISSELLCARS + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.VINNO) + "</td>";
                    valData += "<td data-markid=\"" + value.MARK_ID + "\" data-marktypeid=\"" + value.AUTOMARK_TYPE_ID + "\">" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td>" + value.PRODUCEDYEAR + "</td>";
                    valData += "<td data-id=\"" + value.SPECTYPE_ID + "\">" + replaceDatabaseToDisplay(value.SPECTYPE_NAME) + "</td>";
                    valData += "<td data-id=\"" + value.EXTCOLOR_ID + "\" data-htmlcode=\"" + value.EXTCOLORHTMLCODE + "\" data-code=\"" + value.EXTCOLORCODE + "\" data-name=\"" + value.EXTCOLORNAME + "\" style=\"background-color:#" + value.EXTCOLORHTMLCODE + ";\"></td>";
                    valData += "<td data-id=\"" + value.INTCOLOR_ID + "\" data-htmlcode=\"" + value.INTCOLORHTMLCODE + "\" data-code=\"" + value.INTCOLORCODE + "\" data-name=\"" + value.INTCOLORNAME + "\" style=\"background-color:#" + value.INTCOLORHTMLCODE + ";\"></td>";
                    valData += "<td data-id=\"" + value.FUELTYPE_ID + "\">" + replaceDatabaseToDisplay(value.FUELTYPE_NAME) + "</td>";
                    valData += "<td data-id=\"" + value.TRANSMISSIONTYPE_ID + "\">" + replaceDatabaseToDisplay(value.TRANSMISSIONTYPE_NAME) + "</td>";
                    valData += "<td data-id=\"" + value.ZAALTTYPE_ID + "\">" + replaceDatabaseToDisplay(value.ZAALTTYPE_NAME) + "</td>";
                    valData += "<td>" + value.GETDT + "</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab1Modal\" onclick=\"showAddEditTab1(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    //valData += "<td><button class=\"btn btn-xs btn-warning\" data-toggle=\"modal\" data-target=\"#pTab1ModalSell\" onclick=\"showAddEditTab1Sell(this,'нэмэх')\">Борлуулах</button></td>";
                    if (value.ISSELLCARS == 'success') valData += "<td style=\"padding: 3px;\"><button class=\"btn btn-xs btn-warning\" data-toggle=\"modal\" data-target=\"#pTab1ModalSell\" onclick=\"showAddEditTab1Sell(this,'нэмэх',1)\" style=\"line-height: 14px;\">Захиалгыг<br>борлуулах</button></td>";
                    else valData += "<td><button class=\"btn btn-xs btn-warning\" data-toggle=\"modal\" data-target=\"#pTab1ModalSell\" onclick=\"showAddEditTab1Sell(this,'нэмэх',1)\">Борлуулах</button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab1Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null, { \"sWidth\": \"35px\", \"sClass\": \"text-center\", \"bSortable\": false }, null, { \"sWidth\": \"38px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"38px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"65px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"52px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"38px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"75px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"75px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"75px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
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
    $("#pTab1SelectExtcolor, #pTab1SelectIntcolor, #pTab1SelectSpectype, #pTab1SelectMark").change(function () {
        dataBindTab1Table();
    });
    $("#pTab1ModalSelectMarktype").change(function () {
        var valdata = '';
        var valoptgroup = '';
        if ($('#pTab1ModalSelectMarktype option:selected').val() == '') {
            $('#pTab1ModalSelectMark, #pTab1ModalSelectSpectype').html('<option value="" lang="mn">- Сонго -</option>');
            $('#pTab1ModalSelectMark, #pTab1ModalSelectSpectype').prop('disabled', true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/DealerTab1MarkListForDDL",
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
                    $('#pTab1ModalSelectSpectype').html('<option value="" lang="mn">- Сонго -</option>');
                    $('#pTab1ModalSelectSpectype').prop('disabled', true);
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
    $("#pTab1ModalSelectMark").change(function () {
        var valdata = '';
        if ($('#pTab1ModalSelectMark option:selected').val() == '') {
            $('#pTab1ModalSelectSpectype').html('<option value="" lang="mn">- Сонго -</option>');
            $('#pTab1ModalSelectSpectype').prop('disabled', true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/DealerTab1SpectypeListForDDL2",
                data: '{"clinicid":"' + $('#indexClinicId').text() + '", "mark":"' + $("#pTab1ModalSelectMark option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                    });
                    $("#pTab1ModalSelectSpectype").html('<option value="" lang="mn">- Сонго -</option>' + valData);
                    $("#pTab1ModalSelectSpectype").prop('disabled', false);
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
    $("#pTab1ModalSelectExtcolor").change(function () {
        var valdata = '';
        if ($('#pTab1ModalSelectExtcolor option:selected').val() == '') {
            $('#pTab1ModalDivExtcolor').css('background-color', 'none');
        }
        else {
            $('#pTab1ModalDivExtcolor').css('background-color', '#'+$('#pTab1ModalSelectExtcolor option:selected').attr('data-htmlcode'));
        }
    });
    $("#pTab1ModalSelectIntcolor").change(function () {
        var valdata = '';
        if ($('#pTab1ModalSelectIntcolor option:selected').val() == '') {
            $('#pTab1ModalDivIntcolor').css('background-color', 'none');
        }
        else {
            $('#pTab1ModalDivIntcolor').css('background-color', '#' + $('#pTab1ModalSelectIntcolor option:selected').attr('data-htmlcode'));
        }
    });
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        $('#pTab1ModalID').html('');
        $('#pTab1ModalDivExtcolor, #pTab1ModalDivIntcolor').css('background-color', 'none');
        $('#pTab1ModalSelectMarktype, #pTab1ModalSelectProducedyear, #pTab1ModalInputVinno, #pTab1ModalSelectExtcolor, #pTab1ModalSelectIntcolor, #pTab1ModalInputGetdt, #pTab1ModalInputPrice').val('');
        $('input[name="pTab1ModalInputFueltype"], input[name="pTab1ModalInputTransmission"], input[name="pTab1ModalInputZaaltType"]').prop('checked', false);
        
        $('#pTab1ModalSelectMark, #pTab1ModalSelectSpectype').html('<option value="" lang="mn">- Сонго -</option>');
        $('#pTab1ModalSelectMark, #pTab1ModalSelectSpectype').prop('disabled', true);
        $('#pTab1ModalForm').find('.modal-footer').find(':submit').prop('disabled', false);
        if (isinsupt == 'засах') {
            $('#pTab1ModalID').html($(el).closest('tr').attr('data-id'));
            $('#pTab1ModalSelectMarktype').val($(el).closest('tr').find('td:eq(2)').attr('data-marktypeid'));
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
                    $('#pTab1ModalSelectMark').val($(el).closest('tr').find('td:eq(2)').attr('data-markid'));
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../wcf/ServiceMain.svc/DealerTab1SpectypeListForDDL2",
                        data: '{"clinicid":"' + $('#indexClinicId').text() + '", "mark":"' + $("#pTab1ModalSelectMark option:selected").val() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            valData = '';
                            $($.parseJSON(data.d)).each(function (index, value) {
                                valData += "<option value=\"" + value.ID + "\">" + replaceDatabaseToDisplay(value.NAME) + "</option>";
                            });
                            $("#pTab1ModalSelectSpectype").html('<option value="" lang="mn">- Сонго -</option>' + valData);
                            $("#pTab1ModalSelectSpectype").prop('disabled', false);
                            $('#pTab1ModalSelectSpectype').val($(el).closest('tr').find('td:eq(4)').attr('data-id'));
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
            $('#pTab1ModalInputVinno').val($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab1ModalSelectProducedyear').val($(el).closest('tr').find('td:eq(3)').html());
            $('#pTab1ModalInputFueltype' + $(el).closest('tr').find('td:eq(7)').attr('data-id')).prop('checked', true);
            $('#pTab1ModalInputTransmission' + $(el).closest('tr').find('td:eq(8)').attr('data-id')).prop('checked', true);
            $('#pTab1ModalInputZaaltType' + $(el).closest('tr').find('td:eq(9)').attr('data-id')).prop('checked', true);
            $('#pTab1ModalInputGetdt').val($(el).closest('tr').find('td:eq(10)').html());
            $('#pTab1ModalInputPrice').val($(el).closest('tr').find('td:eq(11)').html().replace(/₮/g, '').replace(/,/g, ''));
            $('#pTab1ModalSelectExtcolor').val($(el).closest('tr').find('td:eq(5)').attr('data-id'));
            $('#pTab1ModalDivExtcolor').css('background-color', '#' + $(el).closest('tr').find('td:eq(5)').attr('data-htmlcode'));
            $('#pTab1ModalSelectIntcolor').val($(el).closest('tr').find('td:eq(6)').attr('data-id'));
            $('#pTab1ModalDivIntcolor').css('background-color', '#' + $(el).closest('tr').find('td:eq(6)').attr('data-htmlcode'));
        }
    }
    function showDeleteTab1(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_SOLDCARCUSTOMER_SELLCARS WHERE SELLCARS_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d != '0') alert('Сонгосон автомашинд хамааралтай худалдан авалт бүртгэгдсэн тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон автомашиныг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_SELLCARS WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1Table();
                                    smallBox('Автомашин', 'Амжилттай устлаа', '#659265');
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
    $("#pTab1ModalForm").validate({
        rules: {
            pTab1ModalSelectMarktype: {
                required: true
            },
            pTab1ModalSelectMark: {
                required: true
            },
            pTab1ModalSelectSpectype: {
                required: true
            },
            pTab1ModalInputVinno: {
                required: true,
                minlength: 4,
                maxlength: 17
            },
            pTab1ModalSelectProducedyear: {
                required: true
            },
            pTab1ModalInputFueltype: {
                required: true
            },
            pTab1ModalInputTransmission: {
                required: true
            },
            pTab1ModalInputZaaltType: {
                required: true
            },
            pTab1ModalInputGetdt: {
                required: true,
                date: true
            },
            pTab1ModalInputPrice: {
                required: true,
                maxlength: 17,
                digits: true
            },
            pTab1ModalSelectExtcolor: {
                required: true
            },
            pTab1ModalSelectIntcolor: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            pTab1ModalSelectMarktype: {
                required: 'Сонгоно уу'
            },
            pTab1ModalSelectMark: {
                required: 'Сонгоно уу'
            },
            pTab1ModalSelectSpectype: {
                required: 'Сонгоно уу'
            },
            pTab1ModalInputVinno: {
                required: 'Оруулна уу',
                minlength: 'Багадаа 4 тэмдэгт оруулна уу',
                maxlength: 'Багадаа 17 тэмдэгт оруулна уу'
            },
            pTab1ModalSelectProducedyear: {
                required: 'Сонгоно уу'
            },
            pTab1ModalInputFueltype: {
                required: 'Сонгоно уу'
            },
            pTab1ModalInputTransmission: {
                required: 'Сонгоно уу'
            },
            pTab1ModalInputZaaltType: {
                required: 'Сонгоно уу'
            },
            pTab1ModalInputGetdt: {
                required: 'Оруулна уу',
                date: 'Зөв оруулна уу /Жил-Сар-Өдөр/'
            },
            pTab1ModalInputPrice: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 11 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            pTab1ModalSelectExtcolor: {
                required: 'Сонгоно уу'
            },
            pTab1ModalSelectIntcolor: {
                required: 'Сонгоно уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_SELLCARS (CLINIC_ID, MARK_ID, PRODUCEDYEAR, VINNO, FUELTYPE_ID, TRANSMISSIONTYPE_ID, ZAALTTYPE_ID, SPECTYPE_ID, EXTCOLOR_ID, INTCOLOR_ID, GETDT, PRICE, CREATED_STAFFID, CREATED_DATE) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('numeric', $('#pTab1ModalSelectMark option:selected').val()) + ', ' + strQryIsNull('numeric', $('#pTab1ModalSelectProducedyear option:selected').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputVinno').val()))) + ', ' + strQryIsNull('numeric', $('input[name=pTab1ModalInputFueltype]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=pTab1ModalInputTransmission]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=pTab1ModalInputZaaltType]:checked').val()) + ', ' + strQryIsNull('numeric', $('#pTab1ModalSelectSpectype option:selected').val()) + ', ' + strQryIsNull('numeric', $('#pTab1ModalSelectExtcolor option:selected').val()) + ', ' + strQryIsNull('numeric', $('#pTab1ModalSelectIntcolor option:selected').val()) + ', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputGetdt').val()))) + ', ' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#pTab1ModalInputPrice').val()))) + ', ' + $('#indexStaffId').html() + ', GETDATE())"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        var valDate= new Date(parseInt($.trim($('#pTab1ModalInputGetdt').val()).split('-')[0]), (parseInt($.trim($('#pTab1ModalInputGetdt').val()).split('-')[1])-1), parseInt($.trim($('#pTab1ModalInputGetdt').val()).split('-')[2]), 0,0,0,0);
                        if ($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')) == 'pTab1Li') {
                            if (valDate <= Date.now()) dataBindTab1Table();
                            else if (valDate > Date.now()) $('#pTab2DatatableDiv').html('');
                        }
                        else if ($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')) == 'pTab2Li') {
                            if (valDate <= Date.now()) $('#pTab1DatatableDiv').html('');
                            else if (valDate > Date.now()) dataBindTab2Table();
                        }
                        else if ($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')) == 'pTab3Li') {
                            //dataBindTab3Table();
                        }
                        else if ($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')) == 'pTab4Li') {
                            //dataBindTab4Table();
                        }
                        $('#pTab1Modal').modal('hide');
                        smallBox('Борлуулах автомашины мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_SELLCARS SET MARK_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectMark option:selected').val()) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#pTab1ModalSelectProducedyear option:selected').val()) + ', VINNO=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputVinno').val()))) + ', FUELTYPE_ID=' + strQryIsNull('numeric', $('input[name=pTab1ModalInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE_ID=' + strQryIsNull('numeric', $('input[name=pTab1ModalInputTransmission]:checked').val()) + ', ZAALTTYPE_ID=' + strQryIsNull('numeric', $('input[name=pTab1ModalInputZaaltType]:checked').val()) + ', SPECTYPE_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectSpectype option:selected').val()) + ', EXTCOLOR_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectExtcolor option:selected').val()) + ', INTCOLOR_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectIntcolor option:selected').val()) + ', GETDT=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputGetdt').val()))) + ', PRICE=' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#pTab1ModalInputPrice').val()))) + ', UPDATED_STAFFID=' + $('#indexStaffId').html() + ', UPDATED_DATE=GETDATE() WHERE ID=' + $('#pTab1ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        //alert($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')));
                        if ($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')) == 'pTab1Li') {
                            dataBindTab1Table();
                        }
                        else if ($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')) == 'pTab2Li') {
                            dataBindTab2Table();
                        }
                        else if ($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')) == 'pTab3Li') {
                            //dataBindTab3Table();
                        }
                        else if ($.trim($('#pTab1Li').closest('ul').find('.active').attr('id')) == 'pTab4Li') {
                            //dataBindTab4Table();
                        }
                        $('#pTab1Modal').modal('hide');
                        smallBox('Борлуулах автомашины мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
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
    //tab1sell
    function showAddEditTab1Sell(el, isinsupt, issubmit) {
        $('#pTab1ModalSellHeaderLabel').text(isinsupt);

        $('#pTab1ModalSellID, #pTab1ModalSellDivMark, #pTab1ModalSellDivSpec, #pTab1ModalSellDivVinno, #pTab1ModalSellDivProducedyr, #pTab1ModalSellDivFueltype, #pTab1ModalSellDivTransmissiontype, #pTab1ModalSellDivZaalttype, #pTab1ModalSellDivGetdt, #pTab1ModalSellDivPrice, #pTab1ModalSellDivExtcolorname, #pTab1ModalSellDivExtcolor, #pTab1ModalSellDivIntcolorname, #pTab1ModalSellDivIntcolor').html('');

        $('#pTab1ModalSellCustomerId, #pTab1ModalSellSOLDCARCUSTOMER_SELLCARS_ID, #pTab1ModalSellInputRD, #pTab1ModalSellInputOwnername, #pTab1ModalSellInputTel, #pTab1ModalSellInputTel2, #pTab1ModalSellInputAddress, #pTab1ModalSellInputEmail, #pTab1ModalSellInputAgreementno, #pTab1ModalSellSelectPaymenttype, #pTab1ModalSellInputPaydt, #pTab1ModalSellSelectSoldstaff').val('');
        $('input[name="pTab1ModalSellInputType"], input[name="pTab1ModalSellInputIsResold"], input[name="pTab1ModalSellInputEvent"]').prop('checked', false);
        $('#pTab1ModalSellAttachBtn').html('Файл хавсаргаагүй байна...');
        $('#pTab1ModalSellAttachBtn').attr('href', 'javascript:void(0);');
        $('#pTab1ModalSellAttachInput').val('');

        $('#pTab1ModalSellInputEvent' + issubmit).prop('checked', true);

        $('#pTab1ModalSellFieldsetIsSubmit1').addClass('hide');
        if (issubmit == '1') $('#pTab1ModalSellFieldsetIsSubmit1').removeClass('hide');

        $("#pTab1ModalSellForm").validate().resetForm();
        if (isinsupt == 'нэмэх') {
            $('#pTab1ModalSellID').html($(el).closest('tr').attr('data-id'));
            $('#pTab1ModalSellDivMark').html($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1ModalSellDivSpec').html($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1ModalSellDivVinno').html($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab1ModalSellDivProducedyr').html($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1ModalSellDivFueltype').html($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1ModalSellDivTransmissiontype').html($(el).closest('tr').find('td:eq(8)').text());
            $('#pTab1ModalSellDivZaalttype').html($(el).closest('tr').find('td:eq(9)').text());
            $('#pTab1ModalSellDivGetdt').html($(el).closest('tr').find('td:eq(10)').text());
            $('#pTab1ModalSellDivPrice').html($(el).closest('tr').find('td:eq(11)').text());
            $('#pTab1ModalSellDivExtcolorname').html($(el).closest('tr').find('td:eq(5)').attr('data-name'));
            $('#pTab1ModalSellDivExtcolor').css('background-color', '#' + $(el).closest('tr').find('td:eq(5)').attr('data-htmlcode'));
            $('#pTab1ModalSellDivIntcolorname').html($(el).closest('tr').find('td:eq(6)').attr('data-name'));
            $('#pTab1ModalSellDivIntcolor').css('background-color', '#' + $(el).closest('tr').find('td:eq(6)').attr('data-htmlcode'));
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteDataSet",
                data: '{"qry":"SELECT a.ID, a.SOLDCARCUSTOMER_ID, b.RD, b.NAME, b.TEL, b.TEL2, b.ADDRESS, b.EMAIL, b.CUSTOMERTYPE_ID FROM TBL_SOLDCARCUSTOMER_SELLCARS a INNER JOIN TBL_SOLDCARCUSTOMER b ON a.SOLDCARCUSTOMER_ID=b.ID WHERE a.ISSUBMIT=0 AND a.SELLCARS_ID = ' + $(el).closest('tr').attr('data-id') + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $($.parseJSON(data.d)).each(function (index, value) {
                        $('#pTab1ModalSellCustomerId').val(value.SOLDCARCUSTOMER_ID);
                        $('#pTab1ModalSellSOLDCARCUSTOMER_SELLCARS_ID').val(value.ID);
                        $('#pTab1ModalSellInputRD').val(replaceDatabaseToDisplay(value.RD));
                        $('#pTab1ModalSellInputOwnername').val(replaceDatabaseToDisplay(value.NAME));
                        $('#pTab1ModalSellInputTel').val(replaceDatabaseToDisplay(value.TEL));
                        $('#pTab1ModalSellInputTel2').val(replaceDatabaseToDisplay(value.TEL2));
                        $('#pTab1ModalSellInputAddress').val(replaceDatabaseToDisplay(value.ADDRESS));
                        $('#pTab1ModalSellInputEmail').val(replaceDatabaseToDisplay(value.EMAIL));
                        $('#pTab1ModalSellInputType' + value.CUSTOMERTYPE_ID).prop('checked', true);
                    });
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
            $('#pTab1ModalSellSpanPrice').html($(el).closest('tr').find('td:eq(11)').html());
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteDataSet",
                data: '{"qry":"SELECT a.ID, a.SELLCARS_ID, g.NAME+\' - \'+f.NAME as AUTOMARK, d.NAME as SPECTYPE_NAME, c.VINNO, c.PRODUCEDYEAR, i.NAME as FUELTYPE_NAME, j.NAME as TRANSMISSIONTYPE_NAME, k.NAME as ZAALTTYPE_NAME, c.GETDT, c.PRICE, l.CODE as EXTCOLOR_CODE, l.NAME as EXTCOLOR_NAME, l.HTMLCODE as EXTCOLOR_HTMLCODE, m.CODE as INTCOLOR_CODE, m.NAME as INTCOLOR_NAME, m.HTMLCODE as INTCOLOR_HTMLCODE, b.RD as CUSTOMERRD, b.NAME as CUSTOMERNAME, b.TEL as CUSTOMERTEL, b.TEL2 as CUSTOMERTEL2, b.ADDRESS as CUSTOMERADDRESS, b.EMAIL as CUSTOMEREMAIL, b.CUSTOMERTYPE_ID, n.NAME as CUSTOMERTYPENAME, a.AGGREEMENTNO, a.SELLCARSPAYMENTTYPE_ID, a.PAYDT, a.ISRESOLD, ISNULL(a.AGREEMENTATTACH, N\'Файл хавсаргаагүй байна...\') as AGREEMENTATTACH, a.SOLDCARCUSTOMER_ID, a.SOLDCAR_STAFFID, a.SOLDCARPRICE FROM TBL_SOLDCARCUSTOMER_SELLCARS a INNER JOIN TBL_SOLDCARCUSTOMER b ON a.SOLDCARCUSTOMER_ID=b.ID INNER JOIN TBL_SELLCARS c ON a.SELLCARS_ID=c.ID INNER JOIN TBL_SPECTYPE d ON c.SPECTYPE_ID=d.ID INNER JOIN TBL_AUTOMARK f ON d.MARK_ID=f.ID INNER JOIN TBL_AUTOMARK_TYPE g ON f.AUTOMARK_TYPE_ID=g.ID INNER JOIN TBL_SELLCARSPAYMENTTYPE h ON a.SELLCARSPAYMENTTYPE_ID=h.ID INNER JOIN TBL_FUELTYPE i ON c.FUELTYPE_ID=i.ID INNER JOIN TBL_TRANSMISSIONTYPE j ON c.TRANSMISSIONTYPE_ID=j.ID INNER JOIN TBL_ZAALTTYPE k ON c.ZAALTTYPE_ID=k.ID INNER JOIN TBL_CARCOLOR l ON c.EXTCOLOR_ID=l.ID INNER JOIN TBL_CARCOLOR m ON c.INTCOLOR_ID=m.ID INNER JOIN TBL_CUSTOMERTYPE n ON b.CUSTOMERTYPE_ID=n.ID WHERE a.ID=' + $(el).closest('tr').attr('data-id') + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $($.parseJSON(data.d)).each(function (index, value) {
                        $('#pTab1ModalSellID').html(value.SELLCARS_ID);
                        $('#pTab1ModalSellDivMark').html(replaceDatabaseToDisplay(value.AUTOMARK));
                        $('#pTab1ModalSellDivSpec').html(replaceDatabaseToDisplay(value.SPECTYPE_NAME));
                        $('#pTab1ModalSellDivVinno').html(replaceDatabaseToDisplay(value.VINNO));
                        $('#pTab1ModalSellDivProducedyr').html(replaceDatabaseToDisplay(value.PRODUCEDYEAR));
                        $('#pTab1ModalSellDivFueltype').html(replaceDatabaseToDisplay(value.FUELTYPE_NAME));
                        $('#pTab1ModalSellDivTransmissiontype').html(replaceDatabaseToDisplay(value.FUELTYPE_NAME));
                        $('#pTab1ModalSellDivZaalttype').html(replaceDatabaseToDisplay(value.FUELTYPE_NAME));
                        $('#pTab1ModalSellDivGetdt').html(value.GETDT);
                        $('#pTab1ModalSellDivPrice').html("₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                        $('#pTab1ModalSellDivExtcolorname').html(replaceDatabaseToDisplay(value.EXTCOLOR_NAME));
                        $('#pTab1ModalSellDivExtcolor').css('background-color', '#' + value.EXTCOLOR_HTMLCODE);
                        $('#pTab1ModalSellDivIntcolorname').html(replaceDatabaseToDisplay(value.INTCOLOR_NAME));
                        $('#pTab1ModalSellDivIntcolor').css('background-color', '#' + value.INTCOLOR_HTMLCODE);
                        $('#pTab1ModalSellCustomerId').val(value.SOLDCARCUSTOMER_ID);
                        $('#pTab1ModalSellSOLDCARCUSTOMER_SELLCARS_ID').val(value.ID);
                        $('#pTab1ModalSellInputRD').val(replaceDatabaseToDisplay(value.CUSTOMERRD));
                        $('#pTab1ModalSellInputOwnername').val(replaceDatabaseToDisplay(value.CUSTOMERNAME));
                        $('#pTab1ModalSellInputTel').val(replaceDatabaseToDisplay(value.CUSTOMERTEL));
                        $('#pTab1ModalSellInputTel2').val(replaceDatabaseToDisplay(value.CUSTOMERTEL2));
                        $('#pTab1ModalSellInputAddress').val(replaceDatabaseToDisplay(value.CUSTOMERADDRESS));
                        $('#pTab1ModalSellInputEmail').val(replaceDatabaseToDisplay(value.CUSTOMEREMAIL));
                        $('#pTab1ModalSellInputType' + value.CUSTOMERTYPE_ID).prop('checked', true);
                        $('#pTab1ModalSellInputAgreementno').val(replaceDatabaseToDisplay(value.AGGREEMENTNO));
                        $('#pTab1ModalSellSelectPaymenttype').val(value.SELLCARSPAYMENTTYPE_ID);
                        $('#pTab1ModalSellInputPaydt').val(value.PAYDT);
                        $('#pTab1ModalSellInputIsResold' + value.ISRESOLD).prop('checked', true);
                        $('#pTab1ModalSellAttachBtn').html(value.AGREEMENTATTACH);
                        $('#pTab1ModalSellAttachBtn').attr('href', '../files/agreement/' + value.AGREEMENTATTACH);
                        $('#pTab1ModalSellSpanPrice').html($(el).closest('tr').find('td:eq(11)').html());
                        $('#pTab1ModalSellSelectSoldstaff').val(value.SOLDCAR_STAFFID);
                        $('#pTab1ModalSellSpanPrice').html("₮" + value.SOLDCARPRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
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
    }
    $("#pTab1ModalSellInputRD").change(function () {
        var valData = '';
        if ($.trim($("#pTab1ModalSellInputRD").val()) != '') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT COUNT(1) FROM TBL_SOLDCARCUSTOMER WHERE RD = N\'' + $.trim($("#pTab1ModalSellInputRD").val()) + '\'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d != '0') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteDataSet",
                            data: '{"qry":"SELECT ID, RD, NAME, CUSTOMERTYPE_ID, TEL, TEL2, EMAIL, [ADDRESS] FROM TBL_SOLDCARCUSTOMER WHERE RD=N\'' + $.trim($("#pTab1ModalSellInputRD").val()) + '\'"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                $($.parseJSON(data.d)).each(function (index, value) {
                                    $('#pTab1ModalSellCustomerId').val(value.ID);
                                    $('#pTab1ModalSellInputOwnername').val(replaceDatabaseToDisplay(value.NAME));
                                    $('#pTab1ModalSellInputTel').val(replaceDatabaseToDisplay(value.TEL));
                                    $('#pTab1ModalSellInputTel2').val(replaceDatabaseToDisplay(value.TEL2));
                                    $('#pTab1ModalSellInputAddress').val(replaceDatabaseToDisplay(value.ADDRESS));
                                    $('#pTab1ModalSellInputEmail').val(replaceDatabaseToDisplay(value.EMAIL));
                                    $('input[name="pTab1ModalSellInputType"]').prop('checked', false);
                                    $('#pTab1ModalSellInputType' + value.CUSTOMERTYPE_ID).prop('checked', true);
                                });
                                alert('Бүртгэлтэй хэрэглэгч...');
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
                        $('#pTab1ModalSellCustomerId').val('');
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
            if ($.trim($('#pTab1ModalSellCustomerId').val())!='') {
                $('#pTab1ModalSellCustomerId').val('');
                $('#pTab1ModalSellInputOwnername').val('');
                $('#pTab1ModalSellInputTel').val('');
                $('#pTab1ModalSellInputTel2').val('');
                $('#pTab1ModalSellInputAddress').val('');
                $('#pTab1ModalSellInputEmail').val('');
                $('input[name="pTab1ModalSellInputType"]').prop('checked', false);
            }
        }
    });
    $("#pTab1ModalSellAttachInput").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 104857600) {
            errMsg += 'Файлын хэмжээ 100MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'pdf') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /pdf/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            $('#pTab1ModalSellAttachBtn').html($(this).val().split('\\').pop());
        }
        else alert(errMsg);
    });
    $("#pTab1ModalSellAttachDelete").click(function () {
        if ($('#pTab1ModalSellAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
            $.SmartMessageBox({
                title: "Анхааруулга!",
                content: "Та устгахдаа итгэлтэй байна уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../ws/ServiceMain.svc/DeleteFile",
                        data: '{"filename":"~/files/agreement/' + $('#pTab1ModalSellAttachBtn').html() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            $('#pTab1ModalSellAttachBtn').html('Файл хавсаргаагүй байна...');
                            $('#pTab1ModalSellAttachInput').val('');
                            smallBox('Хавсаргасан файл', 'Амжилттай устгагдлаа', '#659265', 3000);
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
    });
    $("#pTab1ModalSellForm").validate({
        rules: {
            pTab1ModalSellInputRD: {
                required: true,
                minlength: 5,
                maxlength: 10
            },
            pTab1ModalSellInputOwnername: {
                required: true,
                maxlength: 100,
            },
            pTab1ModalSellInputTel: {
                required: true,
                maxlength: 8,
                digits: true
            },
            pTab1ModalSellInputTel2: {
                maxlength: 8,
                digits: true
            },
            pTab1ModalSellInputAddress: {
                maxlength: 150
            },
            pTab1ModalSellInputEmail: {
                email: true
            },
            pTab1ModalSellInputType: {
                required: true
            },
            pTab1ModalSellInputAgreementno: {
                required: function (element) {
                    return $('input[name=pTab1ModalSellInputEvent]:checked').val() != '0'
                },
                maxlength: 15
            },
            pTab1ModalSellSelectPaymenttype: {
                required: function (element) {
                    return $('input[name=pTab1ModalSellInputEvent]:checked').val() != '0'
                }
            },
            pTab1ModalSellInputPaydt: {
                required: function (element) {
                    return $('input[name=pTab1ModalSellInputEvent]:checked').val() != '0'
                },
                date: true
            },
            pTab1ModalSellInputIsResold: {
                required: function (element) {
                    return $('input[name=pTab1ModalSellInputEvent]:checked').val() != '0'
                }
            },
            pTab1ModalSellSelectSoldstaff: {
                required: function (element) {
                    return $('input[name=pTab1ModalSellInputEvent]:checked').val() != '0'
                }
            }
        },
        // Messages for form validation
        messages: {
            pTab1ModalSellInputRD: {
                required: 'Оруулна уу',
                minlength: 'Багадаа 5 тэмдэгт оруулна уу',
                maxlength: 'Уртдаа 10 тэмдэгт оруулна уу'
            },
            pTab1ModalSellInputOwnername: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 100 тэмдэгт авна'
            },
            pTab1ModalSellInputTel: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 8 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            pTab1ModalSellInputTel2: {
                maxlength: 'Уртдаа 11 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            pTab1ModalSellInputAddress: {
                maxlength: 'Уртдаа 150 тэмдэгт авна'
            },
            pTab1ModalSellInputEmail: {
                email   : 'Зөв оруулна уу'
            },
            pTab1ModalSellInputType: {
                required: 'Сонгоно уу'
            },
            pTab1ModalSellInputAgreementno: {
                required: 'Сонгоно уу',
                maxlength: 'Уртдаа 15 тэмдэгт авна'
            },
            pTab1ModalSellSelectPaymenttype: {
                required: 'Сонгоно уу'
            },
            pTab1ModalSellInputPaydt: {
                required: 'Оруулна уу',
                date: 'Зөв оруулна уу /Жил-Сар-Өдөр/'
            },
            pTab1ModalSellInputIsResold: {
                required: 'Сонгоно уу'
            },
            pTab1ModalSellSelectSoldstaff: {
                required: 'Сонгоно уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            var filename = '';
            var valIsReSold = '';
            if ($.trim($('#pTab1ModalSellAttachBtn').html()) != 'Файл хавсаргаагүй байна...') {
                filename = 'БорлуулалтынГэрээ-' + $.trim($('#pTab1ModalSellDivVinno').html()) + '.pdf';
            }
            if ($('input[name="pTab1ModalSellInputIsResold"]:checked').val() == undefined) valIsReSold = '';
            else valIsReSold = $('input[name="pTab1ModalSellInputIsResold"]:checked').val();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/INS_DEALERSELL",
                data: '{"CLINIC_ID":"' + $('#indexClinicId').text() + '", "SOLDCARCUSTOMER_ID":"' + $.trim($('#pTab1ModalSellCustomerId').val()) + '", "SOLDCARCUSTOMER_RD":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalSellInputRD').val())) + '", "SOLDCARCUSTOMER_NAME":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalSellInputOwnername').val())) + '", "SOLDCARCUSTOMER_CUSTOMERTYPE_ID":"' + $('input[name=pTab1ModalSellInputType]:checked').val() + '", "SOLDCARCUSTOMER_TEL":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalSellInputTel').val())) + '", "SOLDCARCUSTOMER_TEL2":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalSellInputTel2').val())) + '", "SOLDCARCUSTOMER_EMAIL":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalSellInputEmail').val())) + '", "SOLDCARCUSTOMER_ADDRESS":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalSellInputAddress').val())) + '", "SELLCARS_ID":"' + $.trim($('#pTab1ModalSellID').html()) + '", "AGGREEMENTNO":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalSellInputAgreementno').val())) + '", "SELLCARSPAYMENTTYPE_ID":"' + $.trim($('#pTab1ModalSellSelectPaymenttype option:selected').val()) + '", "PAYDT":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalSellInputPaydt').val())) + '", "AGREEMENTATTACH":"' + filename + '", "ISRESOLD":"' + valIsReSold + '", "USERID":"' + $('#indexStaffId').html() + '", "SOLDCARCUSTOMER_SELLCARS_ID":"' + $.trim($('#pTab1ModalSellSOLDCARCUSTOMER_SELLCARS_ID').val()) + '", "ISSUBMIT":"' + $('input[name=pTab1ModalSellInputEvent]:checked').val() + '", "SOLDCAR_STAFFID":"' + $('#pTab1ModalSellSelectSoldstaff option:selected').val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    if (filename != '') {
                        if ($("#pTab1ModalSellAttachInput").val() != '') {
                            var uploadfiles = $("#pTab1ModalSellAttachInput").get(0);
                            var uploadedfiles = uploadfiles.files;
                            var fromdata = new FormData();
                            fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../pg/uploadFile.ashx?fileurl=files/agreement&filename=" + filename,
                                data: fromdata,
                                contentType: false,
                                processData: false,
                                success: function () {
                                    smallBox('Хавсралт файл', 'Амжилттай хадгалагдлаа', '#659265');
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
                    if ($('#pTab1ModalSellHeaderLabel').text() == 'нэмэх') {
                        if ($('input[name="pTab1ModalSellInputEvent"]:checked').val() == '1') {
                            dataBindTab1Table();
                            $('#pTab2DatatableDiv').html('');
                        }
                        else {
                            dataBindTab2Table();
                            $('#pTab1DatatableDiv').html('');
                        }
                        $('#pTab4DatatableDiv').html('');
                    }
                    else {
                        dataBindTab4Table();
                    }
                    $('#pTab1ModalSell').modal('hide');
                    smallBox('Борлуулалт', 'Амжилттай хадгалагдлаа', '#659265');
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

    //tab2
    function dataBindTab2Table() {
        var valData = '';
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealerTab2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "extcolor":"' + $('#pTab2SelectExtcolor option:selected').val() + '", "intcolor":"' + $('#pTab2SelectIntcolor option:selected').val() + '", "spectype":"' + $('#pTab2SelectSpectype option:selected').val() + '", "mark":"' + $('#pTab2SelectMark option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th rowspan=\"2\" lang=\"mn\">#</th>";
                valData += "<th rowspan=\"2\" data-class=\"expand\" lang=\"mn\">Аралын дугаар</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Модел</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Ү/он</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Загвар</th>";
                valData += "<th colspan=\"2\" lang=\"mn\">Өнгө</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Шатхууны төрөл</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Хурдны хайрцаг</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Заалт</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">БУУХ ОГНОО</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Үнэ</th>";
                valData += "<th rowspan=\"2\">&nbsp;</th>";
                valData += "<th rowspan=\"2\">Баталгаат захиалга</th>";
                valData += "</tr>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">Гадар</th>";
                valData += "<th lang=\"mn\">Дотор</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\" class=\"" + value.ISSELLCARS + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.VINNO) + "</td>";
                    valData += "<td data-markid=\"" + value.MARK_ID + "\" data-marktypeid=\"" + value.AUTOMARK_TYPE_ID + "\">" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td>" + value.PRODUCEDYEAR + "</td>";
                    valData += "<td data-id=\"" + value.SPECTYPE_ID + "\">" + replaceDatabaseToDisplay(value.SPECTYPE_NAME) + "</td>";
                    valData += "<td data-id=\"" + value.EXTCOLOR_ID + "\" data-htmlcode=\"" + value.EXTCOLORHTMLCODE + "\" data-code=\"" + value.EXTCOLORCODE + "\" data-name=\"" + value.EXTCOLORNAME + "\" style=\"background-color:#" + value.EXTCOLORHTMLCODE + ";\"></td>";
                    valData += "<td data-id=\"" + value.INTCOLOR_ID + "\" data-htmlcode=\"" + value.INTCOLORHTMLCODE + "\" data-code=\"" + value.INTCOLORCODE + "\" data-name=\"" + value.INTCOLORNAME + "\" style=\"background-color:#" + value.INTCOLORHTMLCODE + ";\"></td>";
                    valData += "<td data-id=\"" + value.FUELTYPE_ID + "\">" + replaceDatabaseToDisplay(value.FUELTYPE_NAME) + "</td>";
                    valData += "<td data-id=\"" + value.TRANSMISSIONTYPE_ID + "\">" + replaceDatabaseToDisplay(value.TRANSMISSIONTYPE_NAME) + "</td>";
                    valData += "<td data-id=\"" + value.ZAALTTYPE_ID + "\">" + replaceDatabaseToDisplay(value.ZAALTTYPE_NAME) + "</td>";
                    valData += "<td>" + value.GETDT + "</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab1Modal\" onclick=\"showAddEditTab1(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    if (value.ISSELLCARS == 'success') valData += "<td><button class=\"btn btn-xs btn-warning\" onclick=\"showDeleteTab2Sell(this)\">Цуцлах</button></td>";
                    else valData += "<td><button class=\"btn btn-xs btn-warning\" data-toggle=\"modal\" data-target=\"#pTab1ModalSell\" onclick=\"showAddEditTab1Sell(this,'нэмэх',0)\">Захиалах</button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab2Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab2Datatable) {responsiveHelper_pTab2Datatable = new ResponsiveDatatablesHelper($('#pTab2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab2Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null, { \"sWidth\": \"35px\", \"sClass\": \"text-center\", \"bSortable\": false }, null, { \"sWidth\": \"38px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"38px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"65px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"52px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"38px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"75px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"75px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
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
    $("#pTab2SelectExtcolor, #pTab2SelectIntcolor, #pTab2SelectSpectype, #pTab2SelectMark").change(function () {
        dataBindTab2Table();
    });
    //tab2sell
    function showDeleteTab2Sell(el) {
        $.SmartMessageBox({
            title: "",
            content: "Баталгаат захиалгыг цуцлахад итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_SOLDCARCUSTOMER_SELLCARS WHERE SELLCARS_ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Table();
                        smallBox('Автомашины баталгаат захиалгаа', 'Амжилттай цуцлагдлаа', '#659265');
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
    //tab3
    function dataBindTab3Table() {
        var valData = '';
        showLoader('loaderTab3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealerTab3Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "extcolor":"' + $('#pTab3SelectExtcolor option:selected').val() + '", "intcolor":"' + $('#pTab3SelectIntcolor option:selected').val() + '", "spectype":"' + $('#pTab3SelectSpectype option:selected').val() + '", "ordertype":"' + $('#pTab3SelectOrdertype option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab3Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th rowspan=\"2\" lang=\"mn\">#</th>";
                valData += "<th rowspan=\"2\" data-class=\"expand\" lang=\"mn\">Нэр</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Утас</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Модел</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Загвар</th>";
                valData += "<th colspan=\"2\" lang=\"mn\">Өнгө</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Шатхууны төрөл</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Хурдны хайрцаг</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">ХҮЛЭЭН АВАХ ОГНОО</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Үнэ</th>";
                valData += "<th rowspan=\"2\" lang=\"mn\">Төлөв</th>";
                valData += "<th rowspan=\"2\" style=\"width:40px;\">&nbsp;</th>";
                valData += "</tr>";
                valData += "<tr>";
                valData += "<th lang=\"mn\">Гадар</th>";
                valData += "<th lang=\"mn\">Дотор</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\" data-address=\"" + replaceDatabaseToDisplay(value.CUSTOMERADDRESS) + "\" data-email=\"" + replaceDatabaseToDisplay(value.CUSTOMEREMAIL) + "\" data-producedyr=\"" + value.PRODUCEDYEAR + "\" data-zaalttypeid=\"" + value.ZAALTTYPE_ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td data-type=\"" + value.CUSTOMERTYPE_ID + "\">" + replaceDatabaseToDisplay(value.CUSTOMERNAME) + "</td>";
                    valData += "<td data-tel=\"" + value.CUSTOMERTEL + "\" data-tel2=\"" + value.CUSTOMERTEL2 + "\">" + replaceDatabaseToDisplay(value.CUSTOMERTEL) + ", " + replaceDatabaseToDisplay(value.CUSTOMERTEL2) + "</td>";
                    valData += "<td data-markid=\"" + value.MARK_ID + "\" data-marktypeid=\"" + value.AUTOMARK_TYPE_ID + "\">" + replaceDatabaseToDisplay(value.MARK_NAME) + "</td>";
                    valData += "<td data-id=\"" + value.SPECTYPE_ID + "\">" + replaceDatabaseToDisplay(value.SPECTYPE_NAME) + "</td>";
                    valData += "<td data-id=\"" + value.EXTCOLOR_ID + "\" data-htmlcode=\"" + value.EXTCOLORHTMLCODE + "\" data-code=\"" + value.EXTCOLORCODE + "\" data-name=\"" + value.EXTCOLORNAME + "\" style=\"background-color:#" + value.EXTCOLORHTMLCODE + ";\"></td>";
                    valData += "<td data-id=\"" + value.INTCOLOR_ID + "\" data-htmlcode=\"" + value.INTCOLORHTMLCODE + "\" data-code=\"" + value.INTCOLORCODE + "\" data-name=\"" + value.INTCOLORNAME + "\" style=\"background-color:#" + value.INTCOLORHTMLCODE + ";\"></td>";
                    valData += "<td data-id=\"" + value.FUELTYPE_ID + "\">" + value.FULETYPE_NAME + "</td>";
                    valData += "<td data-id=\"" + value.TRANSMISSIONTYPE_ID + "\">" + replaceDatabaseToDisplay(value.TRANSMISSIONTYPE_NAME) + "</td>";
                    valData += "<td>" + value.GETDT + "</td>";
                    valData += "<td style=\"text-align:right;\">₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td data-id=\"" + value.SELLCARSORDERTYPE_ID + "\"><span class=\" label " + value.SELLCARSORDERTYPE_BGCOLOR + "\">" + value.SELLCARSORDERTYPE_NAME + "</span></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab3Modal\" onclick=\"showAddEditTab3(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab3(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab3Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab3Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab3Datatable) {responsiveHelper_pTab3Datatable = new ResponsiveDatatablesHelper($('#pTab3Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab3Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab3Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null, null, null, { \"sWidth\": \"38px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"38px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"65px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"52px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"75px\", \"sClass\": \"text-center\", \"bSortable\": false }, { \"sWidth\": \"75px\", \"sClass\": \"text-center\", \"bSortable\": false }, null, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
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
    $("#pTab3SelectExtcolor, #pTab3SelectIntcolor, #pTab3SelectSpectype, #pTab3SelectOrdertype").change(function () {
        dataBindTab3Table();
    });
    $("#pTab3ModalSelectExtcolor").change(function () {
        var valdata = '';
        if ($('#pTab3ModalSelectExtcolor option:selected').val() == '') {
            $('#pTab3ModalDivExtcolor').css('background-color', 'none');
        }
        else {
            $('#pTab3ModalDivExtcolor').css('background-color', '#' + $('#pTab3ModalSelectExtcolor option:selected').attr('data-htmlcode'));
        }
    });
    $("#pTab3ModalSelectIntcolor").change(function () {
        var valdata = '';
        if ($('#pTab3ModalSelectIntcolor option:selected').val() == '') {
            $('#pTab3ModalDivIntcolor').css('background-color', 'none');
        }
        else {
            $('#pTab3ModalDivIntcolor').css('background-color', '#' + $('#pTab3ModalSelectIntcolor option:selected').attr('data-htmlcode'));
        }
    });
    function showAddEditTab3(el, isinsupt) {
        $('#pTab3ModalHeaderLabel').text(isinsupt);
        $('#pTab3ModalID').html('');
        $('#pTab3ModalDivExtcolor, #pTab3ModalDivIntcolor').css('background-color', 'none');
        $('#pTab3ModalInputOwnername, #pTab3ModalInputTel, #pTab3ModalInputTel2, #pTab3ModalInputAddress, #pTab3ModalInputEmail, #pTab3ModalSelectSpectype, #pTab3ModalSelectProducedyear, #pTab3ModalInputGetdt, #pTab3ModalInputPrice, #pTab3ModalSelectExtcolor, #pTab3ModalSelectIntcolor').val('');
        $('input[name="pTab3ModalInputType"], input[name="pTab3ModalInputFueltype"], input[name="pTab3ModalInputTransmission"], input[name="pTab3ModalInputZaaltType"]').prop('checked', false);
        $('#pTab3ModalSelectOrdertype').val('1');
        $('#pTab3ModalForm').find('.modal-footer').find(':submit').prop('disabled', false);
        if (isinsupt == 'засах') {
            $('#pTab3ModalID').html($(el).closest('tr').attr('data-id'));
            $('#pTab3ModalInputOwnername').val($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab3ModalInputTel').val($(el).closest('tr').find('td:eq(2)').text().split(', ')[0]);
            $('#pTab3ModalInputTel2').val($(el).closest('tr').find('td:eq(2)').text().split(', ')[0]);
            $('#pTab3ModalInputType' + $(el).closest('tr').find('td:eq(1)').attr('data-type')).prop('checked', true);
            $('#pTab3ModalInputAddress').val($(el).closest('tr').attr('data-address'));
            $('#pTab3ModalInputEmail').val($(el).closest('tr').attr('data-email'));
            $('#pTab3ModalSelectSpectype').val($(el).closest('tr').find('td:eq(4)').attr('data-id'));
            $('#pTab3ModalSelectProducedyear').val($(el).closest('tr').attr('data-producedyr'));
            $('#pTab3ModalInputFueltype' + $(el).closest('tr').find('td:eq(7)').attr('data-id')).prop('checked', true);
            $('#pTab3ModalInputTransmission' + $(el).closest('tr').find('td:eq(8)').attr('data-id')).prop('checked', true);
            $('#pTab3ModalInputZaaltType' + $(el).closest('tr').attr('data-zaalttypeid')).prop('checked', true);
            $('#pTab3ModalInputGetdt').val($(el).closest('tr').find('td:eq(9)').html());
            $('#pTab3ModalInputPrice').val($(el).closest('tr').find('td:eq(10)').html().replace(/₮/g, '').replace(/,/g, ''));
            $('#pTab3ModalSelectExtcolor').val($(el).closest('tr').find('td:eq(5)').attr('data-id'));
            $('#pTab3ModalDivExtcolor').css('background-color', '#' + $(el).closest('tr').find('td:eq(5)').attr('data-htmlcode'));
            $('#pTab3ModalSelectIntcolor').val($(el).closest('tr').find('td:eq(6)').attr('data-id'));
            $('#pTab3ModalDivIntcolor').css('background-color', '#' + $(el).closest('tr').find('td:eq(6)').attr('data-htmlcode'));
            $('#pTab3ModalSelectOrdertype').val($(el).closest('tr').find('td:eq(11)').attr('data-id'));
        }
    }
    function showDeleteTab3(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та борлуулах автомашины захиалгыг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_SOLDCARCUSTOMER_ORDER WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3Table();
                        smallBox('Автомашины захиалга', 'Амжилттай устлаа', '#659265');
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
    $("#pTab3ModalForm").validate({
        rules: {
            pTab3ModalInputOwnername: {
                required: true,
                maxlength: 100
            },
            pTab3ModalInputTel: {
                required: true,
                maxlength: 8,
                digits: true
            },
            pTab3ModalInputTel2: {
                maxlength: 8,
                digits: true
            },
            pTab3ModalInputType: {
                required: true
            },
            pTab3ModalInputAddress: {
                maxlength: 150
            },
            pTab3ModalInputEmail: {
                email: true
            },
            pTab3ModalSelectSpectype: {
                required: true
            },
            pTab3ModalSelectProducedyear: {
                required: true
            },
            pTab3ModalInputFueltype: {
                required: true
            },
            pTab3ModalInputTransmission: {
                required: true
            },
            pTab3ModalInputZaaltType: {
                required: true
            },
            pTab3ModalInputGetdt: {
                required: true,
                date: true
            },
            pTab3ModalInputPrice: {
                required: true,
                maxlength: 17,
                digits: true
            },
            pTab3ModalSelectExtcolor: {
                required: true
            },
            pTab3ModalSelectIntcolor: {
                required: true
            },
            pTab3ModalSelectOrdertype: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            pTab3ModalInputOwnername: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 100 тэмдэгт оруулна уу'
            },
            pTab3ModalInputTel: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 8 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            pTab3ModalInputTel2: {
                maxlength: 'Уртдаа 8 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            pTab3ModalInputType: {
                required: 'Сонгоно уу'
            },
            pTab3ModalInputAddress: {
                maxlength: 'Уртдаа 150 тэмдэгт авна'
            },
            pTab3ModalInputEmail: {
                email: 'Зөв оруулна уу'
            },
            pTab3ModalSelectSpectype: {
                required: 'Сонгоно уу'
            },
            pTab3ModalSelectProducedyear: {
                required: 'Сонгоно уу'
            },
            pTab3ModalInputFueltype: {
                required: 'Сонгоно уу'
            },
            pTab3ModalInputTransmission: {
                required: 'Сонгоно уу'
            },
            pTab3ModalInputZaaltType: {
                required: 'Сонгоно уу'
            },
            pTab3ModalInputGetdt: {
                required: 'Сонгоно уу',
                date: 'Зөв оруулна уу /Жил-Сар-Өдөр/'
            },
            pTab3ModalInputPrice: {
                required: 'Оруулна уу',
                maxlength: 'Уртдаа 11 тэмдэгт авна',
                digits: 'Зөвхөн тоон тэмдэгт орно'
            },
            pTab3ModalSelectExtcolor: {
                required: 'Сонгоно уу'
            },
            pTab3ModalSelectIntcolor: {
                required: 'Сонгоно уу'
            },
            pTab3ModalSelectOrdertype: {
                required: 'Сонгоно уу'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function () {
            if ($('#pTab3ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_SOLDCARCUSTOMER_ORDER (CLINIC_ID, CUSTOMERNAME, CUSTOMERTYPE_ID, CUSTOMERTEL, CUSTOMERTEL2, CUSTOMEREMAIL, CUSTOMERADDRESS, PRODUCEDYEAR, FUELTYPE_ID, TRANSMISSIONTYPE_ID, ZAALTTYPE_ID, SPECTYPE_ID, EXTCOLOR_ID, INTCOLOR_ID, GETDT, PRICE, SELLCARSORDERTYPE_ID, CREATED_STAFFID, CREATED_DATE) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputOwnername').val()))) + ', ' + strQryIsNull('numeric', $('input[name=pTab3ModalInputType]:checked').val()) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputTel').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputTel2').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputEmail').val()))) + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputAddress').val()))) + ', ' + strQryIsNull('numeric', $('#pTab3ModalSelectProducedyear option:selected').val()) + ', ' + strQryIsNull('numeric', $('input[name=pTab3ModalInputFueltype]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=pTab3ModalInputTransmission]:checked').val()) + ', ' + strQryIsNull('numeric', $('input[name=pTab3ModalInputZaaltType]:checked').val()) + ', ' + strQryIsNull('numeric', $('#pTab3ModalSelectSpectype option:selected').val()) + ', ' + strQryIsNull('numeric', $('#pTab3ModalSelectExtcolor option:selected').val()) + ', ' + strQryIsNull('numeric', $('#pTab3ModalSelectIntcolor option:selected').val()) + ', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputGetdt').val()))) + ', ' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#pTab3ModalInputPrice').val()))) + ', ' + strQryIsNull('numeric', $('#pTab3ModalSelectOrdertype option:selected').val()) + ', ' + $('#indexStaffId').html() + ', GETDATE())"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3Table();
                        $('#pTab3Modal').modal('hide');
                        smallBox('Автомашины захиалга', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_SOLDCARCUSTOMER_ORDER SET CUSTOMERNAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputOwnername').val()))) + ', CUSTOMERTYPE_ID=' + strQryIsNull('numeric', $('input[name=pTab3ModalInputType]:checked').val()) + ', CUSTOMERTEL=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputTel').val()))) + ', CUSTOMERTEL2=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputTel2').val()))) + ', CUSTOMEREMAIL=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputEmail').val()))) + ', CUSTOMERADDRESS=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputAddress').val()))) + ', PRODUCEDYEAR=' + strQryIsNull('numeric', $('#pTab3ModalSelectProducedyear option:selected').val()) + ', FUELTYPE_ID=' + strQryIsNull('numeric', $('input[name=pTab3ModalInputFueltype]:checked').val()) + ', TRANSMISSIONTYPE_ID=' + strQryIsNull('numeric', $('input[name=pTab3ModalInputTransmission]:checked').val()) + ', ZAALTTYPE_ID=' + strQryIsNull('numeric', $('input[name=pTab3ModalInputZaaltType]:checked').val()) + ', SPECTYPE_ID=' + strQryIsNull('numeric', $('#pTab3ModalSelectSpectype option:selected').val()) + ', EXTCOLOR_ID=' + strQryIsNull('numeric', $('#pTab3ModalSelectExtcolor option:selected').val()) + ', INTCOLOR_ID=' + strQryIsNull('numeric', $('#pTab3ModalSelectIntcolor option:selected').val()) + ', GETDT=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab3ModalInputGetdt').val()))) + ', PRICE=' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#pTab3ModalInputPrice').val()))) + ', SELLCARSORDERTYPE_ID=' + strQryIsNull('numeric', $('#pTab3ModalSelectOrdertype option:selected').val()) + ', UPDATED_STAFFID=' + $('#indexStaffId').html() + ', UPDATED_DATE=GETDATE() WHERE ID=' + $('#pTab3ModalID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3Table();
                        $('#pTab3Modal').modal('hide');
                        smallBox('Автомашины захиалга', 'Амжилттай хадгалагдлаа', '#659265');
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

    //tab4
    function dataBindTab4Table() {
        var valData = '';
        showLoader('loaderTab4');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/DealerTab4Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "paymenttp":"' + $('#pTab4SelectPaymenttype option:selected').val() + '", "spectype":"' + $('#pTab4SelectSpectype option:selected').val() + '", "yr":"' + $('#pTab3SelectYr option:selected').val() + '", "mnth":"' + $('#pTab3SelectMnth option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"pTab4Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th rowspan=\"2\" lang=\"mn\">#</th>";
                valData += "<th colspan=\"4\" lang=\"mn\">Гэрээ</th>";
                valData += "<th colspan=\"3\" lang=\"mn\">Автомашин</th>";
                valData += "<th colspan=\"3\" lang=\"mn\">Үйлчлүүлэгч</th>";
                valData += "<th rowspan=\"2\">&nbsp;</th>";
                valData += "</tr>";
                valData += "<tr>";
                valData += "<th data-class=\"expand\" lang=\"mn\">Гэрээ #</th>";
                valData += "<th lang=\"mn\">Огноо</th>";
                valData += "<th lang=\"mn\">Төлбөр</th>";
                valData += "<th lang=\"mn\">Харах</th>";
                valData += "<th lang=\"mn\">Арал #</th>";
                valData += "<th lang=\"mn\">Модел</th>";
                valData += "<th lang=\"mn\">Загвар</th>";
                valData += "<th lang=\"mn\">Регистер</th>";
                valData += "<th lang=\"mn\">Нэр</th>";
                valData += "<th lang=\"mn\">Утас</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\"" + value.ID + "\">";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.AGGREEMENTNO) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.PAYDT) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.SELLCARSPAYMENTTYPE_NAME) + "</td>";
                    valData += "<td>";
                    if (value.AGREEMENTATTACH != "") {
                        valData += "<div class=\"btn-group\">";
                        valData += "<a href=\"../files/agreement/" + value.AGREEMENTATTACH + "\" class=\"btn btn-default btn-xs\" download title=\"Хавсаргасан файл татах\"><i class=\"fa fa-download\"></i></a>";
                        valData += "<a href=\"../pg/dealerTab4AttachShowModal.aspx?id=" + value.ID + "\" class=\"btn btn-default btn-xs\" data-target=\"#pTab4AttachShowModal\" data-toggle=\"modal\"><i class=\"fa fa-eye\"></i></a>";
                        valData += "</div>";
                    }
                    valData += "</td>";
                    valData += "<td><a href=\"../pg/dealerTab4CarShowModal.aspx?id=" + value.ID + "\" class=\"btn btn-link btn-xs font-sm no-padding\" data-target=\"#pTab4AttachShowModal\" data-toggle=\"modal\">" + replaceDatabaseToDisplay(value.VINNO) + "</a></td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.AUTOMARK_TYPE_NAME) + " - " + replaceDatabaseToDisplay(value.AUTOMARK_NAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.SPECTYPE_NAME) + "</td>";
                    valData += "<td><a href=\"../pg/dealerTab4ClientShowModal.aspx?id=" + value.ID + "\" class=\"btn btn-link btn-xs font-sm no-padding\" data-target=\"#pTab4AttachShowModal\" data-toggle=\"modal\">" + replaceDatabaseToDisplay(value.CUSTOMERRD) + "</a></td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.CUSTOMERNAME) + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.CUSTOMERTEL) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#pTab1ModalSell\" onclick=\"showAddEditTab1Sell(this,'засах',1)\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"showDeleteTab4(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_pTab4Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#pTab4Datatable').dataTable({\"iDisplayLength\": 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab4Datatable) {responsiveHelper_pTab4Datatable = new ResponsiveDatatablesHelper($('#pTab4Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_pTab4Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_pTab4Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null, null, null, null, null, null, null, null, null, { \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#pTab4DatatableDiv").html(valData);
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
    function showDeleteTab4(el) {
        $.SmartMessageBox({
            title: "",
            content: "Автомашины борлуулалтын мэдээллийг устгахдаа итгэлтэй байна уу? /Хавсралт файл давхар устгагдах болно/",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_SOLDCARCUSTOMER_SELLCARS WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($.trim($(el).closest('tr').find('td:eq(4)').html()) != '') {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/DeleteFile",
                                data: '{"fileurl":"' + $(el).closest('tr').find('td:eq(4)').find('div').find('a').attr('href').replace('..', '~') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    smallBox('Хавсралт файл', 'Амжилттай устлаа', '#659265');
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    window.location = '../#pg/error500.aspx';
                                }
                            });
                        }
                        dataBindTab4Table();
                        smallBox('Борлуулсан мэдээлэл', 'Амжилттай устлаа', '#659265');
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
    $("#pTab3SelectYr, #pTab3SelectMnth, #pTab4SelectPaymenttype, #pTab4SelectSpectype").change(function () {
        dataBindTab4Table();
    });


    $('#pTab1ModalInputGetdt, #pTab3ModalInputGetdt, #pTab1ModalSellInputPaydt').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    });
</script>
