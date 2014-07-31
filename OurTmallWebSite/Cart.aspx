<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7" />
  <meta charset="gbk">
  <meta name="apple-touch-fullscreen" content="yes">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
  <meta content="yes" name="apple-mobile-web-app-capable">
  <meta content="black" name="apple-mobile-web-app-status-bar-style">
  <meta name="format-detection" content="telephone=no">
  <meta name="description" content="OurTmall">
  <meta name="keywords" content="OurTmall">
  <meta name="renderer" content="webkit">
  <meta name="data-spm" content="a1z0d">
  <link rel="shortcut icon" href="http://g.tbcdn.cn/mui/global/1.2.35/file/favicon.ico" type="image/x-icon">

  <title>OurTmall - 我的购物车</title>
  <link rel="stylesheet" href="./css/MuiGlobal.css">
  <link rel="stylesheet" href="./css/Cart.css">
  <link rel="stylesheet" href="./css/TstartMin.css">
  <link rel="stylesheet" href="./css/TdogMin.css">
  <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="./js/Global.js"></script>
  <script type="text/javascript" src="./js/Cart.js"></script>
</head>
<body data-spm="6639537" class="cart-tmall ">
<form id="Form1" method="post" runat="Server">
  <div id="page" class="cl">
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
              <i class="mui-iconfont">㕹</i> 
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
          </ul> 
        </div> 
      </div> 
    </div> 

    <style>
      .sn-simple-logo {_width: auto!important;}
      #content .sn-simple-logo {position: absolute}
    </style>

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
      <div id="J_Cart" class="cart">
        <div id="J_FilterBar" class="cart-filter-bar">
            <ul id="J_CartSwitch" class="switch-cart">
              <li class="btn-switch-cart current">
                <a href="javascript:void(0)" class="J_MakePoint" data-point="tbcart.8.35">
                  <em>全部商品
                  </em>
                </a>
              </li>
            </ul>
            <div class="cart-sum">已选商品：
                <strong class="price">¥
                <em id="J_SmallTotal">0.00
                </em>
                </strong>
                <a href="javascript:void(0)" id="J_SmallSubmit" class="submit-btn submit-btn-disabled">结&nbsp;算
                </a>
            </div>
            <div class="wrap-line">
                <div class="floater" style="width: 123px; left: -1px;">
                </div>
            </div>
        </div>

        <div id="J_CartMain" class="cart-main">
          <div class="cart-table-th">
            <div class="wp">
                <div class="th th-chk">
                    <div id="J_SelectAll1" class="select-all J_SelectAll">
                        <div class="cart-checkbox">
                            <asp:TextBox ID="J_SelectAllCbx1" CssClass="J_CheckBoxShop" Text="0" runat="Server"/>
                            <!-- <input class="J_CheckBoxShop" id="J_SelectAllCbx1" type="checkbox" name="select-all" value="true"> -->
                            <label class="J_SelectAllCheckbox">勾选购物车内所有商品
                            </label>
                        </div>&nbsp;&nbsp;全选
                    </div>
                </div>
                <div class="th th-item">
                    <div class="td-inner">商品信息
                    </div>
                </div>
                <div class="th th-info">
                    <div class="td-inner">&nbsp;
                    </div>
                </div>
                <div class="th th-price">
                    <div class="td-inner">单价（元）
                    </div>
                </div>
                <div class="th th-amount">
                    <div class="td-inner">数量
                    </div>
                </div>
                <div class="th th-sum">
                    <div class="td-inner">金额（元）
                    </div>
                </div>
                <div class="th th-op">
                    <div class="td-inner">操作
                    </div>
                </div>
            </div>
          </div>

          <div id="J_OrderList" data-spm="1997196601">
            <div id="J_OrderHolder_s_1917047079_1" style="height: auto;">
                <div id="J_Order_s_1917047079_1" class="J_Order clearfix order-body">
                  <div class="order-content">
                    <div id="J_BundleList_s_1917047079_1" class="item-list">
                      <div id="J_Bundle_s_1917047079_1_0" class="bundle  bundle-last ">
                        <div id="J_ItemHolder">
                          <!-- 插入 -->
                          <div class="J_ItemBody item-body clearfix item-normal">
                            <ul class="item-content clearfix">
                              <li class="td td-chk">
                                <div class="td-inner">
                                  <div class="cart-checkbox">
                                    <asp:TextBox ID="ItemCheckbox0" CssClass="J_CheckBoxItem" Text="0" runat="Server"/>
                                    <!-- <input class="J_CheckBoxItem" type="checkbox" name="items[]" value="74913374822" checked=""> -->
                                    <label class="J_ItemCheckBox">勾选商品
                                    </label>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-item">
                                <div class="td-inner">
                                  <div class="item-pic J_ItemPic img-loaded">
                                    <a href="javascript:void(0)" target="_blank" class="J_MakePoint" data-point="tbcart.8.12">
                                      <img src="" class="itempic J_ItemImg">
                                    </a>
                                  </div>
                                  <div class="item-info">
                                    <div class="item-basic-info">
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemName" data-point="tbcart.8.11">
                                      </a>
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemStore" data-point="tbcart.8.11">
                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-info">
                                <div class="item-props ">
                                </div>
                              </li>
                              <li class="td td-price">
                                <div class="td-inner">
                                  <div class="item-price price-promo-">
                                    <div class="price-content">
                                      <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">
                                        </em>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-amount">
                                <div class="td-inner">
                                  <div class="amount-wrapper ">
                                    <div class="item-amount ">
                                      <a href="#" class="J_Minus minus">-
                                      </a>
                                      <asp:TextBox ID="Amount0" Text="1" CssClass="text text-amount J_ItemAmount" MaxLength="8" runat="server"/>
                                      <!-- <input type="text" value="1" class="text text-amount J_ItemAmount" data-max="12" data-now="1" autocomplete="off"> -->
                                      <a href="#" class="J_Plus plus">+
                                      </a>
                                    </div>
                                    <div class="amount-msg J_AmountMsg">
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-sum">
                                <div class="td-inner">
                                  <em tabindex="0" class="J_ItemSum number">
                                  </em>
                                  <div class="J_ItemLottery">
                                  </div>
                                </div>
                              </li>
                              <li class="td td-op">
                                <div class="td-inner">
                                  <a href="javascript:void(0)" title="删除" class="J_Del J_MakePoint">删除
                                  </a>
                                </div>
                              </li>
                            </ul>
                          </div>

                          <div class="J_ItemBody item-body clearfix item-normal">
                            <ul class="item-content clearfix">
                              <li class="td td-chk">
                                <div class="td-inner">
                                  <div class="cart-checkbox">
                                    <asp:TextBox ID="ItemCheckbox1" CssClass="J_CheckBoxItem" Text="0" runat="Server"/>
                                    <!-- <input class="J_CheckBoxItem" type="checkbox" name="items[]" value="74913374822" checked=""> -->
                                    <label class="J_ItemCheckBox">勾选商品
                                    </label>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-item">
                                <div class="td-inner">
                                  <div class="item-pic J_ItemPic img-loaded">
                                    <a href="javascript:void(0)" target="_blank" class="J_MakePoint" data-point="tbcart.8.12">
                                      <img src="" class="itempic J_ItemImg">
                                    </a>
                                  </div>
                                  <div class="item-info">
                                    <div class="item-basic-info">
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemName" data-point="tbcart.8.11">
                                      </a>
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemStore" data-point="tbcart.8.11">
                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-info">
                                <div class="item-props ">
                                </div>
                              </li>
                              <li class="td td-price">
                                <div class="td-inner">
                                  <div class="item-price price-promo-">
                                    <div class="price-content">
                                      <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">
                                        </em>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-amount">
                                <div class="td-inner">
                                  <div class="amount-wrapper ">
                                    <div class="item-amount ">
                                      <a href="#" class="J_Minus minus">-
                                      </a>
                                      <asp:TextBox ID="Amount1" Text="1" CssClass="text text-amount J_ItemAmount" MaxLength="8" runat="server"/>
                                      <!-- <input type="text" value="1" class="text text-amount J_ItemAmount" data-max="12" data-now="1" autocomplete="off"> -->
                                      <a href="#" class="J_Plus plus">+
                                      </a>
                                    </div>
                                    <div class="amount-msg J_AmountMsg">
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-sum">
                                <div class="td-inner">
                                  <em tabindex="0" class="J_ItemSum number">
                                  </em>
                                  <div class="J_ItemLottery">
                                  </div>
                                </div>
                              </li>
                              <li class="td td-op">
                                <div class="td-inner">
                                  <a href="javascript:void(0)" title="删除" class="J_Del J_MakePoint">删除
                                  </a>
                                </div>
                              </li>
                            </ul>
                          </div>

                          <div class="J_ItemBody item-body clearfix item-normal">
                            <ul class="item-content clearfix">
                              <li class="td td-chk">
                                <div class="td-inner">
                                  <div class="cart-checkbox">
                                    <asp:TextBox ID="ItemCheckbox2" CssClass="J_CheckBoxItem" Text="0" runat="Server"/>
                                    <!-- <input class="J_CheckBoxItem" type="checkbox" name="items[]" value="74913374822" checked=""> -->
                                    <label class="J_ItemCheckBox">勾选商品
                                    </label>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-item">
                                <div class="td-inner">
                                  <div class="item-pic J_ItemPic img-loaded">
                                    <a href="javascript:void(0)" target="_blank" class="J_MakePoint" data-point="tbcart.8.12">
                                      <img src="" class="itempic J_ItemImg">
                                    </a>
                                  </div>
                                  <div class="item-info">
                                    <div class="item-basic-info">
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemName" data-point="tbcart.8.11">
                                      </a>
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemStore" data-point="tbcart.8.11">
                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-info">
                                <div class="item-props ">
                                </div>
                              </li>
                              <li class="td td-price">
                                <div class="td-inner">
                                  <div class="item-price price-promo-">
                                    <div class="price-content">
                                      <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">
                                        </em>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-amount">
                                <div class="td-inner">
                                  <div class="amount-wrapper ">
                                    <div class="item-amount ">
                                      <a href="#" class="J_Minus minus">-
                                      </a>
                                      <asp:TextBox ID="Amount2" Text="1" CssClass="text text-amount J_ItemAmount" MaxLength="8" runat="server"/>
                                      <!-- <input type="text" value="1" class="text text-amount J_ItemAmount" data-max="12" data-now="1" autocomplete="off"> -->
                                      <a href="#" class="J_Plus plus">+
                                      </a>
                                    </div>
                                    <div class="amount-msg J_AmountMsg">
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-sum">
                                <div class="td-inner">
                                  <em tabindex="0" class="J_ItemSum number">
                                  </em>
                                  <div class="J_ItemLottery">
                                  </div>
                                </div>
                              </li>
                              <li class="td td-op">
                                <div class="td-inner">
                                  <a href="javascript:void(0)" title="删除" class="J_Del J_MakePoint">删除
                                  </a>
                                </div>
                              </li>
                            </ul>
                          </div>

                          <div class="J_ItemBody item-body clearfix item-normal">
                            <ul class="item-content clearfix">
                              <li class="td td-chk">
                                <div class="td-inner">
                                  <div class="cart-checkbox">
                                    <asp:TextBox ID="ItemCheckbox3" CssClass="J_CheckBoxItem" Text="0" runat="Server"/>
                                    <!-- <input class="J_CheckBoxItem" type="checkbox" name="items[]" value="74913374822" checked=""> -->
                                    <label class="J_ItemCheckBox">勾选商品
                                    </label>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-item">
                                <div class="td-inner">
                                  <div class="item-pic J_ItemPic img-loaded">
                                    <a href="javascript:void(0)" target="_blank" class="J_MakePoint" data-point="tbcart.8.12">
                                      <img src="" class="itempic J_ItemImg">
                                    </a>
                                  </div>
                                  <div class="item-info">
                                    <div class="item-basic-info">
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemName" data-point="tbcart.8.11">
                                      </a>
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemStore" data-point="tbcart.8.11">
                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-info">
                                <div class="item-props ">
                                </div>
                              </li>
                              <li class="td td-price">
                                <div class="td-inner">
                                  <div class="item-price price-promo-">
                                    <div class="price-content">
                                      <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">
                                        </em>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-amount">
                                <div class="td-inner">
                                  <div class="amount-wrapper ">
                                    <div class="item-amount ">
                                      <a href="#" class="J_Minus minus">-
                                      </a>
                                      <asp:TextBox ID="Amount3" Text="1" CssClass="text text-amount J_ItemAmount" MaxLength="8" runat="server"/>
                                      <!-- <input type="text" value="1" class="text text-amount J_ItemAmount" data-max="12" data-now="1" autocomplete="off"> -->
                                      <a href="#" class="J_Plus plus">+
                                      </a>
                                    </div>
                                    <div class="amount-msg J_AmountMsg">
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-sum">
                                <div class="td-inner">
                                  <em tabindex="0" class="J_ItemSum number">
                                  </em>
                                  <div class="J_ItemLottery">
                                  </div>
                                </div>
                              </li>
                              <li class="td td-op">
                                <div class="td-inner">
                                  <a href="javascript:void(0)" title="删除" class="J_Del J_MakePoint">删除
                                  </a>
                                </div>
                              </li>
                            </ul>
                          </div>

                          <div class="J_ItemBody item-body clearfix item-normal">
                            <ul class="item-content clearfix">
                              <li class="td td-chk">
                                <div class="td-inner">
                                  <div class="cart-checkbox">
                                    <asp:TextBox ID="ItemCheckbox4" CssClass="J_CheckBoxItem" Text="0" runat="Server"/>
                                    <!-- <input class="J_CheckBoxItem" type="checkbox" name="items[]" value="74913374822" checked=""> -->
                                    <label class="J_ItemCheckBox">勾选商品
                                    </label>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-item">
                                <div class="td-inner">
                                  <div class="item-pic J_ItemPic img-loaded">
                                    <a href="javascript:void(0)" target="_blank" class="J_MakePoint" data-point="tbcart.8.12">
                                      <img src="" class="itempic J_ItemImg">
                                    </a>
                                  </div>
                                  <div class="item-info">
                                    <div class="item-basic-info">
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemName" data-point="tbcart.8.11">
                                      </a>
                                      <a href="#" target="_blank" class="item-title J_MakePoint J_ItemStore" data-point="tbcart.8.11">
                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-info">
                                <div class="item-props ">
                                </div>
                              </li>
                              <li class="td td-price">
                                <div class="td-inner">
                                  <div class="item-price price-promo-">
                                    <div class="price-content">
                                      <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">
                                        </em>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-amount">
                                <div class="td-inner">
                                  <div class="amount-wrapper ">
                                    <div class="item-amount ">
                                      <a href="#" class="J_Minus minus">-
                                      </a>
                                      <asp:TextBox ID="Amount4" Text="1" CssClass="text text-amount J_ItemAmount" MaxLength="8" runat="server"/>
                                      <!-- <input type="text" value="1" class="text text-amount J_ItemAmount" data-max="12" data-now="1" autocomplete="off"> -->
                                      <a href="#" class="J_Plus plus">+
                                      </a>
                                    </div>
                                    <div class="amount-msg J_AmountMsg">
                                    </div>
                                  </div>
                                </div>
                              </li>
                              <li class="td td-sum">
                                <div class="td-inner">
                                  <em tabindex="0" class="J_ItemSum number">
                                  </em>
                                  <div class="J_ItemLottery">
                                  </div>
                                </div>
                              </li>
                              <li class="td td-op">
                                <div class="td-inner">
                                  <a href="javascript:void(0)" title="删除" class="J_Del J_MakePoint">删除
                                  </a>
                                </div>
                              </li>
                            </ul>
                          </div>

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
          </div>
        </div>

        <div id="J_FloatBarHolder" class="float-bar-holder">
          <div id="J_FloatBar" class="float-bar clearfix default" style="position: static;">
            <div class="float-bar-wrapper">
              <div id="J_SelectAll2" class="select-all J_SelectAll">
                <div class="cart-checkbox"><!-- cart-checkbox-checked -->
                  <asp:TextBox ID="J_SelectAllCbx2" CssClass="J_CheckBoxShop" Text="0" runat="Server"/>
                  <!-- <input class="J_CheckBoxShop" id="J_SelectAllCbx2" type="checkbox" name="select-all" value="true"> -->
                  <label class="J_SelectAllCheckbox">勾选购物车内所有商品
                  </label>
                </div>&nbsp;全选
              </div>
              <div class="operations">
                <a href="#" hidefocus="true" class="J_DeleteSelected">删除</a>
              </div>
              <div class="float-bar-right">
                <div class="pipe">
                </div>
                <div class="price-sum">
                  <span class="txt">合计：
                  </span>
                  <strong class="price">¥
                    <em id="J_Total">0.00
                    </em>
                  </strong>
                </div>
                <div class="btn-area">
                  <style type="text/css">
                    .asp-btn {position: absolute; right: 0; opacity: 0}
                  </style>
                  <script type="text/javascript">
                    function JPAYClick() {
                      if (parseInt($("#ItemCheckbox0").val()) != 0) {
                        $("#ItemCheckbox0").val($(".J_ItemImg:eq(0)").attr("data-id"));
                      }
                      if (parseInt($("#ItemCheckbox1").val()) != 0) {
                        $("#ItemCheckbox1").val($(".J_ItemImg:eq(1)").attr("data-id"));
                      }
                      if (parseInt($("#ItemCheckbox2").val()) != 0) {
                        $("#ItemCheckbox2").val($(".J_ItemImg:eq(2)").attr("data-id"));
                      }
                      if (parseInt($("#ItemCheckbox3").val()) != 0) {
                        $("#ItemCheckbox3").val($(".J_ItemImg:eq(3)").attr("data-id"));
                      }
                      if (parseInt($("#ItemCheckbox4").val()) != 0) {
                        $("#ItemCheckbox4").val($(".J_ItemImg:eq(4)").attr("data-id"));
                      }
                    }
                  </script>
                  <asp:Button id="J_PAY" CssClass="submit-btn asp-btn" Text="结&nbsp;算" runat="Server" OnClick="J_PAY_Click" OnClientClick="return JPAYClick();"/>
                  <a href="javascript:void(0)" id="J_Go" class="submit-btn submit-btn-disabled">
                   <span>结&nbsp;算
                    </span>
                    <b>
                    </b>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    
      <input id="_tb_token_" type="hidden" value="QjNaHTJC8HXN" name="_tb_token_">

    </div>

    <div id="footer" data-spm="a2226n1" style="display:block;margin-top:50px;">
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
      <div id="server-num">carts010192004095.cm3</div>
    </div>
  </div>
</form>
</body>
</html>