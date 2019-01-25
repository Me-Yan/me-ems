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
                            <c:if test="${not empty facultyList}">
                                <c:forEach items="${facultyList}" var="faculty">
                                    <option value="${faculty.facultyId}"><c:out value="${faculty.name}"/></option>
                                </c:forEach>
                            </c:if>
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
                    <h4 class="modal-title">添加专业</h4>
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
                                            <input type="text" name="professionId" class="form-control field-input" id="professionId" />
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

    <script>
        $(function () {
            initSelect();
            initTable();
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
                        $("#tipContent").html(result.message);
                        $("#professionTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html(result.message);
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

        // 查询
        $("#grade, #faculty, #profession").on("change", function () {
            $("#clazzTable").bootstrapTable("refresh");
        });

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
                        field: 'professionName',
                        title: '专业',
                        align: 'center',
                        valign: 'middle',
                        width:'30%'
                    },
                    {
                        field: 'clazzName',
                        title: '班级',
                        align: 'center',
                        valign: 'middle',
                        width:'10%'
                    },
                    {
                        field: 'gradeName',
                        title: '年级',
                        align: 'center',
                        valign: 'middle',
                        width:'15%'
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
                                var content = '<div class="btn-group"><button type="button" class="btn btn-primary" onclick="editModal('+row.professionId+', '+row.facultyId+')">修改</button>';
                                if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.active) {
                                    content += '<button type="button" class="btn btn-danger" onclick="deleteModal('+row.professionId+')">删除</button>';
                                } else {
                                    content += '<button type="button" class="btn btn-success" onclick="restoreModal('+row.professionId+')">恢复</button>';
                                }

                                return  content + '</div>';
                            }

                            return "所属学院被删除";
                        }
                    }
                ]
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
