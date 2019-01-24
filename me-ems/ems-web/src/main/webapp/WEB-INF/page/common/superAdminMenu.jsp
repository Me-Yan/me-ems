<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/downlist/downlist.css">
<script src="${pageContext.request.contextPath}/resources/scripts/downlist/google.js"></script>
<script>
    $(function () {
        $(".downlist-content").maps();
    });
</script>

<div class="downlist-content">
    <ul class="venus-menu">
        <li>
            <a href="${pageContext.request.contextPath}/faculty/listFaculty">学院列表</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/profession/listProfession">专业列表</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/teacher/listTeacher">教师管理</a>
        </li>
        <li>
            <a href="javascript:void(0);">课程管理</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/subject/listSubject">课程列表</a></li>
                <li><a href="#">添加课程</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0);">班级管理</a>
            <ul>
                <li><a href="#">班级列表</a></li>
                <li><a href="#">添加班级</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0);">学生管理</a>
            <ul>
                <li><a href="#">学生列表</a></li>
                <li><a href="#">添加学生</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0);">成绩管理</a>
            <ul>
                <li><a href="#">成绩列表</a></li>
            </ul>
        </li>
    </ul>
</div>