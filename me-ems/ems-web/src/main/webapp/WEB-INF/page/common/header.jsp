<%@ page import="com.me.inner.util.SecurityUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="web-header">
    <div class="header-content">
        <div class="system-name">教务管理系统</div>
        <div class="user-action">
            <div class="dropdown">
                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-user fa-fw"></i>&nbsp;&nbsp;<%=SecurityUtil.getUserInfo().getUsername()%>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" aria-labelledby="dLabel">
                    <li><a href=""><i class="fa fa-user fa-fw"></i>个人信息</a></li>
                    <li class="divider"></li>
                    <li><a href=""><i class="fa fa-sign-out fa-fw"></i>退出</a></li>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>