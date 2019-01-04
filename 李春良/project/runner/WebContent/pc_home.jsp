<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>个人中心</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/navigation.css" rel="stylesheet">
    <!-- zui -->
    <link href="css/zui.css" rel="stylesheet">
    <!-- ZUI 标准版压缩后的 CSS 文件 -->

    <!-- ZUI Javascript 依赖 jQuery -->
    <script src="js/jquery-1.7.min.js"></script>
    <!-- ZUI 标准版压缩后的 JavaScript 文件 -->
    <script src="js/zui.js"></script>
    <script src="js/iconfont.js"></script>
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
    <link href="css/zui.min.css" rel="stylesheet">
	<!-- ZUI Javascript 依赖 jQuery -->
	<script src="js/jquery-1.7.min.js"></script>
	<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
	<script src="js/zui.min.js"></script>
	<script src="js/toastr.min.js"></script>
	<script src="https://cdn.goeasy.io/goeasy.js"></script>
	<!--****************自定义CSS**************-->
	<link rel="stylesheet" href="css/pc_login.css">
</head>
<link href="css/toastr.min.css" rel="stylesheet"/>
<style>
	a:hover{
		text-decoration:none;
	}
</style>
<body>
<input style="display:none;" value="${user.id}" id="channel">
  <script type="text/javascript">
  	var goEasy=new GoEasy({
  		appkey:"BC-0d6ab878a0a24864a0c5c0e5251e50df"
  	});
  	goEasy.subscribe({
  		channel:$('#channel').val(),
  		onMessage:function(message){
  			var re=eval("("+message.content+")");
  			toastr.info(re.talkerId.nickname+"给你发消息啦!");
  		}
  	})
  </script>
	<!--顶部资料卡-->
	<div class="datatop" style="background-image:url(images/personalCenter/wenli2.png)">
		<!-- .................................................................................. -->
		<c:if test="${user.headPortrait == null}">
			<a href="pc_editInformation.jsp"><img src="images/personalCenter/defaultPhoto.jpg" class="photo">
		</c:if>
		<c:if test="${user.headPortrait != null}">
			<a href="pc_editInformation.jsp"><img src="${user.headPortrait}" class="photo">
		</c:if>
		<!-- .................................................................................. -->
		<c:if test="${user.nickname == null}">
			<span class="name">未登录用户</span>
		</c:if>
		<c:if test="${user.nickname != null}">
			<span class="name">${user.nickname}</span>
		</c:if>
		<!-- .................................................................................. -->
		
		
	
	</div>
	<!--****************************************************************************-->
	<div class="space"></div>
	<a href="checkMoney">
	<div class="dataselect">
		<img src="images/personalCenter/wallet.png" class="mark">
		<span class="dataselect_text">我的钱包</span>

	</div>
	</a>
	<div class="space"></div>
	<a href="orderIndex">
	<div class="dataselect">
		<img src="images/personalCenter/order.png" class="mark">
		<span class="dataselect_text">订单中心</span>

	</div>
	</a>
		<c:if test="${user.information.oppositeImage != null}">
			<a href="showStudentID">
				<div class="dataselect">
					<img src="images/personalCenter/student.png" class="mark">
					<span class="dataselect_text">学生认证</span>
				</div>
			</a>
	</c:if>
	<c:if test="${user.information.oppositeImage == null}">
			<a href="pc_noStudentID.jsp">
				<div class="dataselect">
					<img src="images/personalCenter/student.png" class="mark">
					<span class="dataselect_text">学生认证</span>
				</div>
			</a>
	</c:if>
	<div class="space"></div>
	<a href="systemSetup.jsp">
	<div class="dataselect">
		<img src="images/personalCenter/setting.png" class="mark">
		<span class="dataselect_text">设置</span>

	</div>
	</a>

	<!-- 下方导航 -->
      <div class="menu ">
        <ul class="nav nav-primary">
          <li class="">
            <a href="index">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-shouye-xianxing"></use> 
              </svg> 
              <div class="menu-text">
              首页
              </div>
            </a>
          </li>
          <li class="">
            <a href="oc_orderCenter.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-baoguofahuo-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                代取
              </div>
            </a>
          </li>
          <li class="">
            <a href="issuanceOrders.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-jijianfasong-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                发单
              </div>
            </a>
          </li>
          <li class="">
            <a href="showChat">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-liaotianduihua-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                消息
              </div>
            </a>
          </li>
          <li class="active">
            <a href="showMassages">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-yonghu-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                我
              </div>
            </a>
          </li>
        </ul>
      </div>
</body>
</html>