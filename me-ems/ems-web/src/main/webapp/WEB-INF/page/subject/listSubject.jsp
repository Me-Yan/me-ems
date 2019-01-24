<%@ page import="com.me.inner.constant.CommonConstant" %><%--
  Created by IntelliJ IDEA.
  User: YanYanghong
  Date: 2019/1/24
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程列表</title>
    <style>
        .icon-search {
            cursor: pointer;
        }
        .icon-search:active {
            background-color: #D8D8D8;
        }
    </style>
</head>
<body>

    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-title"><span>课程列表</span></div>
            <div class="line-dashed"></div>
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-6 col-sm-4 col-md-4" style="margin-bottom: 10px;">
                        <div class="input-group">
                            <input name="subjectName" id="subjectName" maxlength="50" class="form-control field-input" placeholder="课程名称" />
                            <div class="input-group-addon icon-search"><i class="fa fa-search"></i></div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-8 col-md-8 text-right">
                        <button type="button" class="btn btn-primary" id="btnAdd">添加</button>
                    </div>
                    <div class="col-xs-12">
                        <div class="table-responsive">
                            <table id="subjectTable" class="table table-hover table-striped table-condensed"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../commonModal.jsp"/>

    <%-- 新建课程Modal --%>
    <div class="modal fade" id="formModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">添加课程</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="subjectForm" method="post">
                        <div class="row">
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">课程名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <input type="text" name="name" class="form-control field-input" id="name" />
                                            <span class="text-error hide" name="nameMessage"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnSubmit">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 确认添加提示Modal --%>
    <div class="modal fade" id="confirmFormModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body text-center">
                    <p>确认添加该课程？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnConfirm">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 修改课程Modal --%>
    <div class="modal fade" id="editFormModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">修改课程</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="editSubjectForm" method="post">
                        <div class="row">
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">课程名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <input type="text" name="editName" class="form-control field-input" maxlength="20" id="editName" />
                                            <span class="text-error hide" name="editNameMessage"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnEditSubmit">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <%-- 确认修改提示Modal --%>
    <div class="modal fade" id="confirmEditFormModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body text-center">
                    <p>确认修改该课程？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnEditConfirm">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 删除课程 --%>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body text-center">
                    <p>删除课程，会同时取消该课程的正常进行，确认删除？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnDelete">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 恢复课程 --%>
    <div class="modal fade" id="restoreModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body text-center">
                    <p>确认恢复课程？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnRestore">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        var updateId;
        var deleteId;
        var restoreId;
        $(function () {
            initTable();
        });

        // 恢复课程
        function restoreModal(subjectId) {
            restoreId = subjectId;
            $("#restoreModal").modal("show");
        }
        $("#btnRestore").on("click", function () {
            $("#restoreModal").modal("hide");
            $("body").loading("请稍等。。。");
            $.ajax({
                url: "${pageContext.request.contextPath}/subject/restoreSubject",
                type: "post",
                data: {
                    subjectId: restoreId
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html(result.message);
                        $("#subjectTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html(result.message);
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        // 删除课程
        function deleteModal(subjectId) {
            deleteId = subjectId;
            $("#deleteModal").modal("show");
        }
        $("#btnDelete").on("click", function () {
            $("#deleteModal").modal("hide");
            $("body").loading("请稍等。。。");
            $.ajax({
                url: "${pageContext.request.contextPath}/subject/deleteSubject",
                type: "post",
                data: {
                    subjectId: deleteId
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html(result.message);
                        $("#subjectTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html(result.message);
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        // 修改课程
        function editModal(subjectId) {
            updateId = subjectId;
            $.ajax({
                url: "${pageContext.request.contextPath}/subject/getSubject",
                type: "post",
                data: {
                    subjectId: updateId
                },
                success: function (result) {
                    if (result) {
                        $("#editName").val(result.name);
                    }
                }
            });
            $("#editFormModal").modal({
                backdrop: 'static',
                keyboard: false,
                show: true
            });
        }

        $("#btnEditSubmit").on("click", function () {
            var validation = $("#editSubjectForm").data("formValidation");
            validation.validate();
            if (validation.isValid()) {
                $("#editFormModal").modal("hide");
                $("#confirmEditFormModal").modal({
                    backdrop: 'static',
                    keyboard: false,
                    show: true
                });
            }
        });

        $("#btnEditConfirm").on("click", function () {
            $("#confirmEditFormModal").modal("hide");
            $("body").loading("请等待。。。");
            $.ajax({
                url: "${pageContext.request.contextPath}/subject/updateSubject",
                type: "post",
                data: {
                    subjectId: updateId,
                    name: $("#editName").val()
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html(result.message);
                        $("#subjectTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html(result.message);
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        $("#editFormModal").on("show.bs.modal", function () {
            document.getElementById("editSubjectForm").reset();
            initEditValidation();
        });
        $("#editFormModal").on("hidden.bs.modal", function () {
            $("#editSubjectForm").data("formValidation").destroy();
        });

        // 添加课程
        $("#btnAdd").on("click", function () {
            $("#formModal").modal({
                backdrop: 'static',
                keyboard: false,
                show: true
            });
        });

        $("#btnSubmit").on("click", function () {
            var validation = $("#subjectForm").data("formValidation");
            validation.validate();
            if (validation.isValid()) {
                $("#formModal").modal("hide");
                $("#confirmFormModal").modal({
                    backdrop: 'static',
                    keyboard: false,
                    show: true
                });
            }
        });
        $("#btnConfirm").on("click", function () {
            $("#confirmFormModal").modal("hide");
            $("body").loading("请等待。。。");
            $.ajax({
                url: "${pageContext.request.contextPath}/subject/addSubject",
                type: "post",
                data: $("#subjectForm").serialize(),
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html(result.message);
                        $("#subjectTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html(result.message);
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });
        $("#formModal").on("show.bs.modal", function () {
            document.getElementById("subjectForm").reset();
            initValidation();
        });
        $("#formModal").on("hidden.bs.modal", function () {
            $("#subjectForm").data("formValidation").destroy();
        });

        // 查询
        $(".icon-search").on("click", function () {
            $("#subjectTable").bootstrapTable("refresh");
        });

        var serialNo = 1;
        function queryParams(params) {
            serialNo = params.offset;
            return {
                subjectName: $("#subjectName").val(),
                curPage: params.offset/params.limit,
                limit: params.limit
            };
        }

        function initTable() {
            $("#subjectTable").bootstrapTable({
                url: '${pageContext.request.contextPath}/subject/listSubjectData',
                method: 'POST',
                cache: false,
                contentType: "application/x-www-form-urlencoded",
                queryParams: queryParams,
                pagination: true,
                pageNumber: 1,
                pageSize: 10,
                pageList: [10],
                sidePagination: 'server',
                uniqueId: 'facultyId',
                columns: [
                    {
                        field: '',
                        title: '#',
                        align: 'center',
                        valign: 'middle',
                        width:'10%',
                        formatter: function () {
                            return ++serialNo;
                        }
                    },
                    {
                        field: 'name',
                        title: '课程名称',
                        align: 'center',
                        valign: 'middle',
                        width:'50%'
                    },
                    {
                        field: 'createDateStr',
                        title: '创建时间',
                        align: 'center',
                        valign: 'middle',
                        width:'20%'
                    },
                    {
                        field: '',
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        width:'20%',
                        formatter: function (value, row, index) {

                            var content = '<div class="btn-group"><button type="button" class="btn btn-primary" onclick="editModal('+row.subjectId+')">修改</button>';
                            if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.active) {
                                content += '<button type="button" class="btn btn-danger" onclick="deleteModal('+row.subjectId+')">删除</button>';
                            } else {
                                content += '<button type="button" class="btn btn-success" onclick="restoreModal('+row.subjectId+')">恢复</button>';
                            }

                            return content + '</div>';
                        }
                    }
                ]
            });
        }

        function initValidation() {
            $("#subjectForm").formValidation({
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
                        var messageNode  = $('#subjectForm').find($("span[name='"+messageName+"']"));
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
                    name:{
                        message: '请填写课程名称。',
                        validators: {
                            notEmpty: {
                                message: '请填写课程名称。'
                            },
                            stringLength: {
                                max: 20,
                                message: '不能超过20个字符。'
                            }
                        }
                    }
                }
            }).on('err.field.fv', function(e, data) {
                $("#subjectForm").find("i.form-control-feedback").remove();

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
                $("#subjectForm").find("."+data.field+"Message").css("display","none");
                $("#subjectForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#subjectForm").find("i.form-control-feedback").remove();
            });
        }

        function initEditValidation() {
            $("#editSubjectForm").formValidation({
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
                        var messageNode  = $('#editSubjectForm').find($("span[name='"+messageName+"']"));
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
                    editName:{
                        message: '请填写课程名称。',
                        validators: {
                            notEmpty: {
                                message: '请填写课程名称。'
                            },
                            stringLength: {
                                max: 20,
                                message: '不能超过20个字符。'
                            }
                        }
                    }
                }
            }).on('err.field.fv', function(e, data) {
                $("#editSubjectForm").find("i.form-control-feedback").remove();

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
                $("#editSubjectForm").find("."+data.field+"Message").css("display","none");
                $("#editSubjectForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#editSubjectForm").find("i.form-control-feedback").remove();
            });
        }
    </script>

</body>
</html>
