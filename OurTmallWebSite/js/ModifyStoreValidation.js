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

function checkStoreModificationValidate()
{
		var sn = $("#NewStoreName").val();
		var ppw = $("#PreStorePassWord").val();
		var npw = $("#NewStorePassWord").val();
		var npw2 = $("#NewStorePassWord2").val();
		var on = $("#NewOwnerName").val();
		var em = $("#NewStoreEmail").val();
		var tel = $("#NewStoreTelephone").val();
		var upload = document.getElementById("NewLogo");
		var temp = document.getElementById("CorrectStorePrePassWord");
		var corrPrePW = temp.innerText;

		if (ppw == "")
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("*必须先填写原密码");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (ppw != "" && ppw != corrPrePW)
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("*原密码填写错误");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (ppw != "" && npw != npw2)
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("*两次新密码填写不一致");
				$("#NewStorePassWord2ErrorInfo").text("*两次新密码填写不一致");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (ppw != "" && npw.length > 50)
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("*新密码的长度要小于50");
				$("#NewStorePassWord2ErrorInfo").text("*新密码的长度要小于50");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if(on == "")
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("*店主名字不能为空");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (on != "" && on.length > 50)
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("*店主名字长度应小于50");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (tel == "")
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("*联系电话不能为空");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (tel != "" && !isValidTel(tel))
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("*新电话输入不合法");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (em == "")
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("*邮箱不能为空");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (em != "" && !isValidEmail(em))
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("*新邮箱输入不合法");
				$("#NewLogoErrorInfo").text("");
				return false;
		}
		else if (!CheckFile(upload))
		{
				$("#NewStoreNameErrorInfo").text("");
				$("#PreStorePassWordErrorInfo").text("");
				$("#NewStorePassWordErrorInfo").text("");
				$("#NewStorePassWord2ErrorInfo").text("");
				$("#NewOwnerNameErrorInfo").text("");
				$("#NewStoreTelephoneErrorInfo").text("");
				$("#NewStoreEmailErrorInfo").text("");
				$("#NewLogoErrorInfo").text("*logo图片格式错误");
				return false;
		}
		else
		{
				return true;
		}
}