$(document).ready(function () {
    var qString = getQueryString();

    //刷新店铺信息
    $.getJSON("./handler/Product_Info.ashx", { ID: qString.ID }, function (data, status) {
        if (status == "success") {
            //店铺名、logo、是否收藏
            $("#J_StoreHead a:first").attr("href", "./Store.aspx?ID=" + data.store_id);
            $("#J_StoreHead img").attr("src", data.store_logo);
            $("#J_StoreHead h1").text(data.store_name);
            var username = getCookie("isLogin");
            //                 if (username && isCollected(username, storename)) {
            //                     $(".store-uncollected").addClass("hidden");
            //                     $(".store-collected").removeClass("hidden");
            //                 }
            //                 else {
            //                     $(".store-uncollected").removeClass("hidden");
            //                     $(".store-collected").addClass("hidden");
            //                 }

            $("title").text(data.name + " - OurTmall");
            $(".tb-detail-hd span").text(data.name);
            //                 if (username && isCollected(username, productname)) {
            //                     $(".product-uncollected").addClass("hidden");
            //                     $(".product-collected").removeClass("hidden");
            //                 }
            //                 else {
            //                     $(".product-uncollected").removeClass("hidden");
            //                     $(".product-collected").addClass("hidden");
            //                 }
            $(".tm-price").text(data.price);
            $(".tm-score").text(parseInt(data.price / 10));
            $(".tm-sales").text(data.sales);
            $(".tm-rate2").append(data.score);
            $(".tm-rate span").addClass("c-value-" + data.score.toString().replace(/\./, "d"));
            $("#score3").css("width", data.score * 100 / 5 + "%");
            $("#score3 em").text(data.score);
            $("#score1").text(data.score);
            $("#score2").addClass("c-value-" + data.score.toString().replace(/\./, "d"));
            $("#score3").removeClass("c-value-" + data.score.toString().replace(/\./, "d"));
            $("#score3").addClass("score-value-" + data.score.toString().replace(/\./, "d"));

            var imgItem = "<li><a href='javascript:void(0)'><img></a></li>";
            var imgList = new Array(data.img.length + 1).join(imgItem);
            $("#J_UlThumb").append(imgList);

            var imgList2 = new Array(data.img.length + 1).join("<img>");
            $("#J_DesImage").append(imgList2);

            $.each(data.img, function (index, item) {
                $("#J_UlThumb img:eq(" + index + ")").attr("src", item);
                $("#J_DesImage img:eq(" + index + ")").attr("src", item);
            });
            $("#J_UlThumb li:first").addClass("tb-selected");
            $("#J_ImgBooth").attr("src", data.img[0]);
            //图片预览事件
            $("#J_UlThumb li").bind({
                mouseover: function () {
                    $("#J_UlThumb li").removeClass("tb-selected");
                    $(this).addClass("tb-selected");
                    $("#J_ImgBooth").attr("src", $(this).find("img").attr("src"));
                }
            });

            $(".J_EbrandLogo").text(data.name);
            $(".attr-list-hd").append(data.description);

            var goodsItem = '<div class="aside-bar-item">\
                                <a target="_blank">\
                                    <img>\
                                    <p></p>\
                                </a>\
                            </div>';
            var goodsList = new Array(data.store_hot.length + 1).join(goodsItem);
            $(".aside-bar").append(goodsList);
            for (var i = 0; i < data.store_hot.length; i++) {
                $(".aside-bar-item:eq(" + i + ") a").attr("href", "./Product.aspx?ID=" + data.store_hot[i].id);
                $(".aside-bar-item:eq(" + i + ") a").attr("title", data.store_hot[i].name);
                $(".aside-bar-item:eq(" + i + ") img").attr("src", data.store_hot[i].img);
                $(".aside-bar-item:eq(" + i + ") p").text(data.store_hot[i].name);
            }
        }
    });

    $("#Quantity").keypress(function (event) {
        if ((event.which < 48 && event.which != 8) || (event.which > 57))
            return false;
        if (event.which == 48 && $(this).val() == "")
            return false;
        return true;
    });

    $(".mui-amount-increase").click(function () {
        var n = $("#Quantity").val();
        if (n == "")
            $("#Quantity").val(1);
        if (parseInt(n) < 99999999)
            $("#Quantity").val(parseInt(n) + 1);
    });
    $(".mui-amount-decrease").click(function () {
        var n = $("#Quantity").val();
        if (parseInt(n) > 1)
            $("#Quantity").val(parseInt(n) - 1);
    });
})