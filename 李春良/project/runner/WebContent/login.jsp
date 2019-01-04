<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>login</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
  <!-- zui -->
    <link href="${pageContext.request.contextPath}/css/zui.min.css" rel="stylesheet">
    <!-- bch -->
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
</head>
<body>
<script type="text/javascript">
	
	var tips = "${loginMessage}";
	
	if(tips === "") {
		console.log(tips);
	}else{
		alert(tips)
	}
   
</script>
<div class="am-g">
	<!-- 标题栏 -->
	<div class="alert">
        <div>
          <i class="icon icon-chevron-left"><h2>用户登陆</h2></i>
        </div>
      </div>
      <!-- LOGO -->
	<div class="am-u-sm-12 am-text-center" style="padding-top: 10%">
		 <img src="${pageContext.request.contextPath}/images/runner.png">
	</div>
	<!-- 登陆框 -->
	<div class="am-u-sm-11 am-u-sm-centered loginDiv">
	<form class="am-form" method="post" action="login">
	  <fieldset class="myapp-login-form am-form-set fieldsetDiv">
		<div class="am-form-group am-form-icon">
			<i class="am-icon-user"></i>
			<input name="email" type="text" class="myapp-login-input-text am-form-field" placeholder="请输入您的邮箱">
		</div>
	    <div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input name="password" type="password" class="myapp-login-input-text am-form-field" placeholder="请输入您的密码">
		</div>
	  </fieldset>
	  <button type="submit" class="myapp-login-form-submit am-btn am-btn-primary am-btn-block ">登 陆</button>
	</form>
	<div>
		<a href="${pageContext.request.contextPath}/register.jsp"><span class="span1">免费注册</span></a>
		<a href="retrieve.jsp"><span class="span2">忘记密码</span></a>
	</div>
	</div>
	<div class="am-text-center am-u-sm-11 am-u-sm-centered myapp-login-form-shortcut">
		<hr class="myapp-login-form-hr">
		<span class="myapp-login-form-hr-font">第三方登陆</span>
	</div>

	<div class="am-u-sm-12 am-text-center myapp-login-form-listico" >
		 <div style="position: absolute;left: 10%" class="am-u-sm-4 am-text-center" >
		 <a href="#"><i class="am-icon-btn am-danger am-icon-weibo"></i></a>
		 </div>
		 <div style="position: absolute;left: 55%" class="am-u-sm-4 am-text-center" >
		 <i class="am-icon-btn am-success am-icon-weixin"></i>
		 </div>
	</div>
	<div class="spanDiv0" style="position: absolute;top: 115%">
		<span>登录即表示您已阅读、理解并同意</span>		
	</div>
	<div class="spanDiv1" style="position: absolute;top: 118%;left: 16.5%">
		<span>《代跑侠服务协议》、《代跑侠隐私保护指引》</span>
	</div>
	
</div>
<div
  class="am-slider am-slider-default"
  data-am-flexslider="{controlNav: 'thumbnails', directionNav: false, slideshow: false}">
  <ul class="am-slides">
    <li data-thumb="http://s.amazeui.org/media/i/demos/pure-4.jpg?imageView2/0/w/360">
      </li>
  </ul>
</div>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="js/jquery.min.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
<!-- ZUI Javascript组件 -->
<script src="js/zui.min.js"></script>
</body>
</html>