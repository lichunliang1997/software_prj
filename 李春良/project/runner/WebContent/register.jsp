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
  <title>register</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
  <!-- zui -->
    <link href="${pageContext.request.contextPath}/css/zui.min.css" rel="stylesheet">
    <!-- bch -->
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- bch--js -->
    <script>
    $(document).ready(function(){
    	//alert("${message}");
    	var tips = "${registerMessage}";
    	
    	if(tips === "") {
    		console.log(tips);
    	}else{
    		alert(tips)
    	}
    	//点击链接的时候调用
        $("#linkToCart").click(function(){
   
            //得到input的值
            var count = $("#email").val();
            $.ajax({
                type: "POST",                            //传数据的方式
                url: "sendEmail?email="+count,                             //servlet地址
 
                success: function(result){               //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
                	console.log(result)           //找到输入框 并且将result的值 传进去
                }
            });
   
        });
    	})
    	//    电子邮箱
        function DZYXonblus() {
            var email = document.getElementById("email");
            var re = /[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5}/;
            if (email.value == "") {
                document.getElementById('DZYXerror').innerText = "请输入电子邮箱";
            }
            else if (!re.test(email.value)) {
                document.getElementById("DZYXerror").innerHTML = "邮箱格式不正确";
            }
            else {
                document.getElementById('DZYXerror').innerText = "";
            }
        }
        function DZYXonfocu() {
            document.getElementById('DZYXerror').innerText = "";
        }
        //   密码
        function MMonblus() {
            var password = document.getElementById("password");
            var re = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[\`\~\!\@\#\$\%\^\&\*\(\)\_\+\-\=\{\}\|\[\]\:\;\'\<\>\?\,\.]).{6,16}$/;
            // var reg=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;

            if (password.value == "") {
                document.getElementById('MMerror').innerText = "请输入密码";
            }
            else if (password.value.length < 6) {
                document.getElementById('MMerror').innerText = "格式错误,,密码长度至少为6位";
            }

            else if (!re.test(password.value)) {
                document.getElementById('MMerror').innerText = "格式错误,必须包含英文字母大小写、数字以及特殊符号";
            }
            else {
                document.getElementById('MMerror').innerText = "";
            }
        }

        function MMonfocu() {
            document.getElementById('MMerror').innerText = "";
        }

        //    确认密码
        function QRMMonblus() {
            var password = document.getElementById("password");
            var confirmPassword = document.getElementById("confirmPassword");
            if (confirmPassword.value == "") {
                document.getElementById('QRMMerror').innerText = "请输入确认密码";
            }
            else if (password.value != confirmPassword.value) {
                document.getElementById('QRMMerror').innerText = "两次密码输入不一致";
            }
            else {
                document.getElementById('QRMMerror').innerText = "";
            }
        }

        function QRMMonfocu() {
            document.getElementById('QRMMerror').innerText = "";
        }
        
    </script>
</head>
<body>
<div class="am-g">
	<!-- 标题栏 -->
	<div class="alert">
        <div>
          <a href="login.html"><i class="icon icon-chevron-left"></i></a>
          <h2>用户注册</h2>
        </div>
      </div>
      <!-- LOGO -->
	<div class="am-u-sm-12 am-text-center" style="padding-top: 10%">
		 <img src="${pageContext.request.contextPath}/images/runner.png">
	</div>
	<!-- 登陆框 -->
	<div class="am-u-sm-11 am-u-sm-centered loginDiv">
	<form class="am-form" action="save" method="post">
	  <fieldset class="myapp-login-form am-form-set fieldsetDiv">
		<div class="am-form-group am-form-icon">
			<i class="am-icon-user"></i>
			<input type="text" class="myapp-login-input-text am-form-field" placeholder="输入邮箱" onfocus="DZYXonfocu()"
			onblur="DZYXonblus()" id="email" name="email">
			<p id="DZYXerror"></p>
		</div>
	    <div class="am-form-group am-form-icon">
	    <a id="linkToCart" >
      <button type="button" id="registerButton" class="myapp-login-form-submit am-btn am-btn-primary am-btn-block">获取</button>
			<i class="am-icon-lock"></i></a>
			<input id="code" type="text" name="code" class="myapp-login-input-text am-form-field" placeholder="输入验证码">
		</div>
		<div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input type="password" class="myapp-login-input-text am-form-field" placeholder="设置密码" id="password" onfocus="MMonfocu()"
                   onblur="MMonblus()" name="passwd">
            <p id="MMerror"></p>
		</div>
		<div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input type="password" name="rePasswd" class="myapp-login-input-text am-form-field" placeholder="确认密码" id="confirmPassword" onfocus="QRMMonfocu()" onblur="QRMMonblus()">
			<p id="QRMMerror"></p>
		</div>
	  </fieldset>
	  <button type="submit" class="myapp-login-form-submit am-btn am-btn-primary am-btn-block ">注册</button>
	</form>
	<div>
		<a href="${pageContext.request.contextPath}/login.jsp"><span class="register-span3">已有账号，点击登陆</span></a>
	</div>
	</div>
	<div class="am-text-center am-u-sm-11 am-u-sm-centered myapp-login-form-shortcut">
		<hr class="myapp-login-form-hr">
		<span class="myapp-login-form-hr-font">第三方登陆</span>
	</div>

	<div class="am-u-sm-12 am-text-center myapp-login-form-listico" >
		 <div style="position: absolute;left: 10%" class="am-u-sm-4 am-text-center" >
		 <i class="am-icon-btn am-primary am-icon-qq"></i>
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
<script src="js/jquery.min.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
<!-- ZUI Javascript组件 -->
<script src="js/zui.min.js"></script>
</body>
</html>