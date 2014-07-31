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
            window.location.href = "./Login.aspx?backurl=" + window.location.href;
        });
        $(".sn-mytaobao .menu-hd").attr("href", "./ModifyConsumerOrder.aspx");
        $(".sn-mytaobao .menu-bd a:first").attr("href", "./ModifyConsumerOrder.aspx");
        $(".sn-mytaobao .menu-bd a:last").attr("href", "./StoreLogin.aspx");
        $(".sn-cart-link").attr("href", "./Cart.aspx");
        $(".sn-favorite .menu-hd").attr("href", "./ModifyCollection.aspx");
        $(".sn-favorite .menu-bd a:first").attr("href", "./ModifyCollection.aspx");
        $(".sn-favorite .menu-bd a:last").attr("href", "./ModifyStoreCollection.aspx");
        $(".sn-seller a").attr("href", "./StoreLogin.aspx");
    }
    else    // 未登录
    {
        $("#login-info").append("<em>喵，欢迎来OurTmall</em>");
        $("#login-info").append("<a class='sn-login' href='./Login.aspx' target='_top'>请登录</a>");
        $("#login-info").append("<a class='sn-register' href='./Register.aspx' target='_top'>免费注册</a>");
        $(".sn-mytaobao .menu-hd").attr("href", "./Login.aspx?backurl=./ModifyConsumerOrder.aspx");
        $(".sn-mytaobao .menu-bd a:first").attr("href", "./Login.aspx?backurl=./ModifyConsumerOrder.aspx");
        $(".sn-mytaobao .menu-bd a:last").attr("href", "./StoreLogin.aspx");
        $(".sn-cart-link").attr("href", "./Login.aspx?backurl=./Cart.aspx");
        $(".sn-favorite .menu-hd").attr("href", "./Login.aspx?backurl=./ModifyCollection.aspx");
        $(".sn-favorite .menu-bd a:first").attr("href", "./Login.aspx?backurl=./ModifyCollection.aspx");
        $(".sn-favorite .menu-bd a:last").attr("href", "./Login.aspx?backurl=./ModifyStoreCollection.aspx");
        $(".sn-seller a").attr("href", "./StoreLogin.aspx");
    }
}

$(document).ready(function () {
    setLoginInfo();
});