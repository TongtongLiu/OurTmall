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

function checkUserModificationValidate()
{
		var un = $("#ModifyUserName").val();
		var ppw = $("#PrePassWord").val();
		var npw = $("#NewPassWord").val();
		var npw2 = $("#NewPassWord2").val();
		var em = $("#NewEmail").val();
		var tel = $("#NewTelephone").val();
		var upload = document.getElementById("NewAvatar");
		var temp = document.getElementById("CorrectPrePassWord2");
		var corrPrePW = temp.innerText;
		if (ppw != "" && ppw != corrPrePW)
		{
				$("#ModifyUserNameErrorInfo").text("");
				$("#PrePassWordErrorInfo").text("*原密码填写错误");
				$("#NewPassWordErrorInfo").text("");
				$("#NewPassWord2ErrorInfo").text("");
				$("#NewTelephoneErrorInfo").text("");
				$("#NewEmailErrorInfo").text("");
				return false;
		}
		else if (ppw == "" && (npw != "" || npw2 != ""))
		{
				$("#ModifyUserNameErrorInfo").text("");
				$("#PrePassWordErrorInfo").text("*请先填写原密码再修改密码");
				$("#NewPassWordErrorInfo").text("");
				$("#NewPassWord2ErrorInfo").text("");
				$("#NewTelephoneErrorInfo").text("");
				$("#NewEmailErrorInfo").text("");
				return false;
		}
		else if (ppw != "" && npw != npw2)
		{
				$("#ModifyUserNameErrorInfo").text("");
				$("#PrePassWordErrorInfo").text("");
				$("#NewPassWordErrorInfo").text("*两次新密码输入不一致");
				$("#NewPassWord2ErrorInfo").text("*两次新密码输入不一致");
				$("#NewTelephoneErrorInfo").text("");
				$("#NewEmailErrorInfo").text("");
				return false;
		}
		else if (ppw != "" && npw.length > 50)
		{
				$("#ModifyUserNameErrorInfo").text("");
				$("#PrePassWordErrorInfo").text("");
				$("#NewPassWordErrorInfo").text("*新密码长度要小于50");
				$("#NewPassWord2ErrorInfo").text("*新密码长度要小于50");
				$("#NewTelephoneErrorInfo").text("");
				$("#NewEmailErrorInfo").text("");
				return false;
		}
		else if (tel != "" && !isValidTel(tel))
		{
				$("#ModifyUserNameErrorInfo").text("");
				$("#PrePassWordErrorInfo").text("");
				$("#NewPassWordErrorInfo").text("");
				$("#NewPassWord2ErrorInfo").text("");
				$("#NewTelephoneErrorInfo").text("*新电话输入不合法");
				$("#NewEmailErrorInfo").text("");
				return false;
		}
		else if (em != "" && !isValidEmail(em))
		{
				$("#ModifyUserNameErrorInfo").text("");
				$("#PrePassWordErrorInfo").text("");
				$("#NewPassWordErrorInfo").text("");
				$("#NewPassWord2ErrorInfo").text("");
				$("#NewTelephoneErrorInfo").text("");
				$("#NewEmailErrorInfo").text("*新邮箱输入不合法");
				return false;
		}
		else if (!CheckFile(upload)) {
		    $("#ModifyUserNameErrorInfo").text("");
		    $("#PrePassWordErrorInfo").text("");
		    $("#NewPassWordErrorInfo").text("");
		    $("#NewPassWord2ErrorInfo").text("");
		    $("#NewTelephoneErrorInfo").text("");
		    $("#NewEmailErrorInfo").text("");
		    $("#NewAvatarErrorInfo").text("*头像格式错误");
		    return false;
		}
		else {
		    return true;
		}
}