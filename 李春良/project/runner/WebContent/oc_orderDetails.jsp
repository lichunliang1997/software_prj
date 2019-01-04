<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"> 
    <title>订单详情</title>
    <script src="js/jquery.js"></script>
   
    <!-- zui -->
    <link href="css/zui.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>//css/orderDetails.css">
    <style>
    	.banner{
    		width:100%;
    		height:40px;
    		line-height:40px;
    		background: white;
    	}
    	.title{
    		width:35%;
    		height:40px;
    		line-height:40px;
    		color:#858687;
    		font-size: 14px;
    		font-family: '黑体';
    		font-weight: bloder;
    		float: left;
    	}
    	.content{
    		width: 60%;
    		height:40px;
    		line-height: 40px;
    		float: left;
    		text-align: right;
    		font-family: '黑体';
    		font-weight: bolder;
    		font-size: 15px;
    	}
    </style>
</head>
<body style="background: #eceded">
<!-- 在此处编码你的创意 -->
<div class="orderDetails">
    <!--顶端提示和返回-->
    <div class="orderTop">
        <div>
            <i class="icon icon-chevron-left"><h2>订单详情</h2></i>
        </div>
    </div>
    
    <!--地图位置-->
   
        <div id="container" style="width:100%;height:300px;border:1px solid #D0D0D0;
        -webkit-border-radius:10px;
	-moz-border-radius:10px;
	border-radius: 5px;
	margin:0px auto">
	</div>
    <input id="deliveryLnglat" type="text" value="${order.delivery.lnglat}" style="display: none;">
	<input id="destLnglat" type="text" value="${order.destLnglat}" style="display: none;">
    <!--订单信息-->
   
	<div class="banner"  style="margin-top: 10px;">
		<div class="title">&nbsp;&nbsp;快递位置</div>
		<div class="content">${order.delivery.address}</div>
	</div>
	
	<div class="banner" style="margin-bottom: 1px;">
		<div class="title">&nbsp;&nbsp;送达地点</div>
		<div class="content">${order.receipt}</div>
	</div>
    
    	<div class="banner">
		<div class="title">&nbsp;&nbsp;送达时间</div>
		<div class="content" style="color:#e04f4f">${order.deliveryTime}</div>
	</div>
    
    
     <div class="banner"  style="margin-top: 1px;">
		<div class="title">&nbsp;&nbsp;发单人</div>
		<div class="content" style="position: relative;">${invoice.nickname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${invoice.headPortrait}" width="38px" height="38px" style="border-radius: 50%;position: absolute;top:0px;right:0px;"></div>
	</div>
    
    <div class="banner" style="margin-top:10px;">
		<div class="title">&nbsp;&nbsp;规格</div>
		<div class="content" style="color:#e04f4f">
			<c:if test="${order.size ==0}">小型快递(<1KG)</c:if>
          	    <c:if test="${order.size ==1}"> 中型快递(1-5KG)</c:if>
          	    <c:if test="${order.size ==2}">大型快递(>5KG)</c:if>
		</div>
	</div>
	
	<div class="banner">
		<div class="title">&nbsp;&nbsp;佣金</div>
		<div class="content" style="color:#e04f4f">${order.money}元</div>
	</div>
	

    <div class="orderBottom">
	    
        <div class="button">
            <div class="giveUp">
                <a href="orderlist?lnglat=${order.delivery.lnglat}" class="button"><button class="btn" type="button" >放弃抢单</button></a>
            </div>
            <div class="immediatelyOrder">
                <a href="/runner/orderDetails?oid=${order.id}" class="button"><button class="btn btn-primary" type="button" style="background: #e04f4f;border:1px solid #e04f4f;">立即抢单</button></a>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
<!--<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
<!-- ZUI Javascript组件 -->
<script src="js/zui.min.js"></script>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.11&key=096c6a488c034c4cd5c11a51fb5f542d"></script>
 <script src="https://webapi.amap.com/maps?v=1.4.11&key=096c6a488c034c4cd5c11a51fb5f542d&plugin=AMap.Walking"></script>
<script type="text/javascript" src="js/oc_orderDetailsMap.js"></script>
</body>
</html>