<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YanYanghong
  Date: 2018/12/24
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
</head>
<body>

    <div class="page-title" current-page="newBooking">
        <span>个人信息</span>
    </div>

    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">教师号 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <span class="free-text"><c:out value="${teacherObj.number}"/></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
