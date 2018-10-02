<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffinfomodal.aspx.cs" Inherits="ebooking.pg.staffinfomodal" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel" lang="mn">Ажилтаны дэлгэрэнгүй мэдээлэл</h4>
</div>
<div class="modal-body">
    <div class="row">
        <div class="col-sm-3 profile-pic">
			<img id="staffImage" runat="server" src="../img/staff/male.jpg" width="100">
            <div id="staffDetail" runat="server" class="padding-10">
				<span class="label label-success">ACTIVE</span>
                <br />
                <br />
                Код: <span>S0001</span>
                <br />
                <span>Эрэгтэй</span>
            </div>
		</div>
        <div class="col-sm-9">
            <h1 id="staffNamePosition" runat="server">
                Гантөмөр <span class="semi-bold">Гүндсамба</span>
			    <br>
			    <small>Гүйцэтгэх захирал</small>
            </h1>
            <ul class="list-unstyled">
				<li>
					<div class="row">
                        <div class="col-sm-4" lang="mn">Ургийн овог:</div>
                        <div id="staffMname" runat="server" class="col-sm-8">а</div>
					</div>
				</li>
				<li>
					<div class="row">
                        <div class="col-sm-4" lang="mn">Регистер:</div>
                        <div id="staffIDCard" runat="server" class="col-sm-8">а</div>
					</div>
				</li>
				<li>
					<div class="row">
                        <div class="col-sm-4" lang="mn">Төрсөн огноо:</div>
                        <div id="staffBirthday" runat="server" class="col-sm-8">а</div>
					</div>
				</li>
				<li>
					<div class="row">
                        <div class="col-sm-4" lang="mn">Утас:</div>
                        <div id="staffPhone" runat="server" class="col-sm-8">а</div>
					</div>
				</li>
				<li>
					<div class="row">
                        <div class="col-sm-4" lang="mn">И-мэйл:</div>
                        <div id="staffEmail" runat="server" class="col-sm-8">а</div>
					</div>
				</li>
				<li>
					<div class="row">
                        <div class="col-sm-4" lang="mn">Хаяг:</div>
                        <div id="staffAddress" runat="server" class="col-sm-8">а</div>
					</div>
				</li>
			</ul>
        </div>
    </div>
</div>
<%--<div class="modal-body">
    <div class="row">
        <div class="col-md-6 text-right">Анх бүртгэсэн</div>
        <div id="createdInfo" runat="server" class="col-md-6 text-right text-primary"><i>770101 Г. Гүндсамба 2015-10-10 10:00:00</i></div>
    </div>
    <div class="row">
        <div class="col-md-6 text-right">Сүүлд засвар оруулсан</div>
        <div id="updatedInfo" runat="server" class="col-md-6 text-right text-primary"><i>770101 Г. Гүндсамба 2015-10-10 10:00:00</i></div>
    </div>
</div>--%>
