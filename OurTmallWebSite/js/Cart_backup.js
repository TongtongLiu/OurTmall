$(document).ready(function () {
    var username = getCookie("isLogin");
    if (!username) {
        window.location.href = "./Login.aspx?backurl=" + window.location.href;
    }
    $.getJSON("./handler/Cart_Products.ashx", { USER: username }, function (data, status) {
        if (status == "success") {
            var goodsItem1 = '<div class="J_ItemBody item-body clearfix item-normal">\
                            <ul class="item-content clearfix">\
                              <li class="td td-chk">\
                                <div class="td-inner">\
                                  <div class="cart-checkbox">\
                                    <asp:TextBox ID="ItemCheckbox';
            var goodsItem3 = '" CssClass="J_CheckBoxItem" Text="0" runat="Server"/>\
                                    <label class="J_ItemCheckBox">勾选商品\
                                    </label>\
                                  </div>\
                                </div>\
                              </li>\
                              <li class="td td-item">\
                                <div class="td-inner">\
                                  <div class="item-pic J_ItemPic img-loaded">\
                                    <a href="javascript:void(0)" target="_blank" class="J_MakePoint" data-point="tbcart.8.12">\
                                      <img class="itempic J_ItemImg">\
                                    </a>\
                                  </div>\
                                  <div class="item-info">\
                                    <div class="item-basic-info">\
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemName" data-point="tbcart.8.11">\
                                      </a>\
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemStore" data-point="tbcart.8.11">\
                                      </a>\
                                    </div>\
                                  </div>\
                                </div>\
                              </li>\
                              <li class="td td-info">\
                                <div class="item-props ">\
                                </div>\
                              </li>\
                              <li class="td td-price">\
                                <div class="td-inner">\
                                  <div class="item-price price-promo-">\
                                    <div class="price-content">\
                                      <div class="price-line">\
                                        <em class="J_Price price-now" tabindex="0">\
                                        </em>\
                                      </div>\
                                    </div>\
                                  </div>\
                                </div>\
                              </li>\
                              <li class="td td-amount">\
                                <div class="td-inner">\
                                  <div class="amount-wrapper ">\
                                    <div class="item-amount ">\
                                      <a href="#" class="J_Minus minus">-\
                                      </a>\
                                      <asp:TextBox ID="Amout';
            var goodsItem2 = '" Text="1" CssClass="text text-amount J_ItemAmount" MaxLength="8" runat="server"/>\
                                      <a href="#" class="J_Plus plus">+\
                                      </a>\
                                    </div>\
                                    <div class="amount-msg J_AmountMsg">\
                                    </div>\
                                  </div>\
                                </div>\
                              </li>\
                              <li class="td td-sum">\
                                <div class="td-inner">\
                                  <em tabindex="0" class="J_ItemSum number">\
                                  </em>\
                                  <div class="J_ItemLottery">\
                                  </div>\
                                </div>\
                              </li>\
                              <li class="td td-op">\
                                <div class="td-inner">\
                                  <a href="javascript:void(0)" title="移至收藏夹" class="btn-fav J_Fav J_MakePoint">移入收藏夹\
                                  </a>\
                                  <a href="javascript:void(0)" title="删除" class="J_Del J_MakePoint">删除\
                                  </a>\
                                </div>\
                              </li>\
                            </ul>\
                          </div>';
            var goodsList = "";
            for (var i = 0; i < data.length; i++) {
                goodsList += goodsItem1 + i + goodsItem3 + i + goodsItem2;
            }
            $("#J_ItemHolder").append(goodsList);
            $(".J_ItemBody:first").addClass("first-item");
            $(".J_ItemBody:last").addClass("last-item");
            $.each(data, function (index, item) {
                $(".J_ItemImg:eq(" + index + ")").attr("src", item.img);
                $(".J_ItemName:eq(" + index + ")").attr("href", "./Product.aspx?ID=" + item.id);
                $(".J_ItemName:eq(" + index + ")").text(item.name);
                $(".J_ItemStore:eq(" + index + ")").attr("href", "./Store.aspx?ID=" + item.store_id);
                $(".J_ItemStore:eq(" + index + ")").text(item.store_name);
                $(".J_Price:eq(" + index + ")").text(item.price);
                $(".J_ItemSum:eq(" + index + ")").text(item.price);
            })
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
                $(".J_ItemCheckBox").each(function () {
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