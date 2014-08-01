<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="SearchResult" %>

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
        <title>搜索结果</title>
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
        <!--head fix rgn-->
        <style>
          #header .hot-query{*height: 14px}
          #header .hot-query li {display: inline-block;*zoom: 1;*display: inline;border-left: 1px solid #ccc;line-height: 1.1;*line-height: 1.2;padding: 0 12px;}
          body #tstart{right: 35px}

        	.invisibleThing {
				display:none;
        	}
        </style>
        <!--<base target="_blank">-->
        <base href="." target="_blank"/>
        <link charset="utf-8" href="./css/searchbarSuggest.css" rel="stylesheet"/>
        <link charset="utf-8" href="./css/overlay.css" rel="stylesheet"/>
        <link rel="stylesheet" href="./css/global.css"/>
		<link rel="stylesheet" href="./css/Uploaded.css"/>
		<link rel="stylesheet" href="./css/Skin.css"/>
		<link rel="stylesheet" href="./css/Shop.css"/>
		<link rel="stylesheet" href="./css/Store.css"/>
		<script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="./js/GetSearchResult.js"></script>
      <script type="text/javascript" src="./js/Global.js"></script>
      <script type="text/javascript" src="./js/LoginInfo.js"></script>
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
			
		<div id="bd">
			<div class="layout grid-m0 J_TLayout" data-widgetid="5000008224" data-componentid="231" data-context="bd" data-prototypeid="231" data-id="5000008224" data-sitecategory="">
				<div class="col-main">
					<div class="main-wrap J_TRegion" data-modules="main" style="overflow:visible;" data-width="b950">
						<div class="J_TModule" data-widgetid="6316546454"  id="Div2"  data-componentid="5003"  data-spm='110.0.5003-6316546454'  microscope-data='5003-6316546454' data-title="自定义内容区">
							<div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined">
								<s class="skin-box-tp"><b></b></s>
								<div class="skin-box-bd clear-fix">
									<span>
										<div style="width:990px;height:auto;background:#ececec;font-family:lucida grande,lucida sans unicode,helvetica,arial,verdana,sans-serif;">
											<div id="nav-goods" style="width:990px;height:auto;background:#ECECEC;padding-bottom:1px;font-family:lucida grande,lucida sans unicode,helvetica,arial,verdana,sans-serif;overflow:hidden;line-height:1.6em;margin-top:6px;">
												<div class="kvborder" style="float:left;width:986px;height:auto;border:1px solid #DBDBDB;-moz-border-radius:15px;-webkit-border-radius:15px;border-radius:4px;-webkit-box-shadow:1px 1px 1px #D2D2D2;-moz-box-shadow:1px 1px 1px #D2D2D2;box-shadow:1px 1px 1px #D2D2D2;background:#FFF;">
													<div class="goods-header">
														<span>商品列表</span>
														<div class="goods-sort-button">
															<a href="javascript:void(0)" id="sales" class="select">销量</a>
															<a href="javascript:void(0)" id="price">价格</a>
															<a href="javascript:void(0)" id="score">评分</a>
														</div>
													</div>

													<div class="goods-container">

													</div>
												</div>
											</div>
										</div>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

			<form runat="server" id="temp">
				<asp:Label id="SearchWord" runat="server" Text="" CssClass="invisibleThing" />
			</form>

		<div id="footer" data-spm="a2226n1">
    <div id="mall-desc" class="mui-global-footer-lazy" lazytms-cfg="">
      <dl id="ensure">
        <dt><span>天猫保障</span></dt>
        <dd>
          <span><i></i>7天无理由退换货</span>
          <span><i></i>提供发票</span>
        </dd>
      </dl>
      <dl id="beginner">
        <dt><span>新手上路</span></dt>
        <dd>
          <a href="http://register.tmall.com/" target="_blank"><i></i>免费注册</a>
          <a href="https://www.alipay.com/user/reg_select.htm" target="_blank"><i></i>开通支付宝</a>
          <a href="https://www.alipay.com/user/login.htm?goto=https%3A%2F%2Fwww.alipay.com%2Fuser%2Finpour_request.htm" target="_blank"><i></i>支付宝充值</a><a href="http://service.tmall.com/support/tmall/tmallHelp.htm" target="_blank"><i></i>帮助中心</a>
        </dd>
      </dl>
      <dl id="payment">
        <dt><span>支付方式</span></dt>
        <dd>
          <a href="http://help.alipay.com/lab/help_detail.htm?help_id=245296" target="_blank"><i></i>支付宝快捷支付</a>
          <a href="http://help.alipay.com/lab/help_detail.htm?help_id=251547" target="_blank"><i></i>支付宝余额付款</a>
          <a href="http://help.alipay.com/lab/help_detail.htm?help_id=253912" target="_blank"><i></i>支付宝卡付款</a>
          <a href="http://www.tmall.com/go/act/sale/cod.php" target="_blank"><i></i>货到付款</a>
        </dd>
      </dl>
      <dl id="seller">
        <dt><span>商家服务</span></dt>
        <dd>
          <a href="http://zhaoshang.tmall.com/" target="_blank" class="join"><i></i>商家入驻&gt;&gt;</a>
          <a href="http://shangjia.tmall.com/portal.htm" target="_blank"><i></i>商家中心</a>
          <a href="http://peixun.tmall.com/" target="_blank"><i></i>天猫智库</a>
          <a href="http://guize.tmall.com" target="_blank"><i></i>天猫规则</a>
          <a href="http://e56.tmall.com" target="_blank"><i></i>物流服务</a>
          <a href="http://mymy.maowo.tmall.com/" target="_blank"><i></i>喵言喵语</a>
          <a href="http://fw.tmall.com/?spm=3.7095809.2000g002.18.i9zjHo" target="_blank"><i></i>运营服务</a>
        </dd>
      </dl>
      <!--[if IE 6]><br /><![endif]-->
      <h4 class="go-home">
        <a href="./Index.aspx" target="_blank" title="返回天猫首页">返回天猫首页</a>
      </h4>
    </div>
    <div id="copyright" class="mui-global-footer-lazy" lazytms-cfg="">
      <!-- foot links from tms start -->
      <p id="footer-tmallinfo">
        <a href="http://www.tmall.com/go/chn/mall/zhaoshang_produce.php" target="_blank">关于天猫</a>
        <a href="http://service.tmall.com/support/tmall/tmallHelp.htm" target="_blank">帮助中心</a>
        <a href="http://job.taobao.com/" target="_blank">诚聘英才</a>
        <a href="http://www.tmall.com/go/chn/tmall/contact.php" target="_blank">联系我们</a>
        <a href="http://xtao.tmall.com?tracelog=tmallfoot" target="_blank">网站合作</a>
        <a href="http://www.taobao.com/about/copyright.php">版权说明</a>
      </p>
      <p id="footer-otherlink">
        <a href="//www.alibabagroup.com/cn/global/home" target="_blank">阿里巴巴集团</a>
        <a href="//www.taobao.com" target="_blank">淘宝网</a>    |    
        <a href="//www.tmall.com?spm=1.1000386.245549.6.GGCoax" target="_blank">天猫</a>    |    
        <a href="//ju.taobao.com?spm=1.1000386.245549.7.GGCoax" target="_blank">聚划算</a>    |    
        <a href="//www.aliexpress.com?spm=1.1000386.245549.4.GGCoax" target="_blank">全球速卖通</a>    |    
        <a href="//www.alibaba.com?spm=1.1000386.245549.2.GGCoax" target="_blank">阿里巴巴国际交易市场</a>|    
        <a href="//www.1688.com?spm=1.1000386.245549.3.GGCoax" target="_blank">1688</a>    |    
        <a href="//www.alimama.com?spm=1.1000386.245549.9.GGCoax" target="_blank">阿里妈妈</a>    |    
        <a href="//www.aliyun.com?spm=1.1000386.245549.10.GGCoax" target="_blank">阿里云计算</a>    |    
        <a href="//www.yunos.com?spm=1.1000386.245549.11.GGCoax" target="_blank">云OS</a>    |    
        <a href="//www.net.cn?spm=1.1000386.245549.12.GGCoax" target="_blank">万网</a>    |    
        <a href="//trip.taobao.com/" target="_blank">淘宝旅行</a>    |    
        <a href="//www.xiami.com/" target="_blank">虾米</a>    |    
        <a href="//www.laiwang.com/" target="_blank">来往</a>    |    
        <a href="//www.alipay.com" target="_blank">支付宝</a>
      </p>
      <p>©&nbsp;2003-2014&nbsp;Tmall.com&nbsp;版权所有 <br>
        增值电信业务经营许可证：<a data-spm-protocol="i" href="http://www.miibeian.gov.cn/state/outPortal/loginPortal.action">浙B2-20110446</a><br>
        网络文化经营许可证：<a href="http://img01.taobaocdn.com/tps/i1/T1M72qXjhgXXc1.xw7-2349-1700.jpg" target="_blank">浙网文[2012]0234-028号</a><br>
        互联网医疗保健信息服务 审核同意书 浙 卫网审【2012】6号<br>互联网药品信息服务资质证书编号：浙-（经营性）-2012-0005
      </p>
      <!-- foot links from tms end -->
    </div>
    <div id="server-num">buffer010192004059.cm3</div>
  </div>

		</div>
</body>
</html>
