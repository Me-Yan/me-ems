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

    <script>
        $(function () {
            initSelect();
            initTable();
        });

        $("#facultyName").on("change", function () {
            $("#teacherTable").bootstrapTable("refresh");
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
            $("select").select2({
                width: '100%',
                dropdownAutoWidth:false
//                minimumResultsForSearch: -1
            });
        }
    </script>

</body>
</html>
