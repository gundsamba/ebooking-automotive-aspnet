<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patientinfomodal.aspx.cs" Inherits="ebooking.pg.patientinfomodal" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel" lang="mn">Үйлчлүүлэгчийн дэлгэрэнгүй мэдээлэл</h4>
</div>
<div class="modal-body">
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Код</label>
                <div id="patientCode" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Эзэмшигчийн нэр</label>
                <div id="patientName" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Төрөл</label>
                <div id="patientType" runat="server" class="col-md-8" lang="mn">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Утас 1</label>
                <div id="patientTel" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Утас 2</label>
                <div id="patientTel2" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">И-мэйл</label>
                <div id="patientEmail" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Хаяг</label>
                <div id="patientAddress" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Манайхаас худалдан авсан</label>
                <div id="patientIsMySold" runat="server" class="col-md-8"></div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Автомашины загвар</label>
                <div id="patientAutoMark" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Үйлдвэрлэсэн он</label>
                <div id="patientAutoYear" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Улсын дугаар</label>
                <div id="patientAutoNo" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Аралын дугаар</label>
                <div id="patientAutoVinNo" runat="server" class="col-md-8">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Шатахууны төрөл</label>
                <div id="patientFuelType" runat="server" class="col-md-8" lang="mn">P150301134</div>
            </div>
            <div class="row">
                <label class="col-md-4 control-label" lang="mn">Хурдны хайрцаг</label>
                <div id="patientTransmission" runat="server" class="col-md-8" lang="mn">P150301134</div>
            </div>
        </div>
    </div>
</div>
<div class="modal-body">
    <div class="row">
        <div class="col-md-8 text-right" lang="mn">Анх бүртгэсэн</div>
        <div id="createdInfo" runat="server" class="col-md-4 text-right text-primary"><i>770101 Г. Гүндсамба 2015-10-10 10:00:00</i></div>
    </div>
    <div class="row">
        <div class="col-md-8 text-right" lang="mn">Сүүлд засвар оруулсан</div>
        <div id="updatedInfo" runat="server" class="col-md-4 text-right text-primary"><i>770101 Г. Гүндсамба 2015-10-10 10:00:00</i></div>
    </div>
</div>
