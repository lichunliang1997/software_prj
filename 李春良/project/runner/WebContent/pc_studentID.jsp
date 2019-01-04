<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>学生认证</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
    <link href="css/zui.min.css" rel="stylesheet">
	<!-- ZUI Javascript 依赖 jQuery -->
	<script src="js/jquery-1.7.min.js"></script>
	<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
	<script src="js/zui.min.js"></script>
	<script src="js/zui.jedate.js"></script>
	<!--****************自定义CSS**************-->
	<link rel="stylesheet" href="css/pc_students.css">
	<!--******************外部引用包************-->
  	<link href="lib/uploader/zui.uploader.min.css" rel="stylesheet">
  	<script src="lib/uploader/zui.uploader.min.js"></script>
</head>
<body>
	<div class="banner">
		<a href="/runner/showMassages"><img src="images/personalCenter/backblack.png" class="back"></a>
		学生实人认证
	</div>
	<div class="card">
		<span class="card01">我的学生证</span>
		<img src="images/personalCenter/student.png" class="safe">
		<span class="card02">${school}</span>
		<div class="card03">已认证</div>
	</div>
	<div class="massages">
		<div class="massages01">
			<span>上传学生证高清照片以认证</span>
		</div>
		<div class="massages02">	
		
				<img src="${user.information.oppositeImage}" class="photo">
			
		</div>
	</div>




</body>



</html>