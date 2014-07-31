<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<!DOCTYPE html>
<html>
<head>
  <meta name="data-spm" content="p531232234">
  <meta charset="gbk">
  <meta name="description" content="OurTmall Store">
  <meta name="keywords" content="OurTmall Store">
  <meta name="microscope-data" content="pageId=531232234;prototypeId=1;siteCategory=3;siteInstanceId=195500905;shopId=107922698;userId=1917047079">
  <link rel="dns-prefetch" href="http://a.tbcdn.cn">
  <link rel="dns-prefetch" href="http://img01.taobaocdn.com">
  <link rel="dns-prefetch" href="http://img02.taobaocdn.com">
  <link rel="dns-prefetch" href="http://img03.taobaocdn.com">
  <link rel="dns-prefetch" href="http://img04.taobaocdn.com">
  <link rel="dns-prefetch" href="http://log.mmstat.com">
  <link rel="dns-prefetch" href="http://item.tmall.com">
  <link rel="shortcut icon" href="http://a.tbcdn.cn/p/mall/base/favicon.ico" type="image/x-icon">

  <title>OurTmall.com</title>
  <link rel="stylesheet" href="./css/Mui.css"/>
  <link rel="stylesheet" href="./css/Uploaded.css"/>
  <link rel="stylesheet" href="./css/Skin.css"/>
  <link rel="stylesheet" href="./css/Shop.css"/>
  <link rel="stylesheet" href="./css/Store.css"/>
  <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="./js/Global.js"></script>
  <script type="text/javascript" src="./js/Category.js"></script>

  <style>
    #header .hot-query {*height: 14px}
    #header .hot-query li {display: inline-block;*zoom: 1;*display: inline;border-left: 1px solid #ccc;line-height: 1.1;*line-height: 1.2;padding: 0 12px;}
    body #tstart {right: 35px}
  </style>
  <style>
    #content{background:url(about:blank) repeat left 0 #ececec;}
    #hd{background:url(about:blank) repeat left 0 #ececec;}
  </style>
</head>

<body data-spm="1">
<form id="Form1" method="post" runat="Server">
  <div id="page">
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
            <li class="sn-cart mini-cart menu">
              <i class="mui-global-iconfont">&#xf0148;</i> 
              <a class="sn-cart-link" href="#" target="_top" rel="nofollow">购物车 </a> 
            </li> 
            <li class="sn-favorite menu-item"> 
              <div class="sn-menu"> 
                <a class="menu-hd" href="#" target="_top" rel="nofollow">收藏夹<b></b></a> 
                <div class="menu-bd"> 
                  <div class="menu-bd-panel"> 
                    <a href="#" target="_top" rel="nofollow">收藏的宝贝</a> 
                    <a href="#" target="_top" rel="nofollow">收藏的店铺</a> 
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
                    <h2>店铺推荐</h2>
                    <ul class="site-list">
                    </ul>
                  </div>
                  <div class="site-cont site-market">
                    <h2>商品推荐</h2>
                    <ul class="site-list">
                    </ul>
                  </div>
                  <div class="site-cont site-brand">
                    <h2>商品分类</h2>
                    <ul class="site-list">
                    </ul>
                  </div>
                </div>
              </div> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div>

    <style>
      #content #hd {padding-top:0; margin-top: 0}
      .j_MallCateHoverTrigger {display: none}
      #sn-bd .sn-home {display: list-item!important;}
    </style>

    <div id="content" class="eshop head-expand tb-shop">
      <div id="hd" >
        <div class="layout grid-m J_TLayout" data-widgetid="5000008219" data-componentid="23" data-prototypeid="23" data-id="5000008219" data-max="">
          <div class="col-main">
            <div class="main-wrap J_TRegion" data-modules="main" data-width="h950" data-max="">
              <div class="J_TModule" data-widgetid="5000008220"  id="shop5000008220"  data-componentid="5001"  data-spm='110.0.5001-5000008220'  microscope-data='5001-5000008220' data-title="店铺招牌"  ><!-- cache-info: componentId=5001 cacheKey=i-5000008220-10 cachedTime=2014-07-24 22:44:54 putHost=10.192.4.19 expireTime=14400 -->
                <div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-custom-banner">
                  <s class="skin-box-tp"><b></b></s>
                  <div class="skin-box-hd disappear">
                    <i class="hd-icon"></i>
                    <h3><span>店标</span></h3>
                    <div class="skin-box-act">
                      <a href="#" class="more">更多</a>
                    </div>
                  </div>
                  <div class="skin-box-bd">
                    <style>
                      .grid-m .tshop-pbsm-shop-custom-banner .banner-box {
                        background: none repeat scroll 0 0 transparent !important;
                      }
                      .tshop-pbsm-shop-custom-banner .banner-box {
                        height: 50px !important;
                      }
                      .tshop-pbsm-shop-custom-banner {
                        height: 50px !important;
                      }
                    </style>
                    <div>
                      <div class="banner-box">
                        <div style="width:990px;height:50px;background:#ECECEC;font-family:lucida grande,lucida sans unicode,helvetica,arial,verdana,sans-serif;">
                          <div id="J_StoreHead" style="float:left;margin-top:20px;">
                            <a href="" target="_self" style="text-decoration:none;">
                              <img src="" height="30px">
                              <h1 style="display:inline;color:#666;font-family:'Microsoft Yahei';font-size:1.7em;"></h1>
                            </a>
                            <!-- <a href="javascript:void(0)" class="store-uncollected"></a> -->
                            <!-- <a href="javascript:void(0)" class="store-collected hidden"></a> -->
                          </div>
                          <!-- 页面链接 -->
                          <!--                           <div class="store-nav"> -->
                          <!--                             <span><a href="#nav-category">经营范围</a></span> -->
                          <!--                             <span> | </span> -->
                          <!--                             <span><a href="#nav-hot">热门商品</a></span> -->
                          <!--                             <span> | </span> -->
                          <!--                             <span><a href="#nav-goods">所有商品</a></span> -->
                          <!--                             <span> | </span> -->
                          <!--                             <span><a href="#nav-info">店铺信息</a></span> -->
                          <!--                           </div> -->
                        </div>
                      </div>
                    </div>
                  </div>
                  <s class="skin-box-bt"><b></b></s>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="bd" >
        <div class="layout grid-m0 J_TLayout" data-widgetid="5000008224" data-componentid="231" data-context="bd" data-prototypeid="231" data-id="5000008224" data-sitecategory="">
          <div class="col-main">
            <div class="main-wrap J_TRegion" data-modules="main" style="overflow:visible;" data-width="b950">
              <div class="J_TModule" data-widgetid="6316546454"  id="Div2"  data-componentid="5003"  data-spm='110.0.5003-6316546454'  microscope-data='5003-6316546454' data-title="自定义内容区"  >
                <div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined">
                  <s class="skin-box-tp"><b></b></s>
                  <div class="skin-box-bd clear-fix">
                    <span>
                      <div style="width:990px;height:auto;background:#ececec;font-family:lucida grande,lucida sans unicode,helvetica,arial,verdana,sans-serif;">
                        <!-- 所有商品，若选择某类别后，则显示该类别所有商品 -->
                        <div id="nav-goods" style="width:990px;height:auto;background:#ECECEC;padding-bottom:1px;font-family:lucida grande,lucida sans unicode,helvetica,arial,verdana,sans-serif;overflow:hidden;line-height:1.6em;margin-top:6px;">
                          <div class="kvborder" style="float:left;width:986px;height:auto;border:1px solid #DBDBDB;-moz-border-radius:15px;-webkit-border-radius:15px;border-radius:4px;-webkit-box-shadow:1px 1px 1px #D2D2D2;-moz-box-shadow:1px 1px 1px #D2D2D2;box-shadow:1px 1px 1px #D2D2D2;background:#FFF;">
                            <div class="goods-header">
                              <span>类别列表</span>
                              <div class="goods-sort-button">
                                <a href="javascript:void(0)" id="sales" class="select">销量</a>
                                <a href="javascript:void(0)" id="price">价格</a>
                                <a href="javascript:void(0)" id="score">评分</a>
                              </div>
                            </div>
                            <div class="goods-container">
                              <!-- 一项一项地添加商品 -->
                              <!--<div class="goods-item">
                                <div class="goods-item-img">
                                  <a href="#" target="_blank">
                                    <img src="">
                                  </a>
                                </div>
                                <div class="goods-item-info">
                                  <div class="goods-item-name">
                                    <a href="#" target="_blank" class="mblue">
                                      AirPort Express
                                    </a>
                                  </div>
                                  <div class="goods-item-price">
                                    RMB 688
                                  </div>
                                  <div class="goods-item-sales">
                                    销量
                                  </div>
                                </div>
                              </div>-->
                            </div>
                          </div>
                        </div>
                        
                      </div>
                    </span>
                  </div>
                  <s class="skin-box-bt"><b></b></s>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="ft" >
        <div class="layout grid-m J_TLayout" data-widgetid="5000008222" data-componentid="33" data-prototypeid="33" data-id="5000008222" data-max="">
          <div class="col-main">
            <div class="main-wrap J_TRegion" data-modules="main" data-width="f950" data-max="">
              <div class="J_TModule" data-widgetid="5166292953"  id="Div3"  data-componentid="4006"  data-spm='110.0.4006-5166292953'  microscope-data='4006-5166292953' data-title="店铺尾部"  ><!-- cache-info: componentId=4006 cacheKey=i-5166292953-5 cachedTime=2014-07-24 22:44:54 putHost=10.192.4.19 expireTime=14400 -->
                <div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined">
                  <s class="skin-box-tp"><b></b></s>
                  <div class="skin-box-bd clear-fix">
                    <span>
                      <div style="width:990px;height:50px;line-height:50px;background:#ECECEC;">
                        <div style="text-align:center;color:#848484;">版权所有 &copy; 2014 OurTmall 保留所有权利
                        </div>
                      </div>
                    </span>
                  </div>
                  <s class="skin-box-bt"><b></b></s>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

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
</form>
</body>
</html>