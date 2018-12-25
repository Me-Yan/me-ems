<%--
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
                    <div class="col-xs-6 col-sm-4 col-md-4 col-xs-offset-6 col-sm-offset-8 col-md-offset-8" style="margin-bottom: 10px;">
                        <div class="input-group">
                            <input name="facultyName" id="facultyName" maxlength="50" class="form-control field-input" />
                            <div class="input-group-addon icon-search"><i class="fa fa-search"></i></div>
                        </div>
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
            initTable();
        });

        $(".icon-search").on("click", function () {
            $("#facultyTable").bootstrapTable("refresh");
        });

        function queryParams(params) {
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
                pageSize: 10,
                sidePagination: 'server',
                uniqueId: 'facultyId',
                columns: [
                    {
                        field: 'serialNo',
                        title: '#',
                        align: 'center',
                        valign: 'middle',
                        width:'10%'
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
                            return '<div class="btn-group">' +
                                    '<button type="button" class="btn btn-primary">修改</button>' +
                                    '<button type="button" class="btn btn-danger">删除</button>' +
                                    '</div>';
                        }
                    }
                ]
            });
        }
    </script>

</body>
</html>
