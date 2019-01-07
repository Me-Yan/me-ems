<%@ page import="com.me.inner.constant.Constants" %><%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2019/1/2
  Time: 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师列表</title>
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
                            <table id="teacherTable" class="table table-hover table-striped table-condensed"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../commonModal.jsp"/>

    <%-- 添加老师Modal --%>
    <div class="modal fade" id="formModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">添加老师</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="teacherForm" method="post">
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
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">姓名 <span class="colon-label">:</span><span class="field-star">*</span></label>
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
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">年龄 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <input type="text" name="age" class="form-control field-input" id="age" />
                                            <span class="text-error hide" name="ageMessage"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">性别 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <select name="sex" id="sex" class="form-control field-input">
                                                <option value="">- 请选择性别 -</option>
                                                <c:if test="${not empty sexMap}">
                                                    <c:forEach items="${sexMap}" var="sexObj">
                                                        <option value="${sexObj.key}">${sexObj.value}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                            <span class="text-error hide" name="sexMessage"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 form-group-field">
                                <label class="col-sm-3 col-md-3 col-md-offset-1 control-label text-left">出生日期 <span class="colon-label">:</span><span class="field-star">*</span></label>
                                <div class="col-sm-8 col-md-6">
                                    <div class="display-table">
                                        <div class="display-cell colon-cell">:</div>
                                        <div class="display-cell">
                                            <input type="text" name="birthDateStr" class="form-control field-input flatpickr" data-enable-time="false" id="birthDateStr" placeholder="yyyy-dd-mm" />
                                            <span class="text-error hide" name="birthDateStrMessage"></span>
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
                    <p>确认添加该老师？</p>
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
            $('#birthDateStr').flatpickr({
                maxDate: new Date(),
                onChange: function (dateObj, dateStr, instance) {
                    $("#teacherForm").data("formValidation").revalidateField("birthDateStr");
                }
            });
        });

        // 添加老师
        $("#btnAdd").on("click", function () {
           $("#formModal").modal({
               backdrop: 'static',
               keyboard: false,
               show: true
           });
        });
        $("#btnSubmit").on("click", function () {
            var validation = $("#teacherForm").data("formValidation");
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
                url: "${pageContext.request.contextPath}/teacher/addTeacher",
                type: "post",
                data: $("#teacherForm").serialize(),
                success: function (result) {
                    $("body").loading("hide");
                    if (result.success) {
                        $("#tipContent").html("添加成功。");
                        $("#teacherTable").bootstrapTable("refresh");
                    } else {
                        $("#tipContent").html("添加失败，请重新添加。");
                    }
                    $("#outcomeModal").modal("show");
                }
            });
        });
        $("#formModal").on("show.bs.modal", function () {
            $("#facultyId").val("").trigger("change");
            $("#sex").val("").trigger("change");
            document.getElementById("teacherForm").reset();
            initValidation();
        });
        $("#formModal").on("hidden.bs.modal", function () {
            $("#teacherForm").data("formValidation").destroy();
        });

        // 根据学院刷新列表
        $("#facultyName").on("change", function () {
            $("#teacherTable").bootstrapTable("refresh");
        });

        function initValidation() {
            $("#teacherForm").formValidation({
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
                        var messageNode  = $('#teacherForm').find($("span[name='"+messageName+"']"));
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
                        message: '请填写姓名。',
                        validators: {
                            notEmpty: {
                                message: '请填写姓名'
                            },
                            stringLength: {
                                max: 4,
                                message: '不能超过4个字符。'
                            }
                        }
                    },
                    age:{
                        message: '请填写年龄。',
                        validators: {
                            notEmpty: {
                                message: '请填写年龄。'
                            },
                            callback: {
                                message: '请输入合理的年龄',
                                callback: function (value) {
                                    if (value && value.trim()) {
                                        var age = parseInt(value);
                                        if (age<150) {
                                            return true;
                                        } else {
                                            return false;
                                        }
                                    }
                                    return true;
                                }
                            }
                        }
                    },
                    sex:{
                        message: '请选择性别。',
                        validators: {
                            notEmpty: {
                                message: '请选择性别。'
                            }
                        }
                    },
                    birthDateStr:{
                        message: '请选择出生日期。',
                        validators: {
                            notEmpty: {
                                message: '请选择出生日期。'
                            },
                            date: {
                                format: 'YYYY-MM-DD',
                                message: '请输入有效日期'
                            }
                        }
                    }
                }
            }).on('err.field.fv', function(e, data) {
                $("#teacherForm").find("i.form-control-feedback").remove();

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
                $("#teacherForm").find("."+data.field+"Message").css("display","none");
                $("#teacherForm").find("."+data.field+"Message").addClass("hide");

                //remove checkbox feedback icon
                $("#teacherForm").find("i.form-control-feedback").remove();
            });
        }

        var serialNo = 1;
        function queryParams(params) {
            serialNo = params.offset;
            return {
                facultyId: $("#facultyName").val(),
                curPage: params.offset/params.limit,
                limit: params.limit
            };
        }

        function initTable() {
            $("#teacherTable").bootstrapTable({
                url: '${pageContext.request.contextPath}/teacher/listTeacherData',
                method: 'POST',
                cache: false,
                contentType: "application/x-www-form-urlencoded",
                queryParams: queryParams,
                pagination: true,
                pageNumber: 1,
                pageSize: 10,
                pageList: [10],
                sidePagination: 'server',
                uniqueId: 'teacherId',
                columns: [
                    {
                        field: '',
                        title: '#',
                        align: 'center',
                        valign: 'middle',
                        width:'5%',
                        formatter: function () {
                            return ++serialNo;
                        }
                    },
                    {
                        field: 'name',
                        title: '姓名',
                        align: 'center',
                        valign: 'middle',
                        width:'15%'
                    },
                    {
                        field: 'number',
                        title: '教师号',
                        align: 'center',
                        valign: 'middle',
                        width:'15%'
                    },
                    {
                        field: 'facultyName',
                        title: '所属学院',
                        align: 'center',
                        valign: 'middle',
                        width:'20%'
                    },
                    {
                        field: 'age',
                        title: '年龄',
                        align: 'center',
                        valign: 'middle',
                        width:'5%'
                    },
                    {
                        field: 'sex',
                        title: '性别',
                        align: 'center',
                        valign: 'middle',
                        width:'5%',
                        formatter: function (value, row, index, field) {
                            if (value === 1) {
                                return "<%=Constants.Sex.MALE%>";
                            } else {
                                return "<%=Constants.Sex.FEMALE%>";
                            }
                        }
                    },
                    {
                        field: 'birthDateStr',
                        title: '出生日期',
                        align: 'center',
                        valign: 'middle',
                        width:'10%'
                    },
                    {
                        field: '',
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        width:'20%',
                        formatter: function (value, row, index) {
                            return '<div class="btn-group">' +
                                '<button type="button" class="btn btn-primary" onclick="editModal('+row.teacherId+')">修改</button>' +
                                '<button type="button" class="btn btn-danger" onclick="deleteModal('+row.teacherId+')">删除</button>' +
                                '</div>';
                        }
                    }
                ]
            });
        }

        function initSelect() {
            $("#facultyName").select2({
                width: '100%',
                dropdownAutoWidth:false
//                minimumResultsForSearch: -1
            });
            $("#facultyId").select2({
                width: '100%',
                dropdownAutoWidth:false
            });
            $("#sex").select2({
                width: '100%',
                dropdownAutoWidth:false,
                minimumResultsForSearch: -1
            });
        }
    </script>

</body>
</html>
