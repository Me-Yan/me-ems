<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/9
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.me.inner.constant.Constants" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><sitemesh:write property="title" /></title>
    <jsp:include page="emsCommon.jsp"/>
    <sitemesh:write property="head"/>
</head>
<body>
    <c:set var="studentRole" value="<%=Constants.Role.STUDENT%>"/>
    <c:set var="teacherRole" value="<%=Constants.Role.TEACHER%>"/>
    <c:set var="adminRole" value="<%=Constants.Role.ADMIN%>"/>
    <c:set var="superAdminRole" value="<%=Constants.Role.SUPER_ADMIN%>"/>


    <%@ include file="header.jsp" %>
    <div style="max-width: 1200px;margin: 0 auto;">
        <sec:authorize access="hasRole('${superAdminRole}')">
            <jsp:include page="superAdminMenu.jsp"/>
        </sec:authorize>
        <sitemesh:write property="body"/>
    </div>

</body>
</html>
