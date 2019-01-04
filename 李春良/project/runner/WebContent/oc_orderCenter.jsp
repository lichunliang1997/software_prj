<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link href="css/navigation.css" rel="stylesheet">
    <link rel="stylesheet" href="css/orderCenter.css">
    <!-- zui -->
    <link href="css/zui.css" rel="stylesheet">

    <!-- ZUI Javascript 依赖 jQuery -->
    <script src="js/jquery-1.7.min.js"></script>
    <!-- ZUI 标准版压缩后的 JavaScript 文件 -->
    <script src="js/zui.js"></script>
    <script src="js/iconfont.js"></script>
    <script src="js/toastr.min.js"></script>
	<script src="https://cdn.goeasy.io/goeasy.js"></script>
        <style type="text/css">
        #container{

		float:left ;
		width:100%;
		height:480px;
		margin-bottom:2%;
		border:2px solid lightgray;
	}
    </style>
</head>
 <link href="css/toastr.min.css" rel="stylesheet"/>
<body class="body">
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
    <!--顶端提示和返回-->
        <div class="orderTop">
            <h2>接单大厅</h2>
        </div>
    <!--选择地址-->
    <div class="orderCenter">
        <i class="icon icon-map-marker icon-2x" style="margin-left: 9%;color: white"><h3 class="schoolName"></h3></i>
        <img src="images/bike.png" style="width: 12%;height: 12%;margin-left: 35%">
    </div>
    <!--地图位置-->
    <div id="container"></div>
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
          <li class="active">
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
          <li class="">
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
<script src="https://webapi.amap.com/maps?v=1.4.8&key=b6357af7e5eb44585f533ed85e6c238f&callback=init&plugin=AMap.PlaceSearch,AMap.AdvancedInfoWindow"></script>
<script type="text/javascript" src="js/ordercentermap.js"></script>
</html>