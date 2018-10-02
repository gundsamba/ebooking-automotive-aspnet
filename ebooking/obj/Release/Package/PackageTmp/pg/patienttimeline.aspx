<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patienttimeline.aspx.cs" Inherits="ebooking.pg.patienttimeline" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-7">
		<h1 class="page-title txt-color-blueDark" style="margin:12px 0;"><i class="fa fa-archive fa-fw "></i> <span lang="mn">Үйлчүүлэгчийн захиалга болон үйлчилгээний архив</span></h1>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding:0 0 12px 14px;">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Код</label>
                    <div id="patientCode" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Эзэмшигчийн нэр</label>
                    <div id="patientName" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Төрөл</label>
                    <div id="patientType" runat="server" class="col-md-9" lang="mn">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Утас 1</label>
                    <div id="patientTel" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Утас 2</label>
                    <div id="patientTel2" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">И-мэйл</label>
                    <div id="patientEmail" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Хаяг</label>
                    <div id="patientAddress" runat="server" class="col-md-9">P150301134</div>
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Автомашины загвар</label>
                    <div id="patientAutoMark" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Үйлдвэрлэсэн он</label>
                    <div id="patientAutoYear" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Улсын дугаар</label>
                    <div id="patientAutoNo" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Аралын дугаар</label>
                    <div id="patientAutoVinNo" runat="server" class="col-md-9">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Шатахууны төрөл</label>
                    <div id="patientFuelType" runat="server" class="col-md-9" lang="mn">P150301134</div>
                </div>
                <div class="row">
                    <label class="col-md-3 control-label" lang="mn">Хурдны хайрцаг</label>
                    <div id="patientTransmission" runat="server" class="col-md-9" lang="mn">P150301134</div>
                </div>
            </div>
        </div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="well well-sm animated fadeInDown">
			<!-- Timeline Content -->
			<div class="smart-timeline">
				<ul id="appointmentListUl" runat="server" class="smart-timeline-list">
					<li>
						<div class="smart-timeline-icon">
							<img src="img/staff/male.jpg" width="32" height="32" />
						</div>
						<div class="smart-timeline-time">
							<small>2015-01-01 09:00-10:00</small>
						</div>
						<div class="smart-timeline-content">
							<h3 class="margin-top-0 ">
								А ЗААЛ - Өргөгч 1 | <span lang="mn">Захиалгын дугаар</span> #140101001 | <span lang="mn">Нийт дүн</span>: ₮20,000
							</h3>
                            <h4 class="text-primary" lang="mn">Үйлчлүүлэгчийн хүсэлт</h4>
                            <p>
                                <span class="label bg-color-blueDark" lang="mn">Оношлого</span> <span class="label bg-color-blueDark">Үндсэн ЗҮ</span><br />
                                <strong>Хүсэлтийн тэмдэглэл: </strong> <i>Хүсэлтийн тэмдэглэл ингэж бичив</i>
                            </p>
                            <h4 class="text-primary">Оношлогоо  <i>/₮20,000/</i></h4>
                            <p>
                                <span class="label bg-color-blueDark">Явах эд ангийн оношлогоо  <i>/₮20,000/</i></span> <span class="label bg-color-blueDark">Компьютер оношлогоо  <i>/₮20,000/</i></span><br />
                                <strong>Дүгнэлт:</strong> <i>Оношлогооны дүгнэлт ингэж гарав</i><br />
                                <strong>Дүгнэлт гаргасан ахлах механик:</strong> <i>Г.Гүндсамба</i> 
                                <strong>Дүгнэлт гаргасан үйлчилгээний зөвлөх:</strong> <i>Г. Гүндсамба</i>
                            </p>
                            <h4 class="text-primary">Засвар үйлчилгээ <i>/₮20,000/</i></h4>
                            <p>
                                <span class="label bg-color-blueDark">Баталгаат</span><br />
                                <strong>Механик:</strong> <i>Г.Гүндсамба</i>
                                <strong>Ахлах механик:</strong> <i>Г.Гүндсамба</i>
                                <strong>Үйлчилгээний зөвлөх:</strong> <i>Г.Гүндсамба</i>
                            </p>
							<div>
								<table class="table table-hover">
								    <thead>
									    <tr>
										    <th>Код</th>
										    <th>ЗҮ нэр</th>
										    <th>ЗҮ тайлбар</th>
										    <th>ЗҮ авсан тайлбар</th>
										    <th class="text-center">/ш/</th>
										    <th class="text-right">Нэгж үнэ</th>
										    <th class="text-right">Нийт үнэ</th>
									    </tr>
								    </thead>
								    <tbody>
									    <tr>
										    <td>1</td>
										    <td>нэр</td>
										    <td>тайлбар</td>
										    <td>тайлбар</td>
										    <td class="text-center">2</td>
										    <td class="text-right">₮10,000</td>
										    <td class="text-right">₮20,000</td>
									    </tr>
								    </tbody>
							    </table>
							</div>
                            <h4 class="text-primary">Солисон сэлбэг <i>/₮20,000/</i></h4>
                            <div>
								<table class="table table-hover">
								    <thead>
									    <tr>
										    <th>Код</th>
										    <th>Сэлбэг нэр</th>
										    <th>Сэлбэр тайлбар</th>
										    <th>Сэлбэг авсан тайлбар</th>
										    <th class="text-center">/ш/</th>
										    <th class="text-right">Нэгж үнэ</th>
										    <th class="text-right">Нийт үнэ</th>
									    </tr>
								    </thead>
								    <tbody>
									    <tr>
										    <td>1</td>
										    <td>нэр</td>
										    <td>тайлбар</td>
										    <td>тайлбар</td>
										    <td class="text-center">2</td>
										    <td class="text-right">₮10,000</td>
										    <td class="text-right">₮20,000</td>
									    </tr>
								    </tbody>
							    </table>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- END Timeline Content -->
		</div>
	</div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {

    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
</script>
