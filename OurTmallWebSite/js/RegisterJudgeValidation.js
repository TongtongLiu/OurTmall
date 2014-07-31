function mb_isValidEmail(e) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (e.length <= 50 && filter.test(e))
        return true;
    else
        return false;


//     var n = 0;
//     for (i = 0; i < e.length; i++)
//         if (e[i] == '@')
//             n++;
//     if (n == 1 && e.length <= 50) {
//         if ((e[e.length - 1] == 'm' && e[e.length - 2] == 'o' && e[e.length - 3] == 'c' && e[e.length - 4] == '.')
//             || (e[e.length - 1] == 'm' && e[e.length - 2] == 'o' && e[e.length - 3] == 'c' && e[e.length - 4] == '.')
//             || (e[e.length - 1] == 'm' && e[e.length - 2] == 'o' && e[e.length - 3] == 'c' && e[e.length - 4] == '.')) {
//             return true;
//         }
// 
//     }
//     else
//         return false;
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

function CheckFile(obj) {
    var array = new Array('bmp', 'png', 'jpg');  //可以上传的文件类型  
    if (obj.value == '') {
        return true;
    }
    else {
    	var fileContentType = obj.value.match(/^(.*)(\.)(.{1,8})$/)[2]; //这个文件类型正则很有用：）  
    	var temp = obj.value.lastIndexOf(".");
    	var postfix = obj.value.substring(temp + 1);
        var isExists = false;
        for (var i in array) {
        		if (postfix.toLowerCase() == array[i].toLowerCase()) {
                isExists = true;
                return true;
            }
        }
        if (isExists == false) {
            obj.value = null;
            return false;
        }
        return false;
    }
}
function checkValidate() {
    var un = $("#UserName").val();
    var pw = $("#PassWord").val();
    var pw2 = $("#PassWord2").val();
    var em = $("#Email").val();
    var tel = $("#Telephone").val();
    var upload = document.getElementById("UploadAvatar");
    if (un == "") {
        //alert('用户名不能为空！');
        $("#UserNameErrorInfo").text("*用户名不能为空");
        $("#PassWordErrorInfo").text("");
        $("#PassWord2ErrorInfo").text("");
        $("#TelephoneErrorInfo").text("");
        $("#EmailErrorInfo").text("");
        return false;
    }
    else if (un.length > 50) {
        //alert('用户名长度不能超过50！');
        $("#UserNameErrorInfo").text("*用户名长度不能超过50");
        $("#PassWordErrorInfo").text("");
        $("#PassWord2ErrorInfo").text("");
        $("#TelephoneErrorInfo").text("");
        $("#EmailErrorInfo").text("");
        return false;
    }
    else if (pw.length == 0) {
        //alert('密码是必填项！');
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("*密码是必填项");
        $("#PassWord2ErrorInfo").text("*密码是必填项");
        $("#TelephoneErrorInfo").text("");
        $("#EmailErrorInfo").text("");
        return false;
    }
    else if (pw.length < 6) {
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("密码长度不能少于6位！");
        $("#PassWord2ErrorInfo").text("密码长度不能少于6位！");
        $("#TelephoneErrorInfo").text("");
        $("#EmailErrorInfo").text("");
        return false;
    }
    else if (pw != pw2) {
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("两次输入的密码不一致,请重新确认！");
        $("#PassWord2ErrorInfo").text("两次输入的密码不一致,请重新确认！");
        $("#TelephoneErrorInfo").text("");
        $("#EmailErrorInfo").text("");
        return false;
    }
    else if (pw.length > 50) {
        //alert('密码长度不能超过50！');
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("*密码长度不能超过50");
        $("#PassWord2ErrorInfo").text("*密码长度不能超过50");
        $("#TelephoneErrorInfo").text("");
        $("#EmailErrorInfo").text("");
        return false;
    }
    else if (em != "" && !mb_isValidEmail(em)) {
        //alert('邮箱不合法');
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("");
        $("#PassWord2ErrorInfo").text("");
        $("#TelephoneErrorInfo").text("");
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
    else if (!CheckFile(upload))
    {
        $("#UserNameErrorInfo").text("");
        $("#PassWordErrorInfo").text("");
        $("#PassWord2ErrorInfo").text("");
        $("#EmailErrorInfo").text("");
        $("#TelephoneErrorInfo").text("");
        $("#UploadAvatarErrorInfo").text("*上传的图片格式错误");
        return false;
    }
    else {
        return true;
    }
}