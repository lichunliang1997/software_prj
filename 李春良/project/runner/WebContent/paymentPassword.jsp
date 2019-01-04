<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>修改支付密码</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="icon" href="images/logo.ico"/>
  <link rel="stylesheet" href="css/amazeui.min.css">
  <link rel="stylesheet" href="css/app.css">
  <!-- zui -->
    <link href="css/zui.min.css" rel="stylesheet">
    <!-- bch -->
    <link href="css/login.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<script>
var tips = "${payMessage}";
    	
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
          <a href="safe.jsp"><i class="icon icon-chevron-left"></a></i>
          <h2>修改支付密码</h2>
        </div>
      </div>
	<!-- 登陆框 -->
	<div class="am-u-sm-11 am-u-sm-centered loginDiv">
	<form class="am-form" method="post" action="payController">
	  <fieldset class="myapp-login-form am-form-set fieldsetDiv">
	  	<c:if test='${info.paymentPassword=="000000"}'>
	  		默认密码为000000，请修改密码
	  	</c:if>
		<div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input type="password" name="oldPassword" class="myapp-login-input-text am-form-field" placeholder="原密码" id="password" onfocus="MMonfocu()"
                   onblur="MMonblus()">
            <!-- <p id="MMerror"></p> -->
            
		</div>
		<div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input type="password" name="newPassword" class="myapp-login-input-text am-form-field" placeholder="新密码(6位数字)" id="confirmPassword" onfocus="QRMMonfocu()" onblur="QRMMonblus()">
			<!-- <p id="QRMMerror"></p> -->
		</div>
    <div class="am-form-group am-form-icon">
      <i class="am-icon-lock"></i>
      <input type="password" name="rePassword" class="myapp-login-input-text am-form-field" placeholder="确认密码"  onfocus="QRMMonfocu()" onblur="QRMMonblus()">
      <!-- <p id="QRMMerror"></p> -->
    </div>
	  </fieldset>
	  <button type="submit" class="myapp-login-form-submit am-btn am-btn-primary am-btn-block ">确定</button>
	</form>


	
</div>
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
<!-- ZUI Javascript组件 -->
<script src="js/zui.min.js"></script>
</body>
</html>