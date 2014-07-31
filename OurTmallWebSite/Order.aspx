<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE HTML>
<html>
<head>
  <meta charset="gbk">
  <meta name="spm-id" content="a220l.1">
  <base target="_blank" />
  <link rel="shortcut icon" href="http://g.tbcdn.cn/mui/global/1.2.35/file/favicon.ico" type="image/x-icon">
  <link title="OurTmall" href="http://g.tbcdn.cn/mui/global/1.2.35/file/search.xml" type="application/opensearchdescription+xml" rel="search">
  <title>确认订单 - OurTmall</title>
  <link rel="stylesheet" href="./css/global.css">
  <link rel="stylesheet" href="./css/Aio.css">
  <link rel="stylesheet" href="./css/TstartMin.css">
  <link rel="stylesheet" href="./css/TdogMin.css">
  <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="./js/Order.js"></script>
  <script type="text/javascript" src="./js/Global.js"></script>
      <script type="text/javascript" src="./js/LoginInfo.js"></script>
  <style>
    #header .hot-query {*height: 14px}
    #header .hot-query li {display: inline-block;*zoom: 1;*display: inline;border-left: 1px solid #ccc;line-height: 1.1;*line-height: 1.2;padding: 0 12px;}
    body #tstart {right: 35px}
    div {margin:0; padding:0}
  </style>
</head>
<body>
<form id="Form1" method="post" runat="Server">
  <div id="mallPage" class="tmall-page-not-market">
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
              <a class="sn-cart-link" href="#" target="_top" rel="nofollow">购物车 </a> 
            </li> 
            <li class="sn-favorite menu-item"> 
              <div class="sn-menu"> 
                <a class="menu-hd" href="#" target="_top" rel="nofollow">收藏夹<b></b></a> 
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

    <div id="header">
      <div class="headerLayout">
        <div class="headerCon">
          <h1 id="mallLogo">
            <span class="mlogo">
              <a href="./Index.aspx" title="天猫Tmall.com">
                <s></s>
                天猫Tmall.com
              </a>
            </span>
          </h1>
          <div class="header-extra"></div>
        </div>
      </div>
    </div>

    <div id="content">
      <div class="jet" id="J_BuyOrder">
        <div id="A_tddress" class="tddress">
          <div id="J_addresses" class="shipping-address addrMuch">
            <h2>选择收货地址</h2>
            <div class="list"><!-- addr-cur选中 addr-def默认 addr-active指向 -->
              <div data-id="" class="addr" tabindex="1">
                <div class="inner">
                  <div class="addr-hd">
                    <span class="prov">北京
                    </span>
                    <span class="city">北京
                    </span>
                    <span>（
                    </span>
                    <span class="name">刘桐彤
                    </span>
                    <span> 收）
                    </span>
                  </div>
                  <div class="addr-bd">
                    <span class="dist">海淀
                    </span>
                    <span class="street">清华大学紫荆公寓一号楼315B室
                    </span>
                    <span class="phone">18800102016
                    </span>
                    <span class="last">&nbsp;
                    </span>
                  </div>
                  <div class="addr-toolbar">
                  </div>
                </div>
                <ins class="curmarker">
                </ins>
                <a class="setdefault" data-clk="buy-order/mod/address:setDefault">设为默认
                </a>
                <ins class="deftip">默认地址
                </ins>
                <div class="floater">
                </div>
                <div class="option">
                  <div class="container">
                  </div>
                </div>
              </div>

              <div data-id="" class="addr" tabindex="1">
                <div class="inner">
                  <div class="addr-hd">
                    <span class="prov">北京
                    </span>
                    <span class="city">北京
                    </span>
                    <span>（
                    </span>
                    <span class="name">刘桐彤
                    </span>
                    <span> 收）
                    </span>
                  </div>
                  <div class="addr-bd">
                    <span class="dist">海淀
                    </span>
                    <span class="street">清华大学紫荆公寓一号楼315B室
                    </span>
                    <span class="phone">18800102016
                    </span>
                    <span class="last">&nbsp;
                    </span>
                  </div>
                  <div class="addr-toolbar">
                  </div>
                </div>
                <ins class="curmarker">
                </ins>
                <a class="setdefault" data-clk="buy-order/mod/address:setDefault">设为默认
                </a>
                <ins class="deftip">默认地址
                </ins>
                <div class="floater">
                </div>
                <div class="option">
                  <div class="container">
                  </div>
                </div>
              </div>

              <div data-id="" class="addr" tabindex="1">
                <div class="inner">
                  <div class="addr-hd">
                    <span class="prov">北京
                    </span>
                    <span class="city">北京
                    </span>
                    <span>（
                    </span>
                    <span class="name">刘桐彤
                    </span>
                    <span> 收）
                    </span>
                  </div>
                  <div class="addr-bd">
                    <span class="dist">海淀
                    </span>
                    <span class="street">清华大学紫荆公寓一号楼315B室
                    </span>
                    <span class="phone">18800102016
                    </span>
                    <span class="last">&nbsp;
                    </span>
                  </div>
                  <div class="addr-toolbar">
                  </div>
                </div>
                <ins class="curmarker">
                </ins>
                <a class="setdefault" data-clk="buy-order/mod/address:setDefault">设为默认
                </a>
                <ins class="deftip">默认地址
                </ins>
                <div class="floater">
                </div>
                <div class="option">
                  <div class="container">
                  </div>
                </div>
              </div>

              <div data-id="" class="addr" tabindex="1">
                <div class="inner">
                  <div class="addr-hd">
                    <span class="prov">北京
                    </span>
                    <span class="city">北京
                    </span>
                    <span>（
                    </span>
                    <span class="name">刘桐彤
                    </span>
                    <span> 收）
                    </span>
                  </div>
                  <div class="addr-bd">
                    <span class="dist">海淀
                    </span>
                    <span class="street">清华大学紫荆公寓一号楼315B室
                    </span>
                    <span class="phone">18800102016
                    </span>
                    <span class="last">&nbsp;
                    </span>
                  </div>
                  <div class="addr-toolbar">
                  </div>
                </div>
                <ins class="curmarker">
                </ins>
                <a class="setdefault" data-clk="buy-order/mod/address:setDefault">设为默认
                </a>
                <ins class="deftip">默认地址
                </ins>
                <div class="floater">
                </div>
                <div class="option">
                  <div class="container">
                  </div>
                </div>
              </div>

            </div>

            <div class="control">
                <a class="manageAddr" href="./ModifyDeliveryAddress.aspx" data-mm="manange_address">
                  管理收货地址
                </a>
            </div>
          </div>
        </div>

        <h2 style="margin-top:40px;">确认订单信息</h2>
        <div id="A_orders" class="orders">
          <table class="grid-bundle grid-TmallSeller" id="order_b_91188576706">
            <thead>
              <tr>
                <th class="tube-title">
                  <div class="title-wrap">
                    <div class="title-inner">
                      <div class="bundle-title">
                        <a href="#">
                          OurTmall
                        </a>
                      </div>
                    </div>
                  </div>
                </th>
                <th class="tube-price">单价（元）
                </th>
                <th class="tube-amount">数量
                </th>
                <th class="tube-promo">优惠（元）
                </th>
                <th class="tube-sum">小计(元)
                </th>
                <th class="tube-postage">配送方式
                </th>
              </tr>
              <tr class="row-border">
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td class="tube-postage">
                </td>
              </tr>
            </thead>
            <tbody>
              <tr class="grid-main">
                <td colspan="6" class="tube-main">
                  <table>
                    <tbody>
                      <tr id="item_37913328705:48968899455:74996262719" class="grid-order ">
                        <td class="tube-img">
                          <a class="img" href="javascript:void(0)">
                            <img data-mm="openitem_pic" width="50" height="50" src="">
                          </a>
                        </td>
                        <td class="tube-master" style="vertical-align:middle">
                          <p class="item-title">
                            <a data-mm="openitem_txt" href="javascript:void(0)">
                              
                            </a>
                          </p>
                        </td>
                        <td class="tube-sku">
                        </td>
                        <td class="tube-price">
                        </td>
                        <td class="tube-amount">
                            <div class="tc-amount" id="quantity_37913328705:48968899455:74996262719">1
                            </div>
                        </td>
                        <td class="tube-promo">
                            <div class="promotion itempromo">-
                            </div>
                            <div class="campign">
                            </div>
                        </td>
                        <td class="tube-sum">
                            <span class="itemPay" id="itemPay_37913328705:48968899455:74996262719">
                            <p class="sum">
                            </p>
                            </span>
                        </td>
                        <td style="width:185px">OurTmall 快递</td>
                      </tr>
                    </tbody>
                  </table>
                </td>

              </tr>

              <tr class="grid-main">
                <td colspan="6" class="tube-main">
                  <table>
                    <tbody>
                      <tr id="Tr1" class="grid-order ">
                        <td class="tube-img">
                          <a class="img" href="javascript:void(0)">
                            <img data-mm="openitem_pic" width="50" height="50" src="">
                          </a>
                        </td>
                        <td class="tube-master" style="vertical-align:middle">
                          <p class="item-title">
                            <a data-mm="openitem_txt" href="javascript:void(0)">
                              
                            </a>
                          </p>
                        </td>
                        <td class="tube-sku">
                        </td>
                        <td class="tube-price">
                        </td>
                        <td class="tube-amount">
                            <div class="tc-amount" id="Div1">1
                            </div>
                        </td>
                        <td class="tube-promo">
                            <div class="promotion itempromo">-
                            </div>
                            <div class="campign">
                            </div>
                        </td>
                        <td class="tube-sum">
                            <span class="itemPay" id="Span1">
                            <p class="sum">
                            </p>
                            </span>
                        </td>
                        <td style="width:185px">OurTmall 快递</td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>

              <tr class="grid-main">
                <td colspan="6" class="tube-main">
                  <table>
                    <tbody>
                      <tr id="Tr2" class="grid-order ">
                        <td class="tube-img">
                          <a class="img" href="javascript:void(0)">
                            <img data-mm="openitem_pic" width="50" height="50" src="">
                          </a>
                        </td>
                        <td class="tube-master" style="vertical-align:middle">
                          <p class="item-title">
                            <a data-mm="openitem_txt" href="javascript:void(0)">
                              
                            </a>
                          </p>
                        </td>
                        <td class="tube-sku">
                        </td>
                        <td class="tube-price">
                        </td>
                        <td class="tube-amount">
                            <div class="tc-amount" id="Div2">1
                            </div>
                        </td>
                        <td class="tube-promo">
                            <div class="promotion itempromo">-
                            </div>
                            <div class="campign">
                            </div>
                        </td>
                        <td class="tube-sum">
                            <span class="itemPay" id="Span2">
                            <p class="sum">
                            </p>
                            </span>
                        </td>
                        <td style="width:185px">OurTmall 快递</td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>

              <tr class="grid-main">
                <td colspan="6" class="tube-main">
                  <table>
                    <tbody>
                      <tr id="Tr3" class="grid-order ">
                        <td class="tube-img">
                          <a class="img" href="javascript:void(0)">
                            <img data-mm="openitem_pic" width="50" height="50" src="">
                          </a>
                        </td>
                        <td class="tube-master" style="vertical-align:middle">
                          <p class="item-title">
                            <a data-mm="openitem_txt" href="javascript:void(0)">
                              
                            </a>
                          </p>
                        </td>
                        <td class="tube-sku">
                        </td>
                        <td class="tube-price">
                        </td>
                        <td class="tube-amount">
                            <div class="tc-amount" id="Div3">1
                            </div>
                        </td>
                        <td class="tube-promo">
                            <div class="promotion itempromo">-
                            </div>
                            <div class="campign">
                            </div>
                        </td>
                        <td class="tube-sum">
                            <span class="itemPay" id="Span3">
                            <p class="sum">
                            </p>
                            </span>
                        </td>
                        <td style="width:185px">OurTmall 快递</td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>

              <tr class="grid-main">
                <td colspan="6" class="tube-main">
                  <table>
                    <tbody>
                      <tr id="Tr4" class="grid-order ">
                        <td class="tube-img">
                          <a class="img" href="javascript:void(0)">
                            <img data-mm="openitem_pic" width="50" height="50" src="">
                          </a>
                        </td>
                        <td class="tube-master" style="vertical-align:middle">
                          <p class="item-title">
                            <a data-mm="openitem_txt" href="javascript:void(0)">
                              
                            </a>
                          </p>
                        </td>
                        <td class="tube-sku">
                        </td>
                        <td class="tube-price">
                        </td>
                        <td class="tube-amount">
                            <div class="tc-amount" id="Div4">1
                            </div>
                        </td>
                        <td class="tube-promo">
                            <div class="promotion itempromo">-
                            </div>
                            <div class="campign">
                            </div>
                        </td>
                        <td class="tube-sum">
                            <span class="itemPay" id="Span4">
                            <p class="sum">
                            </p>
                            </span>
                        </td>
                        <td style="width:185px">OurTmall 快递</td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td class="tube-annex" colspan="3"></td>
                <td class="tube-bill" colspan="3">
                  <div class="promotion orderpromo">
                  </div>
                  <div class="orderPay" id="orderPay_b_91188576706">
                    <span class="tc-rmb">
                    </span>
                    <strong>
                    </strong>
                  </div>
                </td>
              </tr>
            </tfoot>
          </table>
        </div>

        <div id="A_checkbar" class="checkbar">
          <div id="J_checkbar" class="checkbar">
            <div id="J_CheckbarMain" class="main">
              <div class="point point-off" id="J_Point">
                <!--                 <div class="hd"> -->
                <!--                   <input class="toggle" data-clk="buy-order/mod/point:toggle" type="checkbox" id="tmallPoint_1"> -->
                <!--                   <label for="tmallPoint_1">使用天猫积分 -->
                <!--                   </label> -->
                <!--                   <p>&nbsp; -->
                <!--                   </p> -->
                <!--                 </div> -->
                <div class="bd">
                  <span class="colon">：
                  </span>
                  <span class="txtBox">
                  <input class="tc-text cost" id="J_PointInput" type="text" autocomplete="off">点
                  </span>
                  <span class="discharge">-
                  <span class="tc-rmb">¥
                  </span>
                  <strong id="J_Discharge">0.00
                  </strong>
                  </span>
                  <p class="totalPoint">
                  <span>（可用
                  <span class="usablePoints">29
                  </span>点）
                  </span>
                  </p>
                </div>
              </div>
              <div id="J_CheckDue" class="due">
                <div class="realPay" id="realPay_1">
                  <p class="money">
                  <span class="hd">实付款：
                  </span>
                  <span class="bd">
                  <span class="tc-rmb">¥
                  </span>
                  <strong id="J_RealPay">
                  </strong>
                  </span>
                  </p>
                </div>
                <div class="obtainedPoint" id="obtainedPoint_1">可获得天猫积分：
                    <span class="obtain">
                    <strong>
                    </strong>点
                    </span>
                </div>
              </div>
            </div>
            <div id="J_CheckbarOption" class="option">
            </div>
            <div class="action">
              <a href="./Cart.aspx" class="back-cart">返回购物车修改
              </a>
              <style type="text/css">
                .asp-btn {margin-top: 0 !important;}
              </style>
              <div id="submitOrder_1" class="go-wrapper">
                <span tabindex="21" id="J_Go" data-mm="submit2" class="go-btn" data-clk="buy-order/mod/go:submit" title="提交订单">提交订单
                <s><asp:Button ID="J_GO2" CssClass="go-btn asp-btn" runat="server" Text="提交订单" OnClick="J_GO2_Click"/>
                </s>
                </span>
              </div>
            </div>
          </div>
        </div>
        <div id="A_invalid" class="invalid">
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
      </div>
      <div id="server-num">buy010236074101.cm4</div>
    </div>
  </div>
</form>
</body>
</html>
