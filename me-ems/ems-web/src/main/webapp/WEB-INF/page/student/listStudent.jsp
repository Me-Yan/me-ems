<%@ page import="com.me.inner.constant.CommonConstant" %>
<%@ page import="com.me.inner.constant.Constants" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2019/1/29
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生列表</title>
</head>
<body>

    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-title"><span>学生列表</span></div>
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
                    <div class="col-xs-12 col-sm-3 col-md-3" style="margin-bottom: 10px;">
                        <select name="clazzId" id="clazz" class="form-control field-input">
                            <option value="">- 请选择班级 -</option>
                        </select>
                    </div>
                    <div class="col-xs-12 text-right">
                        <button type="button" class="btn btn-primary" id="btnAdd">添加</button>
                    </div>
                    <div class="col-xs-12" style="margin-top: 10px;">
                        <div class="table-responsive">
                            <table id="studentTable" class="table table-hover table-striped table-condensed"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../commonModal.jsp"/>

    <script>
        $(function () {
            initSelect();
            initTable();
        });

        // init table
        var serialNo = 1;
        function queryParams(params) {
            serialNo = params.offset;
            return {
                gradeName: $("#grade").val(),
                facultyId: $("#faculty").val(),
                professionId: $("#profession").val(),
                clazzId: $("#clazzId").val(),
                curPage: params.offset/params.limit,
                limit: params.limit
            };
        }

        function initTable() {
            $("#studentTable").bootstrapTable({
                url: '${pageContext.request.contextPath}/student/listStudentData',
                method: 'POST',
                cache: false,
                contentType: "application/x-www-form-urlencoded",
                queryParams: queryParams,
                pagination: true,
                pageNumber: 1,
                pageSize: 10,
                pageList: [10],
                sidePagination: 'server',
                uniqueId: 'studentId',
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
                        width:'10%'
                    },
                    {
                        field: 'sex',
                        title: '性别',
                        align: 'center',
                        valign: 'middle',
                        width:'5%',
                        formatter: function (value, row, index) {
                            if (1 === value) {
                                return "<%=Constants.Sex.MALE%>";
                            }

                            return "<%=Constants.Sex.FEMALE%>";
                        }
                    },
                    {
                        field: 'number',
                        title: '学号',
                        align: 'center',
                        valign: 'middle',
                        width:'15%'
                    },
                    {
                        field: 'gradeName',
                        title: '年级',
                        align: 'center',
                        valign: 'middle',
                        width:'10%'
                    },
                    {
                        field: 'clazzName',
                        title: '班级',
                        align: 'center',
                        valign: 'middle',
                        width:'5%'
                    },
                    {
                        field: 'professionName',
                        title: '专业',
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
                                if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.professionActive) {
                                    if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.clazzActive) {
                                        var content = '<div class="btn-group"><button type="button" class="btn btn-primary" onclick="editModal('+row.studentId+')">修改</button>';
                                        if ("<%=CommonConstant.IN_ACTIVE.ACTIVE%>" === row.active) {
                                            content += '<button type="button" class="btn btn-danger" onclick="deleteModal('+row.clazzId+')">删除</button>';
                                        } else {
                                            content += '<button type="button" class="btn btn-success" onclick="restoreModal('+row.clazzId+')">恢复</button>';
                                        }

                                        return  content + '</div>';
                                    }
                                    return "所属班级被删除";
                                }
                                return "所属专业被删除";
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
