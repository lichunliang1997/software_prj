<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>通知</title>
    <link href="css/navigation.css" rel="stylesheet">
    <link href="css/msg.css" rel="stylesheet">
    <!-- zui -->
    <link href="css/zui.css" rel="stylesheet">
    <!-- ZUI 标准版压缩后的 CSS 文件 -->

    <!-- ZUI Javascript 依赖 jQuery -->
    <script src="js/jquery-1.7.min.js"></script>
    <!-- ZUI 标准版压缩后的 JavaScript 文件 -->
    <script src="js/zui.js"></script>
    <script src="js/iconfont.js"></script>
    <script type="text/javascript" src="https://cdn.goeasy.io/goeasy.js"></script>
    <script type="text/javascript">
    </script>
  </head>
  <body class="body">
  <input style="display:none;" value="${user.id}" id="channel">
  <script type="text/javascript">
  	var goEasy=new GoEasy({
  		appkey:"BC-0d6ab878a0a24864a0c5c0e5251e50df"
  	});
  	goEasy.subscribe({
  		channel:$('#channel').val(),
  		onMessage:function(message){
  			window.location.reload();
  		}
  	})
  </script>
      <!-- title -->
      <h2 class="title container-fluid">
        <span class="top-title this"><a href="#">通知</a></span>
        <span class="top-title"><a href="showChat">消息</a></span>
      </h2>
      <!-- 主要内容 -->
      <div class="container-fluid">
        <div class="cards cards-condensed " style="height: 500px;overflow-y: scroll;">
        	<c:forEach items="${sysmsg}" var="msg">
			              <div class="card container-fluid">
			                <img src="images/bike.png" height="20%" width="20%">
			                <div style="width:270px;height:60px;margin-left:60px;position: relative;">
			                	<div style="font-weight: bold;font-size: 18px;margin-bottom: 5px;">系统通知</div>
			                	${msg.content}
			                	<div style="position: absolute;right:0px;top:2px;">${fn:substring(msg.times,0, 16)}</div>
			                </div>
			              </div>
			</c:forEach>	              
        </div>
      </div>
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
          <li class="active">
            <a href="message.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-liaotianduihua-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                消息
              </div>
            </a>
          </li>
          <li class="">
            <a href="pc_home.jsp">
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