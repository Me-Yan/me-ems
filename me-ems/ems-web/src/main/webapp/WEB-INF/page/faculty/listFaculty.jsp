<%@ page import="com.me.inner.constant.CommonConstant" %><%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/12/25
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学院列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/custom-table.css">
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
            <div class="page-section-title"><span>学院列表</span></div>
            <div class="line-dashed"></div>
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-6 col-sm-4 col-md-4" style="margin-bottom: 10px;">
                        <div class="input-group">
                            <input name="facultyName" id="facultyName" maxlength="50" class="form-control field-input" />
                            <div class="input-group-addon icon-search"><i class="fa fa-search"></i></div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-8 col-md-8 text-right">
                        <button type="button" class="btn btn-primary" id="btnAdd">添加</button>
                    </div>
                    <div class="col-xs-12">
                        <div class="table-responsive">
                            <table id="facultyTable" class="table table-hover table-striped table-condensed"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../commonModal.jsp"/>

    <%-- 新建学院Modal --%>
    <div class="modal fade" id="formModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">添加学院</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="facultyForm"method="post">
                        <div class="row">
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">学院名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
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
                    <p>确认添加该学院？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnConfirm">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 修改学院Modal --%>
    <div class="modal fade" id="editFormModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">修改学院</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="editFacultyForm" method="post">
                        <div class="row">
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">学院名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
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
                    <p>确认修改该学院？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnEditConfirm">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 删除学院 --%>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body text-center">
                    <p>删除该学院，同时会删除所有与该学院相关的所有信息，请谨慎操作，确定删除？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnDelete">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 恢复学院 --%>
    <div class="modal fade" id="restoreModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body text-center">
                    <p>恢复学院会同时恢复该学院下的专业及其专业对应的课程和所有的班级，但需要重新安排班级课程，请谨慎操作，确认恢复？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnRestore">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        var deleteId;
        var updateId;
        var restoreId;
        $(function () {
            initTable();
        });
        
        function restoreModal(facultyId) {
            restoreId = facultyId;
            $("#restoreModal").modal("show");
        }
        $("#btnRestore").on("click", function () {
            $("#restoreModal").modal("hide");
            $("body").loading("请稍等。。。");
            $.ajax({
                url: "${pageContext.request.contextPath}/faculty/restoreFaculty",
                type: "post",
                data: {
                    facultyId: restoreId
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html("恢复成功。");
                        $("#facultyTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html("恢复失败。");
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        // 删除学院
        function deleteModal(facultyId) {
            deleteId = facultyId;
            $("#deleteModal").modal("show");
        }
        $("#btnDelete").on("click", function () {
            $("#deleteModal").modal("hide");
            $("body").loading("请稍等。。。");
            $.ajax({
                url: "${pageContext.request.contextPath}/faculty/deleteFaculty",
                type: "post",
                data: {
                    facultyId: deleteId
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html("删除成功。");
                        $("#facultyTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html("删除失败。");
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        // 修改学院
        function editModal(facultyId) {
            updateId = facultyId;
            $.ajax({
               url: "${pageContext.request.contextPath}/faculty/getFaculty",
                type: "post",
                data: {
                    facultyId: updateId
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
            var validation = $("#editFacultyForm").data("formValidation");
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
                url: "${pageContext.request.contextPath}/faculty/updateFaculty",
                type: "post",
                data: {
                    facultyId: updateId,
                    name: $("#editName").val()
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html("修改成功。");
                        $("#facultyTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html("该学院已存在。");
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        $("#editFormModal").on("show.bs.modal", function () {
            document.getElementById("editFacultyForm").reset();
            initEditValidation();
        });
        $("#editFormModal").on("hidden.bs.modal", function () {
            $("#editFacultyForm").data("formValidation").destroy();
        });

        // 添加学院
        $("#btnAdd").on("click", function () {
            $("#formModal").modal({
                backdrop: 'static',
                keyboard: false,
                show: true
            });
        });

        $("#btnSubmit").on("click", function () {
            var validation = $("#facultyForm").data("formValidation");
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
                url: "${pageContext.request.contextPath}/faculty/addFaculty",
                type: "post",
                data: $("#facultyForm").serialize(),
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html("添加成功。");
                        $("#facultyTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html("该学院已存在。");
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });
        $("#formModal").on("show.bs.modal", function () {
            document.getElementById("facultyForm").reset();
            initValidation();
        });
        $("#formModal").on("hidden.bs.modal", function () {
            $("#facultyForm").data("formValidation").destroy();
        });

        $(".icon-search").on("click", function () {
            $("#facultyTable").bootstrapTable("refresh");
        });

        var serialNo = 1;
        function queryParams(params) {
            serialNo = params.offset;
            return {
                facultyName: $("#facultyName").val(),
                curPage: params.offset/params.limit,
                limit: params.limit
            };
        }

        function initTable() {
            $("#facultyTable").bootstrapTable({
                url: '${pageContext.request.contextPath}/faculty/listFacultyData',
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
                        title: '学院名称',
                        align: 'center',
                        valign: 'middle',
                        width:'70%'
                    },
                    {
                        field: '',
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        width:'20%',
                        formatter: function (value, row, index) {

                            var content = '<div class="btn-group"><button type="button" class="btn btn-primary" onclick="editModal('+row.facultyId+')">修改</button>';
                            if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.active) {
                                content += '<button type="button" class="btn btn-danger" onclick="deleteModal('+row.facultyId+')">删除</button>';
                            } else {
                                content += '<button type="button" class="btn btn-success" onclick="restoreModal('+row.facultyId+')">恢复</button>';
                            }

                            return content + '</div>';
                        }
                    }
                ]
            });
        }

        function initValidation() {
            $("#facultyForm").formValidation({
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
                        var messageNode  = $('#facultyForm').find($("span[name='"+messageName+"']"));
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
                        message: '请填写学院名称。',
                        validators: {
                            notEmpty: {
                                message: '请填写学院名称'
                            },
                            stringLength: {
                                max: 20,
                                message: '不能超过20个字符。'
                            }
                        }
                    }
                }
            }).on('err.field.fv', function(e, data) {
                $("#facultyForm").find("i.form-control-feedback").remove();

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
                $("#facultyForm").find("."+data.field+"Message").css("display","none");
                $("#facultyForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#facultyForm").find("i.form-control-feedback").remove();
            });
        }

        function initEditValidation() {
            $("#editFacultyForm").formValidation({
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
                        var messageNode  = $('#editFacultyForm').find($("span[name='"+messageName+"']"));
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
                        message: '请填写学院名称。',
                        validators: {
                            notEmpty: {
                                message: '请填写学院名称'
                            },
                            stringLength: {
                                max: 20,
                                message: '不能超过20个字符。'
                            }
                        }
                    }
                }
            }).on('err.field.fv', function(e, data) {
                $("#editFacultyForm").find("i.form-control-feedback").remove();

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
                $("#editFacultyForm").find("."+data.field+"Message").css("display","none");
                $("#editFacultyForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#editFacultyForm").find("i.form-control-feedback").remove();
            });
        }
    </script>

</body>
</html>
