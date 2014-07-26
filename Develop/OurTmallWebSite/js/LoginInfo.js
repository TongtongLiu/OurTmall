function getCookie(name) {
    var start, end;
    if (document.cookie.length > 0) {
        start = document.cookie.indexOf(name + "=");
        if (start >= 0) {
            start = start + name.length + 1;
            end = document.cookie.indexOf(";", start);
            if (end < 0) end = document.cookie.length;
            return unescape(document.cookie.substring(start, end));
        }
    }
    return "";
}

function setCookie(name, value, expiretime) {
    var timer = (new Date()).getTime();
    if (expiretime.day) timer += expiretime.day * 24 * 3600 * 1000;
    if (expiretime.minute) timer += expiretime.minute * 3600 * 1000;
    if (expiretime.second) timer += expiretime.second * 1000;
    var exdate = new Date();
    exdate.setTime(timer);

    document.cookie = name + "=" + escape(value) +
        ((expiretime == null) ? "" : ";expires=" + exdate.toGMTString());
}

function setLoginInfo() {
    var username = getCookie("isLogin");
    $("#login-info").empty();
    if (username)   // 已登录
    {
        $("#login-info").append("<span class='sn-welcome-info'>\
            <span>Hi， </span>\
            <a target='_top' href='./ModifyUserInfo.aspx' class='j_UserNick sn-user-nick' title='" + username + "'>" + username + "</a>\
            </span>\
            <span class='sn-welcome-info'>\
                <a class='sn-logout' target='_top' href='#' id='J_Logout'>退出</a>\
            </span>");
        $(".sn-logout").click(function () {
            setCookie("isLogin", "", { day: -1 });
            setLoginInfo();
        });
    }
    else    // 未登录
    {
        $("#login-info").append("<em>喵，欢迎来OurTmall</em>");
        $("#login-info").append("<a class='sn-login' href='./Login.aspx' target='_top'>请登录</a>");
        $("#login-info").append("<a class='sn-register' href='./Register.aspx' target='_top'>免费注册</a>");
    }
}

setLoginInfo();