function CheckFile(obj) {
	var array = new Array('bmp', 'png', 'jpg');  //可以上传的文件类型  
	if (obj.value == '') {
		//return true;
		return false;		//不允许有空的情况
	}
	else {  
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

function hasSpecialCharacter(str)
{
	var i = 0;
	for (i = 0; i < str.length; i++)
	{
		if (str[i] == '=' || str[i] == '?' || str[i] == '<' || str[i] == '>' || str[i] == "'" || str[i] == '"' || str[i] == '-' || str[i] == '+'/* || str[i] == '(' || str[i] == ')'*/)
			return true;
	}
	return false;
}

function isValidNum(t)
{
	var i = 0;
	if (t.length > 30)
		return false;
	for (i = 0; i < t.length; i++)
		if (!((t[i] >= '0' && t[i] <= '9') || t[i] == '.'))
			return false;
	return true;
}

function checkProductInfoValidation()
{
	var pn = $("#ProductName").val();
	var pp = $("#ProductPrice").val();
	var pd = $("#ProductDescription").val();
	var upload1 = document.getElementById("UploadProductImg1");
	var upload2 = document.getElementById("UploadProductImg2");
	var upload3 = document.getElementById("UploadProductImg3");
	var upload4 = document.getElementById("UploadProductImg4");
	var upload5 = document.getElementById("UploadProductImg5");

	if (pn == "")
	{
		$("#ProductNameErrorInfo").text("*商品名称不能为空");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (pn.length > 50)
	{
		$("#ProductNameErrorInfo").text("*商品名称过长");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (hasSpecialCharacter(pn))
	{
		$("#ProductNameErrorInfo").text("*商品名称不能含有特殊字符");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (pp == "")
	{
		$("#ProductNameErrorInfo").text("");
		$("#ProductPriceErrorInfo").text("*价格不能为空");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (pp != "" && !isValidNum(pp))
	{
		$("#ProductNameErrorInfo").text("");
		$("#ProductPriceErrorInfo").text("*价格格式不正确");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (pd == "")
	{
		$("#ProductNameErrorInfo").text("");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("*商品描述不能为空");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (!CheckFile(upload1))
	{
		$("#ProductNameErrorInfo").text("");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("*图片1是必填项,且请保证上传的图片格式正确");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (upload2.value != "" && !CheckFile(upload2))
	{
		$("#ProductNameErrorInfo").text("");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("*图片格式错误");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (upload3.value != "" && !CheckFile(upload3)) {
		$("#ProductNameErrorInfo").text("");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("*图片格式错误");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (upload4.value != "" && !CheckFile(upload4)) {
		$("#ProductNameErrorInfo").text("");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("*图片格式错误");
		$("#UploadProductImg5ErrorInfo").text("");
		return false;
	}
	else if (upload5.value != "" && !CheckFile(upload5)) {
		$("#ProductNameErrorInfo").text("");
		$("#ProductPriceErrorInfo").text("");
		$("#ProductDescriptionErrorInfo").text("");
		$("#UploadProductImg1ErrorInfo").text("");
		$("#UploadProductImg2ErrorInfo").text("");
		$("#UploadProductImg3ErrorInfo").text("");
		$("#UploadProductImg4ErrorInfo").text("");
		$("#UploadProductImg5ErrorInfo").text("*图片格式错误");
		return false;
	}
	else
	{
		return true;
	}
}