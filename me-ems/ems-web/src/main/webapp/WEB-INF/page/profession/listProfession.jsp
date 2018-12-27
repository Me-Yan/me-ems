<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YanYanghong
  Date: 2018/12/27
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专业列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/custom-table.css">
</head>
<body>

    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-title"><span>专业列表</span></div>
            <div class="line-dashed"></div>
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-6 col-sm-4 col-md-4" style="margin-bottom: 10px;">
                        <select name="facultyName" id="facultyName" class="form-control field-input">
                            <option value="">- 请选择学院 -</option>
                            <c:if test="${not empty facultyList}">
                                <c:forEach items="${facultyList}" var="faculty">
                                    <option value="${faculty.facultyId}"><c:out value="${faculty.name}"/></option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="col-xs-6 col-sm-8 col-md-8 text-right">
                        <button type="button" class="btn btn-primary" id="btnAdd">添加</button>
                    </div>
                    <div class="col-xs-12">
                        <div class="table-responsive">
                            <table id="professionTable" class="table table-hover table-striped table-condensed"></table>
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
                    <h4 class="modal-title">添加专业</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="professionForm" method="post">
                        <div class="row">
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">学院名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <select name="facultyId" id="facultyId" class="form-control field-input">
                                                <option value="">- 请选择学院 -</option>
                                                <c:if test="${not empty facultyList}">
                                                    <c:forEach items="${facultyList}" var="faculty">
                                                        <option value="${faculty.facultyId}"><c:out value="${faculty.name}"/></option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                            <span class="text-error hide" name="facultyIdMessage"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">专业名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
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
                    <p>确认添加该专业？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnConfirm">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 修改专业Modal --%>
    <div class="modal fade" id="editFormModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">修改专业</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="editProfessionForm" method="post">
                        <div class="row">
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">专业名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
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
                    <p>确认修改该专业？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnEditConfirm">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 删除专业 --%>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body text-center">
                    <p>删除该专业，同时会删除所有与该专业相关的所有信息，比如学生信息、课程信息等，请谨慎操作，确定删除？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnDelete">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        var deleteId;
        var updateId;
        var facultyId;
        $(function () {
            initSelect();
            initTable();
        });

        // 删除专业
        function deleteModal(professionId) {
            deleteId = professionId;
            $("#deleteModal").modal("show");
        }
        $("#btnDelete").on("click", function () {
            $("#deleteModal").modal("hide");
            $("body").loading("请稍等。。。");
            $.ajax({
                url: "${pageContext.request.contextPath}/profession/deleteProfession",
                type: "post",
                data: {
                    professionId: deleteId
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html("删除成功。");
                        $("#professionTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html("删除失败。");
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        // 修改专业
        function editModal(professionId, facultyId) {
            this.updateId = professionId;
            this.facultyId = facultyId;
            $.ajax({
                url: "${pageContext.request.contextPath}/profession/getProfession",
                type: "post",
                data: {
                    professionId: updateId
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
            var validation = $("#editProfessionForm").data("formValidation");
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
                url: "${pageContext.request.contextPath}/profession/updateProfession",
                type: "post",
                data: {
                    facultyId: facultyId,
                    professionId: updateId,
                    name: $("#editName").val()
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html("修改成功。");
                        $("#professionTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html("该学院已存在此专业。");
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        $("#editFormModal").on("show.bs.modal", function () {
            document.getElementById("editProfessionForm").reset();
            initEditValidation();
        });
        $("#editFormModal").on("hidden.bs.modal", function () {
            $("#editProfessionForm").data("formValidation").destroy();
        });

        // 添加专业
        $("#btnAdd").on("click", function () {
            $("#formModal").modal({
                backdrop: 'static',
                keyboard: false,
                show: true
            });
        });

        $("#btnSubmit").on("click", function () {
            var validation = $("#professionForm").data("formValidation");
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
                url: "${pageContext.request.contextPath}/profession/addProfession",
                type: "post",
                data: $("#professionForm").serialize(),
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html("添加成功。");
                        $("#professionTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html("该学院中已存在此专业。");
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });
        $("#formModal").on("show.bs.modal", function () {
            $("#facultyId").val("").trigger("change");
            document.getElementById("professionForm").reset();
            initValidation();
        });
        $("#formModal").on("hidden.bs.modal", function () {
            $("#professionForm").data("formValidation").destroy();
        });

        var serialNo = 1;
        function queryParams(params) {
            serialNo = params.offset;
            return {
                facultyId: $("#facultyName").val(),
                curPage: params.offset/params.limit,
                limit: params.limit
            };
        }

        $("#facultyName").on("change", function () {
            $("#professionTable").bootstrapTable("refresh");
        });

        function initTable() {
            $("#professionTable").bootstrapTable({
                url: '${pageContext.request.contextPath}/profession/listProfessionData',
                method: 'POST',
                cache: false,
                contentType: "application/x-www-form-urlencoded",
                queryParams: queryParams,
                pagination: true,
                pageNumber: 1,
                pageSize: 10,
                pageList: [10],
                sidePagination: 'server',
                uniqueId: 'professionId',
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
                        field: 'facultyName',
                        title: '学院',
                        align: 'center',
                        valign: 'middle',
                        width:'30%'
                    },
                    {
                        field: 'name',
                        title: '专业',
                        align: 'center',
                        valign: 'middle',
                        width:'40%'
                    },
                    {
                        field: '',
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        width:'20%',
                        formatter: function (value, row, index) {
                            return '<div class="btn-group">' +
                                    '<button type="button" class="btn btn-primary" onclick="editModal('+row.professionId+', '+row.facultyId+')">修改</button>' +
                                    '<button type="button" class="btn btn-danger" onclick="deleteModal('+row.professionId+')">删除</button>' +
                                    '</div>';
                        }
                    }
                ]
            });
        }

        function initEditValidation() {
            $("#editProfessionForm").formValidation({
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
                        var messageNode  = $('#editProfessionForm').find($("span[name='"+messageName+"']"));
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
                        message: '请填写专业名称。',
                        validators: {
                            notEmpty: {
                                message: '请填写专业名称。'
                            },
                            stringLength: {
                                max: 20,
                                message: '不能超过20个字符。'
                            }
                        }
                    }
                }
            }).on('err.field.fv', function(e, data) {
                $("#editProfessionForm").find("i.form-control-feedback").remove();

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
                $("#editProfessionForm").find("."+data.field+"Message").css("display","none");
                $("#editProfessionForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#editProfessionForm").find("i.form-control-feedback").remove();
            });
        }

        function initValidation() {
            $("#professionForm").formValidation({
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
                        var messageNode  = $('#professionForm').find($("span[name='"+messageName+"']"));
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
                    facultyId:{
                        message: '请选择学院。',
                        validators: {
                            notEmpty: {
                                message: '请选择学院。'
                            }
                        }
                    },
                    name:{
                        message: '请填写专业名称。',
                        validators: {
                            notEmpty: {
                                message: '请填写专业名称'
                            },
                            stringLength: {
                                max: 20,
                                message: '不能超过20个字符。'
                            }
                        }
                    }
                }
            }).on('err.field.fv', function(e, data) {
                $("#professionForm").find("i.form-control-feedback").remove();

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
                $("#professionForm").find("."+data.field+"Message").css("display","none");
                $("#professionForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#professionForm").find("i.form-control-feedback").remove();
            });
        }

        function initSelect() {
            $("select").select2({
                width: '100%',
                dropdownAutoWidth:false
//                minimumResultsForSearch: -1
            });
        }
    </script>
</body>
</html>
