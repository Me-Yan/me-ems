<%--
  Created by IntelliJ IDEA.
  User: YanYanghong
  Date: 2018/12/24
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
</head>
<body>

<form id="passwordForm">
    <div class="page-title" current-page="newBooking">
        <span>修改密码</span>
    </div>

    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">旧密码 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <input type="text" name="oldPassword" class="form-control field-input" id="oldPassword" />
                                    <span class="text-error hide" name="oldPasswordMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">新密码 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <input type="text" name="newPassword" class="form-control field-input" id="newPassword" />
                                    <span class="text-error hide" name="newPasswordMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">确认密码 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <input type="text" name="confirmPassword" class="form-control field-input" id="confirmPassword" />
                                    <span class="text-error hide" name="confirmPasswordMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="action-btn-group">
        <button type="button" class="btn btn-primary" onclick="backForm()">提交</button>
    </div>
</form>

<script>
    $(function () {
        initValidation();
    });

    function initValidation() {
        $("#passwordForm").formValidation({
            excluded: [':disabled'],
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            err: {
                container: function($field, validator) {
                    var messageName = $($field).attr("name")+"Message";
                    var messageNode  = $('#passwordForm').find($("span[name='"+messageName+"']"));
                    messageNode.addClass("has-error");
                    messageNode.removeClass("hide");
                    return messageNode;
                }
            },
            row: {
                valid: 'has-success',
                invalid: 'has-error',
                feedback: 'has-feedback'
            },
            icon: {
                valid: null,
                invalid: null,
                validating: null
            },
            fields: {
                oldPassword:{
                    message: '请选择是否追加',
                    validators: {
                        notEmpty: {
                            message: '请选择是否追加'
                        },
                        remote: {
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/user/checkPassword',
                            message: 'Site Name already exists.'
                            //delay :  1000
                        }
                    }
                }
            }
        }).on('err.field.fv', function(e, data) {
            $("#passwordForm").find("i.form-control-feedback").remove();

            if($(data.element).is('select')) {
                $(data.element).next().addClass("has-error");
                $(data.element).next().removeClass("has-success");
            }
            else if($(data.element).is('textarea')) {
                $(data.element).parent().addClass("has-error");
                $(data.element).parent().removeClass("has-success");
            }
            else {
                $(data.element).addClass("has-error");
                $(data.element).removeClass("has-success");
            }
        }).on('success.field.fv', function(e, data) {
//            $("#btnUserSubmit").removeAttr("disabled");
            if($(data.element).is('select')) {
                $(data.element).next().removeClass("has-error");
                $(data.element).next().addClass("has-success");
            }
            else if($(data.element).is('textarea')) {
                $(data.element).parent().removeClass("has-error");
                $(data.element).parent().addClass("has-success");
            }
            else {
                $(data.element).removeClass("has-error");
                $(data.element).addClass("has-success");
            }
            $("#passwordForm").find("."+data.field+"Message").css("display","none");
            $("#passwordForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#passwordForm").find("i.form-control-feedback").remove();
        });
    }
</script>
</body>
</html>
