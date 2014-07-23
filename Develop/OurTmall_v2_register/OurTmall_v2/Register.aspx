<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OurTmall_v2.Register" %>

<!DOCTYPE html>
    <html class="ks-webkit537 ks-webkit ks-chrome36 ks-chrome" xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
            <meta charset="gbk"/>
            <meta name="renderer" content="webkit"/>
            <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
            <link rel="dns-prefetch" href="http://g.tbcdn.cn/"/>
            <link rel="dns-prefetch" href="http://gtms01.alicdn.com/"/>
            <link rel="dns-prefetch" href="http://gtms02.alicdn.com/"/>
            <link rel="dns-prefetch" href="http://gtms03.alicdn.com/"/>
            <link rel="dns-prefetch" href="http://gtms04.alicdn.com/"/>
            <link rel="dns-prefetch" href="http://log.mmstat.com/"/>
            <link rel="dns-prefetch" href="http://ald.taobao.com/"/>
            <link rel="dns-prefetch" href="http://tmm.taobao.com/"/>
            <link rel="dns-prefetch" href="http://bar.tmall.com/"/>    
            <meta name="spm-id" content=""/>
            <title>用户注册</title>
            <link rel="shortcut icon" href="http://g.tbcdn.cn/mui/global/1.2.35/file/favicon.ico" type="image/x-icon"/>
            <link title="天猫Tmall.com" href="http://g.tbcdn.cn/mui/global/1.2.35/file/search.xml" type="application/opensearchdescription+xml" rel="search"/>
            <script>
                window.g_config = {};
                window.g_config.headerVersion = '1.0.0';
                window.g_config.loadModulesLater = true;
            </script>
            <script>
                window.g_config = window.g_config || {};
                window.g_config.moduleTimeStamp = {
                    minilogin: 20130704,
                    globalCss: 20131024,
                    globalJs: 20131018
                }
            </script>
            <link rel="stylesheet" href="CSS/global-min.css"/>
            <link rel="stylesheet" href="CSS/global.css"/>
            <link rel="stylesheet" href="CSS/global-min2.css"/>
            <link rel="stylesheet" href="CSS/globalHeader-min.css"/>
            <link href="CSS/xcommonBase.css" rev="stylesheet" rel="stylesheet"/>
            
            
            <!--head fix rgn-->
            <style>
              #header .hot-query{*height: 14px}
              #header .hot-query li {display: inline-block;*zoom: 1;*display: inline;border-left: 1px solid #ccc;line-height: 1.1;*line-height: 1.2;padding: 0 12px;}
              body #tstart{right: 35px}
            </style><!--<base target="_blank">--><base href="." target="_blank">
            <link charset="utf-8" href="CSS/searchbarSuggest.css" rel="stylesheet"/>
            <link charset="utf-8" href="CSS/overlay.css" rel="stylesheet"/>
            <script type="text/javascript" src="JavaScript/jquery-2.1.1.min.js"></script>
            <script type="text/javascript" src="JavaScript/RegisterJudgeValidation.js"></script>
        </head>
        <body>
            <div id="mallPage" class="tms-page mallAct tmall-  page-not-market">
                <!-- --><!--商城通用顶通-->
                <div id="site-nav" data-spm="a2226mz" role="navigation">
                    <div id="sn-bg">
                        <div class="sn-bg-right">
                        </div>
                    </div>
                    <div id="sn-bd">
                        <b class="sn-edge"></b>

                        <div class="sn-container">
                            <p class="sn-back-home"><i class="mui-global-iconfont">&#983339;</i><a href="http://www.tmall.com/">天猫首页</a></p><p id="login-info" class="sn-login-info"><em>喵，欢迎来天猫</em><a class="sn-login" href="http://login.tmall.com/?redirect_url=http%3A%2F%2Fregister.tmall.com%2F%3Fspm%3D3.7328325.a2226mz.2.Dg782T" target="_top">请登录</a><a class="sn-register" href="http://register.tmall.com/" target="_top">免费注册</a></p>
                            <ul class="sn-quick-menu">
                                <li class="sn-mytaobao menu-item j_MyTaobao">
                                    <div class="sn-menu">
                                        <a class="menu-hd" href="http://i.taobao.com/my_taobao.htm" target="_top" rel="nofollow" tabindex="0" aria-haspopup="menu-2" aria-label="右键弹出菜单，tab键导航，esc关闭当前菜单">我的淘宝<b></b></a>

                                        <div class="menu-bd" role="menu" aria-hidden="true" id="menu-2">
                                            <div class="menu-bd-panel" id="myTaobaoPanel">
                                                <a href="http://trade.taobao.com/trade/itemlist/list_bought_items.htm?t=20110530" target="_top" rel="nofollow">已买到的宝贝</a>
                                                <a href="http://trade.taobao.com/trade/itemlist/list_sold_items.htm?t=20110530" target="_top" rel="nofollow">已卖出的宝贝</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="sn-seller-center hidden j_SellerCenter">
                                    <a target="_top" href="http://mai.taobao.com/seller_admin.htm">商家中心</a>
                                </li>
                                <li class="sn-mybrand"><i class="mui-global-iconfont">&#13385;</i>
                                    <a target="_top" id="J_SnMyBrand" class="sn-mybrand-link" href="http://mybrand.tmall.com/?&type=0&scm=1048.1.1.1">我关注的品牌</a>
                                </li>
                                <li class="sn-cart mini-cart menu"><i class="mui-global-iconfont">&#983368;</i>
                                    <a class="sn-cart-link" href="http://cart.tmall.com/cart/myCart.htm?from=btop" target="_top" rel="nofollow" id="mc-menu-hd">购物车<span class="mc-count mc-pt3">0</span>件</a>
                                </li>
                                <li class="sn-favorite menu-item">
                                    <div class="sn-menu">
                                        <a class="menu-hd" href="http://favorite.taobao.com/collect_list-1-.htm?scjjc=c1" target="_top" rel="nofollow" tabindex="0" aria-haspopup="menu-4" aria-label="右键弹出菜单，tab键导航，esc关闭当前菜单">收藏夹<b></b></a>

                                        <div class="menu-bd" role="menu" aria-hidden="true" id="menu-4">
                                            <div class="menu-bd-panel">
                                                <a href="http://shoucang.taobao.com/item_collect.htm" target="_top" rel="nofollow">收藏的宝贝</a>
                                                <a href="http://shoucang.taobao.com/shop_collect_list.htm" target="_top" rel="nofollow">收藏的店铺</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="sn-separator"></li>
                                <li class="sn-mobile">
                                    <i class="mui-global-iconfont">&#13384;</i>
                                    <a title="天猫无线" target="_top" class="sn-mobile-link" href="http://mobile.tmall.com/?scm=1027.1.1.1">手机版</a>
                                </li>
                                <li class="sn-home">
                                    <a href="http://www.taobao.com/">淘宝网</a>
                                </li>
                                <li class="sn-seller menu-item">
                                    <div class="sn-menu J_DirectPromo">
                                        <a class="menu-hd" href="http://shangjia.tmall.com/portal.htm?spm=3600.7326145.a2226mz.19.hvXP0t" target="_top" tabindex="0" aria-haspopup="menu-6" aria-label="右键弹出菜单，tab键导航，esc关闭当前菜单">商家支持<b></b></a>
                                        <div class="menu-bd sn-seller-lazy" role="menu" aria-hidden="true" id="menu-6">
                                        </div>
                                    </div>
                                </li>
                                <li class="sn-sitemap">
                                    <div class="sn-menu">
                                        <h3 class="menu-hd" tabindex="0" aria-haspopup="menu-8" aria-label="右键弹出菜单，tab键导航，esc关闭当前菜单"><i class="mui-global-iconfont"></i><span>网站导航</span><b></b></h3>
                                        <div class="menu-bd sn-sitemap-lazy sn-sitemap-bd" data-spm="a2228l4" role="menu" aria-hidden="true" id="menu-8">
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>    
            <div id="header" data-spm="a2226n0">
                <div class="headerLayout">
                    <!-- global logo -->            
                        <div class="headerCon ">
                            <h1 id="mallLogo" class="mall-logo">
                                <span class="mlogo">
                                    <a href="http://www.tmall.com" title="天猫Tmall.com" target="_top">
                                        <s></s>Tmall.com天猫
                                    </a>
                                </span>
                                <span class="slogo">
                                    <a href=""></a>
                                </span>
                            </h1>
                            <div class="header-extra">
                            <div id="mallSearch" class="mall-search">
                                <form class="mallSearch-form" name="searchTop" action="http://list.tmall.com/search_product.htm" target="_top" accept-charset="gbk">
                                    <fieldset>
                                        <legend>天猫搜索</legend>
                                        <div class="mallSearch-input clearfix">
                                            <label for="mq" style="visibility: visible; display: none;">搜索 天猫 商品/品牌/店铺</label>

                                            <div class="s-combobox" id="s-combobox-113">
                                                <div class="s-combobox-input-wrap">
                                                    <input type="text" name="q" id="mq" tabindex="9" accesskey="s" autocomplete="off" x-webkit-speech="" x-webkit-grammar="builtin:translate" class="s-combobox-input" role="combobox" aria-haspopup="true" title="请输入搜索文字" aria-label="请输入搜索文字"/>
                                                </div>
                                                <label for="mq" class="s-combobox-placeholder" style="color: rgb(102, 102, 102); visibility: visible;"></label>
                                            </div>
                                            <button type="submit">搜索</button>
                                            <input type="hidden" name="user_action" value="initiative"/>
                                            <input type="hidden" name="at_topsearch" value="1"/>
                                            <input type="hidden" name="sort" value="st"/>
                                            <input id="J_Type" type="hidden" name="type" value="p"/>
                                            <input id="J_Cat" type="hidden" name="cat" value="all"/>
                                            <input type="hidden" name="vmarket" value=""/>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>                
                        </div>
                    </div>
                </div>
            </div>

        <div class="content">
            <form id="form1" runat="server">
                <div class="form-list form-main-list" style="border:3px solid #eeeeee">
                    <div class="form-group">
                        <div class="form-item">
                            <span class="form-label tsl" data-phase-id="r_p_username">用户名(必填)</span>
                            <asp:TextBox runat="server" ID="UserName" />
                            <label id="UserNameErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl" data-phase-id="r_p_password">输入密码(必填)</span>
                            <asp:TextBox runat="server" ID="PassWord" TextMode="Password" />
                            <label id="PassWordErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl" data-phase-id="r_p_confirmPassword">确认密码(必填)</span>
                            <asp:TextBox runat="server" ID="PassWord2" TextMode="Password" />
                            <label id="PassWord2ErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl" data-phase-id="r_p_email">电子邮件(选填)</span>
                            <asp:TextBox runat="server" ID="Email" />
                            <label id="EmailErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl" data-phase-id="r_p_telephone">电话号码(选填)</span>
                            <asp:TextBox runat="server" id="Telephone" />
                            <label id="TelephoneErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl" data-phase-id="r_p_avatar">上传头像(选填)</span>
                            <asp:FileUpload ID="UploadAvatar" runat="server" />   
                        </div>
                        <div class="form-item">
                            <asp:Button id="submitButton" runat="server" Text="注册" CssClass="btn btn-large tsl" OnClick="submitButton_Click" OnClientClick="return checkValidate()"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>