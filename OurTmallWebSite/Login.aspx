<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="description" content="OurTmall">
  <meta name="keywords" content="OurTmall">
  <meta name="data-spm" content="3704.3033477">
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache,must-revalidate">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
  <meta content="yes" name="apple-mobile-web-app-capable">
  <meta content="black" name="apple-mobile-web-app-status-bar-style">
  <meta content="telephone=no" name="format-detection">
  <link rel="shortcut icon" href="https://s.tbcdn.cn/p/mall/base/favicon.ico" type="image/x-icon" />
  <link title="OurTmall" href="https://s.tbcdn.cn/p/mall/header/search.xml" type="application/opensearchdescription+xml" rel="search">
  <title>登录 - OurTmall</title>
  <link rel="stylesheet" href="./css/Header.css">
  <link rel="stylesheet" href="./css/Login.css">
  <script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="./js/Login.js"></script>
</head>

<body>
  <div id="header">
    <div id="header-inner">
      <div class="logo">
        <a href="./Index.aspx" target="_self"><img src="http://img02.taobaocdn.com/tps/i2/T1zjasXpBXXXcKFznB-284-40.png" alt="Tmall.com天猫" /></a>
      </div>
    </div>

    <div class="miao">
      <img class="m" src="http://img03.taobaocdn.com/tps/i3/T1v2SqXzpcXXcJrWLc-136-117.png" alt=""/>
    </div>
  </div>

  <div id="content" class="clearfix">
    <div class="pic" data-spm="6799321">
      <img id="j_mediaImg" src="./img/login-cover.jpg">
    </div>
    <div class="form form-inner form-content">
      <div id="content2">
        <div id="J_LoginBox" class="login-box">
          <div class="bd">
            <div id="J_Message" style="display:none" class="login-msg msg">
              <p class="error"></p>
            </div>
            <div id="J_Static" class="static">
              <form id="J_StaticForm" method="post" action="Login.aspx" runat="server">
                <div class="field username-field">
                  <label for="TPL_username_1">登录名：</label>
                  <input type="text" name="TPL_username" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="1" autofocus>
                </div>
                <div class="field pwd-field">
                  <label id="password-label" for="TPL_password_1">登录密码：</label>
                  <span id="J_StandardPwd">
                    <input type="password" aria-labelledby="password-label" name="TPL_password" id="TPL_password_1" class="login-text" maxlength="20" tabindex="2">
                  </span>
                </div>
                <div class="safe" style="height: 20px"></div>
                <div class="submit">
                  <button type="submit" class="J_Submit" tabindex="5" id="J_SubmitStatic">登 录</button>
                </div>
                <ul class="entries">
                  <li id="registerUrl_1" class="register"><a id="J_RegisterLink1" href="./Register.aspx" target="_blank" tabindex="8">免费注册</a></li>
                </ul>
                <span id="J_PasswordEditTmp" class="password-edit-tmp"></span>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="footer">
    <div id="mall-desc">
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
        <a href="https://www.alipay.com/user/login.htm?goto=https%3A%2F%2Fwww.alipay.com%2Fuser%2Finpour_request.htm" target="_blank"><i></i>支付宝充值</a>
        <a href="http://service.tmall.com/support/tmall/tmallHelp.htm" target="_blank"><i></i>帮助中心</a>
      </dd>
    </dl>
    <dl id="payment">
      <dt><span>支付方式</span></dt>
      <dd>
        <a href="http://help.alipay.com/lab/help_detail.htm?help_id=245296" target="_blank"><i></i>支付宝快捷支付</a>
        <a href="http://help.alipay.com/lab/help_detail.htm?help_id=251547" target="_blank"><i></i>支付宝余额付款</a>
        <a href="http://help.alipay.com/lab/help_detail.htm?help_id=253912" target="_blank"><i></i>支付宝卡付款</a>
        <a href="http://www.tmall.com/go/act/sale/cod.php" target="_blank"><i></i>货到付款</a>
        <a href="http://abc.alipay.com/cool/fastPayment.htm" target="_blank"><i></i>新人支付</a>
      </dd>
    </dl>

    <dl id="seller">
      <dt><span>商家服务</span></dt>
      <dd>
        <a href="http://zhaoshang.tmall.com/" target="_blank" class="join" ><i></i>商家入驻>></a>
        <a href="http://shangjia.tmall.com/portal.htm" target="_blank" ><i></i>商家中心</a>
		    <a href="http://peixun.tmall.com/" target="_blank" ><i></i>天猫智库</a>
        <a href="http://guize.tmall.com" target="_blank" ><i></i>天猫规则</a>
        <a href="http://e56.tmall.com" target="_blank" ><i></i>物流服务</a>
        <a href="http://mymy.maowo.tmall.com/" target="_blank"><i></i>喵言喵语</a>
        <a href="http://fw.tmall.com/?spm=3.7095809.2000g002.18.i9zjHo" target="_blank"><i></i>运营服务</a>
      </dd>
    </dl>
    <!--[if IE 6]><br /><![endif]-->
	  <h4 class="go-home"><a href="./Index.aspx" target="_blank" title="返回天猫首页" >返回天猫首页</a></h4>    </div>
      <div id="copyright">
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
          <a href="//www.alibabagroup.com/cn/global/home" target="_blank">阿里巴巴集团</a>|
          <a href="//www.taobao.com" target="_blank">淘宝网</a>
          |
          <a href="//www.tmall.com?spm=1.1000386.245549.6.GGCoax" target="_blank">天猫</a>
          |
          <a href="//ju.taobao.com?spm=1.1000386.245549.7.GGCoax" target="_blank">聚划算</a>
          |
          <a href="//www.aliexpress.com?spm=1.1000386.245549.4.GGCoax" target="_blank">全球速卖通</a>
          |
          <a href="//www.alibaba.com?spm=1.1000386.245549.2.GGCoax" target="_blank">阿里巴巴国际交易市场</a>|
          <a href="//www.1688.com?spm=1.1000386.245549.3.GGCoax" target="_blank">1688</a>
          |
          <a href="//www.alimama.com?spm=1.1000386.245549.9.GGCoax" target="_blank">阿里妈妈</a>
          |
          <a href="//www.aliyun.com?spm=1.1000386.245549.10.GGCoax" target="_blank">阿里云计算</a>
          |
          <a href="//www.yunos.com?spm=1.1000386.245549.11.GGCoax" target="_blank">云OS</a>
          |
          <a href="//www.net.cn?spm=1.1000386.245549.12.GGCoax" target="_blank">万网</a>
          |
          <a href="//trip.taobao.com/" target="_blank">淘宝旅行</a>
          |
          <a href="//www.xiami.com/" target="_blank">虾米</a>
          |
          <a href="//www.laiwang.com/" target="_blank">来往</a>
          |
          <a href="//www.alipay.com" target="_blank">支付宝</a>
      </p>
      <p>
        &copy;&nbsp;2003-2014&nbsp;Tmall.com&nbsp;版权所有 <br />增值电信业务经营许可证：
        <a data-spm-protocol="i"  href="http://www.miibeian.gov.cn/state/outPortal/loginPortal.action" href="_blank">浙B2-20110446</a><br />
        网络文化经营许可证：
        <a href="http://img01.taobaocdn.com/tps/i1/T1M72qXjhgXXc1.xw7-2349-1700.jpg" target="_blank">浙网文[2012]0234-028号</a><br/>
        互联网医疗保健信息服务 审核同意书 浙 卫网审【2012】6号<br />互联网药品信息服务资质证书编号：浙-（经营性）-2012-0005
      </p>
      <!-- foot links from tms end -->
    </div>
  </div>
</body>
</html>
