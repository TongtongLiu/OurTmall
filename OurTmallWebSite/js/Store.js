$(document).ready(function () {
    var qString = getQueryString();

    //刷新店铺信息
    $.getJSON("./handler/Store_Info.ashx", { ID: qString.ID }, function (data, status) {
        if (status == "success") {
            $("title").text(data.name + " - OurTmall");
            //店铺名、logo、是否收藏
            $("J_StoreHead a:first").attr("href", "./Store?ID=" + data.id);
            $("#J_StoreHead img").attr("src", data.logo);
            $("#J_StoreHead h1").text(data.name);
            var username = getCookie("isLogin");
            //                 if (username && isCollected(username, storename)) {
            //                     $(".store-uncollected").addClass("hidden");
            //                     $(".store-collected").removeClass("hidden");
            //                 }
            //                 else {
            //                     $(".store-uncollected").removeClass("hidden");
            //                     $(".store-collected").addClass("hidden");
            //                 }

            //店铺的商品类别
            var len = data.category_name.length;
            var cateItem = "<li><a href='javascript:void(0)'></a></li>";
            var cateList = new Array(len + 1).join(cateItem);
            $(".topnav").append(cateList);
            $(".topnav li").each(function (index, element) {
                $(this).css("width", 100 / len + "%");
                $(this).find("a").text(data.category_name[index]);
                $(this).find("a").attr("data-cid", data.category_id[index]);
                $(this).find("a").click(function () {
                    if ($("#nav-hot").css("display") != "none") {
                        $("#nav-hot").slideToggle();
                        $("#nav-hot2").slideToggle();
                    }

                    $.getJSON("./handler/Store_Products.ashx", { ID: qString.ID, CID: $(this).attr("data-cid") }, function (data, status) {
                        if (status == "success") {
                            productList = [];
                            $.each(data, function (index, item) {
                                productList.push(item);
                            });
                            displayProducts();
                        }
                    });
                });
            });
            
            //店铺完整信息
            $(".bottom-info").css("background-image", "url(" + data.logo + ")");
            $("#store-name-info").text(data.name);
            $("#store-category-info").append(data.category_name.join("，"));
            $("#store-contact-info").append("电话: " + data.telephone + "<br>邮箱: " + data.email);
            $("#store-score-info").append(data.score);
            $("#store-description").append(data.description);
        }
    });

    //刷新商品信息
    var productList = [];
    var pagesize = 30;
    var page = 0;
    $.getJSON("./handler/Store_Products.ashx", { ID: qString.ID }, function (data, status) {
        if (status == "success") {
            //热门商品
            $(".J_HotProductName a").each(function (index, element) {
                $(this).attr("href", "./Product.aspx?ID=" + data[index].id);
                $(this).text(data[index].name.substring(0, data[index].name.indexOf(" ")));
            });
            $(".J_HotProductPrice a").each(function (index, element) {
                $(this).text("RMB " + data[index].price);
            });
            $(".J_HotProductURL a").each(function (index, element) {
                $(this).attr("href", "./Product.aspx?ID=" + data[index].id);
            });
            $(".kv01 a").each(function (index, element) {
                $(this).attr("href", "./Product.aspx?ID=" + data[index].id);
                $(this).find("img").attr("src", data[index].img);
            });
            //商品列表
            productList = [];
            $.each(data, function (index, item) {
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
        
        switch ($(this).attr("id"))
        {
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