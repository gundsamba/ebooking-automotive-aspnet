<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rprt2.aspx.cs" Inherits="ebooking.pg.rprt2" %>
<style>
    .hideCal>.ui-datepicker-calendar {
    display: none;
    }
</style>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-medkit fa-fw "></i> 
			<span lang="mn">Статистик тайлан</span>
		</h1>
	</div>
</div>
<section id="widget-grid" class="">
    <div class="row">
	    <div class="col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs bordered">
			    <li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
				    <a href="#s1" data-toggle="tab" lang="mn">Цаг авалтын статистик тайлан</a>
			    </li>
			    <li id="pTab2Li" onclick="pDatabindTabs(this)">
				    <a href="#s2" data-toggle="tab" lang="mn">Орлогын статистик тайлан</a>
			    </li>
			    <li id="pTab3Li" onclick="pDatabindTabs(this)">
				    <a href="#s3" data-toggle="tab" lang="mn">Бүртгэлтэй автомашины тоо /маркаар/</a>
			    </li>
			    <li id="pTab4Li" onclick="pDatabindTabs(this)">
				    <a href="#s4" data-toggle="tab" lang="mn">Хамгийн</a>
			    </li>
			    <li id="pTab5Li" onclick="pDatabindTabs(this)">
				    <a href="#s5" data-toggle="tab" lang="mn">Захиалгын дэлгэрэнгүй</a>
			    </li>
		    </ul>
            <div id="myTabContent1" class="tab-content">
				<div class="tab-pane fade in active" id="s1">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:50px; float: left; padding-top: 6px;" lang="mn">Төрөл:</div>
                                <div style="width:80px; float: left; margin-right: 10px;">
                                    <select id="rprt2Tab1SelectType" runat="server" class="form-control" style="padding:1px;"><option value="1" lang="mn">Өдрөөр</option><option value="2" lang="mn">Сараар</option></select>
                                </div>
                                <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                <div id="rprt2Tab1SelectStartDate1Div" style="width:120px; float: left; margin-right: 10px; display:block;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab1SelectStartDate1" runat="server" type="text" name="rprt2Tab1SelectStartDate1">
                                    </label>
                                </div>
                                <div id="rprt2Tab1SelectStartDate2Div" style="width:120px; float: left; margin-right: 10px; display:none;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab1SelectStartDate2" runat="server" type="text" name="rprt2Tab1SelectStartDate2">
                                    </label>
                                </div>
                                <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                <div id="rprt2Tab1SelectEndDate1Div" style="width:120px; float: left; margin-right: 10px; display:block;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab1SelectEndDate1" runat="server" type="text" name="rprt2Tab1SelectEndDate1">
                                    </label>
                                </div>
                                <div id="rprt2Tab1SelectEndDate2Div" style="width:120px; float: left; margin-right: 10px; display:none;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab1SelectEndDate2" runat="server" type="text" name="rprt2Tab1SelectEndDate2">
                                    </label>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab1', 'Цаг авалтын статистик тайлан')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab1')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab1')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="loaderTab1" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab1" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <span lang="mn">Цаг авалтын статистик тайлан</span> /<label id="rprt2Tab1BeginDate" runat="server"></label> - <label id="rprt2Tab1EndDate" runat="server"></label>, <label id="rprt2Tab1Type" lang="mn">Өдрөөр</label>/
                            </div>
						    <div id="divrprt2Tab1Chart" class="chart no-padding"></div>
						    <div id="divrprt2Tab1Table" class="no-padding"></div>
                        </div>
                    </div>
                </div>
				<div class="tab-pane fade in" id="s2">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:50px; float: left; padding-top: 6px;" lang="mn">Төрөл:</div>
                                <div style="width:80px; float: left; margin-right: 10px;">
                                    <select id="rprt2Tab2SelectType" runat="server" class="form-control" style="padding:1px;"><option value="1" lang="mn">Өдрөөр</option><option value="2" lang="mn">Сараар</option></select>
                                </div>
                                <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                <div id="rprt2Tab2SelectStartDate1Div" style="width:120px; float: left; margin-right: 10px; display:block;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab2SelectStartDate1" runat="server" type="text" name="rprt2Tab2SelectStartDate1">
                                    </label>
                                </div>
                                <div id="rprt2Tab2SelectStartDate2Div" style="width:120px; float: left; margin-right: 10px; display:none;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab2SelectStartDate2" runat="server" type="text" name="rprt2Tab2SelectStartDate2">
                                    </label>
                                </div>
                                <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                <div id="rprt2Tab2SelectEndDate1Div" style="width:120px; float: left; margin-right: 10px; display:block;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab2SelectEndDate1" runat="server" type="text" name="rprt2Tab2SelectEndDate1">
                                    </label>
                                </div>
                                <div id="rprt2Tab2SelectEndDate2Div" style="width:120px; float: left; margin-right: 10px; display:none;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab2SelectEndDate2" runat="server" type="text" name="rprt2Tab2SelectEndDate2">
                                    </label>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab2', 'Орлогын статистик тайлан')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab2')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab2')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div>                            
                        </div>
                        <div id="loaderTab2" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab2" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <span lang="mn">Орлогын статистик тайлан</span> /<label id="rprt2Tab2BeginDate" runat="server"></label> - <label id="rprt2Tab2EndDate" runat="server"></label>, <label id="rprt2Tab2Type" lang="mn">Өдрөөр</label>/
                            </div>
						    <div id="divrprt2Tab2Chart" class="chart no-padding"></div>
						    <div id="divrprt2Tab2Table" class="no-padding"></div>
                        </div>
                    </div>
                </div>
				<div class="tab-pane fade in" id="s3">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                &nbsp;
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab3', 'Бүртгэлтэй машины тоо')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab3')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab3')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div>                            
                        </div>
                        <div id="loaderTab3" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab3" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div id="divrprt2Tab3Table" runat="server" class="no-padding"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="s4">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:50px; float: left; padding-top: 6px;" lang="mn">Төрөл:</div>
                                <div style="width:200px; float: left; margin-right: 10px;">
                                    <select id="rprt2Tab4SelectType" runat="server" class="form-control" style="padding:1px;"><option value="1" lang="mn">Борлуулагдсан сэлбэг</option><option value="2" lang="mn">Авсан засвар үйлчилгээ</option><option value="3" lang="mn">Оношлуулсан оношлогоо</option><option value="4" lang="mn">Авсан үйлчлүүлэгчийн хүсэлт</option></select>
                                </div>
                                <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                <div id="rprt2Tab4SelectStartDate1Div" style="width:120px; float: left; margin-right: 10px; display:block;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab4SelectStartDate1" runat="server" type="text" name="rprt2Tab4SelectStartDate1">
                                    </label>
                                </div>
                                <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                <div id="rprt2Tab4SelectEndDate1Div" style="width:120px; float: left; margin-right: 10px; display:block;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab4SelectEndDate1" runat="server" type="text" name="rprt2Tab4SelectEndDate1">
                                    </label>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab4', 'Хамгийн')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab4')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab4')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div>                            
                        </div>
                        <div id="loaderTab4" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab4" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <span lang="mn">Хамгийн их</span> <label id="rprt2Tab4TypeLabel" runat="server" lang="mn">Борлуулагдсан сэлбэг</label> /<label id="rprt2Tab4BeginDate" runat="server"></label> - <label id="rprt2Tab4EndDate" runat="server"></label>/
                            </div>
						    <div id="divrprt2Tab4Table" class="no-padding"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="s5">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:5%; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                <div id="rprt2Tab5SelectStartDate1Div" style="width:120px; float: left; margin-right: 10px; display:block;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab5SelectStartDate1" runat="server" type="text" name="rprt2Tab4SelectStartDate1">
                                    </label>
                                </div>
                                <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                <div id="rprt2Tab5SelectEndDate1Div" style="width:120px; float: left; margin-right: 10px; display:block;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt2Tab5SelectEndDate1" runat="server" type="text" name="rprt2Tab4SelectEndDate1">
                                    </label>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab5')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab5')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </div> 
                        </div>
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div style="width:5%; float: left; padding-top: 6px;" lang="mn">Үзүүлэлт:</div>
                            <div style="width:90%; float: left; margin-right: 10px; display:block;">
                                <select id="rprt2Tab5Select2Uzuulelt" name="rprt2Tab5Select2Uzuulelt" multiple="multiple" style="width:100%" data-placeholder="Үзүүлэлт сонго">
                                    <option selected="selected" value="b.NUM as 'Захиалгын дугаар'">Захиалгын дугаар</option>
                                    <option value="CASE WHEN b.APPOINTMENTTYPE=1 THEN N'Биечлэн' ELSE N'Утсаар' END AS 'Захиалгын төрөл'">Захиалгын төрөл</option>
                                    <option value="b.DT as 'Огноо'">Огноо</option>
                                    <option value="b.STARTTIME as 'Эхлэх цаг'">Эхлэх цаг</option>
                                    <option value="b.ENDTIME as 'Дуусах цаг'">Дуусах цаг</option>
                                    <option value="c.NAME as 'Заал'">Заал</option>
                                    <option value="b.CHAIRNUM as 'Өргөгч'">Өргөгч</option>
                                    <option value="f.NAME as 'Захиалгын төлөв'">Захиалгын төлөв</option>
                                    <option value="b.APPCANCELINFO as 'Цуцлагдсан тайлбар'">Цуцлагдсан тайлбар</option>
                                    <option value="a.REQUESTTYPELIST as 'Үйлчлүүлэгчийн хүсэлтийн төрөл'">Үйлчлүүлэгчийн хүсэлтийн төрөл</option>
                                    <option value="b.REQUESTMEMO as 'Үйлчүүлэгчийн хүсэлт'">Үйлчлүүлэгчийн хүсэлт</option>
                                    <option value="d.CODE as 'Үйлчүүлэгчийн код'">Үйлчлүүлэгчийн код</option>
                                    <option value="d.AUTONO as 'Улсын дугаар'">Улсын дугаар</option>
                                    <option value="h.NAME as 'Үйлдвэрлэгч'">Үйлдвэрлэгч</option>
                                    <option value="g.NAME as 'Автомашины загвар'">Автомашины загвар</option>
                                    <option value="d.PRODUCEDYEAR as 'Үйлдвэрлэсэн он'">Үйлдвэрлэсэн он</option>
                                    <option value="d.VINNO as 'Аралын дугаар'">Аралын дугаар</option>
                                    <option value="CASE WHEN d.FUELTYPE=1 THEN N'Бензин' ELSE N'Дизель' END AS 'Шатхууны төрөл'">Шатахууны төрөл</option>
                                    <option value="d.VINNO as 'Аралын дугаар'">Аралын дугаар</option>
                                    <option value="CASE WHEN d.TRANSMISSIONTYPE=1 THEN N'Автомат' ELSE N'Механик' END AS 'Хурдны хайрцаг'">Хурдны хайрцаг</option>
                                    <option value="CASE WHEN d.ZAALTTYPE=1 THEN N'Мил' ELSE N'Км' END AS 'Заалтын төрөл'">Заалтын төрөл</option>
                                    <option value="b.MILEAGE AS 'Заалт'">Заалт</option>
                                    <option value="d.NAME as 'Эзэмшигчийн нэр'">Эзэмшигчийн нэр</option>
                                    <option value="d.TEL as 'Утас 1'">Утас 1</option>
                                    <option value="d.TEL2 as 'Утас 2'">Утас 2</option>
                                    <option value="CASE WHEN d.TYPE=1 THEN N'Хувь хүн' ELSE N'Байгууллага' END AS 'Эзэмшигчийн төрөл'">Эзэмшигч төрөл</option>
                                    <option value="d.ADDRESS as 'Хаяг'">Хаяг</option>
                                    <%--<option value="d.EMERGENCYTEL as 'Яаралтай үед холбогдох утас'">Яаралтай үед холбогдох хүний утас</option>
                                    <option value="CASE WHEN d.EMERGENCYTEL=1 THEN N'Ажил' ELSE CASE WHEN d.EMERGENCYTEL=2 THEN N'Гэр' ELSE N'Бусад' END END AS 'Яаралтай үед холбогдох утасны төрөл'">Яаралтай үед холбогдох хүний утасны төрөл</option>
                                    <option value="d.EMERGENCYPERSONNAME as 'Хэн болох'">Хэн болох</option>--%>
                                    <option value="d.EMAIL as 'Емайл'">Имэйл</option>
                                </select>
                                <script>$("#rprt2Tab5Select2Uzuulelt").select2();</script>
                            </div>
                            <div style="width:4%; float: left; padding-top: 0;" lang="mn">
                                <button id="rprt2Tab5ButtonShow" type="button" class="btn btn-primary btn-sm btn-block">
								    Харах
							    </button>
                            </div>
                        </div>
                        <div id="loaderTab5" class="loader-background">
                            <img width="64" height="" src="img/loading.gif">
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                        </div>
                        <div id="divpTab5" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <span lang="mn">ЗАХИАЛГЫН ДЭЛГЭРЭНГҮЙ ТАЙЛАН</span> /<label id="rprt2Tab5BeginDate" runat="server"></label> - <label id="rprt2Tab5EndDate" runat="server"></label>/
                            </div>
						    <div id="divrprt2Tab5Table" class="no-padding"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">
    var plot_1, plot_2;
    var $chrt_border_color = "#efefef";
    var $chrt_grid_color = "#DDD"
    var $chrt_main = "#E24913";			/* red       */
    var $chrt_second = "#6595b4";		/* blue      */
    var $chrt_third = "#FF9F01";		/* orange    */
    var $chrt_fourth = "#7e9d3a";		/* green     */
    var $chrt_fifth = "#BD362F";		/* dark red  */
    var $chrt_mono = "#000";
    var globalAjaxVar = null;
    pageSetUp();
    var pagefunction = function () {
        dataBindTab1Chart();
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
            if ($.trim($('#divrprt2Tab1Table').html()) == "") {
                dataBindTab1Chart();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#divrprt2Tab2Table').html()) == "") {
                dataBindTab2Chart();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab4Li') {
            if ($.trim($('#divrprt2Tab4Table').html()) == "") {
                dataBindTab4Datatable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab5Li') {
            if ($.trim($('#divrprt2Tab5Table').html()) == "") {
                dataBindTab5Datatable();
            }
        }
    }

    function dataBindTab1Chart() {
        var valData = '';
        var strHead = "", strBody = "";
        var rwCnt = 1;
        showLoader('loaderTab1');
        var varData = '';
        if ($('#rprt2Tab1SelectType option:selected').val() == '1') {
            $('#rprt2Tab1SelectStartDate1Div').css('display', 'block');
            $('#rprt2Tab1SelectStartDate2Div').css('display', 'none');
            $('#rprt2Tab1SelectEndDate1Div').css('display', 'block');
            $('#rprt2Tab1SelectEndDate2Div').css('display', 'none');
            varData = '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt2Tab1SelectStartDate1').val() + '", "enddate":"' + $('#rprt2Tab1SelectEndDate1').val() + '", "type":"' + $('#rprt2Tab1SelectType option:selected').val() + '"}';
        }
        else if ($('#rprt2Tab1SelectType option:selected').val() == '2') {
            $('#rprt2Tab1SelectStartDate1Div').css('display', 'none');
            $('#rprt2Tab1SelectStartDate2Div').css('display', 'block');
            $('#rprt2Tab1SelectEndDate1Div').css('display', 'none');
            $('#rprt2Tab1SelectEndDate2Div').css('display', 'block');
            varData = '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt2Tab1SelectStartDate2').val() + '", "enddate":"' + $('#rprt2Tab1SelectEndDate2').val() + '", "type":"' + $('#rprt2Tab1SelectType option:selected').val() + '"}';
        }
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt2Tab1Datatable",
            data: varData,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                strHead = "";
                strBody = "";
                rwCnt = 1;
                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 12px arial, sans-serif; width: 100%;\"><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (rwCnt > 25) {
                        rwCnt = 1;
                        valData += strHead + "</tr>" + strBody + "</tr>";
                    }
                    if (rwCnt == 1) {
                        strHead = "<tr style=\"background-color:#C6D9F1; color:#666666;\"><td style=\"border: 1px solid #DDD; padding:10px 5px; text-align:center;\">" + value.EPOCHDT + "</td>";
                        strBody = "<tr><td style=\"border: 1px solid #DDD; padding:10px 5px; text-align:right;\">" + value.SUMPRICE + "</td>";
                    }
                    else {

                        strHead += "<td style=\"border: 1px solid #DDD; padding:10px 5px; text-align:center;\">" + value.EPOCHDT + "</td>";
                        strBody += "<td style=\"border: 1px solid #DDD; padding:10px 5px; text-align:right;\">" + value.SUMPRICE + "</td>";
                    }
                    rwCnt++;
                });
                valData += strHead + "</tr>" + strBody + "</tr>";
                valData += "</tbody></table>";
                $("#divrprt2Tab1Table").html(valData);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/Rprt2Tab1Chart",
                    data: varData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var d1 = $.parseJSON(data.d);
                        for (var i = 0; i < d1.length; ++i)
                            d1[i][0] += 60 * 60 * 1000;
                        var options = {
                            xaxis: {
                                mode: "time",
                                tickLength: 5
                            },
                            series: {
                                lines: {
                                    show: true,
                                    lineWidth: 1,
                                    fill: true,
                                    fillColor: {
                                        colors: [{
                                            opacity: 0.1
                                        }, {
                                            opacity: 0.15
                                        }]
                                    }
                                },
                                //points: { show: true },
                                shadowSize: 0
                            },
                            selection: {
                                mode: "x"
                            },
                            grid: {
                                hoverable: true,
                                clickable: true,
                                tickColor: $chrt_border_color,
                                borderWidth: 0,
                                borderColor: $chrt_border_color,
                            },
                            tooltip: true,
                            tooltipOpts: {
                                content: "<b>%x</b>: <span>%y</span>",
                                dateFormat: "%y-%m-%d",
                                defaultTheme: false
                            },
                            colors: [$chrt_second],
                        };
                        //plot_1 = $.plot($("#divrprt2Tab1Chart"), [d1], options);
                        $.plot($("#divrprt2Tab1Chart"), [d1], options);
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
    function dataBindTab2Chart() {
        var valData = '';
        var strHead = "", strBody = "";
        var rwCnt = 1;
        showLoader('loaderTab2');
        var varData = '';
        if ($('#rprt2Tab2SelectType option:selected').val() == '1') {
            $('#rprt2Tab2SelectStartDate1Div').css('display', 'block');
            $('#rprt2Tab2SelectStartDate2Div').css('display', 'none');
            $('#rprt2Tab2SelectEndDate1Div').css('display', 'block');
            $('#rprt2Tab2SelectEndDate2Div').css('display', 'none');
            varData = '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt2Tab2SelectStartDate1').val() + '", "enddate":"' + $('#rprt2Tab2SelectEndDate1').val() + '", "type":"' + $('#rprt2Tab2SelectType option:selected').val() + '"}';
        }
        else if ($('#rprt2Tab2SelectType option:selected').val() == '2') {
            $('#rprt2Tab2SelectStartDate1Div').css('display', 'none');
            $('#rprt2Tab2SelectStartDate2Div').css('display', 'block');
            $('#rprt2Tab2SelectEndDate1Div').css('display', 'none');
            $('#rprt2Tab2SelectEndDate2Div').css('display', 'block');
            varData = '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt2Tab2SelectStartDate2').val() + '", "enddate":"' + $('#rprt2Tab2SelectEndDate2').val() + '", "type":"' + $('#rprt2Tab2SelectType option:selected').val() + '"}';
        }
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt2Tab2Datatable",
            data: varData,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                strHead = "";
                strBody = "";
                rwCnt = 1;
                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 12px arial, sans-serif; width: 100%;\"><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (rwCnt > 25) {
                        rwCnt = 1;
                        valData += strHead + "</tr>" + strBody + "</tr>";
                    }
                    if (rwCnt == 1) {
                        strHead = "<tr style=\"background-color:#C6D9F1; color:#666666;\"><td style=\"border: 1px solid #DDD; padding:10px 5px; text-align:center;\">" + value.EPOCHDT + "</td>";
                        strBody = "<tr><td style=\"border: 1px solid #DDD; padding:10px 5px; text-align:right;\">" + value.SUMPRICE + "</td>";
                    }
                    else {

                        strHead += "<td style=\"border: 1px solid #DDD; padding:10px 5px; text-align:center;\">" + value.EPOCHDT + "</td>";
                        strBody += "<td style=\"border: 1px solid #DDD; padding:10px 5px; text-align:right;\">" + value.SUMPRICE + "</td>";
                    }
                    rwCnt++;
                });
                valData += strHead + "</tr>" + strBody + "</tr>";
                valData += "</tbody></table>";
                $("#divrprt2Tab2Table").html(valData);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../wcf/ServiceMain.svc/Rprt2Tab2Chart",
                    data: varData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var d2 = $.parseJSON(data.d);
                        for (var i = 0; i < d2.length; ++i)
                            d2[i][0] += 60 * 60 * 1000;
                        var options = {
                            xaxis: {
                                mode: "time",
                                tickLength: 5
                            },
                            series: {
                                lines: {
                                    show: true,
                                    lineWidth: 1,
                                    fill: true,
                                    fillColor: {
                                        colors: [{
                                            opacity: 0.1
                                        }, {
                                            opacity: 0.15
                                        }]
                                    }
                                },
                                //points: { show: true },
                                shadowSize: 0
                            },
                            selection: {
                                mode: "x"
                            },
                            grid: {
                                hoverable: true,
                                clickable: true,
                                tickColor: $chrt_border_color,
                                borderWidth: 0,
                                borderColor: $chrt_border_color,
                            },
                            tooltip: true,
                            tooltipOpts: {
                                content: "<b>%x</b>: <span>₮%y</span>",
                                dateFormat: "%y-%m-%d",
                                defaultTheme: false
                            },
                            colors: [$chrt_second],
                        };
                        //plot_2 = $.plot($("#divrprt2Tab2Chart"), [d2], options);
                        $.plot($("#divrprt2Tab2Chart"), [d2], options);
                        hideLoader('loaderTab2');
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
    function dataBindTab4Datatable() {
        var valData = '', strHead = "";
        showLoader('loaderTab4');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt2Tab4Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt2Tab4SelectStartDate1').val() + '", "enddate":"' + $('#rprt2Tab4SelectEndDate1').val() + '", "type":"' + $('#rprt2Tab4SelectType option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                strHead = "";
                if ($('#rprt2Tab4SelectType option:selected').val() == "1") {
                    strHead = "<thead><tr style=\"background-color:#C6D9F1; color:#666666;\"><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">#</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Төрөл</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Код</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нэр</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Тайлбар</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Үнэ</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">ТОО</th></tr></thead>";
                }
                else if ($('#rprt2Tab4SelectType option:selected').val() == "2") {
                    strHead = "<thead><tr style=\"background-color:#C6D9F1; color:#666666;\"><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">#</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Төрөл</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Код</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нэр</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Тайлбар</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Үнэ</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">ТОО</th></tr></thead>";
                }
                else if ($('#rprt2Tab4SelectType option:selected').val() == "3") {
                    strHead = "<thead><tr style=\"background-color:#C6D9F1; color:#666666;\"><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">#</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нэр</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">ТОО</th></tr></thead>";
                }
                else if ($('#rprt2Tab4SelectType option:selected').val() == "4") {
                    strHead = "<thead><tr style=\"background-color:#C6D9F1; color:#666666;\"><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">#</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Нэр</th><th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">ТОО</th></tr></thead>";
                }
                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 12px arial, sans-serif; width: 100%;\">" + strHead;
                $($.parseJSON(data.d)).each(function (index, value) {
                    if ($('#rprt2Tab4SelectType option:selected').val() == "1") valData += "<tr><td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.RW + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.PART_TYPE_NAME) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.PART_CODE) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.PART_NAME) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.PART_DESCRIPTION) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + value.PART_PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.SUMCNT + "</td></tr>";
                    else if ($('#rprt2Tab4SelectType option:selected').val() == "2") valData += "<tr><td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.RW + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.SERVICE_TYPE_NAME) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.SERVICE_CODE) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.SERVICE_NAME) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.SERVICE_DESCRIPTION) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + value.SERVICE_PRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.SUMCNT + "</td></tr>";
                    else if ($('#rprt2Tab4SelectType option:selected').val() == "3") valData += "<tr><td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.RW + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.DIAGNOSTICTYPE_NAME) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.CNT + "</td></tr>";
                    else if ($('#rprt2Tab4SelectType option:selected').val() == "4") valData += "<tr><td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.RW + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:left;\">" + replaceDatabaseToDisplay(value.REQUESTTYPE_NAME) + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.CNT + "</td></tr>";
                });
                valData += "</tbody></table>";
                $("#divrprt2Tab4Table").html(valData);
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
    function dataBindTab5Datatable() {
        showLoader('loaderTab5');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt2Tab5Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt2Tab5SelectStartDate1').val() + '", "enddate":"' + $('#rprt2Tab5SelectEndDate1').val() + '", "uzuulelt":"' + $('#rprt2Tab5Select2Uzuulelt').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#divrprt2Tab5Table").html(replaceDatabaseToDisplay(data.d));
                $('#rprt2Tab5BeginDate').text($('#rprt2Tab5SelectStartDate1').val());
                $('#rprt2Tab5EndDate').text($('#rprt2Tab5SelectEndDate1').val());
                hideLoader('loaderTab5');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#rprt2Tab1SelectType").change(function () {
        if ($('#rprt2Tab1SelectType option:selected').val() == '1') {
            $('#rprt2Tab1BeginDate').text($('#rprt2Tab1SelectStartDate1').val());
            $('#rprt2Tab1EndDate').text($('#rprt2Tab1SelectEndDate1').val());
        }
        else if ($('#rprt2Tab1SelectType option:selected').val() == '2') {
            $('#rprt2Tab1BeginDate').text($('#rprt2Tab1SelectStartDate2').val());
            $('#rprt2Tab1EndDate').text($('#rprt2Tab1SelectEndDate2').val());
        }
        dataBindTab1Chart();
        $('#rprt2Tab1Type').html($('#rprt2Tab1SelectType option:selected').text());
    });
    $("#rprt2Tab2SelectType").change(function () {
        if ($('#rprt2Tab2SelectType option:selected').val() == '1') {
            $('#rprt2Tab2BeginDate').text($('#rprt2Tab2SelectStartDate1').val());
            $('#rprt2Tab2EndDate').text($('#rprt2Tab2SelectEndDate1').val());
        }
        else if ($('#rprt2Tab2SelectType option:selected').val() == '2') {
            $('#rprt2Tab2BeginDate').text($('#rprt2Tab2SelectStartDate2').val());
            $('#rprt2Tab2EndDate').text($('#rprt2Tab2SelectEndDate2').val());
        }
        dataBindTab2Chart();
        $('#rprt2Tab2Type').html($('#rprt2Tab2SelectType option:selected').text());
    });
    $("#rprt2Tab4SelectType").change(function () {
        $('#rprt2Tab4BeginDate').text($('#rprt2Tab4SelectStartDate1').val());
        $('#rprt2Tab4EndDate').text($('#rprt2Tab4SelectEndDate1').val());
        $('#rprt2Tab4TypeLabel').html($('#rprt2Tab4SelectType option:selected').text());
        dataBindTab4Datatable();
    });
    $("#rprt2Tab5ButtonShow").click(function () {
        if ($.trim($('#rprt2Tab5SelectStartDate1').val()) == "") alert("Эхлэх огноо оруулна уу!");
        else {
            if ($.trim($('#rprt2Tab5SelectEndDate1').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                if ($('#rprt2Tab5Select2Uzuulelt').val() == null) alert('Үзүүлэлт заавал сонгоно уу!');
                else {
                    var isNum = 0;
                    for (var i = 0; i < $('#rprt2Tab5Select2Uzuulelt').val().toString().split(',').length; i++) {
                        if ($('#rprt2Tab5Select2Uzuulelt').val().toString().split(',')[i] == "b.NUM as 'Захиалгын дугаар'") {
                            isNum = 1;
                            break;
                        }
                    }
                    if (isNum == 0) alert('Захиалгын дугаар заавал сонгоно уу!');
                    else {
                        dataBindTab5Datatable();
                    }
                }
            }
        }
    });
    function dateChangedTab1_1() {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt2Tab1SelectStartDate1") {
            if ($.trim($('#rprt2Tab1SelectEndDate1').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt2Tab1SelectEndDate1').val().split('-')[0], $('#rprt2Tab1SelectEndDate1').val().split('-')[1], $('#rprt2Tab1SelectEndDate1').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab1Chart();
                    $('#rprt2Tab1BeginDate').text($(this).val());
                    $('#rprt2Tab1EndDate').text($('#rprt2Tab1SelectEndDate1').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt2Tab1SelectEndDate1") {
            if ($.trim($('#rprt2Tab1SelectStartDate1').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt2Tab1SelectStartDate1').val().split('-')[0], $('#rprt2Tab1SelectStartDate1').val().split('-')[1], $('#rprt2Tab1SelectStartDate1').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab1Chart();
                    $('#rprt2Tab1BeginDate').text($('#rprt2Tab1SelectStartDate1').val());
                    $('#rprt2Tab1EndDate').text($(this).val());
                }
            }
        }
    }
    function dateChangedTab1_2() {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt2Tab1SelectStartDate2") {
            if ($.trim($('#rprt2Tab1SelectEndDate2').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt2Tab1SelectEndDate2').val().split('-')[0], $('#rprt2Tab1SelectEndDate2').val().split('-')[1], $('#rprt2Tab1SelectEndDate2').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab1Chart();
                    $('#rprt2Tab1BeginDate').text($(this).val());
                    $('#rprt2Tab1EndDate').text($('#rprt2Tab1SelectEndDate2').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt2Tab1SelectEndDate2") {
            if ($.trim($('#rprt2Tab1SelectStartDate2').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt2Tab1SelectStartDate2').val().split('-')[0], $('#rprt2Tab1SelectStartDate2').val().split('-')[1], $('#rprt2Tab1SelectStartDate2').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab1Chart();
                    $('#rprt2Tab1BeginDate').text($('#rprt2Tab1SelectStartDate2').val());
                    $('#rprt2Tab1EndDate').text($(this).val());
                }
            }
        }
    }
    function dateChangedTab2_1() {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt2Tab2SelectStartDate1") {
            if ($.trim($('#rprt2Tab2SelectEndDate1').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt2Tab2SelectEndDate1').val().split('-')[0], $('#rprt2Tab2SelectEndDate1').val().split('-')[1], $('#rprt2Tab2SelectEndDate1').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab2Chart();
                    $('#rprt2Tab2BeginDate').text($(this).val());
                    $('#rprt2Tab2EndDate').text($('#rprt2Tab2SelectEndDate1').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt2Tab2SelectEndDate1") {
            if ($.trim($('#rprt2Tab2SelectStartDate1').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt2Tab2SelectStartDate1').val().split('-')[0], $('#rprt2Tab2SelectStartDate1').val().split('-')[1], $('#rprt2Tab2SelectStartDate1').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab2Chart();
                    $('#rprt2Tab2BeginDate').text($('#rprt2Tab2SelectStartDate1').val());
                    $('#rprt2Tab2EndDate').text($(this).val());
                }
            }
        }
    }
    function dateChangedTab2_2() {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt2Tab2SelectStartDate2") {
            if ($.trim($('#rprt2Tab2SelectEndDate2').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt2Tab2SelectEndDate2').val().split('-')[0], $('#rprt2Tab2SelectEndDate2').val().split('-')[1], $('#rprt2Tab2SelectEndDate2').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab2Chart();
                    $('#rprt2Tab2BeginDate').text($(this).val());
                    $('#rprt2Tab2EndDate').text($('#rprt2Tab2SelectEndDate2').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt2Tab2SelectEndDate2") {
            if ($.trim($('#rprt2Tab2SelectStartDate2').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt2Tab2SelectStartDate2').val().split('-')[0], $('#rprt2Tab2SelectStartDate2').val().split('-')[1], $('#rprt2Tab2SelectStartDate2').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab2Chart();
                    $('#rprt2Tab2BeginDate').text($('#rprt2Tab2SelectStartDate2').val());
                    $('#rprt2Tab2EndDate').text($(this).val());
                }
            }
        }
    }
    function dateChangedTab4() {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt2Tab4SelectStartDate1") {
            if ($.trim($('#rprt2Tab4SelectEndDate1').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt2Tab4SelectEndDate1').val().split('-')[0], $('#rprt2Tab4SelectEndDate1').val().split('-')[1], $('#rprt2Tab4SelectEndDate1').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab4Datatable();
                    $('#rprt2Tab4BeginDate').text($(this).val());
                    $('#rprt2Tab4EndDate').text($('#rprt2Tab4SelectEndDate1').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt2Tab4SelectEndDate1") {
            if ($.trim($('#rprt2Tab4SelectStartDate1').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt2Tab4SelectStartDate1').val().split('-')[0], $('#rprt2Tab4SelectStartDate1').val().split('-')[1], $('#rprt2Tab4SelectStartDate1').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab4Datatable();
                    $('#rprt2Tab4BeginDate').text($('#rprt2Tab4SelectStartDate1').val());
                    $('#rprt2Tab4EndDate').text($(this).val());
                }
            }
        }
    }
    function dateChangedTab5() {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt2Tab5SelectStartDate1") {
            if ($.trim($('#rprt2Tab5SelectEndDate1').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt2Tab5SelectEndDate1').val().split('-')[0], $('#rprt2Tab5SelectEndDate1').val().split('-')[1], $('#rprt2Tab5SelectEndDate1').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    
                }
            }
        }
        else if ($(this).attr('id') == "rprt2Tab5SelectEndDate1") {
            if ($.trim($('#rprt2Tab5SelectStartDate1').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt2Tab5SelectStartDate1').val().split('-')[0], $('#rprt2Tab5SelectStartDate1').val().split('-')[1], $('#rprt2Tab5SelectStartDate1').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    
                }
            }
        }
    }
    $('#rprt2Tab1SelectStartDate1, #rprt2Tab1SelectEndDate1').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab1_1).on('changeDate', dateChangedTab1_1);
    $('#rprt2Tab1SelectStartDate2, #rprt2Tab1SelectEndDate2').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        onClose: function (dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
            dateChangedTab1_2();
        }
    }).change(dateChangedTab1_2).on('changeDate', dateChangedTab1_2);
    $('#rprt2Tab2SelectStartDate1, #rprt2Tab2SelectEndDate1').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab2_1).on('changeDate', dateChangedTab2_1);
    $('#rprt2Tab2SelectStartDate2, #rprt2Tab2SelectEndDate2').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        onClose: function (dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
            dateChangedTab2_2();
        }
    }).change(dateChangedTab2_2).on('changeDate', dateChangedTab2_2);
    $('#rprt2Tab4SelectStartDate1, #rprt2Tab4SelectEndDate1').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab4).on('changeDate', dateChangedTab4);
    $('#rprt2Tab5SelectStartDate1, #rprt2Tab5SelectEndDate1').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab5).on('changeDate', dateChangedTab5);
    function weekendAreas(axes) {
        var markings = [];
        var d = new Date(axes.xaxis.min);
        d.setUTCDate(d.getUTCDate() - ((d.getUTCDay() + 1) % 7))
        d.setUTCSeconds(0);
        d.setUTCMinutes(0);
        d.setUTCHours(0);
        var i = d.getTime();
        do {
            markings.push({
                xaxis: {
                    from: i,
                    to: i + 2 * 24 * 60 * 60 * 1000
                }
            });
            i += 7 * 24 * 60 * 60 * 1000;
        } while (i < axes.xaxis.max);

        return markings;
    }

    loadScript("js/plugin/flot/jquery.flot.cust.min.js", function () {
        loadScript("js/plugin/flot/jquery.flot.resize.min.js", function () {
            loadScript("js/plugin/flot/jquery.flot.fillbetween.min.js", function () {
                loadScript("js/plugin/flot/jquery.flot.orderBar.min.js", function () {
                    loadScript("js/plugin/flot/jquery.flot.pie.min.js", function () {
                        loadScript("js/plugin/flot/jquery.flot.time.min.js", function () {
                            loadScript("js/plugin/flot/jquery.flot.tooltip.min.js", function () {
                                loadScript("js/plugin/morris/raphael.min.js", function () {
                                    loadScript("js/plugin/morris/morris.min.js", pagefunction);
                                });
                            });
                        });
                    });
                });
            });
        });
    });
</script>
