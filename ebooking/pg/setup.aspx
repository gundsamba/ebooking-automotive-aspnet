<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setup.aspx.cs" Inherits="ebooking.pg.setup" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-3">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-gears fa-fw "></i> 
			<span lang="mn">Ерөнхий тохиргоо</span>
		</h1>
	</div>
</div>
<section id="widget-grid" class="">
    <div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<ul class="nav nav-tabs bordered">
				<li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
					<a href="#s1" data-toggle="tab" lang="mn">Заал болон өргөгч</a>
				</li>
				<li id="pTab3Li" onclick="pDatabindTabs(this)">
					<a href="#s3" data-toggle="tab" lang="mn">Цаг авалтын календар</a>
				</li>
				<li id="pTab4Li" onclick="pDatabindTabs(this)">
					<a href="#s4" data-toggle="tab" lang="mn">Үйлчлүүлэгчийн хүсэлт</a>
				</li>
				<li id="pTab6Li" onclick="pDatabindTabs(this)">
					<a href="#s6" data-toggle="tab" lang="mn">Оношлогооны төрөл</a>
				</li>
				<li id="pTab7Li" onclick="pDatabindTabs(this)">
					<a href="#s7" data-toggle="tab" lang="mn">Засвар үйлчилгээний төрөл</a>
				</li>
				<li id="pTab8Li" onclick="pDatabindTabs(this)">
					<a href="#s8" data-toggle="tab" lang="mn">Байгууллагын мэдээлэл</a>
				</li>
				<li id="pTab9Li" onclick="pDatabindTabs(this)">
					<a href="#s9" data-toggle="tab" lang="mn">Job дээрх албан тушаалын тохиргоо</a>
				</li>
			</ul>
			<div id="myTabContent1" class="tab-content">
				<div class="tab-pane fade in active animated fast fadeInDown" id="s1">
                    <div class="col-sm-12 col-md-12 col-lg-6" style="padding:0 10px 0 0">
                        <div class="jarviswidget jarviswidget-color-blueDark" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-togglebutton="false">
                            <header>
				                <span class="widget-icon"> <i class="fa fa-desktop"></i> </span>
				                <h2 lang="mn">Заал болон өргөгчийн бүртгэл</h2>
                                <div class="widget-toolbar">
					                <a href="javascript:void(0);" class="btn btn-default txt-color-blueLight" data-toggle="modal" data-target="#setupTab1Modal" onclick="setupTab1ModalAddEdit(this,'нэмэх')"><i class="fa fa-plus fa-lg"></i></a>
				                </div>
			                </header>
                            <div>
                                <div id="loaderTab1" class="loader-background">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="setupTab1DatatableDiv" class="widget-body no-padding">
					
				                </div>
			                </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6" style="padding:0 0 0 10px;">
                        <div class="jarviswidget jarviswidget-color-blueDark" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-togglebutton="false">
                            <header>
				                <span class="widget-icon"> <i class="fa fa-desktop"></i> </span>
				                <h2 lang="mn">Өргөгчийн нэр</h2>
                                <div class="widget-toolbar">
					                <a href="javascript:void(0);" class="btn btn-default txt-color-blueLight" data-toggle="modal" data-target="#setupTab1s2Modal" onclick="setupTab1s2ModalAddEdit(this,'нэмэх')"><i class="fa fa-plus fa-lg"></i></a>
				                </div>
			                </header>
                            <div>
                                <div id="loaderTab1s2" class="loader-background">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="setupTab1s2DatatableDiv" class="widget-body no-padding">
					
				                </div>
			                </div>
                        </div>
                    </div>
				</div>
                <div class="tab-pane fade animated fast fadeInDown padding-10" id="s3">
                    <div class="row">
                        <div class="col-md-1">
                            <label lang="mn">Эхлэх цаг</label>
                            <select id="setupTab3SelectStartTime" class="form-control" style="padding: 1px;"><option>00:00</option><option>01:00</option><option>02:00</option><option>03:00</option><option>04:00</option><option>05:00</option><option>06:00</option><option>07:00</option><option>08:00</option><option>09:00</option><option>10:00</option><option>11:00</option><option>12:00</option><option>13:00</option><option>14:00</option><option>15:00</option><option>16:00</option><option>17:00</option><option>18:00</option><option>19:00</option><option>20:00</option><option>21:00</option><option>22:00</option><option>23:00</option></select>
                        </div>
                        <div class="col-md-1">
                            <label lang="mn">Дуусах цаг</label>
                            <select id="setupTab3SelectEndTime" class="form-control" style="padding: 1px;"><option>00:00</option><option>01:00</option><option>02:00</option><option>03:00</option><option>04:00</option><option>05:00</option><option>06:00</option><option>07:00</option><option>08:00</option><option>09:00</option><option>10:00</option><option>11:00</option><option>12:00</option><option>13:00</option><option>14:00</option><option>15:00</option><option>16:00</option><option>17:00</option><option>18:00</option><option>19:00</option><option>20:00</option><option>21:00</option><option>22:00</option><option>23:00</option></select>
                        </div>
                        <div class="col-md-2">
                            <label lang="mn">Цагийн интервал</label>
                            <select id="setupTab3SelectInterval" class="form-control" style="padding: 1px;"><option value="15" lang="mn">15 минут</option><option value="20" lang="mn">20 минут</option><option value="30" lang="mn">30 минут</option><option value="60" lang="mn">60 минут</option></select>
                        </div>
                    </div>
                    <div class="row margin-bottom-10">
                        <div class="col-md-1">
                            <label lang="mn">Цайны эхлэх цаг</label>
                            <select id="setupTab3SelectLunchStartTime" class="form-control" style="padding: 1px;"><option>00:00</option><option>00:30</option><option>01:00</option><option>01:30</option><option>02:00</option><option>02:30</option><option>03:00</option><option>03:30</option><option>04:00</option><option>04:30</option><option>05:00</option><option>05:30</option><option>06:00</option><option>06:30</option><option>07:00</option><option>07:30</option><option>08:00</option><option>08:30</option><option>09:00</option><option>09:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option><option>12:30</option><option>13:00</option><option>13:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option><option>16:00</option><option>16:30</option><option>17:00</option><option>17:30</option><option>18:00</option><option>18:30</option><option>19:00</option><option>19:30</option><option>20:00</option><option>20:30</option><option>21:00</option><option>21:30</option><option>22:00</option><option>22:30</option><option>23:00</option><option>23:30</option></select>
                        </div>
                        <div class="col-md-1">
                            <label lang="mn">Цайны дуусах цаг</label>
                            <select id="setupTab3SelectLunchEndTime" class="form-control" style="padding: 1px;"><option>00:00</option><option>00:30</option><option>01:00</option><option>01:30</option><option>02:00</option><option>02:30</option><option>03:00</option><option>03:30</option><option>04:00</option><option>04:30</option><option>05:00</option><option>05:30</option><option>06:00</option><option>06:30</option><option>07:00</option><option>07:30</option><option>08:00</option><option>08:30</option><option>09:00</option><option>09:30</option><option>10:00</option><option>10:30</option><option>11:00</option><option>11:30</option><option>12:00</option><option>12:30</option><option>13:00</option><option>13:30</option><option>14:00</option><option>14:30</option><option>15:00</option><option>15:30</option><option>16:00</option><option>16:30</option><option>17:00</option><option>17:30</option><option>18:00</option><option>18:30</option><option>19:00</option><option>19:30</option><option>20:00</option><option>20:30</option><option>21:00</option><option>21:30</option><option>22:00</option><option>22:30</option><option>23:00</option><option>23:30</option></select>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade animated fast fadeInDown" id="s4">
                    <div class="col-sm-12 col-md-12 col-lg-6" style="padding:0;">
                        <div class="jarviswidget jarviswidget-color-blueDark" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-togglebutton="false">
                            <header>
				                <span class="widget-icon"> <i class="fa fa-desktop"></i> </span>
				                <h2 lang="mn">Үйлчлүүлэгчийн хүсэлтийн бүртгэл</h2>
                                <div class="widget-toolbar">
					                <a href="javascript:void(0);" class="btn btn-default txt-color-blueLight" data-toggle="modal" data-target="#setupTab4Modal" onclick="setupTab4ModalAddEdit(this,'нэмэх')"><i class="fa fa-plus fa-lg"></i></a>
				                </div>
			                </header>
                            <div>
                                <div id="loaderTab4" class="loader-background">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="setupTab4DatatableDiv" class="widget-body no-padding">
					
				                </div>
			                </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade animated fast fadeInDown" id="s6">
                    <div class="col-sm-12 col-md-12 col-lg-6" style="padding:0;">
                        <div class="jarviswidget jarviswidget-color-blueDark" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-togglebutton="false">
                            <header>
				                <span class="widget-icon"> <i class="fa fa-desktop"></i> </span>
				                <h2 lang="mn">Оношлогооны төрлийн бүртгэл</h2>
                                <div class="widget-toolbar">
					                <a href="javascript:void(0);" class="btn btn-default txt-color-blueLight" data-toggle="modal" data-target="#setupTab6Modal" onclick="setupTab6ModalAddEdit(this,'нэмэх')"><i class="fa fa-plus fa-lg"></i></a>
				                </div>
			                </header>
                            <div>
                                <div id="loaderTab6" class="loader-background">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="setupTab6DatatableDiv" class="widget-body no-padding">
					
				                </div>
			                </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade animated fast fadeInDown" id="s7">
                    <div class="col-sm-12 col-md-12 col-lg-6" style="padding:0;">
                        <div class="jarviswidget jarviswidget-color-blueDark" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-togglebutton="false">
                            <header>
				                <span class="widget-icon"> <i class="fa fa-desktop"></i> </span>
				                <h2 lang="mn">Засвар үйлчилгээний төрлийн бүртгэл</h2>
                                <div class="widget-toolbar">
					                <a href="javascript:void(0);" class="btn btn-default txt-color-blueLight" data-toggle="modal" data-target="#setupTab7Modal" onclick="setupTab7ModalAddEdit(this,'нэмэх')"><i class="fa fa-plus fa-lg"></i></a>
				                </div>
			                </header>
                            <div>
                                <div id="loaderTab7" class="loader-background">
                                    <img src="../img/loading.gif" />
                                    <h2 lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="setupTab7DatatableDiv" class="widget-body no-padding">
					
				                </div>
			                </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade animated fast fadeInDown" id="s8">
                    <article class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="jarviswidget jarviswidget-color-blueDark" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-togglebutton="false">
                            <header>
				                <span class="widget-icon"> <i class="fa fa-desktop"></i> </span>
				                <h2 lang="mn">Байгууллагын мэдээлэл</h2>
			                </header>
                            <div>
                                <div class="jarviswidget-editbox">

					            </div>
                                <div class="widget-body">
					                <form id="setupTab8Section1Form" class="form-horizontal">
                                        <fieldset>
                                            <div class="form-group">
									            <label class="col-md-2 control-label" lang="mn">*Нэр</label>
									            <div class="col-md-10">
										            <input id="setupTab8Section1InputName" runat="server" class="form-control" placeholder="Байгууллагын нэр" type="text" lang="mn">
									            </div>
								            </div>
                                            <div class="form-group">
									            <label class="col-md-2 control-label" lang="mn">Хаяг</label>
									            <div class="col-md-10">
										            <input id="setupTab8Section1InputAddr" runat="server" class="form-control" placeholder="Байгууллагын хаяг" type="text" lang="mn">
									            </div>
								            </div>
                                            <div class="form-group">
									            <label class="col-md-2 control-label" lang="mn">Утас</label>
									            <div class="col-md-5">
										            <input id="setupTab8Section1InputTel1" runat="server" class="form-control" placeholder="Утас 1" type="text" lang="mn">
									            </div>
                                                <div class="col-md-5">
										            <input id="setupTab8Section1InputTel2" runat="server" class="form-control" placeholder="Утас 2" type="text" lang="mn">
									            </div>
								            </div>
                                            <div class="form-group">
									            <label class="col-md-2 control-label" lang="mn">И-мэйл</label>
									            <div class="col-md-10">
										            <input id="setupTab8Section1InputEmail" runat="server" class="form-control" placeholder="И-мэйл" type="text" lang="mn">
									            </div>
								            </div>
                                            <div class="form-group">
									            <label class="col-md-2 control-label" lang="mn">Вэб хаяг</label>
									            <div class="col-md-10">
										            <input id="setupTab8Section1InputWeb" runat="server" class="form-control" placeholder="Вэб хаяг" type="text" lang="mn">
									            </div>
								            </div>
                                            <div class="form-group">
									            <label class="col-md-2 control-label" lang="mn">Фэйсбүүк</label>
									            <div class="col-md-10">
										            <input id="setupTab8Section1InputFb" runat="server" class="form-control" placeholder="Фэйсбүүк хаяг" type="text" lang="mn">
									            </div>
								            </div>
                                            <div class="form-group">
									            <label class="col-md-2 control-label" lang="mn">Лого</label>
									            <div class="col-md-6">
										            <input id="setupTab8Section1InputImg" runat="server" class="btn btn-default" type="file">
									            </div>
                                                <div class="col-md-4">
                                                    <img id="setupTab8Section1ImgLogo" runat="server" src="~/img/no_image_available.jpg" width="150" />
                                                </div>
								            </div>
                                        </fieldset>
                                        <div class="form-actions">
								            <div class="row">
									            <div class="col-md-12">
										            <button class="btn btn-default" type="submit" lang="mn">Хадгалах</button>
									            </div>
								            </div>
							            </div>
					                </form>
				                </div>
			                </div>
                        </div>
                    </article>
                </div>
                <div class="tab-pane fade animated fast fadeInDown padding-10" id="s9">
                    <div class="row" style="margin-bottom: 5px;">
                        <div id="setupTab3DivJobPosition1Val" runat="server" class="col-md-2" data-value="">
                            Ахлах механик:
                        </div>
                        <div class="col-md-3">
                            <select id="setupTab3SelectJobPosition1" name="setupTab3SelectJobPosition1" runat="server" data-value="1" class="form-control input-sm">
                                <option value="">- Сонго -</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 5px;">
                        <div id="setupTab3DivJobPosition2Val" runat="server" class="col-md-2" data-value="">
                            Механик:
                        </div>
                        <div class="col-md-3">
                            <select id="setupTab3SelectJobPosition2" name="setupTab3SelectJobPosition2" runat="server" data-value="2" class="form-control input-sm">
                                <option value="">- Сонго -</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div id="setupTab3DivJobPosition3Val" runat="server" class="col-md-2" data-value="">
                            Үйлчилгээний зөвлөх:
                        </div>
                        <div class="col-md-3">
                            <select id="setupTab3SelectJobPosition3" name="setupTab3SelectJobPosition3" runat="server" data-value="3" class="form-control input-sm">
                                <option value="">- Сонго -</option>
                            </select>
                        </div>
                    </div>
                </div>
			</div>
		</article>
	</div>
</section>
<div id="setupTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="setupTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Заал болон өргөгч</span>&nbsp;<span id="setupTab1ModalHeaderLabel"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="tab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label"><span lang="mn">*Заалны нэр</span> <i style="font-size: 11px;"><span lang="mn">/уртдаа 25 тэмдэгт/</span></i></label>
									<input id="setupTab1ModalInputName" name="setupTab1ModalInputName" type="text" class="form-control" placeholder="Заалны нэр" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Өргөгчийн тоо</label>
									<select id="setupTab1ModalSelectChairNumber" name="setupTab1ModalSelectChairNumber" class="form-control" >
								        <option value="" lang="mn">- Сонго -</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                        <option>11</option>
                                        <option>12</option>
                                        <option>13</option>
                                        <option>14</option>
                                        <option>15</option>
                                        <option>16</option>
                                        <option>17</option>
                                        <option>18</option>
                                        <option>19</option>
                                        <option>20</option>
                                        <option>21</option>
                                        <option>22</option>
                                        <option>23</option>
                                        <option>24</option>
                                        <option>25</option>
                                        <option>26</option>
                                        <option>27</option>
                                        <option>28</option>
                                        <option>29</option>
                                        <option>30</option>
							        </select>
                                </div>
                            </div>
						</div>
					</fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button id="setupTab1ModalBtnSave" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="setupTab1s2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="setupTab1s2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title" lang="mn">Өргөгчийн нэр оруулах</h4>
		        </div>
                <div class="modal-body">
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Заал</label>
									<select id="setupTab1s2ModalSelectRoom" name="setupTab1s2ModalSelectRoom" class="form-control" >
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
                                    <label class="control-label" lang="mn">*Өргөгч</label>
									<select id="setupTab1s2ModalSelectChairNum" name="setupTab1s2ModalSelectChairNum" class="form-control" >
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
                                    <label class="control-label" lang="mn">*Өргөгчийн нэр</label>
									<input id="setupTab1s2ModalInputChairTitle" name="setupTab1s2ModalInputChairTitle" type="text" class="form-control" placeholder="Өргөгчийн нэр" lang="mn"/>
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
<div id="setupTab4Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="setupTab4ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Үйлчлүүлэгчийн хүсэлт</span>&nbsp;<span id="setupTab4ModalHeaderLabel"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="tab4ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Нэр</label>
									<input id="setupTab4ModalInputName" name="setupTab4ModalInputName" type="text" class="form-control" placeholder="Нэр" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button id="setupTab4ModalBtnSave" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="setupTab6Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="setupTab6ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Оношлогооны төрөл</span>&nbsp;<span id="setupTab6ModalHeaderLabel"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="tab6ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Төрлийн нэр</label>
									<input id="setupTab6ModalInputName" name="setupTab6ModalInputName" type="text" class="form-control" placeholder="Төрлийн нэр" lang="mn"/>
                                </div>
                            </div>
						</div>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Оношлогооны үнэ</label>
									<input id="setupTab6ModalInputPrice" name="setupTab6ModalInputPrice" type="text" class="form-control" placeholder="Оношлогооны үнэ" lang="mn"/>
                                </div>
                            </div>
						</div>
					</fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button id="setupTab6ModalBtnSave" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="setupTab7Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="setupTab7ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span lang="mn">Засвар үйлчилгээний төрөл</span>&nbsp;<span id="setupTab7ModalHeaderLabel"></span></h4>
		        </div>
                <div class="modal-body">
                    <div id="tab7ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Төрлийн нэр</label>
									<input id="setupTab7ModalInputName" name="setupTab7ModalInputName" type="text" class="form-control" placeholder="Төрлийн нэр" lang="mn"/>
                                </div>
                            </div>
						</div>
                        <div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label" lang="mn">*Төлбөртэй эсэх</label>
                                    <div class="checkbox">
                                        <label>
										    <input id="setupTab7ModalInputIsPrice" name="setupTab7ModalInputIsPrice" type="checkbox" class="checkbox style-0">
										    <span lang="mn">Тийм</span>
									    </label>
                                    </div>
                                </div>
                            </div>
						</div>
					</fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal" lang="mn">Болих</button>
			        <button id="setupTab7ModalBtnSave" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
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
            if ($.trim($('#setupTab1DatatableDiv').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($('#setupTab3SelectStartTime option:selected').val() == '00:00' && $('#setupTab3SelectEndTime option:selected').val() == '00:00') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteScalar",
                    data: '{"qry":"SELECT (SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarstarttime\')+\'~\'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarendtime\')+\'~\'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarinterval\')+\'~\'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarlunchstarttime\')+\'~\'+(SELECT VALUE FROM TBL_SETUP WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarlunchendtime\')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        alert(data.d);
                        $('#setupTab3SelectStartTime').val(data.d.split('~')[0]);
                        $('#setupTab3SelectEndTime').val(data.d.split('~')[1]);
                        $('#setupTab3SelectInterval').val(data.d.split('~')[2]);
                        $('#setupTab3SelectLunchStartTime').val(data.d.split('~')[3]);
                        $('#setupTab3SelectLunchEndTime').val(data.d.split('~')[4]);
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
        else if ($.trim($(el).attr('id')) == 'pTab4Li') {
            if ($.trim($('#setupTab4DatatableDiv').html()) == "") {
                dataBindTab4Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab6Li') {
            if ($.trim($('#setupTab6DatatableDiv').html()) == "") {
                dataBindTab6Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab7Li') {
            if ($.trim($('#setupTab7DatatableDiv').html()) == "") {
                dataBindTab7Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab9Li') {
            $('#setupTab3SelectJobPosition1').val($('#setupTab3DivJobPosition1Val').attr('data-value'));
            $('#setupTab3SelectJobPosition2').val($('#setupTab3DivJobPosition2Val').attr('data-value'));
            $('#setupTab3SelectJobPosition3').val($('#setupTab3DivJobPosition3Val').attr('data-value'));
        }
    }
    //tab1
    function dataBindTab1Table() {
        var valData = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/SetupTab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"setupTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ID</th>";
                valData += "<th lang=\"mn\">#</th>";
                valData += "<th lang=\"mn\">Өөрөөний нэр</th>";
                valData += "<th lang=\"mn\">Өргөгчийн тоо</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ID + "</td>";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + value.CHAIRNUM + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#setupTab1Modal\" onclick=\"setupTab1ModalAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"setupTab1ModalDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_tab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#setupTab1Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_tab1Datatable) {responsiveHelper_tab1Datatable = new ResponsiveDatatablesHelper($('#setupTab1Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_tab1Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_tab1Datatable.respond();}, \"aoColumns\": [null, { \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null,{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#setupTab1DatatableDiv").html(valData);
                hideLoader('loaderTab1');
                dataBindTab1s2Table();
                $('#setupTab1s2ModalSelectRoom').html('<option value="" lang="mn">- Сонго -</option>');
                $('#setupTab1Datatable > tbody > tr').each(function (index) {
                    $('#setupTab1s2ModalSelectRoom').append('<option value=\"' + $(this).find('td:eq(0)').text() + '\">' + $(this).find('td:eq(2)').text() + '</option>');
                });
                $('#setupTab1s2ModalSelectChairNum').html('<option value="" lang="mn">- Сонго -</option>');
                $('#setupTab1s2ModalSelectChairNum').prop('disabled', true);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function setupTab1ModalAddEdit(el, isinsupt) {
        $('#setupTab1ModalHeaderLabel').text(isinsupt);
        $('#setupTab1ModalBtnSave').prop('disabled', false);
        if (isinsupt == 'нэмэх') {
            $('#tab1ID').text('');
            $('#setupTab1ModalInputName').val('');
            $('#setupTab1ModalSelectChairNumber').val('');
        }
        else {
            $('#tab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#setupTab1ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
            $('#setupTab1ModalSelectChairNumber').val($(el).closest('tr').find('td:eq(3)').text());
        }
    }
    function setupTab1ModalDelete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT WHERE ROOM_ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != '0') alert($(el).closest('tr').find('td:eq(2)').text() + ' -д хамааралтай захиалга орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон заалыг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_ROOM WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1Table();
                                    smallBox('Заал', 'Амжилттай устлаа', '#659265');
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
    //tab1s1
    function dataBindTab1s2Table() {
        var valData = '';
        showLoader('loaderTab1s2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/SetupTab1s2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"setupTab1s2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ROOM_ID</th>";
                valData += "<th lang=\"mn\">Өөрөөний нэр</th>";
                valData += "<th lang=\"mn\">Өргөгч</th>";
                valData += "<th lang=\"mn\">Өргөгчийн нэр</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ROOM_ID + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.ROOM_NAME) + "</td>";
                    valData += "<td>" + value.CHAIR + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.TITLE) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#setupTab1s2Modal\" onclick=\"setupTab1s2ModalAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"setupTab1s2ModalDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_tab1s2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#setupTab1s2Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_tab1s2Datatable) {responsiveHelper_tab1s2Datatable = new ResponsiveDatatablesHelper($('#setupTab1s2Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_tab1s2Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_tab1s2Datatable.respond();}, \"aoColumns\": [null, null, { \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null,{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#setupTab1s2DatatableDiv").html(valData);
                hideLoader('loaderTab1s2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function setupTab1s2ModalAddEdit(el, isinsupt) {
        if (isinsupt == 'нэмэх') {
            $('#setupTab1s2ModalSelectRoom').val('');
            $('#setupTab1s2ModalSelectChairNum').html('<option value="" lang="mn">- Сонго -</option>');
            $('#setupTab1s2ModalSelectChairNum').prop('disabled', true);
            $('#setupTab1s2ModalInputChairTitle').val('');
        }
        else {
            $('#setupTab1s2ModalSelectRoom').val($(el).closest('tr').find('td:eq(0)').text());
            var valChairIndex = $(el).closest('tr').find('td:eq(2)').text();
            $('#setupTab1Datatable > tbody > tr').each(function (index) {
                if ($(el).closest('tr').find('td:eq(0)').text() == $(this).find('td:eq(0)').text()) {
                    for (var i = 1; i <= parseInt($(this).find('td:eq(3)').text()) ; i++) {
                        $('#setupTab1s2ModalSelectChairNum').append('<option>' + i.toString() + '</option>');
                    }
                }
            });
            $('#setupTab1s2ModalSelectChairNum').val(valChairIndex);
            $('#setupTab1s2ModalInputChairTitle').val($(el).closest('tr').find('td:eq(3)').text());
        }
    }
    function setupTab1s2ModalDelete(el) {
        $.SmartMessageBox({
            title: "",
            content: "Та сонгосон өргөгчийн нэрийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"DELETE FROM TBL_ROOMTITLE WHERE ROOM_ID=' + $(el).closest('tr').find('td:eq(0)').text() + ' AND CHAIR=' + $(el).closest('tr').find('td:eq(2)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1s2Table();
                        smallBox('Өргөгчийн нэр', 'Амжилттай устлаа', '#659265');
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
    $("#setupTab1s2ModalSelectRoom").change(function () {
        if ($("#setupTab1s2ModalSelectRoom option:selected").val() == '') {
            $('#setupTab1s2ModalSelectChairNum').html('<option value="" lang="mn">- Сонго -</option>');
            $('#setupTab1s2ModalSelectChairNum').prop('disabled', true);
        }
        else {
            $('#setupTab1s2ModalSelectChairNum').html('<option value="" lang="mn">- Сонго -</option>');
            $('#setupTab1Datatable > tbody > tr').each(function (index) {
                if ($("#setupTab1s2ModalSelectRoom option:selected").val() == $(this).find('td:eq(0)').text()) {
                    for (var i = 1; i <= parseInt($(this).find('td:eq(3)').text()) ; i++) {
                        $('#setupTab1s2ModalSelectChairNum').append('<option>' + i.toString() + '</option>');
                    }
                }
            });
            $('#setupTab1s2ModalSelectChairNum').prop('disabled', false);
        }
    });

    //tab3
    $("#setupTab3SelectStartTime").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_SETUP SET VALUE=N\'' + $('#setupTab3SelectStartTime option:selected').val() + '\' WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarstarttime\'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Эхлэх цаг', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#setupTab3SelectEndTime").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_SETUP SET VALUE=N\'' + $('#setupTab3SelectEndTime option:selected').val() + '\' WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarendtime\'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Дуусах цаг', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#setupTab3SelectInterval").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_SETUP SET VALUE=N\'' + $('#setupTab3SelectInterval option:selected').val() + '\' WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarinterval\'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Цагийн интервал', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#setupTab3SelectLunchStartTime").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_SETUP SET VALUE=N\'' + $('#setupTab3SelectLunchStartTime option:selected').val() + '\' WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarlunchstarttime\'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Цайны эхлэх цаг', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#setupTab3SelectLunchEndTime").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_SETUP SET VALUE=N\'' + $('#setupTab3SelectLunchEndTime option:selected').val() + '\' WHERE CLINIC_ID=' + $('#indexClinicId').text() + ' AND KEYCODE=\'calendarlunchendtime\'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Цайны дуусах цаг', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    //tab4
    function dataBindTab4Table() {
        var valData = '';
        showLoader('loaderTab4');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/SetupTab4Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"setupTab4Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ID</th>";
                valData += "<th>#</th>";
                valData += "<th lang=\"mn\">Хүсэлтийн нэр</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ID + "</td>";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#setupTab4Modal\" onclick=\"setupTab4ModalAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"setupTab4ModalDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_tab4Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#setupTab4Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_tab4Datatable) {responsiveHelper_tab4Datatable = new ResponsiveDatatablesHelper($('#setupTab4Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_tab4Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_tab4Datatable.respond();}, \"aoColumns\": [null, { \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null,{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#setupTab4DatatableDiv").html(valData);
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
    function setupTab4ModalAddEdit(el, isinsupt) {
        $('#setupTab4ModalHeaderLabel').text(isinsupt);
        $('#setupTab4ModalBtnSave').prop('disabled', false);
        if (isinsupt == 'нэмэх') {
            $('#tab4ID').text('');
            $('#setupTab4ModalInputName').val('');
        }
        else {
            $('#tab4ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#setupTab4ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
        }
    }
    function setupTab4ModalDelete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT_REQUESTTYPE WHERE REQUESTTYPE_ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон хүсэлтэд хамааралтай мэдээлэл орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон хүсэлтийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_REQUESTTYPE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab4Table();
                                    smallBox('Сонгосон хүсэлт', 'Амжилттай устлаа', '#659265');
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
    //tab6
    function dataBindTab6Table() {
        var valData = '';
        showLoader('loaderTab6');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/SetupTab6Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"setupTab6Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ID</th>";
                valData += "<th>#</th>";
                valData += "<th lang=\"mn\">Оношлогооны төрлийн нэр</th>";
                valData += "<th lang=\"mn\">Үнэ</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ID + "</td>";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td class=\"text-right\">₮" + value.PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#setupTab6Modal\" onclick=\"setupTab6ModalAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"setupTab6ModalDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_tab6Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#setupTab6Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_tab6Datatable) {responsiveHelper_tab6Datatable = new ResponsiveDatatablesHelper($('#setupTab6Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_tab6Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_tab6Datatable.respond();}, \"aoColumns\": [null, { \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null,{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#setupTab6DatatableDiv").html(valData);
                hideLoader('loaderTab6');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function setupTab6ModalAddEdit(el, isinsupt) {
        $('#setupTab6ModalHeaderLabel').text(isinsupt);
        $('#setupTab6ModalBtnSave').prop('disabled', false);
        if (isinsupt == 'нэмэх') {
            $('#tab6ID').text('');
            $('#setupTab6ModalInputName').val('');
            $('#setupTab6ModalInputPrice').val('');
        }
        else {
            $('#tab6ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#setupTab6ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
            $('#setupTab6ModalInputPrice').val($(el).closest('tr').find('td:eq(3)').text().replace(/₮/g, '').replace(/,/g, ''));
        }
    }
    function setupTab6ModalDelete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT_DIAGNOSTICTYPE WHERE DIAGNOSTICTYPE_ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон оношлогооны төрөлд хамааралтай мэдээлэл орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон оношлогооны төрлийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_DIAGNOSTICTYPE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab6Table();
                                    smallBox('Сонгосон оношлогооны төрөл', 'Амжилттай устлаа', '#659265');
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
    //tab7
    function dataBindTab7Table() {
        var valData = '';
        showLoader('loaderTab7');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/SetupTab7Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"setupTab7Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\">";
                valData += "<thead>";
                valData += "<tr>";
                valData += "<th class=\"hide\">ID</th>";
                valData += "<th>#</th>";
                valData += "<th lang=\"mn\">Засвар үйлчилгээний төрлийн нэр</th>";
                valData += "<th lang=\"mn\">Төлбөртэй эсэх</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td class=\"hide\">" + value.ID + "</td>";
                    valData += "<td>" + value.RW + "</td>";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    if (value.ISPRICE == "1") valData += "<td><span class=\"label bg-color-red\" lang=\"mn\">ТИЙМ</span></td>";
                    else valData += "<td><span class=\"label bg-color-greenLight\" lang=\"mn\">ҮГҮЙ</span></td>";
                    valData += "<td><button class=\"btn btn-xs btn-default\" data-toggle=\"modal\" data-target=\"#setupTab7Modal\" onclick=\"setupTab7ModalAddEdit(this,'засах')\"><i class=\"fa fa-pencil\"></i></button><button class=\"btn btn-xs btn-default\" onclick=\"setupTab7ModalDelete(this)\"><i class=\"fa fa-trash-o\"></i></button></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>var responsiveHelper_tab7Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480 };$('#setupTab7Datatable').dataTable({\"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_tab7Datatable) {responsiveHelper_tab7Datatable = new ResponsiveDatatablesHelper($('#setupTab7Datatable'), breakpointDefinition);}},\"rowCallback\": function (nRow) {responsiveHelper_tab7Datatable.createExpandIcon(nRow);},\"drawCallback\": function (oSettings) {responsiveHelper_tab7Datatable.respond();}, \"aoColumns\": [null, { \"sWidth\": \"25px\", \"sClass\": \"text-center\" }, null, null,{ \"sWidth\": \"50px\", \"sClass\": \"text-center\", \"bSortable\": false }]});<\/script>";
                $("#setupTab7DatatableDiv").html(valData);
                hideLoader('loaderTab7');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function setupTab7ModalAddEdit(el, isinsupt) {
        $('#setupTab7ModalHeaderLabel').text(isinsupt);
        $('#setupTab7ModalBtnSave').prop('disabled', false);
        if (isinsupt == 'нэмэх') {
            $('#tab7ID').text('');
            $('#setupTab7ModalInputName').val('');
            $('#setupTab7ModalInputIsPrice').prop('checked', false);
        }
        else {
            $('#tab7ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#setupTab7ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
            if ($.trim($(el).closest('tr').find('td:eq(3)').find('span').text()) == 'ТИЙМ') $('#setupTab7ModalInputIsPrice').prop('checked', true);
            else $('#setupTab7ModalInputIsPrice').prop('checked', false);
        }
    }
    function setupTab7ModalDelete(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteScalar",
            data: '{"qry":"SELECT COUNT(1) FROM TBL_APPOINTMENT_REPAIR WHERE REPAIRTYPE_ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "0") {
                    alert("Сонгосон засвар үйлчилгээний төрөлд хамааралтай мэдээлэл орсон тул устгах боломжгүй байна!");
                }
                else {
                    $.SmartMessageBox({
                        title: "",
                        content: "Та сонгосон засвар үйлчилгээний төрлийг устгахдаа итгэлтэй байна уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"DELETE FROM TBL_REPAIRTYPE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab7Table();
                                    smallBox('Сонгосон засвар үйлчилгээний төрөл', 'Амжилттай устлаа', '#659265');
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

    //tab1
    $('#setupTab1ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            setupTab1ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Заалны нэр оруулна уу'
                    },
                    stringLength: {
                        max: 25,
                        message: 'Заалны нэр уртдаа 25 тэмдэгт авна'
                    }
                }
            },
            setupTab1ModalSelectChairNumber: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Хаалганы тоо сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#setupTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteScalar",
                    data: '{"qry":"SELECT COUNT(1) FROM TBL_ROOM"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (parseInt(data.d) < 5) {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                                data: '{"qry":"INSERT INTO TBL_ROOM (CLINIC_ID, NAME, CHAIRNUM) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab1ModalInputName').val()))) + ', ' + strQryIsNull('numeric', $('#setupTab1ModalSelectChairNumber option:selected').val()) + ')"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1Table();
                                    $('#setupTab1Modal').modal('hide');
                                    smallBox('Заал', 'Амжилттай хадгалагдлаа', '#659265');
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    window.location = '../#pg/error500.aspx';
                                }
                            });
                        }
                        else alert('5 ширхэг заал бүртгэгдсэн байна!');
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
                    data: '{"qry":"UPDATE TBL_ROOM SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab1ModalInputName').val()))) + ', CHAIRNUM=' + strQryIsNull('numeric', $('#setupTab1ModalSelectChairNumber option:selected').val()) + ' WHERE ID=' + $('#tab1ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Table();
                        $('#setupTab1Modal').modal('hide');
                        smallBox('Заал', 'Амжилттай хадгалагдлаа', '#659265');
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
    //tab1s2
    $('#setupTab1s2ModalForm').bootstrapValidator({
        //feedbackIcons: {
        //    valid: 'glyphicon glyphicon-ok',
        //    invalid: 'glyphicon glyphicon-remove',
        //    validating: 'glyphicon glyphicon-refresh'
        //},
        fields: {
            setupTab1s2ModalSelectRoom: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            setupTab1s2ModalSelectChairNum: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            setupTab1s2ModalInputChairTitle: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    },
                    stringLength: {
                        max: 25,
                        message: 'Уртдаа 25 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteScalar",
                data: '{"qry":"SELECT COUNT(1) FROM TBL_ROOMTITLE WHERE ROOM_ID=' + $('#setupTab1s2ModalSelectRoom option:selected').val() + ' AND CHAIR=' + $('#setupTab1s2ModalSelectChairNum option:selected').val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == '0') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                            data: '{"qry":"INSERT INTO TBL_ROOMTITLE (ROOM_ID, CHAIR, TITLE) VALUES (' + $('#setupTab1s2ModalSelectRoom option:selected').val() + ', ' + $('#setupTab1s2ModalSelectChairNum option:selected').val() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab1s2ModalInputChairTitle').val()))) + ')"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                dataBindTab1s2Table();
                                $('#setupTab1s2Modal').modal('hide');
                                smallBox('Өргөгчийн нэр', 'Амжилттай хадгалагдлаа', '#659265');
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
                            data: '{"qry":"UPDATE TBL_ROOMTITLE SET TITLE=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab1s2ModalInputChairTitle').val()))) + ' WHERE ROOM_ID=' + $('#setupTab1s2ModalSelectRoom option:selected').val() + ' AND CHAIR=' + $('#setupTab1s2ModalSelectChairNum option:selected').val() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                dataBindTab1s2Table();
                                $('#setupTab1s2Modal').modal('hide');
                                smallBox('Өргөгчийн нэр', 'Амжилттай хадгалагдлаа', '#659265');
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
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
    });
    //tab4
    $('#setupTab4ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            setupTab4ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 25,
                        message: 'Уртдаа 25 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#setupTab4ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_REQUESTTYPE (CLINIC_ID, NAME) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab4ModalInputName').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab4Table();
                        $('#setupTab4Modal').modal('hide');
                        smallBox('Үйлчлүүлэгчийн хүсэлт', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_REQUESTTYPE SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab4ModalInputName').val()))) + ' WHERE ID=' + $('#tab4ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab4Table();
                        $('#setupTab4Modal').modal('hide');
                        smallBox('Үйлчлүүлэгчийн хүсэлт', 'Амжилттай хадгалагдлаа', '#659265');
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
    
    //tab6
    $('#setupTab6ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            setupTab6ModalInputName: {
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
            },
            setupTab6ModalInputPrice: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 10,
                        message: 'Уртдаа 10 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Тоон тэмдэгт орно'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#setupTab6ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_DIAGNOSTICTYPE (CLINIC_ID, NAME, PRICE) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab6ModalInputName').val()))) + ', ' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#setupTab6ModalInputPrice').val()))) + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab6Table();
                        $('#setupTab6Modal').modal('hide');
                        smallBox('Оношлогооны төрөл', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_DIAGNOSTICTYPE SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab6ModalInputName').val()))) + ', PRICE=' + strQryIsNull('numeric', replaceDisplayToDatabase($.trim($('#setupTab6ModalInputPrice').val()))) + ' WHERE ID=' + $('#tab6ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab6Table();
                        $('#setupTab6Modal').modal('hide');
                        smallBox('Оношлогооны төрөл', 'Амжилттай хадгалагдлаа', '#659265');
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
    //tab7
    $('#setupTab7ModalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            setupTab7ModalInputName: {
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
            var valIsPrice = 0;
            if ($('#setupTab7ModalInputIsPrice').is(':checked')) valIsPrice = 1;
            if ($('#setupTab7ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                    data: '{"qry":"INSERT INTO TBL_REPAIRTYPE (CLINIC_ID, NAME, ISPRICE) VALUES (' + $('#indexClinicId').text() + ', ' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab7ModalInputName').val()))) + ', ' + valIsPrice + ')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab7Table();
                        $('#setupTab7Modal').modal('hide');
                        smallBox('Засвар үйлчилгээний төрөл', 'Амжилттай хадгалагдлаа', '#659265');
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
                    data: '{"qry":"UPDATE TBL_REPAIRTYPE SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab7ModalInputName').val()))) + ', ISPRICE=' + valIsPrice + ' WHERE ID=' + $('#tab7ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab7Table();
                        $('#setupTab7Modal').modal('hide');
                        smallBox('Засвар үйлчилгээний төрөл', 'Амжилттай хадгалагдлаа', '#659265');
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
    //tab8 section1
    $('#setupTab8Section1Form').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            setupTab8Section1InputName: {
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
            setupTab8Section1InputAddr: {
                validators: {
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            setupTab8Section1InputTel1: {
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Тоон тэмдэгт орно'
                    }
                }
            },
            setupTab8Section1InputTel2: {
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Тоон тэмдэгт орно'
                    }
                }
            },
            setupTab8Section1InputEmail: {
                validators: {
                    emailAddress: {
                        message: 'Имэйл зөв оруулна уу'
                    }
                }
            },
            setupTab8Section1InputWeb: {
                validators: {
                    uri: {
                        message: 'Вэб хаяг зөв оруулна уу'
                    }
                }
            },
            setupTab8Section1InputFb: {
                validators: {
                    uri: {
                        message: 'Фэйсбүүк хаяг зөв оруулна уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            var filename = '';
            if ($("#setupTab8Section1InputImg").val() != '') {
                var uploadfiles = $("#setupTab8Section1InputImg").get(0);
                var uploadedfiles = uploadfiles.files;
                filename = 'clinic' + $('#indexClinicId').text() + 'logo.jpg';
            }
            else {
                if ($('#staffModalImgStaffImage').attr('src') == '../img/no_image_available.jpg') filename = '';
                else filename = 'clinic' + $('#indexClinicId').text() + 'logo.jpg';
            }
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
                data: '{"qry":"UPDATE TBL_CLINIC SET NAME=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab8Section1InputName').val()))) + ', ADDR=' + strQryIsNull('nvarchar', replaceDisplayToDatabase($.trim($('#setupTab8Section1InputAddr').val()))) + ', TEL=' + strQryIsNull('numeric', $.trim($('#setupTab8Section1InputTel1').val())) + ', TEL2=' + strQryIsNull('numeric', $.trim($('#setupTab8Section1InputTel2').val())) + ', EMAIL=' + strQryIsNull('nvarchar', $.trim($('#setupTab8Section1InputEmail').val())) + ', WEB=' + strQryIsNull('nvarchar', $.trim($('#setupTab8Section1InputWeb').val())) + ', FB=' + strQryIsNull('nvarchar', $.trim($('#setupTab8Section1InputFb').val())) + ', LOGO=' + strQryIsNull('nvarchar', filename) + ' WHERE ID=' + $('#indexClinicId').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    if ($("#setupTab8Section1InputImg").val() != '') {
                        var uploadfiles = $("#setupTab8Section1InputImg").get(0);
                        var uploadedfiles = uploadfiles.files;
                        var fromdata = new FormData();
                        fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                        var choice = {};
                        choice.url = "pg/uploadFile.ashx?fileurl=files/cliniclogo&filename=" + filename;
                        choice.type = "POST";
                        choice.data = fromdata;
                        choice.contentType = false;
                        choice.processData = false;
                        choice.success = function (result) {
                            if (result == "1") {
                                smallBox('Байгууллагын ерөнхий мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                            }
                            else {
                                smallBox('Байгууллагын ерөнхий мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                                alert('Зураг хадгалахад алдаа гарлаа: ' + result);
                            }
                        };
                        choice.error = function (err) { alert('Зураг хадгалахад алдаа гарлаа: ' + err.statusText); };
                        globalAjaxVar = $.ajax(choice);
                        event.preventDefault();
                    }
                    else {
                        smallBox('Байгууллагын ерөнхий мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
                    }
                    $('#indexClinicName').html($.trim($('#setupTab8Section1InputName').val()));
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

    //таб8
    $("#setupTab8Section1InputImg").change(function () {
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
    function showImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#setupTab8Section1ImgLogo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    //tab9
    $("#setupTab3SelectJobPosition1, #setupTab3SelectJobPosition2, #setupTab3SelectJobPosition3").change(function () {
        var valSelected = $(this).val(), valDataValue = $(this).attr('data-value');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/ExecuteNonQuery",
            data: '{"qry":"UPDATE TBL_JOBPOSITION SET STAFF_POSITION_ID=' + strQryIsNull('numeric', $(this).val()) + ' WHERE ID = ' + $(this).attr('data-value') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                $('#setupTab3DivJobPosition' + valSelected + 'Val').attr('data-value', valDataValue);
                smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
</script>
