<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>快递列表</title>
    <!-- zui -->
    <link href="css/zui.min.css" rel="stylesheet">
    <link href="<%=basePath%>//css/orderList.css" type="text/css" rel="stylesheet">
    <script src="js/layer.js"></script>
    <script src="js/jquery.js"></script>
</head>
<body>
<!-- 在此处编码你的创意 -->
<div class="orderList">
    <!--顶端提示和返回-->
    <div class="orderListTop">
        <a href="oc_orderCenter.jsp"><i class="icon icon-chevron-left"></i></a><h2>快递列表</h2>
    </div>
    <!--订单列表-->
    <div class="orderListContent">
    <c:forEach items="${orderList}" var="order">
        <div class="shadow"></div>
        <div class="orderListContentTop">
            <div class="orderListContentSize">
                <i class="icon icon-th-large">
	                <h3>
	                <c:set var="size" value="${order.size}"/>
	                <c:if test="${size ==0}">小件</c:if>
	                <c:if test="${size ==1}">中件</c:if>
	                <c:if test="${size ==2}">大件</c:if>
	                </h3>
                </i>
            </div>
            <div class="orderListContentMoney">
                <p class="moneyNumber">${order.money}</p><p class="moneyUnit">元</p>
            </div>
        </div>
        <div class="orderListContentCenter">
            <div class="pickUpAddress">
                <div class="pickUpAddressLeft">
                    <div class="positioningIcon">
                        <i class="icon icon-map-marker icon-2x"></i>
                    </div>
                    <div class="pickUp"><p>取件</p></div>
                </div>
                <div class="pickUpAddressRight">
                    <div class="pickUpAddressSite">
                        <p style="font-size: 16px;">${order.delivery.name}</p>
                    </div>
                    <div class="pickUpAddressPosition">
                        <p style="color:grey;">${order.delivery.address}</p>
                    </div>
                </div>
            </div>
            <div class="deliveryAddress">
                <div class="deliveryAddressLeft">
                    <div class="positioningIcon">
                        <i class="icon icon-map-marker icon-2x"></i>
                    </div>
                    <div class="delivery"><p>送件</p></div>
                </div>
                <div class="deliveryAddressRight">
                    <div class="deliveryAddressSite">
                        <p style="font-size: 16px;">${order.receipt}</p>
                    </div>
                    <div class="deliveryAddressTime">
                        <i class="icon icon-time"><p class="time">${order.deliveryTime}内</p><p class="sent">送达</p></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="orderListContentBottom">
            <button value="${order.id}" class="btn btn-block" type="button" style="background-color: #478ddb;color: white;font-size: 15px;font-weight: lighter">查看详情</button>
        </div>
        </c:forEach>
        
    </div>
    <!--分页-->

</div>
<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
<!--<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
<!-- ZUI Javascript组件 -->
<!-- <script src="js/zui.min.js"></script> -->
 <script src="js/orderCenter_orderList.js"></script> 
</body>
</html>