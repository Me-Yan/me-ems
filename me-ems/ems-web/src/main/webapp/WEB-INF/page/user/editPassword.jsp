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
    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-title"><span>修改密码</span></div>
            <div class="line-dashed"></div>
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">旧密码 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <input type="password" name="oldPassword" class="form-control field-input" id="oldPassword" />
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
                                    <input type="password" name="newPassword" class="form-control field-input" id="newPassword" />
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
                                    <input type="password" name="confirmPassword" class="form-control field-input" id="confirmPassword" />
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
        <button type="button" class="btn btn-primary" id="btnSubmit">提交</button>
    </div>
</form>

<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center">确认修改密码？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnConfirm">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="outcomeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-center">密码修改成功，请重新<a href="${pageContext.request.contextPath}/login">登录</a>。</p>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        initValidation();
    });

    $("#btnSubmit").on("click", function () {
        var validation = $("#passwordForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            $("#passwordModal").modal("show");
        }
    });

    $("#btnConfirm").on("click", function () {
        $("#passwordModal").modal("hide");
        $("#btnSubmit").attr("disabled", "disabled");
        $("body").loading("请稍等...");
        $.ajax({
            url: "${pageContext.request.contextPath}/user/confirmPassword",
            type: "POST",
            data: $("#passwordForm").serialize(),
            success: function (result) {
                if (result.success) {
                    $("body").loading("hide");
                    $("#outcomeModal").modal({
                        backdrop: 'static',
                        keyboard: false,
                        show: true
                    });
                }
            }
        })
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
                    message: '请填写旧密码。',
                    validators: {
                        notEmpty: {
                            message: '请填写旧密码'
                        },
                        remote: {
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/user/checkPassword',
                            message: '密码填写错误.',
                            delay: 500
                        }
                    }
                },
                newPassword:{
                    message: '请填写新密码。',
                    validators: {
                        notEmpty: {
                            message: '请填写新密码'
                        },
                        stringLength: {
                            min: 6,
                            max: 16,
                            message: '密码至少需要6个字符且不超过16个字符。'
                        }
                    }
                },
                confirmPassword:{
                    message: '请确认密码。',
                    validators: {
                        callback: {
                            callback: function (value, validator, $field) {
                                var newPassword = $("#newPassword").val();
                                if (value) {
                                    if (value === newPassword) {
                                        return true;
                                    }
                                    return {
                                        valid: false,
                                        message: '两次输入密码不一致'
                                    };
                                }
                                return {
                                    valid: false,
                                    message: '请确认密码。'
                                };
                            }
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
