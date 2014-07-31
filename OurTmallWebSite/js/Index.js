$(document).ready(function () {
    //轮播
    var cur = 0, interval = 3000;
    var autoplay = function () {
        $(".j_MenuNav:eq(" + cur + ")").removeClass("menu-nav-selected");
        $(".j_CategoryMenuPannel:eq(" + cur + ")").addClass("hidden");
        cur = (cur + 1) % 8;
        $(".j_MenuNav:eq(" + cur + ")").addClass("menu-nav-selected");
        $(".j_CategoryMenuPannel:eq(" + cur + ")").removeClass("hidden");
    };
    var autoplayID = setInterval(autoplay, interval);

    $(".j_MenuNav").bind({
        mouseover: function () {
            clearInterval(autoplayID);
            $(".j_MenuNav").removeClass("menu-nav-selected");
            $(this).addClass("menu-nav-selected");
            $(this).addClass("menu-nav-hover");
            $(".j_CategoryMenuPannel").addClass("hidden");
            cur = parseInt($(this).attr("data-count"));
            $(".j_CategoryMenuPannel:eq(" + cur + ")").removeClass("hidden");
        },
        mouseout: function () {
            $(this).removeClass("menu-nav-hover");
            autoplayID = setInterval(autoplay, interval);
        }
    });
    $(".j_BannerContainer").bind({
        mouseover: function () {
            clearInterval(autoplayID);
        },
        mouseout: function () {
            autoplayID = setInterval(autoplay, interval);
        }
    });

    //刷新类别菜单
    $.getJSON("./handler/Index_CategoryMenu.ashx", function (data, status) {
        if (status == "success") {
            $.each(data, function (index, item) {
                //类别名
                $(".j_MenuNav:eq(" + index + ")").append("<a>" + item.name + "<\a>");
                //类别页url
                $(".j_MenuNav:eq(" + index + ") a").attr("href", "./Category.aspx?ID=" + item.id);
                //类别的热门商品url
                $(".j_BannerContainer:eq(" + index + ") a").each(function (index, element) {
                    if (item.product_id[index]) {
                        $(this).attr("href", "./Product.aspx?ID=" + item.product_id[index]);
                    }
                    else {
                        $(this).attr("href", "javascript:void(0)");
                    }
                });
                //类别的热门商品图
                $(".j_BannerContainer:eq(" + index + ") img").each(function (index, element) {
                    if (item.product_img[index]) {
                        $(this).attr("src", item.product_img[index]);
                    }
                    else {
                        $(this).attr("alt", "暂无");
                    }
                });
            });
            $(".category-menu-content .fp-content-loading").removeClass("fp-content-loading");
        }
    });
    
    //刷新热门店铺
    $.getJSON("./handler/Index_HotStore.ashx", function (data, status) {
        if (status == "success") {
            $.each(data, function (index, item) {
                //热门店铺
                if (item.id) {
                    $(".j_BrandItem:eq(" + index + ")").attr("href", "./Store.aspx?ID=" + item.id);
                    $(".j_BrandItem:eq(" + index + ")").attr("title", item.name);
                    $(".j_BrandItem:eq(" + index + ") img").attr("src", item.logo);
                    //更新店铺收藏信息
                    var username = getCookie("isLogin");
                    //                 if (username && isCollected(username, storename)) {
                    //                     $(".j_BrandStatus:eq(" + index + ")").text("");
                    //                 }
                    //                 else {
                    //                     $(".j_BrandStatus:eq(" + index + ")").text("");
                    //                 }
                }
                else {
                    $(".j_BrandItem:eq(" + index + ") img").attr("alt", "暂无");
                }
            });
            $("#J_BrandRecSlide .fp-content-loading").removeClass("fp-content-loading");
        }
    });

    //刷新各类别具体项
    $.getJSON("./handler/Index_FloorItem.ashx", function (data, status) {
        if (status == "success") {
            $.each(data, function (index, item) {
                //类别名
                $(".floor-title:eq(" + index + ") .floor-key").text(item.name);
                //类别url
                $(".floor-title:eq(" + index + ") a").attr("href", "./Category.aspx?ID=" + item.id);
                $(".floor-title:eq(" + index + ") a").attr("title", item.name);
                //类别热门商品
                $(".floor-banner-container:eq(" + index + ") a").each(function (index, element) {
                    if (item.product_id[index]) {
                        $(this).attr("href", "./Product.aspx?ID=" + item.product_id[index]);
                        $(this).attr("title", item.product_name[index]);
                    }
                    else {
                        $(this).attr("href", "javascript:void(0)");
                    }
                });
                $(".floor-banner-container:eq(" + index + ") img").each(function (index, element) {
                    if (item.product_img[index]) {
                        $(this).attr("src", item.product_img[index]);
                    }
                    else {
                        $(this).attr("alt", "暂无");
                    }
                });
                //类别热门店铺
                $(".brand-slide-pannel:eq(" + index + ") a").each(function (index, element) {
                    if (item.store_id[index]) {
                        $(this).attr("href", "./Store.aspx?ID=" + item.store_id[index]);
                        $(this).attr("title", item.store_name[index]);
                    }
                    else {
                        $(this).attr("href", "javascript:void(0)");
                    }
                });
                $(".brand-slide-pannel:eq(" + index + ") img").each(function (index, element) {
                    if (item.store_logo[index]) {
                        $(this).attr("src", item.store_logo[index]);
                    }
                    else {
                        $(this).attr("alt", "暂无");
                    }
                });
            });
            $("#J_FloorContainer .fp-content-loading").removeClass("fp-content-loading");
        }
    })
})