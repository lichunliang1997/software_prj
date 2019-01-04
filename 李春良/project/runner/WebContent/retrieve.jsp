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
  <title>找回密码</title>
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
    <script type="text/javascript">
    $(document).ready(function(){
      var tips = "${ReMessage}";
    	
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
                url: "ReEmail?email="+count,                             //servlet地址
 
                success: function(result){               //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
                	console.log(result)           //找到输入框 并且将result的值 传进去
                }
            });
        });
    })
    
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
          <a href="login.jsp"><i class="icon icon-chevron-left"></i></a>
          <h2>密码找回</h2>
        </div>
      </div>
      <!-- LOGO -->
	<div class="am-u-sm-12 am-text-center" style="padding-top: 10%">
		 <img src="${pageContext.request.contextPath}/images/runner.png">
	</div>
	<!-- 登陆框 -->
	<div class="am-u-sm-11 am-u-sm-centered loginDiv">
	<form class="am-form" action="/retrieve" method="post">
	  <fieldset class="myapp-login-form am-form-set fieldsetDiv">
		<div class="am-form-group am-form-icon">
			<i class="am-icon-user"></i>
			<input id="email" name="email" type="text" class="myapp-login-input-text am-form-field" placeholder="输入邮箱">
		</div>
	    <div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input name="code" type="text" class="myapp-login-input-text am-form-field" placeholder="输入验证码">
		</div>
		<a id="linkToCart"><button type="button" id="retrieveButton" class="myapp-login-form-submit am-btn am-btn-primary am-btn-block">获取</button></a>
		<div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input type="password" class="myapp-login-input-text am-form-field" placeholder="设置密码" id="password" onfocus="MMonfocu()"
                   onblur="MMonblus()" name="password">
            <p id="MMerror"></p>
		</div>
		<div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input type="password" name="rePasswd" class="myapp-login-input-text am-form-field" placeholder="确认密码" id="confirmPassword" onfocus="QRMMonfocu()" onblur="QRMMonblus()">
			<p id="QRMMerror"></p>
		</div>
	  </fieldset>
	  
	  <button type="submit" class="myapp-login-form-submit am-btn am-btn-primary am-btn-block ">确认</button>
	</form>
	</div>
	<div class="am-text-center am-u-sm-11 am-u-sm-centered myapp-login-form-shortcut">
		<hr class="myapp-login-form-hr">
		
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