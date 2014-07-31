$(document).ready(function () {
    var username = getCookie("isLogin");
    if (!username) {
        window.location.href = "./Login.aspx?backurl=" + window.location.href;
    }
    $.getJSON("./handler/Order_Address.ashx", { USER: username }, function (data, status) {
        if (status == "success") {
            var num = data.length;
            var i, maxn = 4;

            for (i = 0; i < maxn && i < num; i++) {
                $(".prov:eq(" + i + ")").text(data[i].prov);
                $(".city:eq(" + i + ")").text(data[i].city);
                $(".name:eq(" + i + ")").text(data[i].name);
                $(".dist:eq(" + i + ")").text(data[i].dist);
                $(".street:eq(" + i + ")").text(data[i].street);
                $(".phone:eq(" + i + ")").text(data[i].phone);
                if (data[i].isDefault) {
                    $(".addr:eq(" + i + ")").addClass("addr-def");
                    $(".addr:eq(" + i + ")").addClass("addr-cur");
                }
            }
            for (; i < maxn; i++) {
                $(".addr:eq(" + i + ")").css("display", "none");
            }
        }
    });

    $(".addr:visible").bind({
        mouseover: function () {
            $(this).addClass("addr-active");
        },
        mouseout: function () {
            $(this).removeClass("addr-active");
        },
        click: function () {
            $(".addr:visible").removeClass("addr-cur");
            $(this).addClass("addr-cur");
        }
    });

    var OrderIDStr = getCookie("OrderID");
    var OrderIDList = OrderIDStr.split("+");
    var IDList = {};
    for (var i = 0; i < OrderIDList.length; i++) {
        IDList["ID" + i] = parseInt(OrderIDList[i]);
    }
    $.getJSON("./handler/Order_Products.ashx", IDList, function (data, status) {
        if (status == "success") {
            var num = data.length;
            var i, maxn = 5;
            var total = 0;

            for (i = 0; i < maxn && i < num; i++) {
                $(".tube-img:eq(" + i + ") img").attr("src", data[i].img);
                $(".tube-img:eq(" + i + ") a").attr("href", "./Product.aspx?ID=" + data[i].id);
                $(".tube-master:eq(" + i + ") a").attr("href", "./Product.aspx?ID=" + data[i].id);
                $(".tube-master:eq(" + i + ") a").text(data[i].name);
                $(".tube-price:eq(" + i + ")").text(data[i].price.toFixed(2));
                $(".tc-amount:eq(" + i + ")").text(data[i].amount);
                total += data[i].price * data[i].amount;
                $(".tube-sum:eq(" + i + ") p").text((data[i].price * data[i].amount).toFixed(2));
            }
            for (; i < maxn; i++) {
                $(".grid-main:eq(" + i + ")").css("display", "none");
            }
            $("#J_RealPay").text(total.toFixed(2));
            $(".obtainedPoint strong").text(parseInt(total / 10).toFixed(2));
        }
    })
})