/**
 * Created by Me on 2018/9/15.
 */

$(function () {
    $("#btnSubmit").on("click", function () {
        var username = $("#username").val();
        var password = $("#password").val();
        var errorMessage = "";
        if (!(username&&username.trim())&&!(password&&password.trim())) {
            errorMessage = "请输入用户名和密码";
        } else if (!(username&&username.trim())) {
            errorMessage = "请输入用户名";
        } else if (!(password&&password.trim())) {
            errorMessage = "请输入密码";
        }

        if (errorMessage) {
            $("#errorMessage").html(errorMessage);
            return false;
        } else {
            $("#loginForm").submit();
        }
    });

    $("#username, #password").on("focus", function () {
        $("#errorMessage").html("");
    });
});

