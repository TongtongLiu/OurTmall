function mb_isValidEmail(e) {
    var n = 0;
    for (i = 0; i < e.length; i++)
        if (e[i] == '@')
            n++;
    if (n == 1 && e.length <= 50 && e[e.length - 1] == 'm' && e[e.length - 2] == 'o' && e[e.length - 3] == 'c' && e[e.length - 4] == '.')
        return true;
    else
        return false;
}
function mb_isValidTel(t) {
    var i = 0;
    if (t.length > 50)
        return false;
    for (i = 0; i < t.length; i++)
        if (!(t[i] >= '0' && t[i] <= '9'))
            return false;
    return true;
}
function checkValidate() {
    var un = $("#UserName").val();
    var pw = $("#PassWord").val();
    var pw2 = $("#PassWord2").val();
    var em = $("#Email").val();
    var tel = $("#Telephone").val();
    console.log(un + ',' + pw + ',' + pw2 + ',' + em + ',' + tel);
    if (un == "") {
        //alert('用户名不能为空！');
        $("#UserNameErrorInfo").text("*用户名不能为空");
        return false;
    }
    else if (un.length > 50) {
        //alert('用户名长度不能超过50！');
        $("#UserNameErrorInfo").text("*用户名长度不能超过50");
        return false;
    }
    else if (pw != pw2) {
        $("#UserNameErrorInfo").text("");
        alert('两次输入的密码不一致,请重新确认！');
        return false;
    }
    else if (pw.length == 0) {
        //alert('密码是必填项！');
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("*密码是必填项");
        $("#PassWord2ErrorInfo").text("*密码是必填项");
        return false;
    }
    else if (pw.length > 50) {
        //alert('密码长度不能超过50！');
        $("#PassWordErrorInfo").text("*密码长度不能超过50");
        $("#PassWord2ErrorInfo").text("*密码长度不能超过50");
        return false;
    }
    else if (em != "" && !mb_isValidEmail(em)) {
        //alert('邮箱不合法');
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("");
        $("#PassWord2ErrorInfo").text("");
        $("#EmailErrorInfo").text("*邮箱不合法");
        return false;
    }
    else if (tel != "" && !mb_isValidTel(tel)) {
        //alert('电话不合法');
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("");
        $("#PassWord2ErrorInfo").text("");
        $("#EmailErrorInfo").text("");
        $("#TelephoneErrorInfo").text("*电话不合法");
        return false;
    }
    else {
        return true;
    }
}