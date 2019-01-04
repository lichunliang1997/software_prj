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
  <title>修改手机号</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="i" href="">
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
<script type="text/javascript">
$(document).ready(function(){
	var tips = "${phoneMessage}";
	
	if(tips === "") {
		console.log(tips);
	}else{
		alert(tips)
	}
	//点击链接的时候调用
    $("#linkToCart").click(function(){

        //得到input的值
        var count = $("#phone").val();
        $.ajax({
            type: "POST",                            //传数据的方式
            url: "sendCode?phoneNumber="+count,                             //servlet地址

            success: function(result){               //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
            	console.log(result)           //找到输入框 并且将result的值 传进去
            }
        });

    });
	})
</script>
<div class="am-g">
	<!-- 标题栏 -->
	<div class="alert">
        <div>
          <a href="safe.jsp"><i class="icon icon-chevron-left"></a></i>
          <h2>修改手机号</h2>
        </div>
      </div>
	<!-- 登陆框 -->
	<div class="am-u-sm-11 am-u-sm-centered loginDiv">
	<form class="am-form" method="post" action="changePhone">
	  <fieldset class="myapp-login-form am-form-set fieldsetDiv">
		<div class="am-form-group am-form-icon">
      <i class="am-icon-user"></i>
      <input type="text" class="myapp-login-input-text am-form-field" placeholder="输入新的手机号" onfocus="DZYXonfocu()"
      onblur="DZYXonblus()" name="phone" id="phone">
      <!-- <p id="DZYXerror">123</p> -->
    </div>
    <a id="linkToCart" href="#">
    <button type="button" id="phoneButton" class="myapp-login-form-submit am-btn am-btn-primary am-btn-block">获取</button></a>
    <div class="am-form-group am-form-icon">
      <i class="am-icon-user"></i>
      <input type="text" class="myapp-login-input-text am-form-field" placeholder="输入发送到新手机的验证码" onfocus="DZYXonfocu()"
      onblur="DZYXonblus()" name="phoneNumber">
      <!-- <p id="DZYXerror">123</p> -->
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