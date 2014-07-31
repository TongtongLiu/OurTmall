<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyUserInfo.aspx.cs" Inherits="ModifyUserInfo" %>

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
        <title>用户信息修改</title>
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
        <link rel="stylesheet" href="./css/global.css"/>
        <!--head fix rgn-->
        <style>
          #header .hot-query{*height: 14px}
          #header .hot-query li {display: inline-block;*zoom: 1;*display: inline;border-left: 1px solid #ccc;line-height: 1.1;*line-height: 1.2;padding: 0 12px;}
          body #tstart{right: 35px}
        </style>
        <!--<base target="_blank">-->
        <base href="." target="_blank"/>
        <link charset="utf-8" href="./css/searchbarSuggest.css" rel="stylesheet"/>
        <link charset="utf-8" href="./css/overlay.css" rel="stylesheet"/>
        <style>
        		.invisableThing {
						display:none;
        		}
        </style>
		<link rel="stylesheet" href="./css/app-config.css"/>
		<link rel="stylesheet" href="./css/tbra.css"/>
		<link rel="stylesheet" href="./css/mission.css"/>
		<link rel="stylesheet" href="./css/pf-base.css"/>
		<link rel="stylesheet" href="./css/mt-tips.css"/>
		<link rel="stylesheet" href="./css/tbsp.css"/>
		<link rel="stylesheet" href="./css/mytaobaoMtbase.css"/>
		<link rel="stylesheet" href="./css/global-min.css"/>
		<link rel="stylesheet" href="./css/xcommonBase.css"/>
		<script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="./js/ModifyUserValidation.js"></script>
    
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
          <script type="text/javascript" src="./js/LoginInfo.js"></script>
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
                    <a href="./C" target="_top" rel="nofollow">收藏的店铺</a> 
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

            <div id="header" data-spm="a2226n0">
                <div class="headerLayout">
                <!-- global logo -->            
                    <div class="headerCon ">
                        <h1 id="mallLogo" class="mall-logo">
                            <span class="mlogo">
                                <a href="http://www.tmall.com/" title="天猫Tmall.com" target="_top">
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

		<div id="content" class="layout grid-s160m0">
				<!-- 信息显示及修改部分 -->
				<div class="col-main">
						<div class="main-wrap">
								<!-- 开始个人信息的修改 -->
								<div id="profile" class="sns-config">
										<div class="sns-box box-detail">
												<div class="bd">
														<div class="sns-nf">
																<div style="font-size:15px;margin:10px 0;">
																		您可以在这里修改个人资料哦~
																</div>
																<asp:Label ID="CorrectPrePassWord2" runat="server" CssClass="invisableThing" />
																<form id="ModifyUserInfoForm" runat="server">
																		<div id="MainProfile" class="parts">
																				<p>
																						<label class="noticeInfo">昵称：</label>
																						<asp:TextBox runat="server" id="ModifyUserName" CssClass="f-txt" ReadOnly="true" />
																						<span class="noticeInfo">(不可修改)</span>
																						<span id="ModifyUserNameErrorInfo" style="color:red"  class="noticeInfo"></span>
																				</p>
																				<p>
																						<label  class="noticeInfo">原密码：</label>
																						<asp:TextBox runat="server" id="PrePassWord" TextMode="Password" CssClass="f-txt" />
																						<span class="noticeInfo">(必填)</span>
																						<span id="PrePassWordErrorInfo" style="color:red" class="noticeInfo"></span>
																				</p>
																				<p>
																						<label class="noticeInfo">新密码：</label>
																						<asp:TextBox runat="server" id="NewPassWord" TextMode="Password" CssClass="f-txt" />
																						<span class="noticeInfo">(选填)</span>
																						<span id="NewPassWordErrorInfo" style="color:red" class="noticeInfo"></span>
																				</p>
																				<p>
																						<label class="noticeInfo">确认新密码：</label>
																						<asp:TextBox runat="server" id="NewPassWord2" TextMode="Password" CssClass="f-txt" />
																						<span class="noticeInfo">(选填)</span>
																						<span id="NewPassWord2ErrorInfo" style="color:red" class="noticeInfo"></span>
																				</p>
																				<p>
																						<label class="noticeInfo">修改电话：</label>
																						<asp:TextBox runat="server" id="NewTelephone" CssClass="f-txt" />
																						<span class="noticeInfo">(可修改)</span>
																						<span id="NewTelephoneErrorInfo" style="color:red" class="noticeInfo"></span>
																				</p>
																				<p>
																						<label class="noticeInfo">修改邮箱：</label>
																						<asp:TextBox runat="server" id="NewEmail" CssClass="f-txt" />
																						<span class="noticeInfo">(可修改)</span>
																						<span id="NewEmailErrorInfo" style="color:red"></span>
																				</p>
																				<p>
																						<label class="noticeInfo">修改头像：</label>
																						<asp:FileUpload ID="NewAvatar" runat="server" CssClass="noticeInfo" />
																						<span id="NewAvatarErrorInfo" style="color:red"></span>
																				</p>
																				<p>
																						<asp:Button ID="SubmitModificationButton" runat="server" Text="提交更改" CssClass="btn btn-large tsl" OnClick="SubmitModificationButton_Click" OnClientClick="return checkUserModificationValidate()" />
																				</p>
																		</div>
																</form>
														</div>
												</div>
										</div>
								</div>
						</div>
				</div>

				<!-- 边栏 -->
				<div class="col-sub">
						<style>
								#Content .main-wrap,
								#content .main-wrap {
								    margin-left: 139px;
								}

								#Content .col-sub,
								#content .col-sub {
								    width: 139px;
									margin-left: -100%;
									*display: inline;
								}
						</style>

						<aside class="mt-menu" id="SideMenu">
								<div class="mt-avatar">
										<div class="mt-avatar-box" id="MtAvatarBox">
												<asp:Image runat="server" ID="UserAvatar" ImageUrl="consumerImg/DefaultAvatar.jpg" Width="100" Height="100" />
										</div>
								</div>

								<div class="mt-menu-tree">
										<dl class="mt-menu-item mt-account-manage no-decoration">
												<dt>账号管理</dt>
												<dd id="BaseInfo">
														<a href="./ModifyUserInfo.aspx" target="_self">个人资料</a>
												</dd>
												<dd id="DeliveryAddress">
														<a href="./ModifyDeliveryAddress.aspx" target="_self">收货地址</a>
												</dd>
												<dd id="Collections">
														<a href="ModifyCollection.aspx" target="_self">收藏的商品</a>
												</dd>
												<dd id="CollectedStores">
														<a href="ModifyStoreCollection.aspx" target="_self">收藏的店铺</a>
												</dd>
												<dd id="Orders">
														<a href="ModifyConsumerOrder.aspx" target="_self">我的订单</a>
												</dd>
										</dl>
								</div>
						</aside>
				</div>
		</div>
		</div>
</body>
</html>