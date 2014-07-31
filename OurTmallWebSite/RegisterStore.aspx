<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterStore.aspx.cs" Inherits="RegisterStore" %>

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
            <title>店铺注册</title>
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
            <script type="text/javascript" src="./js/Global.js"></script>
      <script type="text/javascript" src="./js/LoginInfo.js"></script>
            
            <!--head fix rgn-->
            <style>
              #header .hot-query{*height: 14px}
              #header .hot-query li {display: inline-block;*zoom: 1;*display: inline;border-left: 1px solid #ccc;line-height: 1.1;*line-height: 1.2;padding: 0 12px;}
              body #tstart{right: 35px}

              .restrictSize
              {
                  max-width:400px;
                  max-height:250px;
              }
            </style><!--<base target="_blank">--><base href="." target="_blank">
            <link charset="utf-8" href="CSS/searchbarSuggest.css" rel="stylesheet"/>
            <link charset="utf-8" href="CSS/overlay.css" rel="stylesheet"/>
            <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
            <script type="text/javascript" src="./js/StoreRegisterJudgeValidation.js"></script>
        </head>
        <body>
            <div id="mallPage" class="tms-page mallAct tmall-  page-not-market">
                <!-- --><!--商城通用顶通-->
              <div id="site-nav" data-spm="a2226mz"> 
      <div id="sn-bg">
        <div class="sn-bg-right"> 
        </div> 
      </div> 
      <div id="sn-bd">
        <b class="sn-edge"></b> 
        <div class="sn-container"> 
          <p id="login-info" class="sn-login-info"></p>
          <ul class="sn-quick-menu"> 
            <li class="sn-mytaobao menu-item j_MyTaobao"> 
              <div class="sn-menu"> 
                <a class="menu-hd" href="#" target="_top" rel="nofollow">我的淘宝<b></b></a> 
                <div class="menu-bd"> 
                  <div class="menu-bd-panel" id="myTaobaoPanel"> 
                    <a href="#" target="_top" rel="nofollow">已买到的宝贝</a> 
                    <a href="#" target="_top" rel="nofollow">已卖出的宝贝</a> 
                  </div> 
                </div> 
              </div> 
            </li> 
            <li class="sn-mybrand">
              <i class="mui-global-iconfont">&#xf0148;</i> 
              <a class="sn-cart-link" href="./Cart.aspx" target="_top" rel="nofollow">购物车 </a> 
            </li> 
            <li class="sn-favorite menu-item"> 
              <div class="sn-menu"> 
                <a class="menu-hd" href="./Colloection.aspx" target="_top" rel="nofollow">收藏夹<b></b></a> 
                <div class="menu-bd"> 
                  <div class="menu-bd-panel"> 
                    <a href="./Colloection.aspx" target="_top" rel="nofollow">收藏的宝贝</a> 
                    <a href="./Colloection.aspx" target="_top" rel="nofollow">收藏的店铺</a> 
                  </div> 
                </div> 
              </div> 
            </li> 
            <li class="sn-separator"></li> 
            <li class="sn-home"> 
              <a href="http://www.taobao.com/" target="_blank">淘宝网</a> 
            </li> 
            <li class="sn-seller menu-item">  
              <a class="menu-hd" href="#" target="_top">商家中心</a> 
            </li> 
            <li class="sn-sitemap"> 
              <div class="sn-menu"> 
                <h3 class="menu-hd">
                  <i class="mui-global-iconfont">&#xe601;</i>
                  <span>网站导航</span>
                  <b></b>
                </h3> 
                <div class="menu-bd sn-sitemap-lazy sn-sitemap-bd" data-spm="a2228l4"> 
                </div>
                <div class="menu-bd sn-sitemap-lazy sn-sitemap-bd" data-spm="a2228l4">
                  <div class="site-cont site-hot">
                    <h2>热点推荐<span>Hot</span></h2>
                    <ul class="site-list">
                      <li><a href="http://chaoshi.tmall.com/?spm=3.7346457.a2228ix.1">天猫超市</a></li>
                      <li><a href="http://miao.tmall.com/?spm=3.7346457.a2228ix.2">喵鲜生</a></li>
                      <li><a href="http://www.tmall.com/go/act/3c/diankj.php?spm=3.7346457.a2228ix.3">酷玩街</a></li>
                      <li><a href="http://new.neiyi.tmall.com/?spm=3.7346457.a2228ix.4">内衣新品
                        <i class="sn-sitemap-icon  sn-sitemap-icon-hot "></i>
                      </a></li>
                      <li><a href="http://new.nvzhuang.tmall.com/?spm=3.7346457.a2228ix.5">女装新品
                        <i class="sn-sitemap-iconsn-sitemap-icon-hot "></i>
                      </a></li>
                      <li><a href="http://mei.tmall.com/shiyong.htm?spm=3.7346457.a2228ix.6">试美妆</a></li>
                      <li><a href="http://new.sports.tmall.com/?spm=3.7346457.a2228ix.7">运动新品</a></li>
                      <li><a href="http://www.tmall.com/go/market/fushi/shishang.php?spm=3.7346457.a2228ix.8">时尚先生
                        <i class="sn-sitemap-iconsn-sitemap-icon-hot "></i>
                      </a></li>
                      <li><a href="http://miaoguoji.tmall.com/?spm=3.7346457.a2228ix.9">户外名品</a></li>
                      <li><a href="http://baby.tmall.com/go/market/baby/4m_jmmm.php?spm=3.7346457.a2228ix.10">精明妈咪</a></li>
                      <li><a href="http://chi.tmall.com/?spm=3.7346457.a2228ix.11">吃乐会
                        <i class="sn-sitemap-icon sn-sitemap-icon-new"></i>
                      </a></li>
                      <li><a href="http://yao.tmall.com/go/market/yiyao/zhonglaonian.php?spm=3.7346457.a2228ix.12">关爱长辈</a></li>
                      <li><a href="http://vip.tmall.com/vip/index.htm?spm=3.7346457.a2228ix.13">会员积分</a></li>
                      <li><a href="http://www.tmall.hk/">天猫国际</a></li>
                    </ul>
                  </div>
                  <div class="site-cont site-market">
                    <h2>行业市场<span>Market</span></h2>
                    <ul class="site-list">
                      <li><a href="http://mei.tmall.com/?spm=3.7346457.a2228ix.15">美妆</a></li>
                      <li><a href="http://3c.tmall.com/?spm=3.7346457.a2228ix.16">电器</a></li>
                      <li><a href="http://nvzhuang.tmall.com/?spm=3.7346457.a2228ix.17">女装
                        <i class="sn-sitemap-iconsn-sitemap-icon-hot "></i>
                      </a></li>
                      <li><a href="http://nanzhuang.tmall.com/?spm=3.7346457.a2228ix.18">男装
                        <i class="sn-sitemap-iconsn-sitemap-icon-hot "></i>
                      </a></li>
                      <li><a href="http://nvxie.tmall.com/?spm=3.7346457.a2228ix.19">女鞋</a></li>
                      <li><a href="http://nanxie.tmall.com/?spm=3.7346457.a2228ix.20">男鞋</a></li>
                      <li><a href="http://neiyi.tmall.com/?spm=3.7346457.a2228ix.21">内衣
                        <i class="sn-sitemap-iconsn-sitemap-icon-hot "></i>
                      </a></li><li><a href="http://bag.tmall.com/?spm=3.7346457.a2228ix.22">箱包</a></li>
                      <li><a href="http://sports.tmall.com/?spm=3.7346457.a2228ix.23">运动</a></li>
                      <li><a href="http://huwai.tmall.com/?spm=3.7346457.a2228ix.24">户外
                        <i class="sn-sitemap-iconsn-sitemap-icon-hot "></i>
                      </a></li>
                      <li><a href="http://baby.tmall.com/?spm=3.7346457.a2228ix.25">母婴</a></li>
                      <li><a href="http://jia.tmall.com/?spm=3.7346457.a2228ix.26">家装</a></li>
                      <li><a href="http://yao.tmall.com/?spm=3.7346457.a2228ix.27">医药</a></li>
                      <li><a href="http://food.tmall.com/?spm=3.7346457.a2228ix.28">食品</a></li>
                      <li><a href="http://dai.tmall.com/?spm=3.7346457.a2228ix.29">配饰
                        <i class="sn-sitemap-icon sn-sitemap-icon-new"></i>
                      </a></li>
                    </ul>
                  </div>
                  <div class="site-cont site-brand">
                    <h2>品牌风尚<span>Brand</span></h2>
                    <ul class="site-list">
                      <li><a href="http://brand.tmall.com/?spm=3.7346457.a2228ix.30">大牌街</a></li>
                      <li><a href="http://brand.tmall.com/second.htm?spm=3.7346457.a2228ix.31">潮牌街</a></li>
                      <li><a href="http://brand.tmall.com/yuanChuang.htm?spm=3.7346457.a2228ix.32">天猫原创</a></li>
                      <li><a href="http://www.tmall.com/go/chn/brand/new-subject.php?spm=3.7346457.a2228ix.33">今日最大牌</a></li>
                      <li><a href="http://xfx.tmall.com/?spm=3.7346457.a2228ix.34">一周新发现</a></li>
                      <li><a href="http://brand.tmall.com/global.htm?spm=3.7346457.a2228ix.35">全球至尚</a></li>
                    </ul>
                  </div>
                </div>
              </div> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div>
               <!-- <div id="site-nav" data-spm="a2226mz" role="navigation">
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
            </div>  -->
            <div id="header" data-spm="a2226n0">
                <div class="headerLayout">
                    <!-- global logo -->            
                        <div class="headerCon ">
                            <h1 id="mallLogo" class="mall-logo">
                                <span class="mlogo">
                                    <a href="./Index.aspx" title="天猫Tmall.com" target="_top">
                                        <s></s>Tmall.com天猫
                                    </a>
                                </span>
                                <span class="slogo">
                                    <a href=""></a>
                                </span>
                            </h1>
                            <div class="header-extra">
                           <div id="mallSearch" class="mall-search">
                               <form class="mallSearch-form" name="searchTop" action="SearchResult.aspx" target="_top" accept-charset="utf-8">
                                   <fieldset>
                                       <legend>天猫搜索</legend>
                                       <div class="mallSearch-input clearfix">
                                           <label for="mq" style="visibility: visible; display: none;">搜索 天猫 商品/品牌/店铺</label>

                                           <div class="s-combobox" id="s-combobox-113">
                                               <div class="s-combobox-input-wrap">
                                                   <input type="text" name="search" id="mq" tabindex="9" accesskey="s" autocomplete="off" x-webkit-speech="" x-webkit-grammar="builtin:translate" class="s-combobox-input" role="combobox" aria-haspopup="true" title="请输入搜索文字" aria-label="请输入搜索文字"/>
                                               </div>
                                           <label for="mq" class="s-combobox-placeholder" style="color: rgb(102, 102, 102); visibility: visible;"></label></div>
                                           <button type="submit">搜索</button>
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
                            <span class="form-label tsl">店铺名(必填)</span>
                            <asp:TextBox runat="server" id="StoreName" />
                            <label id="StoreNameErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl">输入密码(必填)</span>
                            <asp:TextBox runat="server" id="StorePassWord" TextMode="Password" />
                            <label id="StorePassWordErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl">确认密码(必填)</span>
                            <asp:TextBox runat="server" id="StorePassWord2" TextMode="Password" />
                            <label id="StorePassWord2ErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl">店主姓名(必填)</span>
                            <asp:TextBox runat="server" id="StoreOwnerName" />
                            <label id="StoreOwnerNameErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl">联系电话(必填)</span>
                            <asp:TextBox runat="server" id="StoreTelephone" />
                            <label id="StoreTelephoneErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl">联系邮箱(必填)</span>
                            <asp:TextBox runat="server" id="StoreEmail" />
                            <label id="StoreEmailErrorInfo" style="color:red"></label>
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl">店铺简介(选填)</span>
                            <asp:TextBox runat="server" id="StoreDescription" TextMode="MultiLine" Height="250px" Width="400px" CssClass="restrictSize" />
                        </div>
                        <div class="form-item">
                            <span class="form-label tsl">上传logo(选填)</span>
                            <asp:FileUpload id="UploadStoreLogo" runat="server" />
                            <label id="UploadStoreLogoErrorInfo" style="color:red" />
                        </div>
                        <div class="form-item">
                            <asp:Button id="StoreSubmitButton" runat="server" Text="注册商铺" CssClass="btn btn-large tsl" OnClientClick="return checkStoreValidate()" OnClick="StoreSubmitButton_Click" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>