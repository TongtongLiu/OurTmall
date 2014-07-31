<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="gbk" />
  <meta name="keywords" content="OurTmall Product">
  <meta name="description" content="OurTmall Product">
  <meta name="spm-id" content="a220o" />
  <meta name="microscope-data" content="pageId=531232235;prototypeId=2;siteId=2; shopId=107922698; userid=1917047079;">
  <link rel="shortcut icon" href="http://g.tbcdn.cn/mui/global/1.2.35/file/favicon.ico" type="image/x-icon"/>
  <link title="OurTmall" href="http://g.tbcdn.cn/mui/global/1.2.35/file/search.xml" type="application/opensearchdescription+xml" rel="search"/>

  <title>OurTmall</title>
  <link rel="stylesheet" href="./css/ItemDetail.css">
  <link rel="stylesheet" href="./css/ModulesMin.css">
  <link rel="stylesheet" href="./css/Skin.css">
  <link rel="stylesheet" href="./css/Uploaded.css">
  <link rel="stylesheet" href="./css/global.css">
  <link rel="stylesheet" href="./css/Product.css">
  <link rel="stylesheet" href="./css/MallPhotos.css">
  <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="./js/Product.js"></script>
  <script type="text/javascript" src="./js/Global.js"></script>
      <script type="text/javascript" src="./js/LoginInfo.js"></script>
  <style>
    #header .hot-query {*height: 14px}
    #header .hot-query li {display: inline-block;*zoom: 1;*display: inline;border-left: 1px solid #ccc;line-height: 1.1;*line-height: 1.2;padding: 0 12px;}
    body #tstart {right: 35px}
  </style>        
  <style>
    #content{background:url(about:blank) repeat left 0 #ececec;}
    #hd {background:url(about:blank) repeat left 0 #ececec;}
    #page #content #hd {width:auto!important}
  </style>
</head>

<body data-spm="1000855">
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
              <a class="sn-cart-link" href="./Cart.aspx" target="_top" rel="nofollow">购物车 </a> 
            </li> 
            <li class="sn-favorite menu-item"> 
              <div class="sn-menu"> 
                <a class="menu-hd" href="./Colloection.aspx" target="_top" rel="nofollow">收藏夹<b></b></a> 
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

    <div id="content" data-cat="J_Cat" data-type="normal">
      <div class="tb-shop" id="hd">
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
                        <div style="width:990px;height:50px;background:#fff;font-family:lucida grande,lucida sans unicode,helvetica,arial,verdana,sans-serif;">
                          <div id="J_StoreHead" style="float:left;margin-top:20px;">
                            <img src="" height="30px" style="vertical-align:top;">
                            <h1 style="display:inline;color:#666;font-family:'Microsoft Yahei';font-size:1.7em;"></h1>
                            <a href="javascript:void(0)" class="store-uncollected"></a>
                            <a href="javascript:void(0)" class="store-collected hidden"></a>
                          </div>
                          <!-- 页面链接 -->
                          <div class="product-nav">
                            <span><a href="#attributes">商品详情</a></span>
                            <span> | </span>
                            <span><a href="#J_Reviews">累计评价</a></span>
                            <span> | </span>
                            <span><a href="#J_HotProduct">热门商品</a></span>
                          </div>
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
      
      <div id="detail">
        <div id="J_DetailMeta" class="tm-detail-meta tm-clear">
          <div class="tm-clear">
            <div class="tb-property">
              <div class="tb-wrap">
                <!-- 商品名称 -->
                <div class="tb-detail-hd">
                    <h1 data-spm="1000983">
                      <span></span>
                      <a href="javascript:void(0)" class="product-uncollected"></a>
                      <a href="javascript:void(0)" class="product-collected hidden"></a>
                    </h1>
                </div>
                <!-- 商品价格 -->
                <div class="tm-fcs-panel">
                  <dl class="tm-price-panel tm-price-cur" id="J_StrPriceModBox">
                    <dt class="tb-metatit">价格</dt>
                    <dd>
                      <em class="tm-yen">¥</em>
                      <span class="tm-price"></span>
                    </dd>
                  </dl>
                </div>
                <!-- 运费 -->
                <div class="tb-meta" style="height:10px">
								</div>
                <!-- 评分 -->
                <ul class="tm-ind-panel">
                  <li class="tm-ind-item tm-ind-reviewCount canClick tm-line3" id="J_ItemRates">
                    <p class="tm-count tm-sales"></p>
                    <p class="tm-label">销量</p>
                    <p class="tm-rate tm-rate2">
                      <span class="c-value-no"><em></em></span>
                    </p>
                  </li>
                  <li class="tm-ind-item tm-ind-emPointCount" data-spm="1000988">
                    <a href="http://vip.tmall.com/vip/index.htm" target="_blank">
                      <p class="tm-count tm-score"></p>
                      <p class="tm-label">送天猫积分</p>
                    </a>
                  </li>
                </ul>
                <!-- 购买选项 -->
                <div class="tb-key">
                  <div class="tb-skin">
                    <div class="tb-sku">
                      <!-- 属性选择 -->
                      <!--                      <dl class="tb-prop tm-clear"> -->
				              <!-- 					              <dt class="tb-metatit">属性名称</dt> -->
				              <!-- 										    <dd> -->
				              <!-- 				                  <ul class="tm-clear J_TSaleProp  "> -->
				              <!-- 												    <li><a href="#"><span>属性1</span></a></li> -->
				              <!-- 														<li><a href="#"><span>属性2</span></a></li> -->
				              <!-- 												  </ul> -->
				              <!-- 				                </dd> -->
				              <!-- 				              </dl> -->
                      <!-- 数量选择 -->
                      <dl class="tb-amount tm-clear">
                        <dt class="tb-metatit">数量</dt>
                        <dd id="J_Amount" >
                          <span class="tb-amount-widget mui-amount-wrap">
                            <asp:TextBox ID="Quantity" CssClass="tb-text mui-amount-input" Text="1" MaxLength="8" runat="Server"></asp:TextBox>
                            <!-- <input type="text" class="tb-text mui-amount-input" value="1" maxlength="8" title="请输入购买量"/> -->
                            <span class="mui-amount-btn">
                              <span class="mui-amount-increase"></span>
                              <span class="mui-amount-decrease"></span>
                            </span>
                            <span class="mui-amount-unit">件</span>
                          </span>
                        </dd>
                      </dl>
                      <dl id="J_regionSellServer" class="tm-clear tb-hidden tb-prop" data-spm="1000987"></dl>
                      <div class="tb-action tm-clear">
                        <style type="text/css">
                          .asp-btn {opacity: 0;}
                          .asp-label {font-size: 1.6em; color: #c40000; margin-left: 0.5em; margin-top: 0.2em}
                        </style>
                        <div class="tb-btn-buy tb-btn-sku">
                          <a>
                            <b><asp:Button ID="J_LinkBuy" OnClick="J_LinkBuy_Click" Text="       立刻购买       " CssClass="asp-btn" runat="Server" /></b>
                          </a>
                        </div>
                        <div class="tb-btn-basket tb-btn-sku">
                            <a>
                              <b><asp:Button ID="J_LinkBasket" OnClick="J_LinkBasket_Click" Text="      加入购物车      " CssClass="asp-btn" runat="Server" /></b>
                            </a>
                        </div>
                        <asp:Label ID="J_LinkMessage" CssClass="asp-label" runat="Server"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="tm-ser tm-clear">
                </div>
              </div>
            </div>

            <div data-spm="1997427645" class="tb-gallery">
              <div class="tb-booth">
                <a><img id="J_ImgBooth" src=""></a>
              </div>
              <ul id="J_UlThumb" class="tb-thumb tm-clear">
<!--                 <li class="tb-selected"> -->
<!--                   <a href="#"><img src=""></a> -->
<!--                 </li> -->
              </ul>
            </div>
          </div>

          <!-- ruleBanner-->
          <script id="J_SpuMore_Act" type="text/template">
          <!--rullBanner ids:173 false-->
          <!-- 173 -->
          <input type="hidden" class="J_Spm" value="spuSellerListBanner_173"/>
          <input type="hidden" class="J_Track" value="tmalldetail.28.173"/>
          <div style="padding: 15px 0 0 11px">
          <a href="http://www.tmall.com/go/market/promotion-act/jxxs-hxjl.php?spm=a221y.7120101.a222764.1" target="_blank"><img src="http://gtms02.alicdn.com/tps/i2/TB13F5pFVXXXXcvXpXX_KgEYXXX-180-150.jpg" width="180" height="150" alt="机械师"/></a>
          </div>
          </script>
        </div>
      </div>
  
      <div id="J_SaleCombo" class="tb-scombo"></div>
      <div id="J_ShopPromtion"></div> 
      
      <div id="bd">
        <div class="grid-s5m0 tm-clear">
          <div class="col-main tm-clear">
            <div id="mainwrap" class="main-wrap J_TRegion">
              <!-- 顶部导航 -->
              <div id="J_TabBarBox" style="width: 788px;">
                <ul id="J_TabBar" class="tabbar tm-clear">
                  <li class="tm-selected">
                    <a href="#description" rel="nofollow" hidefocus="true" data-index="0" data-spm-anchor-id="a220o.1000855.0.0">商品详情</a>
                  </li>
                  <li class="">
                    <a href="#J_Reviews" rel="nofollow" hidefocus="true" data-index="1" data-spm-anchor-id="a220o.1000855.0.0">累计评价</a>
                  </li>
                </ul>
              </div>

              <!-- 商品属性 -->
              <div id="attributes" class="attributes">
                <div class="attributes-list" id="J_AttrList">
                  <div class="tm-clear tb-hidden tm_brandAttr" id="J_BrandAttr" style="display: block;">
                    <div class="name">
                      商品名称：
                      <a class="J_EbrandLogo" target="_blank" href="javascript:void(0)"></a>
                    </div>
                  </div>

                  <p class="attr-list-hd tm-clear">
                    <em>商品简介：</em><br>
                    
                  </p>
                </div>
              </div>

              <!-- 商品详情 -->
              <div id="description" class="J_DetailSection tshop-psm tshop-psm-bdetaildes">
                <h4 class="hd">商品详情</h4>
                <div class="content ke-post" style="height: auto;">
                  <div style="width:790.0px; height: auto; font-family: lucida grande lucida sans unicode helvetica arial verdana sans-serif; font-size: 14.0px; padding-bottom: 20.0px;">
                    <!-- 商品图片 -->
                    <style>
                      #J_DesImage img {
                        width: 788px;
                        padding: 20px 0;
                      }
                    </style>
                    <div id="J_DesImage" style="float:left;width:788px;border:1px solid #e6e6e6;">
                    </div>

                    <!-- 注意事项 -->
                    <div style="float: left; width: 788.0px; border: 1.0px solid #d2d2d2; height: auto; margin-top: 6.0px; overflow: hidden; color: #000000; padding-bottom: 15.0px; text-align: left;">
                      <div style="float: left; width: 720.0px; margin-left: 34.0px; border-bottom: 1.0px solid #d2c2d2; margin-top: 10.0px; line-height: 1.7em; font-size: 18.0px; display: inline;">
                        注意事项
                      </div>
                      <div style="float: left; width: 700.0px; margin-left: 34.0px; margin-top: 10.0px; line-height: 1.5em;">
                        <ol style="float: left; margin-left: 20.0px;">
                          <li>请在购买本产品前先查看产品参数，再选择您需要购买的款式及型号。
                          </li>
                          <li>发票不与商品同时发出。发票将在订购的商品发出后，使用单独的快递邮寄到订单上的地址。如需修改发票抬头（默认为个人)，需要与客服沟通确认后方可生效。
                          </li>
                          <li>如需退货，请联系客服后，等待店家免费上门将商品取回。您无需自行寄回，也无需选择运费险。
                          </li>
                          <li>请不要在下单时填写补充说明，有问题可直接与客服沟通。
                          </li>
                          <li>如有其他问题请联系店家旺旺客服。
                          </li>
                        </ol>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- 评价列表 -->
              <div id="J_Detail">
                <div id="J_Reviews" class="J_DetailSection">
                  <h4 class="hd">累计评价</h4>
                  <div class="tm-rate">
                    <div class="rate-header" style="display: block;">
                      <div class="rate-score">
                        <h4>与描述相符
                        </h4>
                        <strong id="score1">4.5
                        </strong>
                        <p>
                          <span id="score2" class="score-value-no">
                            <em></em>
                          </span>
                        </p>
                      </div>
                      <div class="rate-graph">
                        <div class="graph-scroller">
                          <span id="score3" style="width: 90%"><!-- 根据评分移动位置 -->
                            <em >4.5</em>
                          </span>
                        </div>
                        <ol class="graph-desc">
                          <li>非常不满
                          </li>
                          <li>不满意
                          </li>
                          <li>一般
                          </li>
                          <li>满意
                          </li>
                          <li>非常满意
                          </li>
                        </ol>
                      </div>
                    </div>

                    <!--<div class="rate-grid">
                      <table>
                        <tbody>
                          <tr>
                            <td class="tm-col-master">
                              <div class="tm-rate-content">
                                <div class="tm-rate-fulltxt">
                                  电脑很好
                                </div>
                              </div>
                              <div class="tm-rate-date">
                                03.09
                              </div>
                            </td>
                            <td class="col-meta">
                              <div class="rate-sku">
                                <p title="">
                                </p>
                              </div>
                              <div class="rate-user-profile">
                                <p title="">
                                </p>
                              </div>
                            </td>
                            <td class="col-author">
                              <div class="rate-user-info">
                                丫
                                          <span>***
                                          </span>0
                                          <span>（匿名）
                                          </span>
                              </div>
                              <div class="rate-user-grade">
                                <a href="http://vip.tmall.com" target="_blank" title="天猫T3达人">
                                  <img src="http://a.tbcdn.cn/apps/membermanager/v2/image/tmall-grade-t3-18.png">
                                </a>
                                <img title="91 - 150个买家信用积分" src="http://a.tbcdn.cn/sys/common/icon/rank_s/b_red_4.gif">
                              </div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>-->

                    <div class="rate-page">
                      <div class="rate-paginator">
                        <span class="rate-page-prev">&lt;&lt;上一页
                        </span>
                        <span>1
                        </span>
                        <span class="rate-page-next">下一页&gt;&gt;
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div id="J_HotProduct" class="col-sub J_TRegion" data-modules="sub" style="overflow:visible;" data-width="b190">
            <div class="J_TModule" data-widgetid="5270320300"  id="Div2"  data-componentid="5003"  data-spm='110.0.5003-5270320300'  microscope-data='5003-5270320300' data-title="自定义内容区"  ><!-- cache-info: componentId=5003 cacheKey=i-5270320300-20140306 cachedTime=2014-07-24 17:18:05 putHost=172.24.191.113 expireTime=14400 -->
              <div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined">
                <s class="skin-box-tp"><b></b></s>
                <div class="skin-box-bd clear-fix">
                  <span>
                    <div class="aside-bar">
                      <div class="aside-bar-header">本店热销</div>

<!--
                      <div class="aside-bar-item">
                        <a href="#" target="_blank">
                          <img src="./img/store-sample.png">
                          <p>iMac</p>
                        </a>
                      </div>
-->

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

    <div class="tb-shop" id="ft">
      <div class="layout grid-m J_TLayout" data-widgetid="5000008222" data-componentid="33" data-prototypeid="33" data-id="5000008222" data-max="">
        <div class="col-main">
          <div class="main-wrap J_TRegion" data-modules="main" data-width="f950" data-max="">
            <div class="J_TModule" data-widgetid="5166292953"  id="Div3"  data-componentid="4006"  data-spm='110.0.4006-5166292953'  microscope-data='4006-5166292953' data-title="店铺尾部"  ><!-- cache-info: componentId=4006 cacheKey=i-5166292953-5 cachedTime=2014-07-24 22:44:54 putHost=10.192.4.19 expireTime=14400 -->
              <div class="skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined">
                <s class="skin-box-tp"><b></b></s>
                <div class="skin-box-bd clear-fix">
                  <span>
                    <div style="width:990px;height:50px;line-height:50px;background:#fff;">
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