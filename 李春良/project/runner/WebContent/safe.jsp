<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
 
<head>
 
<meta charset="UTF-8" />
 
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

 <link rel="stylesheet" type="text/css" href="css/setup.css">
<title>账号与安全</title>
 
</head>
 
<body>
 
<div class="header">
 
<a href="systemSetup.jsp"> < </a>
 
<h2>账户与安全</h2> 
</div>

</div>
 
</div>
 
</div>
 
 <div class="address">
 
微信号
 
<a href="#"> *${user.weChat} </a>
 
</div>
<div class="address">
 
QQ号
 
<a href="#"> *${user.qq} </a>
 
</div>
<div class="address">
 
手机号
 
<a href="changePhone.jsp"> *${info.phone} </a>
 
</div>
<div class="address">
 
邮箱
 
<a href="changeEmail.jsp"> *${user.email} </a>
 
</div>
 
 <!-- 连接到修改信息 -->
 <div class="safe">
 
修改登陆密码
<a href="changePassword.jsp">> </a>
 
</div>
<div class="safe">
 
修改支付密码
<a href="paymentPassword.jsp">> </a>
 
</div>
 
</body>
 
</html>