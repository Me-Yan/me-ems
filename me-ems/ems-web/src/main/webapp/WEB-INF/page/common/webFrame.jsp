<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/9
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

    <sec:authorize access="hasRole('<%=Constants.Role.SUPER_ADMIN%>')">
        <jsp:include page="superAdminHeader.jsp"/>
    </sec:authorize>

    <div style="max-width: 1200px;margin: 0 auto;">
        <sitemesh:write property="body"/>
    </div>

</body>
</html>
