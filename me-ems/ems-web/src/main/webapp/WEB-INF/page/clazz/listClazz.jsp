<%@ page import="com.me.inner.constant.CommonConstant" %><%--
  Created by IntelliJ IDEA.
  User: YanYanghong
  Date: 2019/1/25
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>班级列表</title>
</head>
<body>

    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-title"><span>班级列表</span></div>
            <div class="line-dashed"></div>
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-3 col-md-3" style="margin-bottom: 10px;">
                        <select name="grade" id="grade" class="form-control field-input">
                            <option value="">- 请选择年级 -</option>
                            <c:if test="${not empty gradeList}">
                                <c:forEach items="${gradeList}" var="grade">
                                    <option value="${grade}"><c:out value="${grade}"/></option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3" style="margin-bottom: 10px;">
                        <select name="facultyId" id="faculty" class="form-control field-input">
                            <option value="">- 请选择学院 -</option>
                            <c:if test="${not empty facultyList}">
                                <c:forEach items="${facultyList}" var="faculty">
                                    <option value="${faculty.facultyId}"><c:out value="${faculty.name}"/></option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3" style="margin-bottom: 10px;">
                        <select name="professionId" id="profession" class="form-control field-input">
                            <option value="">- 请选择专业 -</option>
                        </select>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 text-right">
                        <button type="button" class="btn btn-primary" id="btnAdd">添加</button>
                    </div>
                    <div class="col-xs-12">
                        <div class="table-responsive">
                            <table id="clazzTable" class="table table-hover table-striped table-condensed"></table>
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
                    <h4 class="modal-title">添加班级</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="clazzForm" method="post">
                        <div class="row">
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">所属学院 <span class="colon-label">:</span><span class="field-star">*</span></label>
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
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">所属专业 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <select name="professionId" id="professionId" class="form-control field-input">
                                                <option value="">- 请选择专业 -</option>
                                            </select>
                                            <span class="text-error hide" name="professionIdMessage"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">年级 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <select name="gradeName" id="gradeName" class="form-control field-input">
                                                <option value="">- 请选择年级 -</option>
                                                <c:if test="${false eq curYearFlag}">
                                                    <option value="${curYear}">${curYear}</option>
                                                </c:if>
                                                <c:if test="${not empty gradeList}">
                                                    <c:forEach items="${gradeList}" var="grade">
                                                        <option value="${grade}"><c:out value="${grade}"/></option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                            <span class="text-error hide" name="gradeNameMessage"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">班级数量 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <select name="clazzCount" id="clazzCount" class="form-control field-input">
                                                <option value="">- 请选择班级数量 -</option>
                                                <c:if test="${not empty clazzList}">
                                                    <c:forEach items="${clazzList}" var="clazz">
                                                        <option value="${clazz}"><c:out value="${clazz}"/></option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                            <span class="text-error hide" name="clazzCountMessage"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 form-group-field">
                                <div class="col-xs-12 field-star">备注：班级的添加是在已存在的班级数量后依次指定数量的班级。</div>
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
                    <p>确认添加该班级？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnConfirm">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 删除班级 --%>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body text-center">
                    <p>删除班级，同时会删除所有与该班级相关的所有信息，比如学生信息、课程信息等，请谨慎操作，确定删除？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="btnDelete">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        var deleteId;
        $(function () {
            initSelect();
            initTable();
        });

        // 删除班级
        function deleteModal(clazzId) {
            deleteId = clazzId;
            $("#deleteModal").modal("show");
        }
        $("#btnDelete").on("click", function () {
            $("#deleteModal").modal("hide");
            $("body").loading("请稍等。。。");
            $.ajax({
                url: "${pageContext.request.contextPath}/clazz/deleteClazz",
                type: "post",
                data: {
                    clazzId: deleteId
                },
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html(result.message);
                        $("#clazzTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html(result.message);
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });

        // 添加班级
        $("#btnAdd").on("click", function () {
            $("#formModal").modal({
                backdrop: 'static',
                keyboard: false,
                show: true
            });
        });

        $("#btnSubmit").on("click", function () {
            var validation = $("#clazzForm").data("formValidation");
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
                url: "${pageContext.request.contextPath}/clazz/addClazz",
                type: "post",
                data: $("#clazzForm").serialize(),
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html(result.message);
                        $("#clazzTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html(result.message);
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });
        $("#formModal").on("show.bs.modal", function () {
            $("#facultyId").val("").trigger("change");
            $("#gradeName").val("").trigger("change");
            $("#clazzCount").val("").trigger("change");
            document.getElementById("clazzForm").reset();
            initValidation();
        });
        $("#formModal").on("hidden.bs.modal", function () {
            $("#clazzForm").data("formValidation").destroy();
        });

        // 查询
        $("#grade, #profession").on("change", function () {
            $("#clazzTable").bootstrapTable("refresh");
        });

        $("#faculty").on("change", function () {
            $("#profession").empty();
            var facultyId = $("#faculty").val();
            if (facultyId) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/clazz/listProfessionByFacultyId",
                    data: {
                        facultyId: facultyId
                    },
                    success: function (result) {
                        if (result && result.length>0) {
                            var content = spliceProfessionNode(result);
                            $("#profession").append(content);
                        } else {
                            $("#profession").append('<option value="">- 请选择专业 -</option>');
                        }
                    }
                });
            } else {
                $("#profession").append('<option value="">- 请选择专业 -</option>');
            }
            $("#clazzTable").bootstrapTable("refresh");
        });

        $("#facultyId").on("change", function () {
            $("#professionId").empty();
            var facultyId = $("#facultyId").val();
            if (facultyId) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/clazz/listProfessionByFacultyId",
                    data: {
                        facultyId: facultyId
                    },
                    success: function (result) {
                        if (result && result.length>0) {
                            var content = spliceProfessionNode(result);
                            $("#professionId").append(content);
                        } else {
                            $("#professionId").append('<option value="">- 请选择专业 -</option>');
                        }
                    }
                });
            } else {
                $("#professionId").append('<option value="">- 请选择专业 -</option>');
            }

            $("#professionId").trigger("change");
        });

        // splice option node
        function spliceProfessionNode(professionArray) {
            var content = '<option value="">- 请选择专业 -</option>';
            if (professionArray && professionArray.length>0) {
                $.each(professionArray, function (index, item) {
                    content += '<option value="'+ item.professionId +'">'+ item.name +'</option>';
                });
            }

            return content;
        }

        // init table
        var serialNo = 1;
        function queryParams(params) {
            serialNo = params.offset;
            return {
                grade: $("#grade").val(),
                facultyId: $("#faculty").val(),
                professionId: $("#profession").val(),
                curPage: params.offset/params.limit,
                limit: params.limit
            };
        }

        function initTable() {
            $("#clazzTable").bootstrapTable({
                url: '${pageContext.request.contextPath}/clazz/listClazzData',
                method: 'POST',
                cache: false,
                contentType: "application/x-www-form-urlencoded",
                queryParams: queryParams,
                pagination: true,
                pageNumber: 1,
                pageSize: 10,
                pageList: [10],
                sidePagination: 'server',
                uniqueId: 'clazzId',
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
                        field: 'gradeName',
                        title: '年级',
                        align: 'center',
                        valign: 'middle',
                        width:'15%'
                    },
                    {
                        field: 'clazzName',
                        title: '班级',
                        align: 'center',
                        valign: 'middle',
                        width:'10%'
                    },
                    {
                        field: 'professionName',
                        title: '专业',
                        align: 'center',
                        valign: 'middle',
                        width:'30%'
                    },
                    {
                        field: 'facultyName',
                        title: '学院',
                        align: 'center',
                        valign: 'middle',
                        width:'15%'
                    },
                    {
                        field: '',
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        width:'20%',
                        formatter: function (value, row, index) {

                            if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.facultyActive) {
                                if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.professionActive) {
                                    var content = '<div class="btn-group">';
                                    if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.active) {
                                        content += '<button type="button" class="btn btn-danger" onclick="deleteModal('+row.professionId+')">删除</button>';
                                    } else {
                                        content += '<button type="button" class="btn btn-success" onclick="restoreModal('+row.professionId+')">恢复</button>';
                                    }

                                    return  content + '</div>';
                                }
                            }

                            return "所属学院被删除";
                        }
                    }
                ]
            });
        }

        function initValidation() {
            $("#clazzForm").formValidation({
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
                        var messageNode  = $('#clazzForm').find($("span[name='"+messageName+"']"));
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
                    professionId:{
                        message: '请选择专业。',
                        validators: {
                            notEmpty: {
                                message: '请选择专业。'
                            }
                        }
                    },
                    gradeName:{
                        message: '请选择年级。',
                        validators: {
                            notEmpty: {
                                message: '请选择年级。'
                            }
                        }
                    },
                    clazzCount:{
                        message: '请选择所需班级数量。',
                        validators: {
                            notEmpty: {
                                message: '请选择所需班级数量。'
                            }
                        }
                    }
                }
            }).on('err.field.fv', function(e, data) {
                $("#clazzForm").find("i.form-control-feedback").remove();

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
                $("#clazzForm").find("."+data.field+"Message").css("display","none");
                $("#clazzForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#clazzForm").find("i.form-control-feedback").remove();
            });
        }

        function initSelect() {
            $("select[name!='clazzCount']").select2({
                width: '100%',
                dropdownAutoWidth:false
//                minimumResultsForSearch: -1
            });
            $("#clazzCount").select2({
                width: '100%',
                dropdownAutoWidth:false,
                minimumResultsForSearch: -1
            });
        }
    </script>

</body>
</html>
