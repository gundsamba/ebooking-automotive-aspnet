<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ebooking.index" %>
<!DOCTYPE html>
<html lang="mn" class="hidden-menu-mobile-lock">	
	<head>
		<meta charset="utf-8">
		<title>eBooking</title>
		<meta name="description" content="">
		<meta name="author" content="">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> 

		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

		<!-- #APP SCREEN / ICONS -->
		<!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
		<link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
		
		<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
		<!-- Startup image for web apps -->
		<link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">

	</head>
	<body class="">
		<header id="header">
			<div id="logo-group">
				<span id="logo"> <img src="img/logo.png" alt="eBooking"> </span>
			</div>
			<div class="pull-right">
				<div id="hide-menu" class="btn-header pull-right">
					<span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
				</div>
				<ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5">
					<li class="">
						<a href="#" class="dropdown-toggle no-margin userdropdown" data-toggle="dropdown"> 
							<img src="img/staff/male.jpg" alt="John Doe" class="online" />  
						</a>
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="toggleShortcut"><i class="fa fa-arrow-down"></i> Хэрэглэгчийн цэс</a>
							</li>
						</ul>
					</li>
				</ul>
				<div id="logout" class="btn-header transparent pull-right">
					<span> <a href="login.html" title="Гарах" data-action="userLogout" data-logout-msg=""><i class="fa fa-sign-out"></i></a> </span>
				</div>
				<div id="fullscreen" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
				</div>
                <ul class="header-dropdown-list hidden-xs">
					<li class="">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <img id="indexLangImg" src="img/blank.gif" class="flag flag-mn" alt="Монгол"> <span id="indexLangName"> МОН</span> <i class="fa fa-angle-down"></i> </a>
						<ul class="dropdown-menu pull-right">
							<li id="indexLangLi_mn" class="active">
								<a href="javascript:void(0);" onclick="changeLang(this);" data-langname="МОН" data-flag="mn" data-lang="mn"><img src="img/blank.gif" class="flag flag-mn" alt="Монгол"> Монгол (МОН)</a>
							</li>
							<li id="indexLangLi_en">
								<a href="javascript:void(0);" onclick="changeLang(this);" data-langname="EN" data-flag="us" data-lang="en"><img src="img/blank.gif" class="flag flag-us" alt="English"> English (EN)</a>
							</li>
						</ul>
					</li>
				</ul>
                <div class="pull-right" style="margin-top:15px; margin-right:15px;">
                    <span id="currentdatetime"></span>
                </div>
                <div style="display:none;">
                    <span id="indexStaffId" runat="server"></span>
                    <span id="indexUserRolesId" runat="server"></span>
                    <span id="indexSessionID" runat="server"></span>
                </div>
			</div>
		</header>
		<aside id="left-panel">
			<div class="login-info">
				<span>
					<a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
						<img src="img/staff/male.jpg" alt="me" class="online" /> 
						<span id="indexUserName" runat="server">
							
						</span>
						<i class="fa fa-angle-down"></i>
					</a> 
				</span>
			</div>
			<nav>
				<ul>
					<li id="indexMenuCalendar" runat="server" class="active">
						<a href="pg/calendar.aspx" title="Цаг авалт"><i class="fa fa-lg fa-fw fa-calendar"></i> <span class="menu-item-parent" lang="mn">Цаг авалт</span></a>
					</li>
					<li id="indexMenuPatient" runat="server">
						<a href="pg/patient.aspx"><i class="fa fa-lg fa-fw fa-user"></i> <span class="menu-item-parent" lang="mn">Үйлчлүүлэгчийн бүртгэл</span></a>
					</li>
					<li id="indexMenuStaff" runat="server">
						<a href="pg/staff.aspx"><i class="fa fa-lg fa-fw fa-group"></i> <span class="menu-item-parent" lang="mn">Ажилтаны бүртгэл</span></a>
					</li>
					<li id="indexMenuService" runat="server">
						<a href="pg/service.aspx"><i class="fa fa-lg fa-fw fa-medkit"></i> <span class="menu-item-parent" lang="mn">Засвар үйлчилгээ</span></a>
					</li>
					<li id="indexMenuPart" runat="server">
						<a href="pg/part.aspx"><i class="fa fa-lg fa-fw fa-wrench"></i> <span class="menu-item-parent" lang="mn">Сэлбэг</span></a>
					</li>
					<li id="indexMenuAutomark" runat="server">
						<a href="pg/automark.aspx"><i class="fa fa-lg fa-fw fa-car"></i> <span class="menu-item-parent" lang="mn">Автомашины марк</span></a>
					</li>
					<li id="indexMenuDealer" runat="server">
						<a href="#"><i class="fa fa-lg fa-fw fa-usd"></i> <span class="menu-item-parent" lang="mn">Автомашин борлуулалт</span></a>
						<ul>
						    <li>
							    <a href="pg/dealer.aspx" lang="mn"><i class="fa fa-pencil-square-o"></i> Бүртгэл</a>
						    </li>
						    <li>
							    <a href="pg/dealerrprt.aspx" lang="mn"><i class="fa fa-fw fa-file-text"></i> Тайлан</a>
						    </li>
						    <li>
							    <a href="pg/dealersettings.aspx" lang="mn"><i class="fa fa-fw fa-gears"></i> Тохиргоо</a>
						    </li>
					    </ul>
					</li>
					<li id="indexMenuSetup" runat="server">
						<a href="#"><i class="fa fa-lg fa-fw fa-gears"></i> <span class="menu-item-parent" lang="mn">Тохиргоо</span></a>
                        <ul>
						    <li>
							    <a href="pg/setup.aspx" lang="mn">Ерөнхий тохиргоо</a>
						    </li>
						    <li>
							    <a href="pg/usersetup.aspx" lang="mn">Хэрэглэгчийн эрх</a>
						    </li>
					    </ul>
					</li>
                    <li id="indexMenuReport" runat="server">
					    <a href="#"><i class="fa fa-lg fa-fw fa-file-text"></i> <span class="menu-item-parent" lang="mn">Тайлан</span></a>
					    <ul>
						    <li>
							    <a href="pg/rprt1.aspx" lang="mn"><i class="fa fa-money"></i> Санхүүгийн тайлан</a>
						    </li>
						    <li>
							    <a href="pg/rprt2.aspx" lang="mn"><i class="fa fa-bar-chart-o"></i> Статистик тайлан</a>
						    </li>
						    <li>
							    <a href="pg/rprt3.aspx" lang="mn"><i class="fa fa-bar-chart-o"></i> Ерөнхий тайлан</a>
						    </li>
					    </ul>
				    </li>
                    <li>
                        <a href="#"><i class="fa fa-lg fa-fw fa-globe"></i> <span class="menu-item-parent" lang="mn">Удирдлага</span></a>
                        <ul id="indexTaskUl" runat="server">
						    
					    </ul>
                    </li>
					<li>
						<a href="document/index.html" target="_blank"><i class="fa fa-lg fa-fw fa-book txt-color-orange"></i> <span class="menu-item-parent txt-color-orange" lang="mn">ГАРЫН АВЛАГА</span></a>
					</li>
				</ul>
			</nav>
			<span class="minifyme" data-action="minifyMenu"> <i class="fa fa-arrow-circle-left hit"></i> </span>
		</aside>
		<div id="main" role="main">
			<div id="ribbon">
				<ol class="breadcrumb">
					<!-- This is auto generated -->
				</ol>
                <span class="ribbon-button-alignment pull-right" style="margin-right:25px">
                    <span id="indexClinicId" runat="server" class="hide"></span>
					<span id="indexClinicName" runat="server" class="btn btn-ribbon hidden-xs"></span>
				</span>
			</div>
			<div id="content">

			</div>
		</div>
		<div class="page-footer">
			<div class="row">
				<div class="col-xs-12 col-sm-6">
					<span class="txt-color-white">eBooking - <span class="hidden-xs" lang="mn">Захиалга бүртгэл хяналтын систем</span> © 2015</span>
				</div>
			</div>
		</div>
		<div id="shortcut">
			<ul>
				<li>
					<a href="#pg/changepass.aspx" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-lock fa-4x"></i> <span lang="mn">Нууц үг өөрчлөх</span> </span> </a>
				</li>
			</ul>
		</div>
		<%--<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
		<%--<script src="js/libs/jquery/2.1.1/jquery.min.js"></script>--%>
		<%--<script src="../js/libs/jquery.min.js"></script>--%>

		<script src="js/libs/jquery-2.1.1.min.js"></script>
		<script>
		    if (!window.jQuery) {
		        document.write('<script src="../js/libs/jquery-2.1.1.min.js"><\/script>');
		    }
		</script>

		<script src="../js/libs/jquery-ui.min.js"></script>
		<script>
		    if (!window.jQuery.ui) {
		        document.write('<script src="../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
		    }
		</script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices: you can disable this in app.js -->
		<script src="js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
		<![endif]-->

		<!-- Demo purpose only -->
		<script src="js/demo.min.js"></script>

		<!-- MAIN APP JS FILE -->
		<script src="js/app.min.js"></script>

		<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
		<!-- Voice command : plugin -->
		<script src="js/speech/voicecommand.min.js"></script>

		<!-- SmartChat UI : plugin -->
		<script src="js/smart-chat-ui/smart.chat.ui.min.js"></script>
		<script src="js/smart-chat-ui/smart.chat.manager.min.js"></script>

        <!--jquery datatable-->
        <script type="text/javascript" src="js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script type="text/javascript" src="js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script type="text/javascript" src="js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script type="text/javascript" src="js/plugin/datatables/jquery.dataTables.rowGrouping.js"></script>
        <!--bootstrap validation-->
        <script type="text/javascript" src="js/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script>
        <!--bootstrap validation-->
        <script type="text/javascript" src="js/plugin/timer/jquery.timer.js"></script>
        <!-- export word -->
        <script src="js/plugin/htmltoword/FileSaver.js"></script> 
        <script src="js/plugin/htmltoword/jquery.wordexport.js"></script>        
        <!--  jquery-lang -->
        <script src="../js/plugin/jscookie/js.cookie.js" charset="utf-8" type="text/javascript"></script>
	    <script src="../js/plugin/jquery-lang/jquery-lang.js" charset="utf-8" type="text/javascript"></script>
        <script>
            function changeLang(el) {
                $('#indexLangImg').attr('class', 'flag flag-' + $(el).attr('data-flag'));
                $('#indexLangName').html('&nbsp;' + $(el).attr('data-langname'));
                $('#indexLangLi_' + $(el).attr('data-lang')).closest('ul').find('li').removeClass('active');
                $('#indexLangLi_' + $(el).attr('data-lang')).addClass('active');
                window.lang.change($(el).attr('data-lang'));
                return false;
            }

            var lang = new Lang();
            lang.dynamic('en', '../files/langpack/en.json');
            lang.init({
                defaultLang: 'mn'
                ,currentLang: 'mn'
                //,cookie: {
                //    name: 'langCookie',
                //    expiry: 365,
                //    path: '/'
                //}
                //,allowCookieOverride: true
            });

            var date = new Date();
            var timer =
                $.timer(
                    function () {
                        currdate = new Date();
                        $('#currentdatetime').html('<i class="fa fa-clock-o"></i> ' + currdate.getFullYear() + '-' + replace2Char((currdate.getMonth() + 1)) + '-' + replace2Char(currdate.getDate()) + ' <span lang="mn">(' + replace2MNDayName(currdate.getDay()) + ')</span> ' + replace2Char(currdate.getHours().toString()) + ':' + replace2Char(currdate.getMinutes().toString()) + ':' + replace2Char(currdate.getSeconds().toString()));
                    }, 1000, true
                );
            function replace2Char(str) {
                if (parseInt(str) >= 0 && parseInt(str) < 10) str = '0' + str.toString();
                return str;
            }
            function replace2MNDayName(num) {
                if (getCookie('langCookie') == 'mn') {
                    if (num == 1) num = 'Да';
                    else if (num == 2) num = 'Мя';
                    else if (num == 3) num = 'Лх';
                    else if (num == 4) num = 'Пү';
                    else if (num == 5) num = 'Ба';
                    else if (num == 6) num = 'Бя';
                    else if (num == 7) num = 'Ня';
                }
                else if (getCookie('langCookie') == 'en') {
                    if (num == 1) num = 'Mo';
                    else if (num == 2) num = 'Tu';
                    else if (num == 3) num = 'We';
                    else if (num == 4) num = 'Th';
                    else if (num == 5) num = 'Fr';
                    else if (num == 6) num = 'Sa';
                    else if (num == 7) num = 'Su';
                }
                else {
                    if (num == 1) num = 'Да';
                    else if (num == 2) num = 'Мя';
                    else if (num == 3) num = 'Лх';
                    else if (num == 4) num = 'Пү';
                    else if (num == 5) num = 'Ба';
                    else if (num == 6) num = 'Бя';
                    else if (num == 7) num = 'Ня';
                }
                return num;
            }

            function showLoader(el) {
                $('#' + el).addClass('loader_show').css('display','block');
                
            }
            function hideLoader(el) {
                $('#' + el).removeClass('loader_show').css('display', 'none');
            }
            function replaceDisplayToDatabase(val) {
                return val.replace(/&quot;/g, "quot;").replace(/</g, 'lt;').replace(/>/g, 'gt;').replace(/"/g, 'quot;').replace(/'/g, "apos;").replace(/&/g, 'amp;').replace(/\\/g, "bsol;");
            }
            function replaceDatabaseToDisplay(val) {
                return val.replace(/lt;/g, '<').replace(/gt;/g, '>').replace(/quot;/g, '"').replace(/amp;/g, '&').replace(/apos;/g, "'").replace(/bsol;/g, "\\");
            }
            function getUrlVars() {
                var vars = [], hash;
                var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < hashes.length; i++) {
                    hash = hashes[i].split('=');
                    vars.push(hash[0]);
                    vars[hash[0]] = hash[1];
                }
                return vars;
            }
            function smallBox(vartitle, varcontent, varcolor) {
                $.smallBox({
                    title: vartitle,
                    content: varcontent,
                    color: varcolor,
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: 4000
                });
            }
            function strConvertFirstCharUpper(str) {
                return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
            }
            function strQryIsNull(tp, str) {
                if (tp == "nvarchar") {
                    if (str == "") str = "NULL";
                    else str = "N'"+str+"'";
                }
                else if (tp == 'varchar') {
                    if (str == "") str = "NULL";
                    else str = "'" + str + "'";
                }
                else if (tp == 'numeric') {
                    if (str == "") str = "NULL";
                    else str = str;
                }
                return str;
            }

            function formatNumber(num) {
                return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
            }
            function PrintElem(elem) {
                Popup($(elem).html());
            }
            function Popup(data) {
                jQuery(".Header").hide();
                var mywindow = window.open('', '', 'left=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status=0,height=600,width=800');
                mywindow.document.write('<html><head><title></title>');
                mywindow.document.write('</head><body >');
                mywindow.document.write(data);
                mywindow.document.write('</body></html>');
                mywindow.print();
                mywindow.close();
                return true;
            }

            function funcIsRole(myroles) {
                var valIsRole = false;
                for (var i = 0; i < myroles.split(',').length; i++) {
                    for (var y = 0; y < $.trim($('#indexUserRolesId').html()).split(',').length; y++) {
                        if (myroles.split(',')[i] == $.trim($('#indexUserRolesId').html()).split(',')[y]) {
                            valIsRole = true;
                        }
                    }
                }
                return valIsRole;
            }
            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for(var i=0; i<ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0)==' ') c = c.substring(1);
                    if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
                }
                return "";
            }

            function exportExcel(divId) {
                window.open('data:application/vnd.ms-excel,' + encodeURIComponent($(divId).html()));
            }
            function exportWord(divId, filename) {
                $(divId).width(1150);
                $("" + divId + "").wordExport(filename);
            }
        </script>
	</body>
</html>