<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
 
<head>
 
<meta charset="UTF-8" />
 
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

 <link rel="stylesheet" type="text/css" href="css/setup.css">
<title>setup</title>
 <script src="js/jquery-1.7.min.js"></script>
 <script src="js/toastr.min.js"></script>
<body>
<div class="header">
 
<a href="pc_home.jsp"> < </a>
 
<h2>设置</h2>
 
<!-- <div class="btn">
 
<span></span>
 
<span></span>
 
<span></span>
 
</div> -->
 
</div>
 
<div class="content">
 
<div class="username">
 
 
<img src="images/runner.png" alt="" />
 
<div class="text">
 
<div class="name">${user.email}</div>
 
<div class="haha">昵称:${user.nickname}</div>
 
</div>
 
<div class="right">

<!-- 个人的二维码 -->
<!-- <div class="img"><img src="./ewm.jpeg" alt="" /></div> -->
 
 <!-- 到达修改个人信息页面 -->
<!-- <div class="back"><a href="#"> > </a></div> -->
 
</div>
 
 
</div>
 
</div>
 
<div class="address">
 
账户与安全
 
<a href="safe.jsp"> > </a>
 
</div>
 
 <!-- 连接到聊天页面 -->
<!-- <div class="safe">
 
通知
<a href="#">> </a>
 
</div> -->

<!-- <div class="other">
 
地区设置

 
<a href=""> > </a>
 
</div> -->
 
 <!-- 关于平台 -->
<div class="shezhi">
 

关于平台

 
<a href="aboutOus.jsp"> > </a>
 
</div>
 
</div>
 
<div class="view">
 
代跑侠使用条款
 
<a href="usingRule.jsp"> > </a>
 
</div>
 
 

 
 <a href="login.jsp"><div style="-webkit-border-radius:10px;
	-moz-border-radius:10px;
	border-radius: 5px;
	width:75%;
	height:40px;
	line-height:40px;
	background:red;
	color:white;
	font-size:20px;
	text-align:center;
	margin:0px auto;">
 退出登录
 </div></a>
 
 
 
 
</body>
 
</html>