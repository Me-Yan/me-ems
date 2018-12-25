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
</head>
<body>

    <div class="page-title">
        <span>修改密码</span>
    </div>
    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-12 form-group-field">
                        <div class="table-responsive">
                            <table id="facultyTable" class="table table-hover table-striped table-condensed"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            initTable();
        });

        function initTable() {
            $("#facultyTable").bootstrapTable({
                url: '${pageContext.request.contextPath}/faculty/listFacultyData',
                method: 'POST',
                cache: false,
                contentType: "application/x-www-form-urlencoded",
                queryParams: function (params) {
                    return {

                    };
                },
                pagination: true,
                sidePagination: 'server',
                uniqueId: 'classifyId',
                columns: [
                    {
                        field: 'serialNo',
                        title: '#',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: 'classifyName',
                        title: '名称',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: 'classifyClass',
                        title: '样式',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: 'sequence',
                        title: '序列号',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: 'createDateStr',
                        title: '添加时间',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: '',
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        formatter: function (value, row, index) {
                            var  content = '<div class="btn-group"><button type="button" class="btn btn-primary" onclick="amendClassify(\''+row.classifyId+'\', \''+row.classifyName+'\', \''+row.classifyClass+'\', \''+row.sequence+'\')">修改</button>';

                            if ("<%=Constant.Classify_Status.VARIABLE%>" === row.status) {
                                if (row.closedCategory>0) {
                                    content += '<button type="button" class="btn btn-success" onclick="activeClassify(\''+row.classifyId+'\')">开放</button>';
                                }
                                if (row.activeCategory>0) {
                                    content += '<button type="button" class="btn btn-danger" onclick="closeClassify(\''+row.classifyId+'\')">关闭</button>';
                                }
                            }

                            content += '</div>';

                            return content;
                        }
                    }
                ]
            });
        }
    </script>

</body>
</html>
