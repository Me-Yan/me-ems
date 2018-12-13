<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2018/9/14
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户登录</title>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/login/main.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/login/util.css" />
    <script src="${pageContext.request.contextPath}/resources/scripts/login/login.js"></script>
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form id="loginForm" action="checklogin" class="form-horizontal login100-form" method="post">
                <span class="login100-form-title p-b-49">养殖管理系统</span>

                <div class="wrap-input100 m-b-23">
                    <input id="username" value="Admin" class="input100" type="text" name="username" placeholder="请输入用户名" maxlength="20" autocomplete="off"/>
                    <i class="login-icon fa fa-lg fa-user"></i>
                </div>

                <div class="wrap-input100">
                    <input id="password" value="123456" class="input100" type="password" name="password" placeholder="请输入密码" autocomplete="off"/>
                    <i class="login-icon fa fa-lg fa-lock"></i>
                </div>

                <div id="errorMessage" class="text-center error-message"></div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button id="btnSubmit" class="login100-form-btn">登 录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    var error = ${error};
    if (error) {
        $("#errorMessage").html("用户名或密码错误！");
    }
</script>

</body>
</html>
