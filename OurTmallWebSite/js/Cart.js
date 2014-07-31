$(document).ready(function () {
    var username = getCookie("isLogin");
    if (!username) {
        window.location.href = "./Login.aspx?backurl=" + window.location.href;
    }
    $.getJSON("./handler/Cart_Products.ashx", { USER: username }, function (data, status) {
        if (status == "success") {
            var num = data.length;
            var i, maxn = 5;

            for (i = 0; i < maxn && i < num; i++) {
                $(".J_ItemImg:eq(" + i + ")").attr("src", data[i].img);
                $(".J_ItemImg:eq(" + i + ")").attr("data-id", data[i].id);
                $(".J_ItemName:eq(" + i + ")").attr("href", "./Product.aspx?ID=" + data[i].id);
                $(".J_ItemName:eq(" + i + ")").text(data[i].name);
                $(".J_ItemStore:eq(" + i + ")").attr("href", "./Store.aspx?ID=" + data[i].store_id);
                $(".J_ItemStore:eq(" + i + ")").text(data[i].store_name);
                $(".J_Price:eq(" + i + ")").text(data[i].price);
                $(".J_ItemSum:eq(" + i + ")").text(data[i].price);
            }
            for (; i < maxn; i++) {
                $(".J_ItemBody:eq(" + i + ")").css("display", "none");
            }

            $(".J_ItemBody:visible:first").addClass("first-item");
            $(".J_ItemBody:visible:last").addClass("last-item");
        }
    })

    $(".J_ItemAmount").bind({
        keypress: function (event) {
            if ((event.which < 48 && event.which != 8) || (event.which > 57))
                return false;
            if (event.which == 48 && $(this).val() == "")
                return false;
            return true;
        }
    });
    $(".J_ItemAmount").each(function (index, item) {
        $(this).bind({
            keyup: function (event) {
                var n = $(this).val();
                if (n == "")
                    n = 0;
                else
                    n = parseInt(n);
                $(".J_ItemSum:eq(" + index + ")").text((parseFloat($(".J_Price:eq(" + index + ")").text()) * n).toFixed(2));
                getTotalPrice();
            }
        })
    })

    $(".J_Minus").each(function (index, item) {
        $(this).bind({
            click: function () {
                var n = $(this).next().val();
                n = parseInt(n);
                if (n > 1)
                    $(this).next().val(--n);
                $(".J_ItemSum:eq(" + index + ")").text((parseFloat($(".J_Price:eq(" + index + ")").text()) * n).toFixed(2));
                getTotalPrice();
            }
        });
    });
    $(".J_Plus").each(function (index, item) {
        $(this).bind({
            click: function () {
                var n = $(this).prev().val();
                if (n == "")
                    n = 0;
                else
                    n = parseInt(n);
                if (n < 99999999)
                    $(this).prev().val(++n);
                $(".J_ItemSum:eq(" + index + ")").text(($(".J_Price:eq(" + index + ")").text() * n).toFixed(2));
                getTotalPrice();
            }
        });
    });

    $(".J_ItemCheckBox").bind({
        click: function () {
            if ($(this).parent().hasClass("cart-checkbox-checked")) {
                $(this).parent().removeClass("cart-checkbox-checked");
                $(this).prev().val("0");
                $(".J_SelectAllCheckbox").parent().removeClass("cart-checkbox-checked");
            }
            else {
                $(this).parent().addClass("cart-checkbox-checked");
                $(this).prev().val("1");
                var flag = true;
                $(".J_ItemCheckBox:visible").each(function () {
                    if (!$(this).parent().hasClass("cart-checkbox-checked"))
                        flag = false;
                });
                if (flag) {
                    $(".cart-checkbox").addClass("cart-checkbox-checked");
                    $("#J_SelectAllCbx1").val("1");
                    $("#J_SelectAllCbx2").val("1");
                }
            }
            getTotalPrice();
        }
    });

    $(".J_SelectAllCheckbox").bind({
        click: function () {
            if ($(this).parent().hasClass("cart-checkbox-checked")) {
                $(".cart-checkbox").removeClass("cart-checkbox-checked");
                $("#J_SelectAllCbx1").val("0");
                $("#J_SelectAllCbx2").val("0");
                $(".J_CheckBoxItem").val("0");
            }
            else {
                $(".cart-checkbox").addClass("cart-checkbox-checked");
                $("#J_SelectAllCbx1").val("1");
                $("#J_SelectAllCbx2").val("1");
                $(".J_CheckBoxItem:visible").val("1");
            }
            getTotalPrice();
        }
    });

    function getTotalPrice() {
        var total = 0;
        $(".J_CheckBoxItem").each(function (index, item) {
            if (parseInt($(this).val()) > 0) {
                total += parseFloat($(".J_ItemSum:eq(" + index + ")").text());
            }
        });
        $("#J_Total").text(total.toFixed(2));
        $("#J_SmallTotal").text(total.toFixed(2));
        if (total > 0) {
            $(".submit-btn").removeClass("submit-btn-disabled");
        }
        else {
            $(".submit-btn").addClass("submit-btn-disabled");
        }
    }

    $(".J_Del").bind({
        click: function () {
            $(this).parents(".J_ItemBody").find(".J_CheckBoxItem").val("0");
            $(this).parents(".J_ItemBody").slideToggle();
            getTotalPrice();
        }
    });

    $(".J_DeleteSelected").bind({
        click: function () {
            $(".J_CheckBoxItem").each(function (index, item) {
                if (parseInt($(this).val()) > 0) {
                    $(this).val("0");
                    $(this).parents(".J_ItemBody").slideToggle();
                }
            });
            getTotalPrice();
        }
    })
})