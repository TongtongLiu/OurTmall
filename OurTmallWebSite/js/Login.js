function printUserNotExistMsg() {
    $("#J_Message").css("display", "block");
    $("#TPL_username_1").attr("autofocus", "autofocus");
    $("#TPL_password_1").removeAttr("autofocus");
    $(".error").text("用户名不存在");
}

function printPwdErrorMsg(uName) {
    $("#J_Message").css("display", "block");
    $("#TPL_username_1").attr("value", uName);
    $("#TPL_username_1").removeAttr("autofocus");
    $("#TPL_password_1").attr("autofocus", "autofocus");
    $(".error").text("密码错误");
}
