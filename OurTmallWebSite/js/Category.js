$(document).ready(function () {
    var qString = getQueryString();

    //刷新商品信息
    var productList = [];
    var pagesize = 30;
    var page = 0;
    $.getJSON("./handler/Category_Products.ashx", { ID: qString.ID }, function (data, status) {
        if (status == "success") {
            $("title").text(data.name + " - OurTmall");
            $(".goods-header span").text(data.name + "列表");

            //商品列表
            productList = [];
            $.each(data.plist, function (index, item) {
                productList.push(item);
            });
            displayProducts();
        }
    });

    function displayProducts() {
        var goodsItem = '<div class="goods-item">\
                              <div class="goods-item-img">\
                                <a href="#" target="_blank">\
                                  <img height="150" width="230" src="#">\
                                </a>\
                              </div>\
                              <div class="goods-item-info">\
                                <div class="goods-item-name">\
                                  <a href="#" target="_blank" class="mblue">\
                                  </a>\
                                </div>\
                                <div class="goods-item-price">\
                                </div>\
                                <div class="goods-item-sales">\
                                </div>\
                                <div class="goods-item-score">\
                                </div>\
                              </div>\
                            </div>';
        var num = pagesize < productList.length ? pagesize : productList.length;
        var goodsList = new Array(num + 1).join(goodsItem);
        $(".goods-container").empty();
        $(".goods-container").append(goodsList);
        $(".goods-item").each(function (index, item) {
            if (index % 3 == 2) {
                $(this).css("border-right", "0");
            }
        });

        for (var i = 0; i < num; i++) {
            $(".goods-item-img:eq(" + i + ") a").attr("href",
                "./Product.aspx?ID=" + productList[page * pagesize + i].id);
            $(".goods-item-img:eq(" + i + ") img").attr("src",
                productList[page * pagesize + i].img);
            $(".goods-item-name:eq(" + i + ") a").attr("href",
                "./Product.aspx?ID=" + productList[page * pagesize + i].id);
            $(".goods-item-name:eq(" + i + ") a").text(productList[page * pagesize + i].name);
            $(".goods-item-price:eq(" + i + ")").text("RMB " + productList[page * pagesize + i].price);
            $(".goods-item-sales:eq(" + i + ")").text("销量 " + productList[page * pagesize + i].sales);
            $(".goods-item-score:eq(" + i + ")").text("评分 " + productList[page * pagesize + i].score);
        }
    }

    //排序按钮事件
    $(".goods-sort-button a").click(function () {
        if ($(this).hasClass("select")) return;

        $(".goods-sort-button a").removeClass("select");
        $(this).addClass("select");

        switch ($(this).attr("id")) {
            case "sales":
                productList.sort(sortBySales);
                break;

            case "price":
                productList.sort(sortByPrice);
                break;

            case "score":
                productList.sort(sortByScore);
                break;
        }
        page = 0;
        displayProducts();
    });
    function sortBySales(p1, p2) {
        return p2.sales - p1.sales;
    }
    function sortByPrice(p1, p2) {
        return p1.price - p2.price;
    }
    function sortByScore(p1, p2) {
        return p2.score - p1.score;
    }
})