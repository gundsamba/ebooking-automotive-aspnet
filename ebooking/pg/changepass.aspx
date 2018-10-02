<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepass.aspx.cs" Inherits="ebooking.pg.changepass" %>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-lock fa-fw "></i> 
			<span lang="mn">Нүүц үг өөрчлөх</span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
        <div class="well animated fadeInDown">
            <div class="row">
                <div class="col-md-6">
                    <form id="changepassForm" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
						        <label class="col-md-4 control-label" lang="mn">*Хуучин нууц үг</label>
						        <div class="col-md-8">
							        <input id="changepassInputOldPassword" name="changepassInputOldPassword" class="form-control" placeholder="Хуучин нууц үг" type="password" lang="mn">
						        </div>
					        </div>
                            <div class="form-group">
						        <label class="col-md-4 control-label" lang="mn">*Шинэ нууц үг</label>
						        <div class="col-md-8">
							        <input id="changepassInputNewPassword" name="changepassInputNewPassword" class="form-control" placeholder="Шинэ нууц үг" type="password" lang="mn">
						        </div>
					        </div>
                            <div class="form-group">
						        <label class="col-md-4 control-label" lang="mn">*Шинэ нууц үг давт</label>
						        <div class="col-md-8">
							        <input id="changepassInputNewPasswordConfirm" name="changepassInputNewPasswordConfirm" class="form-control" placeholder="Шинэ нууц үг давт" type="password" lang="mn">
						        </div>
					        </div>
                            <div class="form-group">
						        <label class="col-md-4 control-label">&nbsp;</label>
						        <div class="col-md-8">
							        <button type="submit" class="btn btn-primary btn-xs pull-right"><span class="glyphicon glyphicon-floppy-disk"></span> <span lang="mn">Хадгалах</span></button>
						        </div>
					        </div>
                            <div id="messageSection" class="form-group">

                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
	</div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var date = new Date();
    var lastDay;
    var pagefunction = function () {
        
    }
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    $('#changepassForm').bootstrapValidator({
        fields: {
            changepassInputOldPassword: {
                group: '.form-group',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 20,
                        min: 6,
                        message: 'Тэмдэгтийн урт 6-20 тэмдэгт авна'
                    }
                }
            },
            changepassInputNewPassword: {
                group: '.form-group',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 20,
                        min: 3,
                        message: 'Тэмдэгтийн урт 3-20 тэмдэгт авна'
                    },
                    identical: {
                        field: 'changepassInputNewPasswordConfirm',
                        message: 'Шинэ нууц үг адил оруулна уу'
                    }
                }
            },
            changepassInputNewPasswordConfirm: {
                group: '.form-group',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 20,
                        min: 3,
                        message: 'Тэмдэгтийн урт 3-20 тэмдэгт авна'
                    },
                    identical: {
                        field: 'changepassInputNewPassword',
                        message: 'Шинэ нууц үг адил оруулна уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../wcf/ServiceMain.svc/Changepass",
                data: '{"userid":"' + $('#indexStaffId').text() + '", "oldpass":"' + $.trim($('#changepassInputOldPassword').val()) + '", "newpass":"' + $.trim($('#changepassInputNewPassword').val()) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    $('#messageSection').html('<div class="alert alert-success fade in" style="margin:0; padding:5px;"><button class="close" data-dismiss="alert">×</button><span lang="mn">Шинэ нууц үг амжилттай хадгалагдлаа...</span></div>');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    $('#messageSection').html('<div class="alert alert-danger fade in" style="margin:0; padding:5px;"><button class="close" data-dismiss="alert">×</button>' + err.Message + '</div>');
                }
            });
        }
    });
</script>
