function isValidEmail(e) {
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (e.length <= 50 && filter.test(e))
				return true;
		else
				return false;
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

function checkDeliveryAddressValidation()
{
		var country = $("#DeliverCountry").val();
		var province = $("#DeliverProvince").val();
		var city = $("#DeliverCity").val();
		var county = $("#DeliverCounty").val();
		var street = $("#DeliverStreet").val();
		var zipcode = $("#DeliverZipcode").val();
		var consignee = $("#DeliverConsignee").val();
		var tel = $("#DeliverTelephone").val();

		if (country == "")
		{
				$("#DeliverAreaErrorInfo").text("*国家信息是必填项");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (city == "")
		{
				$("#DeliverAreaErrorInfo").text("*城市信息是必填项");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (country.length > 50 || province.length > 50 || city.length > 50 || county.length > 50)
		{
				$("#DeliverAreaErrorInfo").text("*地区信息过长");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (street == "")
		{
				$("#DeliverAreaErrorInfo").text("");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("*街道信息是必填项");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (street.length > 50)
		{
				$("#DeliverAreaErrorInfo").text("");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("*街道信息过长");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (zipcode == "")
		{
				$("#DeliverAreaErrorInfo").text("");
				$("#DeliverZipcodeErrorInfo").text("*邮编是必填项");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (zipcode != "" && !isValidTel(zipcode))
		{
				$("#DeliverAreaErrorInfo").text("");
				$("#DeliverZipcodeErrorInfo").text("*邮编格式不正确");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (consignee == "")
		{
				$("#DeliverAreaErrorInfo").text("");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("*收货人信息不能为空");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (consignee.length > 50)
		{
				$("#DeliverAreaErrorInfo").text("");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("*收货人名字过长");
				$("#DeliverTelephoneErrorInfo").text("");
				return false;
		}
		else if (tel == "")
		{
				$("#DeliverAreaErrorInfo").text("");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("*联系电话是必填项");
				return false;
		}
		else if (tel != "" && !isValidTel(tel))
		{
				$("#DeliverAreaErrorInfo").text("");
				$("#DeliverZipcodeErrorInfo").text("");
				$("#DeliverStreetErrorInfo").text("");
				$("#DeliverConsigneeErrorInfo").text("");
				$("#DeliverTelephoneErrorInfo").text("*联系电话格式不正确");
				return false;
		}
		else
		{
				return true;
		}
}