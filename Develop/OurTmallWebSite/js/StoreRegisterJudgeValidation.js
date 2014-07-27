/*function isValidEmail(e) {
    var n = 0;
    for (i = 0; i < e.length; i++)
        if (e[i] == '@')
            n++;
    if (n == 1 && e.length <= 50 && e[e.length - 1] == 'm' && e[e.length - 2] == 'o' && e[e.length - 3] == 'c' && e[e.length - 4] == '.')
        return true;
    else
        return false;
}*/
function isValidEmail(e) {
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
function isValidTel(t) {
    var i = 0;
    if (t.length > 30)
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

function checkStoreValidate()
{
    var sn = $("#StoreName").val();
    var spw = $("#StorePassWord").val();
    var spw2 = $("#StorePassWord2").val();
    var son = $("#StoreOwnerName").val();
    var sem = $("#StoreEmail").val();
    var stel = $("#StoreTelephone").val();
    var upload = document.getElementById("UploadStoreLogo");
    if (sn == "")
    {
        $("#StoreNameErrorInfo").text("*店名不能为空");
        return false;
    }
    else if (sn.length > 50)
    {
        $("#StoreNameErrorInfo").text("*店名长度不能超过50");
        return false;
    }
    else if (spw != spw2)
    {
        $("#StoreNameErrorInfo").text("");
        alert('两次输入的密码不一致,请重新确认！');
        return false;
    }
    else if (spw.length == 0)
    {
        $("#StoreNameErrorInfo").text("");
        $("#StorePassWordErrorInfo").text("*密码是必填项");
        $("#StorePassWord2ErrorInfo").text("*密码是必填项");
        return false;
    }
    else if (spw.length > 50)
    {
        $("#StoreNameErrorInfo").text("");
        $("#StorePassWordErrorInfo").text("*密码长度不能超过50");
        $("#StorePassWord2ErrorInfo").text("*密码长度不能超过50");
        return false;
    }
    else if (son == "")
    {
        $("#StoreNameErrorInfo").text("");
        $("#StorePassWordErrorInfo").text("");
        $("#StorePassWord2ErrorInfo").text("");
        $("#StoreEmailErrorInfo").text("");
        $("#StoreTelephoneErrorInfo").text("");
        $("#StoreOwnerNameErrorInfo").text("*店主姓名不能为空");
        return false;
    }
    else if (son.length > 50)
    {
        $("#StoreNameErrorInfo").text("");
        $("#StorePassWordErrorInfo").text("");
        $("#StorePassWord2ErrorInfo").text("");
        $("#StoreEmailErrorInfo").text("");
        $("#StoreTelephoneErrorInfo").text("");
        $("#StoreOwnerNameErrorInfo").text("*店主姓名长度不能超过50");
        return false;
    }
    else if (stel != "" && !isValidTel(stel))
    {
        //alert('电话不合法');
        $("#StoreUserNameErrorInfo").text("");
        $("#StorePassWordErrorInfo").text("");
        $("#StorePassWord2ErrorInfo").text("");
        $("#StoreEmailErrorInfo").text("");
        $("#StoreOwnerNameErrorInfo").text("");
        $("#StoreTelephoneErrorInfo").text("*电话不合法");
        return false;
    }
    else if (sem != "" && !isValidEmail(sem))
    {
        //alert('邮箱不合法');
        $("#StoreUserNameErrorInfo").text("");
        $("#StorePassWordErrorInfo").text("");
        $("#StorePassWord2ErrorInfo").text("");
        $("#StoreEmailErrorInfo").text("*邮箱不合法");
        $("#StoreOwnerNameErrorInfo").text("");
        $("#StoreTelephoneErrorInfo").text("");
        return false;
    }
    else if (!CheckFile(upload))
    {
        $("#StoreUserNameErrorInfo").text("");
        $("#StorePassWordErrorInfo").text("");
        $("#StorePassWord2ErrorInfo").text("");
        $("#StoreEmailErrorInfo").text("");
        $("#StoreOwnerNameErrorInfo").text("");
        $("#StoreTelephoneErrorInfo").text("");
        $("#UploadStoreLogoErrorInfo").text("*图片格式错误");
        return false;
    }
    else
    {
        return true;
    }
}