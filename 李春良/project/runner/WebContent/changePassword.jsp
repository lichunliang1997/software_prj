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
  <title>修改登陆密码</title>
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
var tips = "${passwordMessage}";
    	
    	if(tips === "") {
    		console.log(tips);
    	}else{
    		alert(tips)
    	}
//密码
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
        document.getElementById('MMerror').innerText = "格式错误,必须包含英文字母大小写、数字和特殊字符";
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
<div class="am-g">
	<!-- 标题栏 -->
	<div class="alert">
        <div>
          <a href="safe.jsp"><i class="icon icon-chevron-left"></a></i>
          <h2>修改登陆密码</h2>
        </div>
      </div>
	<!-- 登陆框 -->
	<div class="am-u-sm-11 am-u-sm-centered loginDiv">
	<form class="am-form" method="post" action="/changePassword">
	  <fieldset class="myapp-login-form am-form-set fieldsetDiv">
		<div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input type="password" name="oldPassword" class="myapp-login-input-text am-form-field" placeholder="原密码" >
            
		</div>
		<div class="am-form-group am-form-icon">
			<i class="am-icon-lock"></i>
			<input type="password" name="newPassword" class="myapp-login-input-text am-form-field" placeholder="新密码" id="password" onfocus="MMonfocu()" onblur="MMonblus()">
			<p id="MMerror"></p>
		</div>
    <div class="am-form-group am-form-icon">
      <i class="am-icon-lock"></i>
      <input type="password" name="rePassword" class="myapp-login-input-text am-form-field" placeholder="确认密码" id="confirmPassword" onfocus="QRMMonfocu()" onblur="QRMMonblus()">
      <p id="QRMMerror"></p>
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