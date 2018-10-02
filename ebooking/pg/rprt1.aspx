<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rprt1.aspx.cs" Inherits="ebooking.pg.rprt1" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-medkit fa-fw "></i> 
			<span lang="mn">Санхүүгийн тайлан</span>
		</h1>
	</div>
</div>
<section id="widget-grid" class="">
    <div class="row">
	    <div class="col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs bordered">
			    <li id="pTab1Li" onclick="pDatabindTabs(this)" class="active">
				    <a href="#s1" data-toggle="tab" lang="mn">Ерөнхий тайлан</a>
			    </li>
			    <%--<li id="pTab2Li" onclick="pDatabindTabs(this)">
				    <a href="#s2" data-toggle="tab">Ажилчдын борлуулалтын тайлан</a>
			    </li>--%>
			    <li id="pTab3Li" onclick="pDatabindTabs(this)">
				    <a href="#s3" data-toggle="tab" lang="mn">Цаг авалтын тайлан</a>
			    </li>
			    <li id="pTab4Li" onclick="pDatabindTabs(this)">
				    <a href="#s4" data-toggle="tab" lang="mn">Өргөгчийн сул зогсолт</a>
			    </li>
			    <li id="pTab5Li" onclick="pDatabindTabs(this)">
				    <a href="#s5" data-toggle="tab" lang="mn">Analyze for Service</a>
			    </li>
		    </ul>
            <div id="myTabContent1" class="tab-content">
				<div class="tab-pane fade in active" id="s1">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt1Tab1SelectStartDate" runat="server" type="text" name="rprt1Tab1SelectStartDate">
                                    </label>
                                </div>
                                <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt1Tab1SelectEndDate" runat="server" type="text" name="rprt1Tab1SelectEndDate">
                                    </label>
                                </div>
                                <div style="width:115px; float: left; padding-top: 6px;" lang="mn">Захиалгын төрөл:</div>
                                <div style="width:150px; float: left; margin-right: 10px;">
                                    <select id="rprt1Tab1SelectAppointmentType" runat="server" class="form-control" style="padding:1px;"><option value="">- Нийт -</option></select>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab1', 'Ерөнхий тайлан')">
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
                                <span lang="mn">Ерөнхий тайлан</span> /<label id="rprt1Tab1BeginDate" runat="server"></label> - <label id="rprt1Tab1EndDate" runat="server"></label>/
                            </div>
                            <div id="divBindTab1Table"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="s2">
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget" data-widget-editbutton="false">
				                <header>
					                <span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
					                <h2 lang="mn">Ерөнхий тайлан</h2>
				                </header>
				                <div>
					                <div class="jarviswidget-editbox">
						
					                </div>
                                     <div id="loaderTab2" class="loader-background">
                                        <img src="../img/loading.gif" />
                                        <h2 lang="mn">Уншиж байна...</h2>
                                    </div>
					                <div class="widget-body">
                                        <div class="smart-form" style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                            <div style="width:100%; float:left;">
                                                <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                                <div style="width:120px; float: left; margin-right: 10px;">
                                                    <label class="input">
                                                        <i class="icon-append fa fa-calendar"></i>
                                                        <input id="rprt1Tab2SelectStartDate" runat="server" type="text" name="rprt1Tab2SelectStartDate">
                                                    </label>
                                                </div>
                                                <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                                <div style="width:120px; float: left; margin-right: 10px;">
                                                    <label class="input">
                                                        <i class="icon-append fa fa-calendar"></i>
                                                        <input id="rprt1Tab2SelectEndDate" runat="server" type="text" name="rprt1Tab2SelectEndDate">
                                                    </label>
                                                </div>
                                                <div style="width:50px; float: left; padding-top: 6px;" lang="mn">Төрөл:</div>
                                                <div style="width:150px; float: left; margin-right: 10px;">
                                                    <select id="rprt1Tab2SelectType" runat="server" class="form-control" style="padding:1px;"><option value="1" lang="mn">Нийт борлуулалт</option><option value="2" lang="mn">Борлуулалт</option><option value="3" lang="mn">Хямдрал</option></select>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                            <span lang="mn">Ажилчдын борлуулалтын тайлан</span> /<label id="rprt1Tab2BeginDate" runat="server"></label> - <label id="rprt1Tab2EndDate" runat="server"></label>, <label id="rprt1Tab2Type" lang="mn">Нийт борлуулалт</label>/
                                        </div>
						                <div id="divrprt1Tab2Table" style="width:68%; float:left;"></div>
                                        <div id="divrprt1Tab2Pie" class="chart" style="width:30%; float:left;"></div>
					                </div>
				                </div>
			                </div>
                        </article>
                    </div>
                </div>
                <div class="tab-pane fade in" id="s3">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt1Tab3SelectStartDate" runat="server" type="text" name="rprt1Tab3SelectStartDate">
                                    </label>
                                </div>
                                <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt1Tab3SelectEndDate" runat="server" type="text" name="rprt1Tab3SelectEndDate">
                                    </label>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab3', 'Цаг авалтын тайлан')">
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
                            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                <span lang="mn">Цаг авалтын тайлан</span> /<label id="rprt1Tab3BeginDate" runat="server"></label> - <label id="rprt1Tab3EndDate" runat="server"></label>/
                            </div>
                            <div id="divBindTab3Table" style="width:40%; float:left;"></div>
                            <div id="divBindTab3Pie" class="chart" style="width:50%; float:left;"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="s4">
                    <div style="display: block; overflow: hidden;">
                        <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                            <div class="smart-form" style="width:70%; float:left;">
                                <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt1Tab4SelectStartDate" runat="server" type="text" name="rprt1Tab4SelectStartDate">
                                    </label>
                                </div>
                                <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                <div style="width:120px; float: left; margin-right: 10px;">
                                    <label class="input">
                                        <i class="icon-append fa fa-calendar"></i>
                                        <input id="rprt1Tab4SelectEndDate" runat="server" type="text" name="rprt1Tab4SelectEndDate">
                                    </label>
                                </div>
                                <div style="width:50px; float: left; padding-top: 6px;" lang="mn">Заал:</div>
                                <div style="width:150px; float: left; margin-right: 10px;">
                                    <select id="rprt1Tab4SelectRoom" runat="server" class="form-control" style="padding:1px;"><option value="">Бүгд</option></select>
                                </div>
                            </div>
                            <div style="text-align:right; width:30%; float:left;">
                                <div class="btn-group pull-right">
                                    <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab4', 'ӨргөгчийнСүлЗогсолт')">
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
                                <span lang="mn">Өргөгчийн сул зогсолтын тайлан</span> /<label id="rprt1Tab4BeginDate" runat="server"></label> - <label id="rprt1Tab4EndDate" runat="server"></label>, <label id="rprt1Tab4Type">Бүгд</label>/
                            </div>
                            <div id="divBindTab4Table"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="s5">
                    <ul class="nav nav-tabs bordered">
			            <li id="pTab5t1Li" onclick="pDatabindTabs(this)" class="active">
				            <a href="#s5t1" data-toggle="tab" lang="mn">Оношлогоо</a>
			            </li>
			            <li id="pTab5t2Li" onclick="pDatabindTabs(this)">
				            <a href="#s5t2" data-toggle="tab" lang="mn">Засвар үйлчилгээ</a>
			            </li>
			            <li id="pTab5t3Li" onclick="pDatabindTabs(this)">
				            <a href="#s5t3" data-toggle="tab" lang="mn">Солигдох сэлбэг</a>
			            </li>
			            <li id="pTab5t4Li" onclick="pDatabindTabs(this)">
				            <a href="#s5t4" data-toggle="tab" lang="mn">Үйлчлүүлэгчийн хүсэлт</a>
			            </li>
		            </ul>
                    <div class="tab-content">
				        <div class="tab-pane active" id="s5t1">
                            <div style="display: block; overflow: hidden;">
                                <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                    <div class="smart-form" style="width:70%; float:left;">
                                        <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                        <div style="width:120px; float: left; margin-right: 10px;">
                                            <label class="input">
                                                <i class="icon-append fa fa-calendar"></i>
                                                <input id="rprt1Tab5t1SelectStartDate" runat="server" type="text" name="rprt1Tab5t1SelectStartDate">
                                            </label>
                                        </div>
                                        <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                        <div style="width:120px; float: left; margin-right: 10px;">
                                            <label class="input">
                                                <i class="icon-append fa fa-calendar"></i>
                                                <input id="rprt1Tab5t1SelectEndDate" runat="server" type="text" name="rprt1Tab5t1SelectEndDate">
                                            </label>
                                        </div>
                                    </div>
                                    <div style="text-align:right; width:30%; float:left;">
                                        <div class="btn-group pull-right">
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab5t1', 'AnalyzeForService1')">
                                                <i class="fa fa-file-word-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab5t1')">
                                                <i class="fa fa-file-excel-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab5t1')">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="loaderTab5t1" class="loader-background">
                                    <img width="64" height="" src="img/loading.gif">
                                    <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="divpTab5t1" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                                    <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                        <span lang="mn">ANALYZE FOR SERVICE (ОНОШЛОГОО)</span> / 
                                        <label id="pTab5t1StartDate" style="font-weight: bold;"></label> - 
                                        <label id="pTab5t1EndDate" style="font-weight: bold;"></label> /
                                    </div>
                                    <div id="divBindTab5t1Table"></div>
                                </div>
                            </div>
                        </div>
				        <div class="tab-pane" id="s5t2">
                            <div style="display: block; overflow: hidden;">
                                <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                    <div class="smart-form" style="width:70%; float:left;">
                                        <div style="width:45px; float: left; padding-top: 6px;" lang="mn">Төрөл:</div>
                                        <div style="width:80px; float: left; margin-right: 10px;">
                                            <select id="rprt1Tab5t2SelectType" name="rprt1Tab5t2SelectType" class="form-control">
                                                <option value="1">Төрлөөр</option>
                                                <option value="2">Бүлгээр</option>
                                            </select>
                                        </div>
                                        <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                        <div style="width:120px; float: left; margin-right: 10px;">
                                            <label class="input">
                                                <i class="icon-append fa fa-calendar"></i>
                                                <input id="rprt1Tab5t2SelectStartDate" runat="server" type="text" name="rprt1Tab5t2SelectStartDate">
                                            </label>
                                        </div>
                                        <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                        <div style="width:120px; float: left; margin-right: 10px;">
                                            <label class="input">
                                                <i class="icon-append fa fa-calendar"></i>
                                                <input id="rprt1Tab5t2SelectEndDate" runat="server" type="text" name="rprt1Tab5t2SelectEndDate">
                                            </label>
                                        </div>
                                    </div>
                                    <div style="text-align:right; width:30%; float:left;">
                                        <div class="btn-group pull-right">
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab5t2', 'AnalyzeForService2')">
                                                <i class="fa fa-file-word-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab5t2')">
                                                <i class="fa fa-file-excel-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab5t2')">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="loaderTab5t2" class="loader-background">
                                    <img width="64" height="" src="img/loading.gif">
                                    <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="divpTab5t2" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                                    <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                        <span lang="mn">ANALYZE FOR SERVICE (ЗАСВАР ҮЙЛЧИЛГЭЭ)</span> / 
                                        <label id="pTab5t2StartDate" style="font-weight: bold;"></label> - 
                                        <label id="pTab5t2EndDate" style="font-weight: bold;"></label> / (<label id="pTab5t2Type" style="font-weight: bold;"></label>)
                                    </div>
                                    <div id="divBindTab5t2Table"></div>
                                </div>
                            </div>
                        </div>
				        <div class="tab-pane" id="s5t3">
                            <div style="display: block; overflow: hidden;">
                                <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                    <div class="smart-form" style="width:70%; float:left;">
                                        <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                        <div style="width:120px; float: left; margin-right: 10px;">
                                            <label class="input">
                                                <i class="icon-append fa fa-calendar"></i>
                                                <input id="rprt1Tab5t3SelectStartDate" runat="server" type="text" name="rprt1Tab5t3SelectStartDate">
                                            </label>
                                        </div>
                                        <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                        <div style="width:120px; float: left; margin-right: 10px;">
                                            <label class="input">
                                                <i class="icon-append fa fa-calendar"></i>
                                                <input id="rprt1Tab5t3SelectEndDate" runat="server" type="text" name="rprt1Tab5t3SelectEndDate">
                                            </label>
                                        </div>
                                    </div>
                                    <div style="text-align:right; width:30%; float:left;">
                                        <div class="btn-group pull-right">
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab5t3', 'AnalyzeForService2')">
                                                <i class="fa fa-file-word-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab5t3')">
                                                <i class="fa fa-file-excel-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab5t3')">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="loaderTab5t3" class="loader-background">
                                    <img width="64" height="" src="img/loading.gif">
                                    <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="divpTab5t3" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                                    <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                        <span lang="mn">ANALYZE FOR SERVICE (СЭЛБЭГ)</span> / 
                                        <label id="pTab5t3StartDate" style="font-weight: bold;"></label> - 
                                        <label id="pTab5t3EndDate" style="font-weight: bold;"></label> /
                                    </div>
                                    <div id="divBindTab5t3Table"></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="s5t4">
                            <div style="display: block; overflow: hidden;">
                                <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                    <div class="smart-form" style="width:70%; float:left;">
                                        <div style="width:85px; float: left; padding-top: 6px;" lang="mn">Эхлэх огноо:</div>
                                        <div style="width:120px; float: left; margin-right: 10px;">
                                            <label class="input">
                                                <i class="icon-append fa fa-calendar"></i>
                                                <input id="rprt1Tab5t4SelectStartDate" runat="server" type="text" name="rprt1Tab5t4SelectStartDate">
                                            </label>
                                        </div>
                                        <div style="width:90px; float: left; padding-top: 6px;" lang="mn">Дуусах огноо:</div>
                                        <div style="width:120px; float: left; margin-right: 10px;">
                                            <label class="input">
                                                <i class="icon-append fa fa-calendar"></i>
                                                <input id="rprt1Tab5t4SelectEndDate" runat="server" type="text" name="rprt1Tab5t4SelectEndDate">
                                            </label>
                                        </div>
                                    </div>
                                    <div style="text-align:right; width:30%; float:left;">
                                        <div class="btn-group pull-right">
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#divpTab5t4', 'AnalyzeForService2')">
                                                <i class="fa fa-file-word-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="exportExcel('#divpTab5t4')">
                                                <i class="fa fa-file-excel-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab5t4')">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="loaderTab5t4" class="loader-background">
                                    <img width="64" height="" src="img/loading.gif">
                                    <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;" lang="mn">Уншиж байна...</h2>
                                </div>
                                <div id="divpTab5t4" class="reports animated fast fadeInDown" style="margin:0 10px 10px 10px;">
                                    <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                        <span lang="mn">ANALYZE FOR SERVICE (ХҮСЭЛТ)</span> / 
                                        <label id="pTab5t4StartDate" style="font-weight: bold;"></label> - 
                                        <label id="pTab5t4EndDate" style="font-weight: bold;"></label> /
                                    </div>
                                    <div id="divBindTab5t4Table"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" src="../js/plugin/flot/jquery.flot.cust.min.js"></script>
<script type="text/javascript" src="../js/plugin/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="../js/plugin/flot/jquery.flot.fillbetween.min.js"></script>
<script type="text/javascript" src="../js/plugin/flot/jquery.flot.orderBar.min.js"></script>
<script type="text/javascript" src="../js/plugin/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="../js/plugin/flot/jquery.flot.time.min.js"></script>
<script type="text/javascript" src="../js/plugin/flot/jquery.flot.tooltip.min.js"></script>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        var valData = '';
        var totalprice = 0;
        $('#rprt1Tab1SelectAppointmentType').html($('#rprt1Tab1SelectAppointmentType').html().replace('<option value="">- Нийт -</option>', '<option value="" lang="mn">- Нийт -</option>'));
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
            if ($.trim($('#divBindTab1Table').html()) == "") {
                dataBindTab1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#divBindTab3Table').html()) == "") {
                dataBindTab3Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab4Li') {
            if ($.trim($('#divBindTab4Table').html()) == "") {
                dataBindTab4Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab5Li') {
            if ($.trim($('#divBindTab5t1Table').html()) == "") {
                dataBindTab5t1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab5t1Li') {
            if ($.trim($('#divBindTab5t1Table').html()) == "") {
                dataBindTab5t1Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab5t2Li') {
            if ($.trim($('#divBindTab5t2Table').html()) == "") {
                dataBindTab5t2Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab5t3Li') {
            if ($.trim($('#divBindTab5t3Table').html()) == "") {
                dataBindTab5t3Table();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab5t4Li') {
            if ($.trim($('#divBindTab5t4Table').html()) == "") {
                dataBindTab5t4Table();
            }
        }
    }


    //tab1
    function dataBindTab1Table() {
        var valData = '';
        var totalprice = 0;
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt1Tab1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "apptype":"' + $('#rprt1Tab1SelectAppointmentType option:selected').val() + '", "begindate":"' + $('#rprt1Tab1SelectStartDate').val() + '", "enddate":"' + $('#rprt1Tab1SelectEndDate').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                totalprice = 0;
                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;\">";
                valData += "<tbody>";
                valData += "<tr style=\"background-color:#C6D9F1;\">";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">#</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Төлөв</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Захиалга #</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Огноо</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Цаг</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Заал</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Өргөгч</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Үйлчлүүлэгч #</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Улсын #</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Оношолгоо</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Засвар үйлчилгээ</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Солигдох сэлбэг</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Үнэ</th>";
                valData += "</tr>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    totalprice += parseFloat(value.PRICESUM);
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.RW + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\"><span class=\"label " + value.COLORCLASS + "\">" + replaceDatabaseToDisplay(value.NAME) + "</span></td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + value.NUM + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + value.DT + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + value.TM + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.ROOM_NAME) + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.CHAIRNUM + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + value.PATIENT_CODE + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.AUTONO) + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.DIAGNOSTICLIST).replace(/, /g, "<br>") + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.SERVICELIST) + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.PARTLIST) + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + value.PRICESUM.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</td>";
                    valData += "</tr>";
                });
                valData += "<tr>";
                valData += "<th colspan=\"12\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">НИЙТ</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">₮" + totalprice.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</th>";
                valData += "</tr>";
                valData += "</tbody>";
                valData += "</table>";
                $("#divBindTab1Table").html(valData);
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
    function dateChangedTab1(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt1Tab1SelectStartDate") {
            if ($.trim($('#rprt1Tab1SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt1Tab1SelectEndDate').val().split('-')[0], $('#rprt1Tab1SelectEndDate').val().split('-')[1], $('#rprt1Tab1SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab1Table();
                    $('#rprt1Tab1BeginDate').text($(this).val());
                    $('#rprt1Tab1EndDate').text($('#rprt1Tab1SelectEndDate').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt1Tab1SelectEndDate") {
            if ($.trim($('#rprt1Tab1SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt1Tab1SelectStartDate').val().split('-')[0], $('#rprt1Tab1SelectStartDate').val().split('-')[1], $('#rprt1Tab1SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab1Table();
                    $('#rprt1Tab1BeginDate').text($('#rprt1Tab1SelectStartDate').val());
                    $('#rprt1Tab1EndDate').text($(this).val());
                }
            }
        }
    }
    $("#rprt1Tab1SelectAppointmentType").change(function () {
        dataBindTab1Table();
    });

    //tab3
    function dataBindTab3Table() {
        var valData = '';
        showLoader('loaderTab3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt1Tab3Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt1Tab3SelectStartDate').val() + '", "enddate":"' + $('#rprt1Tab3SelectEndDate').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;\">";
                valData += "<thead>";
                valData += "<tr style=\"background-color:#C6D9F1;\">";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Төлөв</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Тоо</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\"><span class=\"label " + value.COLORCLASS + "\" style=\"font-size:12px;\">" + replaceDatabaseToDisplay(value.NAME) + "</span></td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.CNT + "</td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                $("#divBindTab3Table").html(valData);
                hideLoader('loaderTab3');

                if ($('#divBindTab3Pie').length) {
                    var data_pie = [];
                    $('#divBindTab3Table').find('table').find('tbody > tr').each(function (index) {
                        data_pie[$(this).index()] = {
                            label: $('td:eq(0)', this).find('span').text(),
                            data: $('td:eq(1)', this).text()
                        }
                    });
                    plot_6 = $.plot($("#divBindTab3Pie"), data_pie, {
                        series: {
                            pie: {
                                show: true,
                                innerRadius: 0.5,
                                radius: 1,
                                label: {
                                    show: true,
                                    radius: 2 / 3,
                                    formatter: function (label, series) {
                                        return '<div style="font-size:11px;text-align:center;padding:4px;color:white;">' + parseFloat(series.percent).toFixed(0) + '%</div>';
                                    },
                                    threshold: 0.1
                                }
                            }
                        },
                        legend: {
                            show: true,
                            noColumns: 1, // number of colums in legend table
                            labelFormatter: null, // fn: string -> string
                            labelBoxBorderColor: "#000", // border color for the little label boxes
                            container: null, // container (as jQuery object) to put legend in, null means default on top of graph
                            position: "ne", // position of default legend container within plot
                            margin: [5, 10], // distance from grid edge to default legend container within plot
                            backgroundColor: "#efefef", // null means auto-detect
                            backgroundOpacity: 1 // set to 0 to avoid background
                        },
                        grid: {
                            hoverable: true,
                            clickable: true
                        },
                    });
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    }
    function dateChangedTab3(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt1Tab3SelectStartDate") {
            if ($.trim($('#rprt1Tab3SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt1Tab3SelectEndDate').val().split('-')[0], $('#rprt1Tab3SelectEndDate').val().split('-')[1], $('#rprt1Tab3SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab3Table();
                    $('#rprt1Tab3BeginDate').text($(this).val());
                    $('#rprt1Tab3EndDate').text($('#rprt1Tab3SelectEndDate').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt1Tab3SelectEndDate") {
            if ($.trim($('#rprt1Tab3SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt1Tab3SelectStartDate').val().split('-')[0], $('#rprt1Tab3SelectStartDate').val().split('-')[1], $('#rprt1Tab3SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab3Table();
                    $('#rprt1Tab3BeginDate').text($('#rprt1Tab3SelectStartDate').val());
                    $('#rprt1Tab3EndDate').text($(this).val());
                }
            }
        }
    }

    //tab4
    function dataBindTab4Table() {
        var valData = '';
        var strPerColor = "";
        var total1 = 0;
        var total2 = 0;
        var total3 = 0;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt1Tab4Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt1Tab4SelectStartDate').val() + '", "enddate":"' + $('#rprt1Tab4SelectEndDate').val() + '", "room":"' + $('#rprt1Tab4SelectRoom option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                strPerColor = "";
                total1 = 0;
                total2 = 0;
                total3 = 0;
                valData += "<table style=\"border: 1px solid #DDD; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;\">";
                valData += "<thead>";
                valData += "<tr style=\"background-color:#C6D9F1;\">";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center; width:31px;\">#</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Өргөгч</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Ажиллах минут</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Ажилласан минут</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Сул минут</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">Хувь</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    total1 += parseInt(value.USETIME);
                    total2 += parseInt(value.USEDTIME);
                    total3 += parseInt(value.FREETIME);
                    if (((parseFloat(value.USEDTIME) / parseFloat(value.USETIME)) * parseFloat(100)).toFixed(2) >= 0) { strPerColor = "bg-color-red"; }
                    else if (((parseFloat(value.USEDTIME) / parseFloat(value.USETIME)) * parseFloat(100)).toFixed(2) >= 50 && ((parseFloat(value.USEDTIME) / parseFloat(value.USETIME)) * parseFloat(100)).toFixed(2) <= 79) { strPerColor = "bg-color-orange"; }
                    else if (((parseFloat(value.USEDTIME) / parseFloat(value.USETIME)) * parseFloat(100)).toFixed(2) >= 80) { strPerColor = "bg-color-greenLight"; }
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.RW + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px;\">" + replaceDatabaseToDisplay(value.ROOM_NAME) + " Өргөгч-" + value.CHAIRNUM + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.USETIME + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.USEDTIME + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.FREETIME + "</td>";
                    valData += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\"><span class=\"label " + strPerColor + "\" style=\"font-size:12px;\">" + ((parseFloat(value.USEDTIME) / parseFloat(value.USETIME)) * parseFloat(100)).toFixed(2) + "%</span></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "<tfoot>";
                valData += "<tr>";
                valData += "<th colspan=\"2\" style=\"border: 1px solid #DDD; padding:5px; text-align:center;\" lang=\"mn\">НИЙТ</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + total1 + "</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + total2 + "</th>";
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + total3 + "</th>";
                if (((parseFloat(total2) / parseFloat(total1)) * parseFloat(100)).toFixed(2) >= 0) { strPerColor = "bg-color-red"; }
                else if (((parseFloat(total2) / parseFloat(total1)) * parseFloat(100)).toFixed(2) >= 50 && ((parseFloat(total2) / parseFloat(total1)) * parseFloat(100)).toFixed(2) <= 79) { strPerColor = "bg-color-orange"; }
                else if (((parseFloat(total2) / parseFloat(total1)) * parseFloat(100)).toFixed(2) >= 80) { strPerColor = "bg-color-greenLight"; }
                valData += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:right;\"><span class=\"label " + strPerColor + "\" style=\"font-size:12px;\">" + ((parseFloat(total2) / parseFloat(total1)) * parseFloat(100)).toFixed(2) + "%</span></th>";
                valData += "</tr>";
                valData += "</tfoot>";
                valData += "</table>";
                $("#divBindTab4Table").html(valData);
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
    function dateChangedTab4(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt1Tab4SelectStartDate") {
            if ($.trim($('#rprt1Tab4SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt1Tab4SelectEndDate').val().split('-')[0], $('#rprt1Tab4SelectEndDate').val().split('-')[1], $('#rprt1Tab4SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab4Table();
                    $('#rprt1Tab4BeginDate').text($(this).val());
                    $('#rprt1Tab4EndDate').text($('#rprt1Tab4SelectEndDate').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt1Tab4SelectEndDate") {
            if ($.trim($('#rprt1Tab4SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt1Tab4SelectStartDate').val().split('-')[0], $('#rprt1Tab4SelectStartDate').val().split('-')[1], $('#rprt1Tab4SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab4Table();
                    $('#rprt1Tab4BeginDate').text($('#rprt1Tab4SelectStartDate').val());
                    $('#rprt1Tab4EndDate').text($(this).val());
                }
            }
        }
    }
    $("#rprt1Tab4SelectRoom").change(function () {
        dataBindTab4Table();
        $('#rprt1Tab4Type').html($('#rprt1Tab4SelectRoom option:selected').text());
    });

    //tab5t1
    function dataBindTab5t1Table() {
        showLoader('loaderTab5t1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt1Tab5t1Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt1Tab5t1SelectStartDate').val() + '", "enddate":"' + $('#rprt1Tab5t1SelectEndDate').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#pTab5t1StartDate').html($('#rprt1Tab5t1SelectStartDate').val());
                $('#pTab5t1EndDate').html($('#rprt1Tab5t1SelectEndDate').val());
                $("#divBindTab5t1Table").html(replaceDatabaseToDisplay(data.d));
                hideLoader('loaderTab5t1');
            },
            failure: function (response) {
                alert(response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dateChangedTab5t1(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt1Tab5t1SelectStartDate") {
            if ($.trim($('#rprt1Tab5t1SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt1Tab5t1SelectEndDate').val().split('-')[0], $('#rprt1Tab5t1SelectEndDate').val().split('-')[1], $('#rprt1Tab5t1SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab5t1Table();
                    $('#rprt1Tab5t1BeginDate').text($(this).val());
                    $('#rprt1Tab5t1EndDate').text($('#rprt1Tab5t1SelectEndDate').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt1Tab5t1SelectEndDate") {
            if ($.trim($('#rprt1Tab5t1SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt1Tab5t1SelectStartDate').val().split('-')[0], $('#rprt1Tab5t1SelectStartDate').val().split('-')[1], $('#rprt1Tab5t1SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab5t1Table();
                    $('#rprt1Tab5t1BeginDate').text($('#rprt1Tab5t1SelectStartDate').val());
                    $('#rprt1Tab5t1EndDate').text($(this).val());
                }
            }
        }
    }
    $('#rprt1Tab5t1SelectStartDate, #rprt1Tab5t1SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab5t1).on('changeDate', dateChangedTab5t1);

    //tab5t2
    function dataBindTab5t2Table() {
        showLoader('loaderTab5t2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt1Tab5t2Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt1Tab5t2SelectStartDate').val() + '", "enddate":"' + $('#rprt1Tab5t2SelectEndDate').val() + '", "tp":"' + $('#rprt1Tab5t2SelectType option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#pTab5t2StartDate').html($('#rprt1Tab5t2SelectStartDate').val());
                $('#pTab5t2EndDate').html($('#rprt1Tab5t2SelectEndDate').val());
                $('#pTab5t2Type').html($('#rprt1Tab5t2SelectType option:selected').text());
                $("#divBindTab5t2Table").html(replaceDatabaseToDisplay(data.d));
                hideLoader('loaderTab5t2');
            },
            failure: function (response) {
                alert(response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dateChangedTab5t2(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt1Tab5t2SelectStartDate") {
            if ($.trim($('#rprt1Tab5t2SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt1Tab5t2SelectEndDate').val().split('-')[0], $('#rprt1Tab5t2SelectEndDate').val().split('-')[1], $('#rprt1Tab5t2SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab5t2Table();
                    $('#rprt1Tab5t2BeginDate').text($(this).val());
                    $('#rprt1Tab5t2EndDate').text($('#rprt1Tab5t2SelectEndDate').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt1Tab5t2SelectEndDate") {
            if ($.trim($('#rprt1Tab5t2SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt1Tab5t2SelectStartDate').val().split('-')[0], $('#rprt1Tab5t2SelectStartDate').val().split('-')[1], $('#rprt1Tab5t2SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab5t2Table();
                    $('#rprt1Tab5t2BeginDate').text($('#rprt1Tab5t2SelectStartDate').val());
                    $('#rprt1Tab5t2EndDate').text($(this).val());
                }
            }
        }
    }
    $('#rprt1Tab5t2SelectStartDate, #rprt1Tab5t2SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab5t2).on('changeDate', dateChangedTab5t2);
    $("#rprt1Tab5t2SelectType").change(function () {
        dataBindTab5t2Table();
    });

    //Tab5t3
    function dataBindTab5t3Table() {
        showLoader('loaderTab5t3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt1Tab5t3Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt1Tab5t3SelectStartDate').val() + '", "enddate":"' + $('#rprt1Tab5t3SelectEndDate').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#pTab5t3StartDate').html($('#rprt1Tab5t3SelectStartDate').val());
                $('#pTab5t3EndDate').html($('#rprt1Tab5t3SelectEndDate').val());
                $("#divBindTab5t3Table").html(replaceDatabaseToDisplay(data.d));
                hideLoader('loaderTab5t3');
            },
            failure: function (response) {
                alert(response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dateChangedTab5t3(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt1Tab5t3SelectStartDate") {
            if ($.trim($('#rprt1Tab5t3SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt1Tab5t3SelectEndDate').val().split('-')[0], $('#rprt1Tab5t3SelectEndDate').val().split('-')[1], $('#rprt1Tab5t3SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab5t3Table();
                    $('#rprt1Tab5t3BeginDate').text($(this).val());
                    $('#rprt1Tab5t3EndDate').text($('#rprt1Tab5t3SelectEndDate').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt1Tab5t3SelectEndDate") {
            if ($.trim($('#rprt1Tab5t3SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt1Tab5t3SelectStartDate').val().split('-')[0], $('#rprt1Tab5t3SelectStartDate').val().split('-')[1], $('#rprt1Tab5t3SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab5t3Table();
                    $('#rprt1Tab5t3BeginDate').text($('#rprt1Tab5t3SelectStartDate').val());
                    $('#rprt1Tab5t3EndDate').text($(this).val());
                }
            }
        }
    }
    $('#rprt1Tab5t3SelectStartDate, #rprt1Tab5t3SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab5t3).on('changeDate', dateChangedTab5t3);

    //Tab5t4
    function dataBindTab5t4Table() {
        showLoader('loaderTab5t4');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../wcf/ServiceMain.svc/Rprt1Tab5t4Datatable",
            data: '{"clinicid":"' + $('#indexClinicId').text() + '", "begindate":"' + $('#rprt1Tab5t4SelectStartDate').val() + '", "enddate":"' + $('#rprt1Tab5t4SelectEndDate').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#pTab5t4StartDate').html($('#rprt1Tab5t4SelectStartDate').val());
                $('#pTab5t4EndDate').html($('#rprt1Tab5t4SelectEndDate').val());
                $("#divBindTab5t4Table").html(replaceDatabaseToDisplay(data.d));
                hideLoader('loaderTab5t4');
            },
            failure: function (response) {
                alert(response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dateChangedTab5t4(ev) {
        var strtDate;
        var endDate;
        if ($(this).attr('id') == "rprt1Tab5t4SelectStartDate") {
            if ($.trim($('#rprt1Tab5t4SelectEndDate').val()) == "") alert("Дуусах огноо оруулна уу!");
            else {
                strtDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                endDate = new Date($('#rprt1Tab5t4SelectEndDate').val().split('-')[0], $('#rprt1Tab5t4SelectEndDate').val().split('-')[1], $('#rprt1Tab5t4SelectEndDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Эхлэх огноо дуусах огнооноос бага байна!');
                else {
                    dataBindTab5t4Table();
                    $('#rprt1Tab5t4BeginDate').text($(this).val());
                    $('#rprt1Tab5t4EndDate').text($('#rprt1Tab5t4SelectEndDate').val());
                }
            }
        }
        else if ($(this).attr('id') == "rprt1Tab5t4SelectEndDate") {
            if ($.trim($('#rprt1Tab5t4SelectStartDate').val()) == "") alert("Эхлэх огноо оруулна уу!");
            else {
                endDate = new Date($(this).val().split('-')[0], $(this).val().split('-')[1], $(this).val().split('-')[2]);
                strtDate = new Date($('#rprt1Tab5t4SelectStartDate').val().split('-')[0], $('#rprt1Tab5t4SelectStartDate').val().split('-')[1], $('#rprt1Tab5t4SelectStartDate').val().split('-')[2]);
                if (strtDate > endDate) alert('Дуусах огноо эхлэх огнооноос их байна!');
                else {
                    dataBindTab5t4Table();
                    $('#rprt1Tab5t4BeginDate').text($('#rprt1Tab5t4SelectStartDate').val());
                    $('#rprt1Tab5t4EndDate').text($(this).val());
                }
            }
        }
    }
    $('#rprt1Tab5t4SelectStartDate, #rprt1Tab5t4SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab5t4).on('changeDate', dateChangedTab5t4);


    $('#rprt1Tab1SelectStartDate, #rprt1Tab1SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab1).on('changeDate', dateChangedTab1);
    $('#rprt1Tab3SelectStartDate, #rprt1Tab3SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab3).on('changeDate', dateChangedTab3);
    $('#rprt1Tab4SelectStartDate, #rprt1Tab4SelectEndDate').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"]
    }).change(dateChangedTab4).on('changeDate', dateChangedTab4);
</script>
